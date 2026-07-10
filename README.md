# AHU 石溪学院课程资料库

安徽大学石溪学院课程资料归档。仓库只按“课程”和“资料类型”组织，不按专业、开课学期或教师拆分；同一门课程的资料只保存一份。

资料仅供个人学习、复习和备份。课程安排、教学内容和考核方式可能变化，请以学院当学期通知为准。

## 课程索引

- [毕业实习-系统硬件综合实训](课程资料/毕业实习-系统硬件综合实训)
- [操作系统](课程资料/操作系统)
- [常微分方程](课程资料/常微分方程)
- [程序设计与算法综合训练](课程资料/程序设计与算法综合训练)
- [大学物理](课程资料/大学物理)
- [大学物理实验](课程资料/大学物理实验)
- [大学艺术](课程资料/大学艺术)
- [概率论与数理统计](课程资料/概率论与数理统计)
- [高级语言程序设计](课程资料/高级语言程序设计)
- [计算机安全基础](课程资料/计算机安全基础)
- [计算机图形学](课程资料/计算机图形学)
- [计算机组成原理与汇编语言程序设计](课程资料/计算机组成原理与汇编语言程序设计)
- [军事理论](课程资料/军事理论)
- [离散数学](课程资料/离散数学)
- [马原](课程资料/马原)
- [毛概](课程资料/毛概)
- [面向对象编程概论](课程资料/面向对象编程概论)
- [人机交互](课程资料/人机交互)
- [社会心理学](课程资料/社会心理学)
- [数据分析](课程资料/数据分析)
- [数据结构](课程资料/数据结构)
- [数据库设计与实践](课程资料/数据库设计与实践)
- [数字逻辑](课程资料/数字逻辑)
- [数字媒体技术原理](课程资料/数字媒体技术原理)
- [网络原理](课程资料/网络原理)
- [习概下](课程资料/习概下)
- [习思想上](课程资料/习思想上)
- [信息管理](课程资料/信息管理)
- [信息技术基础](课程资料/信息技术基础)
- [信息系统中的法律、社会与道德问题](课程资料/信息系统中的法律、社会与道德问题)
- [应用微积分I](课程资料/应用微积分I)
- [应用微积分II](课程资料/应用微积分II)
- [应用微积分III](课程资料/应用微积分III)
- [应用线性代数](课程资料/应用线性代数)
- [ENG](课程资料/ENG)
- [GUI开发](课程资料/GUI开发)
- [Python](课程资料/Python)

## 库结构规范

```text
README.md
<非课程资料>
课程资料/
  <课程名称>/
    通用资料/
    Quiz/
    作业/
    试卷/
    Practice/
    复习资料/
```

根目录只放索引 README、仓库配置和不属于具体课程的公共文件。课程文件只能放在 `课程资料/<课程名称>/` 下。

固定资料类型：

| 目录 | 放置内容 | 年级后缀 |
| --- | --- | --- |
| `通用资料` | 课件、教材、教学大纲、软件说明、跨届通用参考资料 | 不添加 |
| `Quiz` | Quiz 题目、答案和解析 | 新资料需要 |
| `作业` | 作业、实验、课程项目、报告 | 新资料需要 |
| `试卷` | 期中、期末、模拟卷及对应答案 | 新资料需要 |
| `Practice` | 练习、题库、思考题、例题 | 新资料需要 |
| `复习资料` | 知识点、笔记、总结、复习提纲 | 新资料需要 |

不得新增专业、学期、教师或纯年级目录。无法判断类型时放入 `通用资料`，不要让 AI 自创分类名称。

### 年级后缀

当前仓库已有资料不追溯添加年级后缀。今后新增的 `Quiz`、`作业`、`试卷`、`Practice`、`复习资料`应标明资料提供者的入学年级：

```text
Quiz 1 Solutions__2024级.pdf
期末试卷__2024级.pdf
Homework7__2024级/
来源不明的复习提纲__来源届待确认.pdf
```

- 年级表示资料提供者的入学年级，不是考试年份、学年或上传年份。
- 后缀放在扩展名前，使用 `__20XX级`；来源无法确认时使用 `__来源届待确认`。
- 对包含多个相互引用文件的代码、网页、实验环境或压缩包，只给最外层资料包名称添加后缀，内部文件名保持不变。
- `通用资料`不添加年级后缀；同名但内容不同的文件不得覆盖。

### 隐私规则

文件或资料包名称中含真实姓名、学号、邮箱、手机号、账号等个人标识时，直接排除，不以重命名方式规避。提交前还应检查文件内容，不确定能否公开时不要提交。

## 面向大模型的规范

下列 YAML 是本仓库的机器可读约束。自然语言说明与 YAML 冲突时，以硬性约束更严格的一项为准。

```yaml
repository_policy:
  schema_version: 1
  canonical_course_root: "课程资料"
  canonical_path: "课程资料/{课程名称}/{资料类型}/{原始相对路径}"
  physical_partitions:
    major: forbidden
    semester: forbidden
    teacher: forbidden
    cohort_directory: forbidden
  allowed_material_types:
    - "通用资料"
    - "Quiz"
    - "作业"
    - "试卷"
    - "Practice"
    - "复习资料"
  common_materials:
    includes: ["课件", "教材", "教学大纲", "通用参考资料"]
    cohort_suffix: forbidden
  existing_materials:
    bulk_add_cohort_suffix: forbidden
  future_cohort_specific_materials:
    types: ["Quiz", "作业", "试卷", "Practice", "复习资料"]
    suffix_format: "__{入学年份}级"
    unknown_suffix: "__来源届待确认"
    package_rule: "只修改最外层资料包名称，禁止修改包内文件名"
  privacy:
    filename_identifiers: ["真实姓名", "学号", "邮箱", "手机号", "账号"]
    action: "exclude"
    rename_to_hide_identity: forbidden
  content_mutation:
    edit_existing_course_file: forbidden
    convert_existing_course_file: forbidden
    overwrite_existing_course_file: forbidden
    delete_unrelated_material: forbidden
  duplication:
    duplicate_cross_major_course_files: forbidden
  git_workflow:
    direct_commit_to_main: forbidden
    force_push_main: forbidden
    pull_request_initial_state: "draft"
    merge_requires_other_member_review: true
```

可以把下面的提示词交给本地 AI：

```text
请严格读取本仓库 README 和其中的 repository_policy YAML 后整理资料。

1. 先检查当前 Git 分支、git status 和待整理文件，禁止直接在 main 工作。
2. 只允许路径：课程资料/<课程>/<固定资料类型>/<原始相对路径>。
3. 固定资料类型只有：通用资料、Quiz、作业、试卷、Practice、复习资料。
4. 课件进入通用资料，不添加年级后缀。
5. 当前已有资料不批量添加年级；新增的五类非通用资料按 README 添加来源年级后缀。
6. 完整资料包只修改最外层名称，禁止修改内部文件名或文件内容。
7. 文件名含个人标识时排除，不得用改名掩盖。
8. 不按专业、学期、教师或年级建立目录，不复制跨专业课程。
9. 发现同名、疑似重复或分类不确定时停止并列出冲突。
10. 完成后运行 git status、git diff --summary 和隐私关键词检查，输出旧路径到新路径的映射。
11. 未经明确授权，不提交、不推送、不创建或合并 PR。
```

## Pull Request 规范

1. 从最新 `main` 创建独立分支，一个 PR 尽量只处理一门课程或一类结构变更。
2. 使用 `git mv` 整理已有文件，禁止修改课程文件内容。
3. PR 初始状态必须为 Draft，目标分支为 `main`。
4. 至少由一名非提交者核验目录、文件完整性和隐私后，才能转为 Ready 或合并。
5. 禁止直接向 `main` 提交、强制推送或用工作分支替换 `main`。

PR 描述至少包含：

```text
变更范围：
分类依据：
新增资料来源年级（如有）：
排除的个人信息文件数量：
验证结果：

- [ ] 未修改已有课程文件内容
- [ ] 未新增专业、学期、教师或年级目录
- [ ] 已检查文件名和文件内容中的个人信息
- [ ] 已检查重复文件和同名覆盖
- [ ] 已由其他成员核验后再考虑合并
```

提交前运行：

```powershell
git status --short
git diff --summary
git diff --stat
git diff --cached --summary
git diff --cached --stat
```

结构整理应主要显示 rename。出现课程文件内容修改、意外删除或同名覆盖时，应停止并人工核对。

## 免责声明

本仓库不是学院官方资料库，不保证内容完整、准确或适用于当前教学安排。禁止将仓库内容用于售卖、代写、抄袭、批量搬运或冒充官方资料；由不当使用产生的后果由使用者自行承担。

## Star History

<a href="https://www.star-history.com/?repos=UponNoise%2FAHU_SBI_DMT&type=date&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/chart?repos=UponNoise/AHU_SBI_DMT&type=date&theme=dark&legend=top-left&sealed_token=p9G2nCa5-PS6mDejwlotFdrhVuCENgU3OKcewi3hrhzqM6CfPIZYqENhRJekAQUi9VHZglbJWI1ALs1107sAwsun9aXE0BdqqMeHT2rSqlc6oeQ69-CqfM6-h18L52Ig4hkCnN6wCRPD-idgJgpTj6vp-8SE7dXvEfUdbiNxABSa46IJN-cfRViBp3hX" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/chart?repos=UponNoise/AHU_SBI_DMT&type=date&legend=top-left&sealed_token=p9G2nCa5-PS6mDejwlotFdrhVuCENgU3OKcewi3hrhzqM6CfPIZYqENhRJekAQUi9VHZglbJWI1ALs1107sAwsun9aXE0BdqqMeHT2rSqlc6oeQ69-CqfM6-h18L52Ig4hkCnN6wCRPD-idgJgpTj6vp-8SE7dXvEfUdbiNxABSa46IJN-cfRViBp3hX" />
   <img alt="Star History Chart" src="https://api.star-history.com/chart?repos=UponNoise/AHU_SBI_DMT&type=date&legend=top-left&sealed_token=p9G2nCa5-PS6mDejwlotFdrhVuCENgU3OKcewi3hrhzqM6CfPIZYqENhRJekAQUi9VHZglbJWI1ALs1107sAwsun9aXE0BdqqMeHT2rSqlc6oeQ69-CqfM6-h18L52Ig4hkCnN6wCRPD-idgJgpTj6vp-8SE7dXvEfUdbiNxABSa46IJN-cfRViBp3hX" />
 </picture>
</a>
