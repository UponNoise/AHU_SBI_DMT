#!/usr/bin/env python3
"""Generate mobile-friendly curriculum and course indexes from repository data."""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path
from urllib.parse import quote


ROOT = Path(__file__).resolve().parents[1]
COURSE_ROOT = ROOT / "课程资料"
MATERIAL_CATEGORIES = ["通用资料", "Quiz", "作业", "试卷", "Practice", "复习资料"]
MAJOR_NAMES = {"DMT": "数字媒体技术（DMT）", "AMS": "应用统计学（AMS）"}
START_MARKER = "<!-- catalog:start -->"
END_MARKER = "<!-- catalog:end -->"


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def markdown_path(value: str) -> str:
    return quote(value, safe="/-_.()（）")


def course_identity(slug: str) -> tuple[str, str]:
    match = re.match(r"^([A-Z]{2}\d{5})-(.+)$", slug)
    if match:
        return match.group(1), match.group(2)
    return "", slug


def real_files(path: Path) -> list[Path]:
    if not path.exists():
        return []
    return sorted(
        item
        for item in path.rglob("*")
        if item.is_file() and item.name not in {"README.md", ".gitkeep"}
    )


def inventory(slug: str) -> dict[str, object]:
    base = COURSE_ROOT / slug
    categories: dict[str, int] = {}
    for category in MATERIAL_CATEGORIES:
        count = len(real_files(base / category))
        if count:
            categories[category] = count
    all_files = real_files(base)
    categorized = sum(categories.values())
    return {
        "total": len(all_files),
        "categories": categories,
        "other": max(0, len(all_files) - categorized),
    }


def category_summary(info: dict[str, object]) -> str:
    categories = info["categories"]
    assert isinstance(categories, dict)
    parts = [f"{name} {count}" for name, count in categories.items()]
    if info["other"]:
        parts.append(f"其他 {info['other']}")
    return " · ".join(parts)


def replace_root_catalog(readme: str, block: str) -> str:
    marked = re.compile(
        rf"{re.escape(START_MARKER)}.*?{re.escape(END_MARKER)}",
        flags=re.DOTALL,
    )
    replacement = f"{START_MARKER}\n{block.rstrip()}\n{END_MARKER}"
    if marked.search(readme):
        return marked.sub(replacement, readme)
    legacy = re.compile(r"## 课程索引\n.*?(?=\n## 资料类型规范)", flags=re.DOTALL)
    if not legacy.search(readme):
        raise RuntimeError("README.md does not contain a replaceable course index")
    return legacy.sub(f"## 课程索引\n\n{replacement}\n", readme)


def root_catalog(course_slugs: list[str], inventories: dict[str, dict[str, object]]) -> str:
    available = [slug for slug in course_slugs if inventories[slug]["total"]]
    empty = [slug for slug in course_slugs if not inventories[slug]["total"]]
    lines = [
        f"> 共 {len(course_slugs)} 门课程；{len(available)} 门已有资料，{len(empty)} 门等待补充。",
        "> 可按 `t` 使用 GitHub 文件查找，或从上方专业课表按学期进入。",
        "",
        f"### 已有资料（{len(available)}）",
        "",
    ]
    for slug in available:
        code, name = course_identity(slug)
        label = f"{code} · {name}" if code else name
        info = inventories[slug]
        summary = category_summary(info)
        lines.append(
            f"- [{label}]({markdown_path('课程资料/' + slug)}) — "
            f"**{info['total']} 个文件**" + (f" · {summary}" if summary else "")
        )
    lines.extend(["", "<details>", f"<summary>暂无资料（{len(empty)}）</summary>", ""])
    for slug in empty:
        code, name = course_identity(slug)
        label = f"{code} · {name}" if code else name
        lines.append(f"- [{label}]({markdown_path('课程资料/' + slug)})")
    lines.extend(["", "</details>"])
    return "\n".join(lines)


def major_readme(
    major: str,
    semesters: dict[str, list[str]],
    inventories: dict[str, dict[str, object]],
) -> str:
    lines = [
        f"# {MAJOR_NAMES[major]}培养方案索引",
        "",
        "按学期浏览课程；每个学期页面会直接标明真实资料数量，避免进入空目录后才发现暂无内容。",
        "",
        "## 学期导航",
        "",
        "| 学期 | 已有资料 | 课程数 |",
        "| --- | ---: | ---: |",
    ]
    for semester, slugs in semesters.items():
        available = sum(bool(inventories[slug]["total"]) for slug in slugs)
        lines.append(f"| [{semester}]({markdown_path(semester + '.md')}) | {available} | {len(slugs)} |")
    lines.extend(
        [
            "",
            "## 使用说明",
            "",
            "- 学期分配沿用本仓库课表；课程学分、石溪认证与前置要求参考学院 2022 级课程设置。",
            "- 两专业共享课程只保留一份物理资料，课程页会列出它出现在哪些专业与学期。",
            "- `暂无资料` 表示课程信息已建档但尚无可下载文件，可按[贡献指南](../../CONTRIBUTING.md)补充。",
            "- 转学成绩要求详见 [docs/transfer](../../docs/transfer/README.md)。",
            "",
        ]
    )
    return "\n".join(lines)


def semester_page(
    major: str,
    semester: str,
    slugs: list[str],
    inventories: dict[str, dict[str, object]],
) -> str:
    lines = [
        f"# {MAJOR_NAMES[major]} · {semester}",
        "",
        f"[← 返回 {major} 学期导航](README.md)",
        "",
        "> 本页突出显示仓库当前真实库存；课程详情中的学分、石溪认证与前置要求参考学院 2022 级课程设置。",
        "",
    ]
    for slug in slugs:
        code, name = course_identity(slug)
        label = f"{code} · {name}" if code else name
        target = "../../课程资料/" + slug
        info = inventories[slug]
        if info["total"]:
            detail = f"**{info['total']} 个文件**"
            summary = category_summary(info)
            if summary:
                detail += f" · {summary}"
        else:
            detail = "暂无资料"
        lines.append(f"- [{label}]({markdown_path(target)}) — {detail}")
    lines.append("")
    return "\n".join(lines)


def course_readme(
    slug: str,
    info: dict[str, object],
    placements: list[tuple[str, str]],
    official: dict | None,
    official_source: dict,
    override: dict,
) -> str:
    code, name = course_identity(slug)
    total = int(info["total"])
    lines = [f"# {name}", ""]
    if total:
        lines.append(f"> **已收录 {total} 个文件** · {category_summary(info)}")
    else:
        lines.append("> **暂无资料** · 课程已建档，欢迎补充首份资料。")
    if override.get("note"):
        lines.extend(["", f"> 注意：{override['note']}"])

    lines.extend(["", "## 课程信息", "", "| 项目 | 内容 |", "| --- | --- |"])
    lines.append(f"| 课程代码 | `{code}` |" if code else "| 课程代码 | — |")
    if official:
        lines.append(f"| 学分 | {official.get('credits') or '—'} |")
        lines.append(
            f"| 石溪大学认证课程 | {official.get('stony_brook_certification') or '—'} |"
        )
        lines.append(f"| 前置课程要求 | {official.get('prerequisite') or '—'} |")
        programs = official.get("programs", {})
        if programs:
            values = "；".join(f"{major} · {category}" for major, category in programs.items())
            lines.append(f"| 官网课程分类 | {values} |")

    if placements:
        links = []
        for major, semester in placements:
            href = f"../../curricula/{major}/{semester}.md"
            links.append(f"[{major} · {semester}]({markdown_path(href)})")
        lines.append(f"| 仓库课表 | {'；'.join(links)} |")

    requirements = override.get("transfer_requirements", {})
    for major in ("DMT", "AMS"):
        if major in requirements:
            lines.append(f"| {major} 转学成绩要求 | {requirements[major]} |")

    if official:
        lines.extend(
            [
                "",
                f"课程设置来源：[{official_source['title']}（{official_source['version']}）]({official_source['url']})。",
            ]
        )

    lines.extend(["", "## 可用资料", ""])
    categories = info["categories"]
    assert isinstance(categories, dict)
    if categories:
        for category, count in categories.items():
            lines.append(f"- [{category}]({markdown_path(category + '/')}) — {count} 个文件")
        if info["other"]:
            lines.append(f"- 其他未分类文件 — {info['other']} 个")
    else:
        lines.extend(
            [
                "目前没有可下载资料。空分类目录不会显示；新增资料后重新运行生成脚本即可自动出现。",
                "",
                "可参考[贡献指南](../../CONTRIBUTING.md)提交课件、作业、试卷、练习或复习资料。",
            ]
        )
    lines.extend(["", "资料仅供学习参考，以当学期学院通知为准。", ""])
    return "\n".join(lines)


def build_outputs() -> tuple[dict[Path, str], list[str]]:
    curricula = load_json(ROOT / "data" / "curricula.json")["majors"]
    official_data = load_json(ROOT / "data" / "official-courses-2022.json")
    overrides = load_json(ROOT / "data" / "course-overrides.json").get("courses", {})
    official_courses = official_data["courses"]

    course_slugs = sorted(path.name for path in COURSE_ROOT.iterdir() if path.is_dir())
    course_set = set(course_slugs)
    referenced = {
        slug
        for semesters in curricula.values()
        for slugs in semesters.values()
        for slug in slugs
    }
    missing = sorted(referenced - course_set)
    if missing:
        raise RuntimeError("Curriculum references missing course directories: " + ", ".join(missing))

    warnings = []
    unreferenced = sorted(course_set - referenced)
    if unreferenced:
        warnings.append("Unreferenced course directories: " + ", ".join(unreferenced))

    inventories = {slug: inventory(slug) for slug in course_slugs}
    placements: dict[str, list[tuple[str, str]]] = defaultdict(list)
    for major, semesters in curricula.items():
        for semester, slugs in semesters.items():
            for slug in slugs:
                placements[slug].append((major, semester))

    outputs: dict[Path, str] = {}
    root_readme = (ROOT / "README.md").read_text(encoding="utf-8")
    outputs[ROOT / "README.md"] = replace_root_catalog(
        root_readme,
        root_catalog(course_slugs, inventories),
    )

    for major, semesters in curricula.items():
        outputs[ROOT / "curricula" / major / "README.md"] = major_readme(
            major, semesters, inventories
        )
        for semester, slugs in semesters.items():
            outputs[ROOT / "curricula" / major / f"{semester}.md"] = semester_page(
                major, semester, slugs, inventories
            )

    for slug in course_slugs:
        code, _ = course_identity(slug)
        outputs[COURSE_ROOT / slug / "README.md"] = course_readme(
            slug,
            inventories[slug],
            placements.get(slug, []),
            official_courses.get(code),
            official_data["source"],
            overrides.get(slug, {}),
        )
    return outputs, warnings


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail if generated Markdown differs from the committed files",
    )
    args = parser.parse_args()

    outputs, warnings = build_outputs()
    for warning in warnings:
        print(f"warning: {warning}", file=sys.stderr)

    changed = []
    for path, content in outputs.items():
        content = content.rstrip() + "\n"
        current = path.read_text(encoding="utf-8") if path.exists() else ""
        if current != content:
            changed.append(path)
            if not args.check:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content, encoding="utf-8", newline="\n")

    if args.check and changed:
        for path in changed:
            print(f"out of date: {path.relative_to(ROOT)}", file=sys.stderr)
        return 1
    action = "Checked" if args.check else "Generated"
    print(f"{action} {len(outputs)} Markdown files; {len(changed)} changed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
