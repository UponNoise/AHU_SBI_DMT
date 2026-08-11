#!/usr/bin/env python3
"""Generate the lightweight data and course pages used by the index website."""

from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from pathlib import Path
from urllib.parse import quote

from generate_catalog import (
    COURSE_ROOT,
    MAJOR_NAMES,
    MATERIAL_CATEGORIES,
    ROOT,
    course_identity,
    inventory,
    load_json,
)


REPOSITORY_URL = "https://github.com/UponNoise/AHU_SBI_DMT"
WEBSITE_ROOT = ROOT / "website"
SITE_DATA_PATH = WEBSITE_ROOT / "src" / "data" / "site-index.json"
COURSE_PAGE_ROOT = WEBSITE_ROOT / "src" / "content" / "docs" / "course"


def github_tree_url(relative_path: str) -> str:
    encoded = quote(relative_path, safe="/-_.()（）")
    return f"{REPOSITORY_URL}/tree/main/{encoded}"


def yaml_string(value: str) -> str:
    return json.dumps(value, ensure_ascii=False)


def build_site_index() -> dict:
    curricula_data = load_json(ROOT / "data" / "curricula.json")
    curricula = curricula_data["majors"]
    hidden_groups = set(curricula_data.get("hidden_navigation_groups", []))
    official_data = load_json(ROOT / "data" / "official-courses-2022.json")
    official_courses = official_data["courses"]
    overrides = load_json(ROOT / "data" / "course-overrides.json").get("courses", {})

    course_slugs = sorted(path.name for path in COURSE_ROOT.iterdir() if path.is_dir())
    inventories = {slug: inventory(slug) for slug in course_slugs}

    placements: dict[str, list[dict[str, object]]] = defaultdict(list)
    majors: dict[str, dict[str, object]] = {}
    for major, groups in curricula.items():
        rendered_groups = []
        for group_name, slugs in groups.items():
            hidden = group_name in hidden_groups
            rendered_groups.append(
                {
                    "name": group_name,
                    "hidden": hidden,
                    "courses": slugs,
                    "availableCourses": sum(
                        bool(inventories[slug]["total"]) for slug in slugs
                    ),
                }
            )
            for slug in slugs:
                placements[slug].append(
                    {"major": major, "group": group_name, "hidden": hidden}
                )
        majors[major] = {"name": MAJOR_NAMES[major], "groups": rendered_groups}

    courses = []
    for slug in course_slugs:
        code, name = course_identity(slug)
        info = inventories[slug]
        official = official_courses.get(code, {})
        override = overrides.get(slug, {})
        codes = override.get("course_codes", []) or ([code] if code else [])
        categories = []
        for category in MATERIAL_CATEGORIES:
            count = info["categories"].get(category, 0)
            if count:
                categories.append(
                    {
                        "name": category,
                        "count": count,
                        "githubUrl": github_tree_url(f"课程资料/{slug}/{category}"),
                    }
                )
        if info["other"]:
            categories.append(
                {
                    "name": "其他",
                    "count": info["other"],
                    "githubUrl": github_tree_url(f"课程资料/{slug}"),
                }
            )

        public_placements = [item for item in placements.get(slug, []) if not item["hidden"]]
        search_terms = [name, slug, *codes]
        search_terms.extend(item["major"] for item in public_placements)
        search_terms.extend(item["group"] for item in public_placements)
        search_terms.extend(item["name"] for item in categories)

        courses.append(
            {
                "slug": slug,
                "name": name,
                "code": code,
                "codes": codes,
                "displayCode": " / ".join(codes),
                "credits": official.get("credits"),
                "certification": official.get("stony_brook_certification"),
                "prerequisite": official.get("prerequisite"),
                "officialPrograms": official.get("programs", {}),
                "note": override.get("note"),
                "transferRequirements": override.get("transfer_requirements", {}),
                "placements": public_placements,
                "totalFiles": info["total"],
                "categories": categories,
                "hasResources": bool(info["total"]),
                "githubUrl": github_tree_url(f"课程资料/{slug}"),
                "searchText": " ".join(str(term) for term in search_terms).lower(),
            }
        )

    available = [course for course in courses if course["hasResources"]]
    return {
        "schemaVersion": 1,
        "repositoryUrl": REPOSITORY_URL,
        "officialSource": official_data["source"],
        "stats": {
            "courses": len(courses),
            "coursesWithResources": len(available),
            "files": sum(course["totalFiles"] for course in courses),
            "majors": len(majors),
        },
        "materialCategories": [*MATERIAL_CATEGORIES, "其他"],
        "majors": majors,
        "courses": courses,
    }


def course_page(course: dict) -> str:
    code_prefix = f"{course['displayCode']} · " if course["displayCode"] else ""
    status = (
        f"已收录 {course['totalFiles']} 个文件"
        if course["hasResources"]
        else "课程已建档，暂无可下载资料"
    )
    return "\n".join(
        [
            "---",
            f"title: {yaml_string(course['name'])}",
            f"description: {yaml_string(code_prefix + status)}",
            "pagefind: true",
            "tableOfContents: false",
            "---",
            "",
            "import CourseDetail from '../../../components/CourseDetail.astro';",
            "",
            f"<CourseDetail slug={yaml_string(course['slug'])} />",
            "",
        ]
    )


def build_outputs() -> dict[Path, str]:
    site_index = build_site_index()
    outputs = {
        SITE_DATA_PATH: json.dumps(site_index, ensure_ascii=False, indent=2) + "\n"
    }
    for course in site_index["courses"]:
        outputs[COURSE_PAGE_ROOT / f"{course['slug']}.mdx"] = course_page(course)
    return outputs


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail when generated website data or course pages are out of date",
    )
    args = parser.parse_args()

    outputs = build_outputs()
    expected_pages = {path for path in outputs if path.parent == COURSE_PAGE_ROOT}
    existing_pages = set(COURSE_PAGE_ROOT.glob("*.mdx")) if COURSE_PAGE_ROOT.exists() else set()
    stale_pages = sorted(existing_pages - expected_pages)
    changed = []

    for path, content in outputs.items():
        current = path.read_text(encoding="utf-8") if path.exists() else ""
        if current != content:
            changed.append(path)
            if not args.check:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content, encoding="utf-8", newline="\n")

    if stale_pages:
        changed.extend(stale_pages)
        if not args.check:
            for path in stale_pages:
                path.unlink()

    if args.check and changed:
        for path in changed:
            print(f"out of date: {path.relative_to(ROOT)}", file=sys.stderr)
        return 1

    action = "Checked" if args.check else "Generated"
    print(f"{action} website index and {len(expected_pages)} course pages; {len(changed)} changed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
