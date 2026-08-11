#!/usr/bin/env python3
"""Snapshot the 2022 curriculum tables published by SBIAHU.

The generated JSON is intentionally committed so normal index generation is
offline and reproducible. Run this script only when the official page changes.
"""

from __future__ import annotations

import argparse
import json
import re
import urllib.error
import urllib.request
from datetime import date
from html.parser import HTMLParser
from pathlib import Path


SOURCE_URL = "https://sbiahu.ahu.edu.cn/22094/list.htm"
ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = ROOT / "data" / "official-courses-2022.json"
TABLES = {
    0: ("DMT", "专业课程"),
    1: ("DMT", "通识课程"),
    2: ("DMT", "英语课程"),
    3: ("PHY", "专业课程"),
    4: ("PHY", "通识课程"),
    5: ("PHY", "英语课程"),
    6: ("AMS", "专业课程"),
    7: ("AMS", "通识课程"),
    8: ("AMS", "英语课程"),
}


def clean(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def optional(value: str) -> str:
    value = clean(value)
    return "" if value == "/" else value


class TableParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.tables: list[list[list[str]]] = []
        self.table: list[list[str]] | None = None
        self.row: list[str] | None = None
        self.cell: list[str] | None = None

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag == "table":
            self.table = []
        elif tag == "tr" and self.table is not None:
            self.row = []
        elif tag in {"td", "th"} and self.row is not None:
            self.cell = []
        elif tag == "br" and self.cell is not None:
            self.cell.append(" ")

    def handle_data(self, data: str) -> None:
        if self.cell is not None:
            self.cell.append(data)

    def handle_endtag(self, tag: str) -> None:
        if tag in {"td", "th"} and self.cell is not None and self.row is not None:
            self.row.append(clean("".join(self.cell)))
            self.cell = None
        elif tag == "tr" and self.row is not None and self.table is not None:
            if any(self.row):
                self.table.append(self.row)
            self.row = None
        elif tag == "table" and self.table is not None:
            self.tables.append(self.table)
            self.table = None


def fetch_tables(url: str, input_html: Path | None = None) -> list[list[list[str]]]:
    if input_html:
        html = input_html.read_text(encoding="utf-8")
    else:
        request = urllib.request.Request(
            url,
            headers={
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                "AppleWebKit/537.36 Chrome/138.0.0.0 Safari/537.36",
                "Accept-Language": "zh-CN,zh;q=0.9",
                "Referer": "https://sbiahu.ahu.edu.cn/main.htm",
            },
        )
        try:
            with urllib.request.urlopen(request, timeout=30) as response:
                charset = response.headers.get_content_charset() or "utf-8"
                html = response.read().decode(charset, errors="replace")
        except urllib.error.HTTPError as error:
            raise RuntimeError(
                f"Official site returned HTTP {error.code}. Save the page as HTML in a "
                "browser and rerun with --input-html <file>."
            ) from error
    parser = TableParser()
    parser.feed(html)
    return parser.tables


def build_snapshot(tables: list[list[list[str]]], url: str) -> dict[str, object]:
    if len(tables) < len(TABLES):
        raise RuntimeError(f"Expected at least {len(TABLES)} tables, found {len(tables)}")

    courses: dict[str, dict[str, object]] = {}
    for index, (major, category) in TABLES.items():
        table = tables[index]
        if not table or table[0][:5] != [
            "课程代码",
            "课程名称",
            "学分",
            "石溪大学认证课程",
            "前置课程要求",
        ]:
            raise RuntimeError(f"Unexpected header in official table {index}")
        for raw_row in table[1:]:
            row = (raw_row + [""] * 5)[:5]
            code, name, credits, certification, prerequisite = map(clean, row)
            if not code or code == "/":
                continue
            course = courses.setdefault(
                code,
                {
                    "name": name,
                    "credits": credits,
                    "stony_brook_certification": optional(certification),
                    "prerequisite": optional(prerequisite),
                    "programs": {},
                },
            )
            programs = course["programs"]
            assert isinstance(programs, dict)
            programs[major] = category

    return {
        "schema_version": 1,
        "source": {
            "url": url,
            "title": "安徽大学纽约石溪学院课程设置",
            "version": "2022级版本",
            "retrieved_at": date.today().isoformat(),
        },
        "courses": dict(sorted(courses.items())),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--url", default=SOURCE_URL)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--input-html",
        type=Path,
        help="parse a browser-saved copy when the official site blocks command-line requests",
    )
    args = parser.parse_args()

    snapshot = build_snapshot(fetch_tables(args.url, args.input_html), args.url)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(snapshot, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {len(snapshot['courses'])} official courses to {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
