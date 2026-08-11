# 贡献指南

## 路径规则

只允许：

```text
课程资料/<课号-课程名>/<资料类型>/...
```

固定资料类型：`通用资料`、`Quiz`、`作业`、`试卷`、`Practice`、`复习资料`。

禁止按专业、学期、教师或年级新建物理分区目录。两专业共享课只保留一份。

## 课表索引

若新增课程或调整学期，请更新唯一数据源：

- `data/curricula.json`：专业与学期映射
- `data/course-overrides.json`：转学成绩要求、合并存档说明等人工补充字段

随后生成所有专业索引、学期页面和课程 README：

```bash
python scripts/generate_catalog.py
python scripts/generate_catalog.py --check
```

不要直接编辑自动生成的 `curricula/DMT/`、`curricula/AMS/` 或课程目录内的 `README.md`。
课程分类中没有实际文件时不要添加 `.gitkeep`；空分类不会出现在 GitHub 页面上。

学院课程字段快照位于 `data/official-courses-2022.json`。官网更新后可运行：

```bash
python scripts/sync_official_courses.py
python scripts/generate_catalog.py
```

如果官网拒绝命令行请求，请先在浏览器中把课程设置页保存为 HTML，再运行
`python scripts/sync_official_courses.py --input-html <保存的网页>`。

## 年级后缀

已有资料不追溯改名。今后新增的 Quiz / 作业 / 试卷 / Practice / 复习资料：

```text
期末试卷__2024级.pdf
Homework7__2024级/
```

## 隐私

文件名或内容含个人标识时直接排除，不要用改名掩盖。

## Git

- 从最新目标分支拉出独立分支
- 整理已有文件优先 `git mv`
- 未经维护者同意不要直接推 `main`
