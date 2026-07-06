# ISE 333: 用户界面开发（设计）— 期末复习完整指南
# ISE 333: User Interface Development (Design) — Complete Final Exam Review Guide

> **课程 / Course**: ISE 333 — User Interface Development (Design)  
> **学期 / Semester**: Spring 2026  
> **教师 / Instructor**: Hao Li (李昊)  
> **教材 / Textbook**: Ben Shneiderman, *Designing the User Interface: Strategies for Effective Human-Computer Interaction* (6th Edition), 2018  
> **教学风格 / Teaching Style**: Textbook-Based & Personally-Interpreted/Enriched (TBPIE)  
> **考试说明 / Exam Note**: 硬知识（记忆型考点）完全基于教学PPT / Memory-style exam points are totally based on teaching PPTs

---

## 目录 / Table of Contents

1. [第一章：交互系统的可用性 / Chapter 1: Usability of Interactive Systems](#ch01)
2. [第二章：通用可用性 / Chapter 2: Universal Usability](#ch02)
3. [第三章A：指南 / Chapter 3A: Guidelines](#ch03a)
4. [第三章B：原则 / Chapter 3B: Principles](#ch03b)
5. [第三章C：理论 / Chapter 3C: Theories](#ch03c)
6. [第四章：设计 / Chapter 4: Design](#ch04)
7. [第七章：直接操纵与沉浸式环境 / Chapter 7: Direct Manipulation and Immersive Environments](#ch07)
8. [第八章：导航、表单填写与对话框 / Chapter 8: Navigation, Form Fill-In, Dialog Boxes](#ch08)
9. [第九章：表达性人类语言与命令语言 / Chapter 9: Expressive Human and Command Languages](#ch09)
10. [第十章：设备 / Chapter 10: Devices](#ch10)
11. [第十一章：通信与协作 / Chapter 11: Communication and Collaboration](#ch11)
12. [第十二章：提升用户体验 / Chapter 12: Advancing the User Experience](#ch12)
13. [第十四章：文档与用户支持 / Chapter 14: Documentation and User Support](#ch14)
14. [第十五章+第十六章：信息搜索与数据可视化 / Chapter 15+16: Information Search & Data Visualization](#ch15_16)
15. [Quiz 1 & Quiz 2 参考分析 / Quiz 1 & Quiz 2 Reference Analysis](#quiz)
16. [期末考试范围与占比分析 / Final Exam Scope & Weight Analysis](#exam)

---

<a name="ch01"></a>

## 第一章：交互系统的可用性 / Chapter 1: Usability of Interactive Systems

### 1.1 用户界面概念 / Conception of User Interface

| 中文 / Chinese | English |
|---|---|
| **用户界面（UI）** 指用户与计算机系统（或其他系统，如机械系统、交通系统、行政系统、文化系统等）交互的媒介，或系统向用户提供服务的媒介。它包含用户与系统之间交互涉及的所有元素。 | The **User Interface (UI)** refers to the medium/media via which users interact with computer systems (or other kinds of systems such as mechanical, traffic, administrative, cultural systems, etc.), or in other words, via which the systems provide services to the users. It encompasses all the elements involved in the interaction between the users and the systems. |
| 课程重点是计算机系统，但知识本质具有更广泛的适用性。 | The focus is computer systems, but knowledge essence is more generally applicable. |

### 1.2 UI设计的革命与贡献 / Revolution and Contribution of UI Design

| 中文 / Chinese | English |
|---|---|
| UI设计师是一场深刻变革的英雄。他们的工作将个人电脑转变为今天极度成功的移动设备，使用户能够以卓越的方式进行通信和协作。 | User-interface designers are the heroes of a profound transformation. Their work turned personal computers into today's wildly successful mobile devices, enabling users to communicate and collaborate in remarkable ways. |
| **核心观点**：核心技术没有改变，但UI的巨大差异改变了一切。 | **Key insight**: Core technology had not changed, but what made a huge difference is the UI. |
| 改变生活的转变之所以可能，是因为研究者和UI设计师（开发者）利用技术服务于人类需求。研究者创造了人机交互（HCI）这一跨学科科学，将实验心理学的方法应用于计算机科学的强大工具。他们还整合了教育/工业心理学家、教学/图形设计师、技术写作者、人因工程/工效学专家，以及越来越多的人类学家和社会学家的经验。 | Life-changing shifts were made possible because researchers and user-interface designers (developers) harnessed technology to serve human needs. Researchers created the interdisciplinary science of **human-computer interaction (HCI)** by applying the methods of experimental psychology to the powerful tools of computer science. Then they integrated lessons from educational and industrial psychologists, instructional and graphic designers, technical writers, experts in human factors or ergonomics, and growing teams of anthropologists and sociologists. |

### 1.3 社会影响 / Social Impact

| 中文 / Chinese | English |
|---|---|
| **个人层面**：有效的用户体验改变人们的生活——医生诊断、飞行员驾驶飞机、学生学习知识、教师传授知识。 | **Individual level**: Effective user experiences change people's lives — doctors' diagnoses, pilots' flying airplanes, students' learning knowledge, teachers' imparting knowledge. |
| **社会层面**：互联社区开辟了集体行动和政策参与的新形式。更多知情公民可能导致更好的决策、更透明的治理和更大的公平。 | **Societal level**: Connected communities open up new forms of collective action and policy engagement. Having more informed citizens may lead to better decisions, more transparent governance, and greater equity. |
| 对HCI日益增长的兴趣源于设计师改善用户体验的愿望。**用户界面开发/设计（UID）是不可或缺的**。 | The steadily growing interest in HCI stems from the designers' desire to improve the user experience. **UID is indispensable**. |

### 1.4 信息时代的UID / UID in the Information Era

| 中文 / Chinese | English |
|---|---|
| 移动设备的快速广泛普及支持个人通信、协作和内容创作。社交媒体和用户生成内容正在经历爆炸式增长。 | The remarkably rapid and widespread adoption of mobile devices supports personal communication, collaboration, and content creation. Social networking and user-generated content are experiencing explosive growth. |
| **挑战**：UID面临在小尺寸、墙壁尺寸和商场尺寸的显示屏上为不同文化、不同个性的各类人群提供服务的挑战。必须尊重**可塑性（plasticity）和可延展性（malleability）**。 | **Challenge**: UID faces the challenge of providing services on small-, wall-, and mall-sized displays, ranging across various products for various people of various cultures and various personalities. **Plasticity and malleability** have to be respected. |
| 新形式的UI正在出现：普适的、无形的、嵌入周围环境的；上下文感知的、专注的、可感知的；可穿戴的、植入式控制的、多模态的、手势的、情感的。 | New forms of UI are appearing: ubiquitous, pervasive, invisible, embedded; context-aware, attentive, perceptive; wearable, control implanted, multi-modal, gestural, and affective. |

### 1.5 可用性目标与度量 / Usability Goals and Measures

| 中文 / Chinese | English |
|---|---|
| 三大主要特征：**可用性（Usability）、通用性（Universality）、有用性（Usefulness）** | Three primary features: **Usability, Universality, Usefulness** |
| 实现可用性目标需要：深思熟虑的规划、对用户需求的敏感、需求分析的投入、勤奋的测试——在预算内并按计划进行。 | Achievement requires: thoughtful planning, sensitivity to user needs, devotion to requirements analysis, diligent testing — within budget and on schedule. |

**管理者和设计师的角色 / Roles of Managers and Designers**:

| 中文 / Chinese | English |
|---|---|
| **管理者**：追求UI卓越的管理者首先选择经验丰富的设计师，然后准备包含需求收集、指南编制和反复测试时间的现实时间表。 | **Managers**: Those who pursue UI excellence first select experienced designers and then prepare realistic schedules that include time for requirements gathering, guidelines preparation, and repeated testing. |
| **设计师**：从确定用户需求开始，生成多个设计替代方案，并进行广泛评估。成功的UI设计师对多元用户群体和需要完成的任务有透彻的理解。他们超越"用户友好"、"直观"和"自然"等模糊概念。 | **Designers**: Begin by determining user needs, generating multiple design alternatives, and conducting extensive evaluations. Successful designers have a thorough understanding of the diverse community of users and the tasks that must be accomplished. They go beyond vague notions of "user friendliness", "intuitive", and "natural". |

### 1.6 关键公式与定律 / Key Formulas & Laws (mentioned in Chapter 1)

| 名称 / Name | 公式 / Formula | 说明 / Description |
|---|---|---|
| **Miller's Law (米勒定律)** | 7 ± 2 规则 | 人类短期记忆能同时处理的"组块"数量约为 7±2 / The number of "chunks" human short-term memory can handle simultaneously is about 7±2 |
| **Fitts's Law (菲茨定律)** | $T = a + b \cdot \log_2(D/W + 1)$ | T = 移动时间, D = 目标距离, W = 目标宽度 / T = movement time, D = target distance, W = target width |
| **Huffman Coding (哈夫曼编码)** | 变长编码 | 高频符号使用短码，低频符号使用长码 / High-frequency symbols use short codes, low-frequency ones use longer codes |

---

<a name="ch02"></a>

## 第二章：通用可用性 / Chapter 2: Universal Usability

### 2.1 人类多样性 / Human Diversity

| 中文 / Chinese | English |
|---|---|
| 人类能力、背景、动机、个性、文化和工作风格的显著多样性对UID设计师构成挑战。 | The remarkable diversity of human abilities, backgrounds, motivations, personalities, cultures, and work styles challenges UIDers. |
| 移动设备庞大的国际消费市场提高了对通用可用UI设计的压力。 | The huge international consumer market in mobile devices has raised the pressure for UI designs that are universally usable. |
| 重新思考不同情境下的UI设计通常能为所有用户带来更好的产品。为某一群体特殊需求采取的措施（如轮椅坡道）往往使许多群体受益（如婴儿车、带轮行李箱）。 | Rethinking UI designs for differing situations often results in a better product for all users. Measures to accommodate special needs of one group (e.g., sidewalk curb cuts for wheelchair users) often have payoffs for many groups (e.g., baby strollers, wheeled luggage). |

### 2.2 个体多样性 / Individual Diversity

#### 2.2.1 身体能力差异 / Variations in Physical Abilities

| 中文 / Chinese | English |
|---|---|
| 人因工程研究者积累了大量人体测量数据：数千项关于数百种人体特征的测量——男性和女性、年轻人和成年人、亚洲人和欧洲人、体重不足和超重、高个和矮个——提供了构建5-95百分位设计范围的数据。 | Ergonomics researchers accumulated thousands of measures of hundreds of features of people — male and female, young and adult, Asian and European, underweight and overweight, tall and short — providing data to construct 5- to 95-percentile design ranges. |
| **不存在"平均"用户**，必须在设计中做出妥协或构建多版本系统。 | There can be **no image of an "average" user**; compromises must be made or multiple versions of a system must be constructed. |
| 动态动作的测量（如坐姿触及距离、手指按压速度、举力）也同样必要。 | Measures of dynamic actions (e.g., reach distance while seated, speed of finger presses, strength of lifting) are also necessary. |

**感知能力 / Perceptual Abilities**:

| 中文 / Chinese | English |
|---|---|
| 视觉系统对不同颜色有不同响应；人的光谱范围和敏感度各不相同；**周边视觉（peripheral vision）**与**中央凹（fovea，视网膜中央部分）**的图像感知截然不同。 | The visual system responds differently to various colors; people's spectral range and sensitivity vary; **peripheral vision** is quite different from the perception of images in the **fovea** (the central part of the retina). |
| 其他感官也很重要：触觉用于键盘/触摸屏；听觉用于声音提示；语音输入/输出。 | Other senses: touch for keyboard/touch-screen; hearing for audible cues; speech input/output. |

#### 2.2.2 身体工作场所差异 / Variations in Physical Workplaces

**人因工程计算机工作站标准（Human Factors Engineering of Computer Workstations）关注事项**:

- 工作台和显示器支撑高度 / Worktable and display support height
- 工作表面下方的腿部空间 / Clearance under work surface for legs
- 工作表面宽度和深度 / Work-surface width and depth
- 椅子和工作表面的高度和角度可调性 / Adjustability of heights and angles for chairs and work surfaces
- 姿势——座椅深度和角度、靠背高度等 / Posture — seating depth and angle, backrest height, etc.
- 扶手、脚垫和掌托的可用性 / Availability of armrests, footrests, and palmrests
- 椅子脚轮的使用 / Use of chair casters

| 中文 / Chinese | English |
|---|---|
| 工作场所设计对于确保高工作满意度、良好表现和低错误率至关重要。嘈杂的环境、糟糕的照明或闷热的房间会降低表现、增加错误率，并使有动力的用户也感到沮丧。 | Workplace design is important in ensuring high job satisfaction, good performance, and low error rates. Designs can be compromised by a noisy environment, poor lighting, or a stuffy room, and that will eventually lower performance, raise error rates, and discourage even motivated users. |

#### 2.2.3 认知与感知能力差异 / Diverse Cognitive and Perceptual Abilities

| 中文 / Chinese | English |
|---|---|
| 交互系统设计师的重要基础是理解用户的认知和感知能力。注意：这里的"感知能力"指高/认知层面的感知能力（cognitive-level perception），与前面提到的低/物理层面的感知能力（physical-level perception）不同。**认知层面的感知 ≠ 好视力**。 | A vital foundation for interactive-system designers is an understanding of the cognitive and perceptual abilities of the users. Note: "perceptual abilities" here refers to high/cognitive-level perceptual abilities, in contrast with low/physical-level perceptual abilities. **Cognitive-level perception ≠ Good sight**. |

**人类认知过程分类 / Classification of Human Cognitive Processes**:

| 中文 / Chinese | English |
|---|---|
| 短期记忆与工作记忆 | Short-term and working memory |
| 长期记忆与语义记忆 | Long-term and semantic memory |
| 问题解决与推理 | Problem solving and reasoning |
| 决策与风险评估 | Decision making and risk assessment |
| 语言交流与理解 | Language communication and comprehension |
| 搜索、想象与感觉记忆 | Search, imagery, and sensory memory |
| 学习、技能发展、知识获取与概念习得 | Learning, skill development, knowledge acquisition, and concept attainment |

#### 2.2.4 个性差异 / Personality Differences

| 中文 / Chinese | English |
|---|---|
| 有些人热切使用计算机和移动设备，而另一些人则感到沮丧。即使是喜欢使用这些技术的人，也可能对交互风格、交互节奏、图形vs表格呈现、密集vs稀疏数据呈现等有非常不同的偏好。 | Some people are eager to use computers and mobile devices, while others find them frustrating. Even people who enjoy these technologies may have very different preferences for interaction styles, pace of interaction, graphics versus tabular presentations, dense versus sparse data presentation, etc. |
| **没有简单的用户个性类型分类法**。 | There is **no simple taxonomy of user personality types**. |

**大五人格测试 / Big Five Test**（流行但有争议的技术 / popular yet controversial technique）:

| 中文 / Chinese | English |
|---|---|
| 开放性（封闭/开放） | Openness to experience/Intellect (closed/open) |
| 自律性（无序/有序） | Conscientiousness (disorganized/organized) |
| 外向性（内向/外向） | Extraversion (introverted/extroverted) |
| 宜人性/温润性（不合作/合作） | Agreeableness (disagreeable/agreeable) |
| 神经质/稳重性（冷静/紧张） | Neuroticism (calm/nervous) |

### 2.3 群体/社区多样性 / Group/Community Diversity

#### 2.3.1 文化与国际多样性 / Cultural and International Diversity

| 中文 / Chinese | English |
|---|---|
| UID设计师仍在努力建立适合多种语言和文化的指南。促进UI本地版本定制的软件架构提供竞争优势。 | UIDers are still struggling to establish guidelines that are appropriate across multiple languages and cultures. Software architectures that facilitate customization of local versions of UIs offer a competitive advantage. |

**国际化关注的UID事项 / UID Concerns for Internationalization**:

- 字符、数字、特殊字符和变音符号 / Characters, numerals, special characters, and diacritics
- 从左到右 vs 从右到左 vs 垂直输入和阅读 / Left-to-right vs right-to-left vs vertical input and reading
- 日期和时间格式 / Date and time formats
- 数字和货币格式 / Numeric and currency formats
- 度量衡 / Weights and measures
- 电话号码和地址 / Telephone numbers and addresses
- 姓名和头衔 / Names and titles (Mr., Ms., Mme., M., Dr.)
- 身份证号 / Social security, national identification, and passport numbers
- 大写和标点 / Capitalization and punctuation
- 排序顺序 / Sorting sequences
- 图标、按钮和颜色 / Icons, buttons, and colours
- 复数、语法和拼写 / Pluralization, grammar, and spelling
- 礼仪、政策、语气、正式程度和隐喻 / Etiquette, policies, tone, formality, and metaphors

#### 2.3.2 残障用户 / Users with Disabilities

| 中文 / Chinese | English |
|---|---|
| 当数字内容和服务可以灵活地以不同格式呈现时，所有用户都受益。灵活性最受残障用户欣赏。 | When digital content and services can be flexibly presented in different formats, all users benefit. Flexibility is most appreciated by users with disabilities. |
| 盲人用户：屏幕阅读器或可刷新盲文显示器 / Blind users: screen readers or refreshable braille displays | |
| 听力受损用户：视频字幕和音频转录 / Hearing impairments: captioning on videos and transcripts of audio | |
| 行动不便用户：语音识别、眼动追踪、替代键盘或指点设备 / Motor impairments: speech recognition, eye-tracking, alternative keyboards or pointing devices | |
| **Web内容无障碍指南（WCAG）** 是无障碍设计的法律/法规基础。 | **Web Content Accessibility Guidelines (WCAG)** are the basis for accessibility laws and regulations. |

#### 2.3.3 老年用户 / Older Users

| 中文 / Chinese | English |
|---|---|
| 衰老可能带来负面的身体、认知和社会后果。理解衰老的人因可以帮助UID设计师创建便于老年用户访问的UI。 | Aging can have negative physical, cognitive, and social consequences. Understanding the human factors of aging can help UIDers to create UIs that facilitate access by older users. |
| 随年龄增长的非均匀渐进变化：平均视觉和听觉敏锐度显著下降、平均力量和反应速度下降、某些记忆功能丧失、感知灵活性下降、刺激编码减慢、复杂心理技能习得难度增加等。视觉功能如静态视觉敏锐度、暗适应、对比敏感度和周边视觉平均随年龄下降。 | A nonuniform set of progressive changes: average visual and auditory acuity decline, average strength and speed of response decline, loss of some memory function, decline in perceptual flexibility, slowing of stimulus encoding, increased difficulty in acquisition of complex mental skills, etc. |
| **为老年用户设计的好处惠及所有用户**：更大的街道标志、更亮的交通灯、更好的夜间照明；桌面/网页/移动设备提供字体大小、显示对比度和音频级别的控制；更易用的指点设备、更清晰的导航路径和一致的布局。 | **Designing for older users benefits all users**: larger street signs, brighter traffic lights, better nighttime lighting; control over font sizes, display contrast, and audio levels; easier-to-use pointing devices, clearer navigation paths, and consistent layouts. |
| 在UID过程中考虑老年和残障用户通常会产生新颖的解决方案：圆珠笔（为行动不便者）、盒式录音机（为盲人听故事）、自动补全/建议软件（简化数据输入）。 | Considering older and disabled users often produces novel solutions: ballpoint pens (for people with impaired dexterity), cassette tape recorders (for blind users), auto-completion/suggesting software. |

#### 2.3.4 儿童用户 / Children

| 中文 / Chinese | English |
|---|---|
| 适当的儿童UID原则认识到年轻用户对交互式参与的强烈愿望，这种参与给予他们控制和适当反馈，并支持他们与同伴的社交互动。 | Appropriate UID principles for children recognize young users' intense desire for interactive engagement that gives them control with appropriate feedback and supports their social engagement with peers. |
| 儿童喜欢熟悉的角色、探索性环境和重复的能力。年幼的儿童有时会重播一个游戏、重读一个故事或重听一个音乐序列数十次。 | Children like familiar characters, exploratory environments, and the capacity for repetition. Younger children will sometimes replay a game, reread a story, or replay a music sequence dozens of times. |
| **设计限制**：不断发展的灵巧性意味着鼠标拖拽、双击和小目标不能总是使用；低抽象能力意味着复杂序列应避免；注意力短暂；同时处理多个概念的能力有限。 | **Design limitations**: evolving dexterity means mouse dragging, double-clicking, and small targets cannot always be used; low capacity for abstraction means complex sequences must be avoided; short attention spans; limited capacity to work with multiple concepts. |
| 儿童UID设计师有责任关注危险，尤其是在基于Web的环境中。关于隐私问题和陌生人威胁的适当教育也是必需的。 | UIDers for children should have a responsibility to attend to dangers, especially in web-based environments. Appropriate information about privacy issues and threats from strangers is also a requirement. |

### 2.4 硬件与软件多样性 / Hardware and Software Diversity

| 中文 / Chinese | English |
|---|---|
| 除了适应不同用户类别和技能水平外，UID设计师还需要支持广泛的硬件和软件平台。需要兼容旧设备并处理可能具有低处理能力的新移动设备。 | In addition to accommodating different classes of users and skill levels, UIDers need to support a wide range of hardware and software platforms. Need to accommodate older devices and deal with newer mobile devices. |

---

<a name="ch03a"></a>

## 第三章A：指南 / Chapter 3A: Guidelines

### 3A.1 三层知识组织 / Three-Level Organization

| 层级 / Level | 中文说明 / Chinese | English |
|---|---|---|
| **指南 (L-低层)** | 低层次的聚焦建议，关于良好实践和危险警告 | Low-level focused advice about good practices and cautions against dangers |
| **原则 (M-中层)** | 中层次的策略或规则，用于分析和比较UID备选方案 | Middle-level strategies or rules to analyse and compare UID alternatives |
| **理论 (H-高层)** | 高层次的广泛适用框架，用于UID/评估中支持沟通和教学；理论也可以是预测性的 | High-level widely applicable frameworks to draw on during UID/evaluation to support communication and teaching; theories can also be predictive |

### 3A.2 导航UI指南 / Navigating the UI

| 中文 / Chinese | English |
|---|---|
| **标准化任务序列**：允许用户在类似条件下以相同的顺序和方式执行任务 | **Standardize task sequences**: Allow users to perform tasks in the same sequence and manner across similar conditions |
| **确保嵌入链接具有描述性**：链接文本应准确描述链接目标 | **Ensure that embedded links are descriptive**: Link text should accurately describe the link's destination |
| **使用独特且具有描述性的标题**：标题应彼此区分，且与内容在概念上相关 | **Use unique and descriptive headings**: Headings should be distinct from one another and conceptually related to the content |
| **对互斥选择使用单选按钮**：涉及互斥选项列表时提供单选按钮控件 | **Use radio buttons for mutually exclusive choices**: Provide a radio button control when a list of mutually exclusive options is involved |
| **开发能正确打印的页面**：如果用户可能打印页面，开发宽度合适的页面 | **Develop pages that will print properly**: If users are likely to print one or more pages, develop pages with widths that print properly |
| **使用缩略图预览大图**：当查看全尺寸图像不关键时，先提供缩略图。这有生物学解释（尺度空间理论 / Scale-space theory），并非纯粹的经验知识。 | **Use thumbnail images to preview larger images**: When viewing full-size images is not critical, first provide a thumbnail. This is biologically explainable (Scale-space theory), not purely empirical knowledge. |

### 3A.3 组织显示的指南 / Organizing the Display

**数据显示的五个高层次目标 / Five High-Level Goals for Data Display**:

| # | 中文 / Chinese | English |
|---|---|---|
| 1 | **数据显示的一致性**：术语、缩写、格式、颜色、大写等在整个UID过程中都应标准化，通过使用术语词典来控制 | **Consistency of data display**: Terminology, abbreviations, formats, colours, capitalization, etc., should all be standardized and controlled by use of a dictionary |
| 2 | **用户高效信息吸收**：格式应对操作者熟悉，并与需执行的任务相关。整洁的数据列、字母数据左对齐/整数右对齐、小数点对齐、适当间距、可理解标签、适当度量单位等 | **Efficient information assimilation by the user**: Format should be familiar to the operator and related to the tasks. Neat columns, left/right justification for alphabetic data/integers, lining up of decimal points, proper spacing, comprehensible labels, appropriate measurement units |
| 3 | **最小化用户记忆负担**：用户不应被要求记住一个屏幕的信息用于另一个屏幕。任务安排应使完成只需少量操作，最小化遗忘步骤的机会 | **Minimal memory load on the user**: Users should not be required to remember information from one screen for use on another screen. Tasks should be arranged such that completion occurs with few actions |
| 4 | **数据显示与数据输入兼容**：显示信息的格式应明确关联到数据输入的格式。输出字段在可能和适当的情况下也应充当可编辑的输入字段 | **Compatibility of data display with data entry**: Format of displayed information should be linked clearly to the format of data entry. Output fields, where possible and appropriate, should also act as editable input fields |
| 5 | **用户对数据显示的灵活控制**：用户应能以对他们正在工作的任务最方便的形式从显示中获取信息——例如列的排序和行的排序应能被用户轻松更改 | **Flexibility for user control of data display**: Users should be able to get the information from the display in the form most convenient for the task — e.g., the order of columns and sorting of rows should be easily changeable by users |

### 3A.4 吸引用户注意力的指南 / Getting the User's Attention

| 技术 / Technique | 指南 / Guideline |
|---|---|
| **强度 / Intensity** | 仅使用两个级别，有限使用高强度来吸引注意力 / Use two levels only, with limited use of high intensity to draw attention |
| **标记 / Marking** | 下划线、框选、箭头指向、或使用指示符（星号、子弹点、破折号、加号等）/ Underline, enclose in a box, point with an arrow, or use indicators (asterisk, bullet, dash, plus sign, etc.) |
| **大小 / Size** | 最多使用四种大小，较大的尺寸吸引更多注意力 / Use up to four sizes, with larger sizes attracting more attention |
| **字体选择 / Choice of fonts** | 最多使用三种字体 / Use up to three fonts |
| **闪烁 / Blinking** | 非常谨慎地使用闪烁显示（2-4 Hz）或闪烁颜色变化，且仅在有限区域使用，因为它会分散注意力并可能引发癫痫 / Use blinking displays (2-4 Hz) or blinking colour changes with great care and in limited areas, as it is distracting and can trigger seizures |
| **颜色 / Colour** | 最多使用四种标准颜色，额外颜色保留用于偶尔使用 / Use up to four standard colours, with additional colours reserved for occasional use |
| **音频 / Audio** | 使用柔和音调进行常规正面反馈，使用刺耳声音用于罕见紧急情况 / Use soft tones for regular positive feedback and harsh sound for rare emergency conditions |

> ⚠️ **关键原则 / Key Principle**: 不要滥用任何吸引注意力的技术。"一切都是重要的" = "没有什么是重要的"。/"Everything is important" = "Nothing is important".

### 3A.5 促进数据输入的指南 / Facilitating Data Entry

| # | 中文 / Chinese | English |
|---|---|---|
| 1 | **数据输入交易的一致性** | **Consistency of data-entry transactions** |
| 2 | **用户最少输入操作** | **Minimal input actions by the user** |
| 3 | **用户最小记忆负担** | **Minimal memory load on the user** |
| 4 | **数据输入与数据显示兼容** | **Compatibility of data entry with data display** |
| 5 | **用户对数据输入的灵活控制** | **Flexibility for user control of data entry** |

---

<a name="ch03b"></a>

## 第三章B：原则 / Chapter 3B: Principles

### 3B.1 原则基础 / Basics of Principles

| 中文 / Chinese | English |
|---|---|
| 中层次的策略或规则，用于分析和比较UID备选方案。比指南更基本、更广泛适用、更持久。 | Middle-level strategies or rules to analyse and compare UID alternatives. More fundamental, widely applicable, and enduring than guidelines. |
| 五个核心方面：确定用户技能水平 → 识别任务 → 选择交互风格 → 八条黄金规则 → 确保人类控制同时增加自动化 | Five core aspects: Determine users' skill levels → Identify the tasks → Choose an interaction style → Eight golden rules → Ensure human control while increasing automation |

### 3B.2 确定用户技能水平 / Determine Users' Skill Levels

| 中文 / Chinese | English |
|---|---|
| 了解用户是一个简单的理念，但却是一个困难且往往被低估的目标。所有UID都应从理解用户开始，包括反映其年龄、性别、身体和认知能力、教育、文化背景、培训动机、目标和个性的群体档案。 | Learning about the users is a simple idea but a difficult and unfortunately often underevaluated goal. All UID should begin with an understanding of the users, including population profiles that reflect their age, gender, physical and cognitive abilities, education, cultural backgrounds, training motivation, goals, and personality. |
| 了解用户的过程是永无止境的，因为有太多需要了解，也因为用户不断变化。 | The process of getting to know the users is never-ending, because there is so much to know and because the users keep changing. |

**三类用户技能水平 / Three Categories of User Skill Levels**:

| 类别 / Category | 描述 / Description | 设计策略 / Design Strategy |
|---|---|---|
| **新手或首次用户** / Novice or first-time users | 对任务或UI概念了解甚少；首次用户通常了解任务概念但对UI概念了解浅薄 | 通过指令或对话框克服不确定性；限制词汇量；对每项任务完成提供信息反馈；提供具体错误信息；视频演示和在线教程可能有效 |
| **知识型间歇用户** / Knowledgeable intermittent users | 具有稳定的任务概念和广泛的UI概念知识，但难以记住菜单结构或功能位置 | 有序的菜单结构减轻记忆负担；一致的术语促进记忆保持；强调**识别而非回忆（recognition rather than recall）**；提供危险保护以支持放松探索 |
| **专家频繁用户** / Expert frequent users | 对任务和UI概念都非常熟悉，追求快速完成工作 | 欢迎快捷方式以少量点击或手势执行操作；要求快速响应时间；偏好简短且非干扰的反馈 |

**多层级方法 / Multi-Layer Approach**: 当需要适应多用户类别时，基本策略是允许多层（或级别结构）学习方法。新手可以从最小子集开始，中级用户可以选择发展到更高级别，专家可以快速进步。

### 3B.3 识别任务 / Identify the Tasks

| 中文 / Chinese | English |
|---|---|
| 在仔细绘制用户画像后，UID设计师识别要执行的任务。成功的策略通常涉及长时间观察和采访用户。识别任务有助于UID设计师理解任务频率/顺序，并做出关于支持哪些任务的艰难决策。 | After carefully drawing the user profile, UIDers identify the tasks to be carried out. Successful strategies usually involve long hours of observing and interviewing users. Identifying the tasks helps UIDers to understand task frequencies/sequences and make the tough decisions about what tasks to support. |
| 高层次任务动作可以分解为多个中层次任务动作，进一步细化为原子动作。选择最合适的原子动作集是一项困难的任务。 | High-level task actions can be decomposed into multiple middle-level task actions, which can be further refined into atomic actions. |
| **相对任务频率**在塑造菜单树和架构设计决策中很重要。频繁任务应在顶部（快速执行），罕见任务在更深层。可以创建**用户-任务矩阵**来帮助梳理这些事项。 | **Relative task frequencies** are important in shaping a menu tree and are one of the bases for making architectural design decisions. Frequent tasks should be near the top, while rare tasks are deeper down. A **users-tasks matrix** can help UIDers sort out these issues. |

### 3B.4 选择交互风格 / Choose an Interaction Style

| 中文 / Chinese | English |
|---|---|
| **五种主要交互风格 / Five Primary Interaction Styles**: | | 
| 1. **直接操纵 / Direct manipulation** | CV/CG知识对UID有很大帮助 |
| 2. **导航和菜单选择 / Navigation and menu selection** | |
| 3. **表单填写 / Form fill-in** | |
| 4. **自然语言 / Natural language** | |
| 5. **命令语言 / Command language** | 为用户提供强烈的掌控感，能快速表达复杂可能性且无需阅读分散注意力的提示 |

### 3B.5 八条黄金规则 / Eight Golden Rules of UID

| # | 规则 / Rule | 详细说明 / Detail |
|---|---|---|
| **1** | **力求一致性** / Strive for consistency | 在类似情境下要求一致的操作序列；在提示、菜单和帮助屏幕中使用相同的术语；全程使用一致的颜色、布局、大小写、字体等；例外（如删除确认）应可理解 |
| **2** | **追求通用可用性** / Seek universal usability | 认识到不同用户的需求，设计可塑性，促进内容转换。新手到专家的差异、年龄范围、残障、国际差异、技术多样性等丰富了引导UID的需求谱系 |
| **3** | **提供信息反馈** / Offer informative feedback | 对每个用户操作都应有UI反馈。频繁和次要操作的响应可以适度；不频繁和重要操作的响应应更实质性。利用可视化便利地显示变化 |
| **4** | **设计对话以产生终结感** / Design dialogs to yield closure | 操作序列应组织为有开始、中间和结束的组。在操作组完成时提供信息反馈，给用户完成感、解脱感和准备下一组操作的指示 |
| **5** | **预防错误** / Prevent errors | 尽可能确保用户在使用UI时不能犯严重错误。如果用户犯了错误，UI应提供简单、建设性、具体的恢复指导。错误操作应保持UI状态不变且可恢复 |
| **6** | **允许轻松撤销操作** / Permit easy reversal of actions | 尽可能使操作可逆，减轻焦虑。可逆性单元可以是单个操作、一个数据条目或一个完整的操作组 |
| **7** | **让用户保持控制** / Keep users in control (≠ in the control) | 有经验的用户强烈渴望他们掌控UI的感觉，UI响应他们的操作 |
| **8** | **减少短期记忆负担** / Reduce short-term memory load | 人类短期记忆的有限信息处理能力要求UID设计师避免需要用户跨显示屏记忆信息的UI |

---

<a name="ch03c"></a>

## 第三章C：理论 / Chapter 3C: Theories

### 3C.1 理论基础 / Basics of Theories

| 中文 / Chinese | English |
|---|---|
| 高层次的广泛适用框架，在UID/评估中用于支持沟通和教学。HCI学科的一个目标是超越指南的具体性，建立在原则的广度之上，发展经过测试、可靠且广泛有用的理论。 | High-level widely applicable frameworks to draw on during UID/evaluation to support communication and teaching. One goal for HCI is to go beyond the specifics of guidelines and build on the breadth of principles to develop tested, reliable, and broadly useful theories. |

**按理论类型分类 / By Theory Type**:

| 类型 / Type | 中文说明 / Chinese | English |
|---|---|---|
| **描述性 / Descriptive** | 有助于发展一致的术语和有用的分类法（对象和动作），从而支持协作/培训 | Helpful in developing consistent terminology and useful taxonomies, for objects and actions, thereby supporting collaboration/training |
| **解释性 / Explanatory** | 描述事件序列以及因果关系的理论，使干预成为可能 | Describing sequences of events and, where possible, cause and effect, making interventions possible |
| **规定性 / Prescriptive** | 为UID设计师提供明确选择指导的理论 | Giving UIDers clear guidance for their choices |
| **预测性 / Predictive** | 最精确的理论，使UID设计师能够比较UI备选方案的执行时间、错误率等 | Enabling UIDers to compare UI alternatives for execution time, error rates, etc. |

**按涉及的能力/技能分类 / By Capacity/Skills Involved**:
- **运动 / Motor**
- **感知 / Perceptual**
- **认知 / Cognitive**

> 好的理论应该：可理解（understandable），对所有使用者产生相似的结论（produce similar conclusions for all who use it），并有助于解决UID问题（help to solve UID problems）。

### 3C.2 按层级设计理论 / Design-By-Levels Theories

将概念按层级分离的描述性理论方法。UI的四层理论：

| 层级 / Level | 中文说明 / Chinese | English |
|---|---|---|
| **概念层 / Conceptual** | 用户对交互系统的"心理模型"。例如：画图程序（操作像素，具体思维）vs 绘图程序（操作对象，抽象思维）。关于心理模型的决策影响所有下层。 | The user's "mental model" of the interactive system. E.g., Paint programs (manipulate pixels, concrete thinking) vs Drawing programs (operate on objects, abstract thinking). Decisions about mental models affect each of the lower levels. |
| **语义层 / Semantic** | 描述用户输入和计算机输出显示所传达的含义。例如：在绘图程序中删除对象可以通过撤销最近操作或调用删除对象操作来完成。意思是意图表达的意思——既不含糊也不困惑。 | Describes the meanings conveyed by the user's input and by the computer's output display. E.g., deleting an object in a drawing program. Mean what is intended to mean — Neither ambiguity nor confusion. |
| **语法层 / Syntactic** | 定义传达语义的用户操作如何组装成完整句子来执行某些任务。例如：删除文件操作可以通过将对象拖到垃圾桶（trash can，不是"能"而是"罐/桶"），然后点击确认对话框来完成。 | Defines how the user actions that convey semantics are assembled into complete sentences to perform certain tasks. E.g., delete-files action invoked by dragging an object to a trash can followed by a click in a confirmation dialog box. |
| **词法层 / Lexical** | 处理设备依赖性以及用户指定语法的精确机制。例如：一个功能键；200毫秒内的鼠标双击。 | Deals with device dependencies and with the precise mechanisms by which users specify the syntax. E.g., A function key; A mouse double-click within 200 milliseconds. |

**四层理论的优势 / Advantages of Four-Level Theory**:
- 自上而下的性质直观且易于解释
- 与图形化直接操纵UI的成功相匹配
- 自上而下的性质与软件架构匹配
- 允许UID过程中的有用模块化
- 即使在具有许多对象/动作的更复杂系统中也能成功

### 3C.3 行动阶段理论 / Stages-Of-Action Theories

**七阶段行动理论 / Seven Stages-of-Action Theory**:

| 阶段 / Stage | 中文 / Chinese | English |
|---|---|---|
| 1 | 形成目标 | Forming the goal |
| 2 | 形成意图 | Forming the intention |
| 3 | 指定行动 | Specifying the action |
| 4 | 执行行动 | Executing the action |
| 5 | 感知系统状态 | Perceiving the system state |
| 6 | 解释系统状态 | Interpreting the system state |
| 7 | 评估结果 | Evaluating the outcome |

> 体现了**反馈控制的精神（Spirit of Feedback Control）**——行动与评估的动态循环过程。

**良好UID的四项原则（基于七阶段理论）/ Four Principles of Good UID**:

| # | 中文 / Chinese | English |
|---|---|---|
| 1 | 状态和操作备选方案应该是可见的 | The state and the action alternatives should be visible |
| 2 | 应该有一个好的概念模型和一致的系统形象 | There should be a good conceptual model with a consistent system image |
| 3 | UI应包括揭示各阶段之间关系的良好映射 | The UI should include good mappings that reveal relationships among stages |
| 4 | 用户应收到持续反馈 | Users should receive continuous feedback |

### 3C.4 一致性理论 / Consistency Theories

| 中文 / Chinese | English |
|---|---|
| 一致性的UI是UID设计师的重要目标。如果对象和操作的术语是有序的，并且可以用少数规则描述，用户将能够轻松学习和记住它们。可以通过制定详细的指南文档来强制执行一致性。 | A consistent UI is an important goal for UIDers. If terminology for objects and actions is orderly and describable by a few rules, users will be able to learn and retain them easily. UIDers can enforce consistency by developing detailed guidelines documents. |

### 3C.5 语境理论 / Contextual Theories

| 中文 / Chinese | English |
|---|---|
| 语境理论涉及从计算机使用到与充满传感器、响应式家电、显示墙和音频生成器的设备丰富环境的交互转变。强调用户与其他人互动的社会环境——其他人可以提供帮助或成为干扰。 | Contextual theories address the shift from use of a computer to interaction with a device-rich environment filled with sensors, responsive appliances, display walls, and audio generators. They often emphasize the social environment in which users are engaged with other people who can provide assistance or can be distractions. |
| UID设计师可以通过在用户自己的环境中观察他们工作、社交或参与运动/娱乐来应用语境理论。 | UIDers can apply contextual theories by observing users in their own environments as they carry out their work, engage socially, or participate in sports or play. |

### 3C.6 动态理论 / Dynamic Theories

| 中文 / Chinese | English |
|---|---|
| 动态理论涉及技能掌握的进化发展、行为改变、声誉增长和领导能力方面的UID。 | Dynamic theories address UID for evolutionary development of skills mastery, behaviour change, reputation growth, and leadership capacities. |

---

<a name="ch04"></a>

## 第四章：设计 / Chapter 4: Design

### 4.1 设计概念 / Conception of Design

| 中文 / Chinese | English |
|---|---|
| 设计可以宽松地定义为创建合成性人工制品（如产品、服务和流程）的规范的结果或过程。世界上所有的人造物体都是某种设计过程的结果。UI是数字人工制品。 | Design can be loosely defined as the outcome or the process of creating specifications for synthetic artifacts, such as products, services, and processes. All manufactured objects in the world are the result of some form of design process. UIs are digital artifacts. |
| 如果UID设计师仔细考虑如何创建数字产品和服务，他们可以做出吸引人的产品和服务，这些产品和服务响应人类需求，具有易于学习、可理解且高效使用的UI。**设计就是创新**。 | If UIDers carefully consider how digital products and services are created, they can make appealing products and services that respond to human needs with UIs that are easy to learn, comprehensible, and efficient to use. **Design is innovation**. |

### 4.2 历史教训 / Historical Lessons

| 中文 / Chinese | English |
|---|---|
| 早期计算机应用程序由程序员为自己和同行设计，高度功能性。当计算机受众扩展到非技术领域时，这种设计方法迅速失败。这种现象被称为**"对芯片仁慈但对人残酷"（kind to chips but cruel to people）**。 | Early computer applications were designed by programmers to be highly functional for themselves and their peers. This approach quickly failed when the audience grew to non-technical fields. The phenomenon is called **"kind to chips but cruel to people"**. |
| 当今各UI的用户群体具有与程序员和工程师截然不同的背景。他们更少专注于技术本身，更多面向专业或娱乐需求。 | The current generation of users have vastly different backgrounds from programmers and engineers. They are less dedicated to the technology itself, more oriented toward professional or recreational needs. |

### 4.3 传统软件工程瀑布模型 / Traditional Software Engineering Waterfall Model

```
需求 Requirements → 设计 Design → 开发 Development → 测试 Testing → 部署 Deploying → 维护 Maintenance
```

### 4.4 设计过程的运作特征 / Operational Characteristics of Design Process

| 中文 / Chinese | English |
|---|---|
| 设计是一个**动态过程**，不能静态地充分表示 | Design is a **dynamic process** and cannot be adequately represented statically |
| 设计过程是**非层次化的**，既不是严格自下而上也不是严格自上而下 | The design process is **nonhierarchical**, neither strictly bottom-up nor strictly top-down |
| 设计过程是**不可预测的和根本变革性的**，涉及开发可能在最终结果中不发挥作用的局部和临时解决方案 | The design process is **unpredictable and radically transformational**, involving the development of partial and interim solutions that may ultimately play no role in the final outcome |
| 设计**本质上涉及发现新目标** | Design **intrinsically involves discovery of new goals** |

### 4.5 四阶段迭代设计过程 / Four-Phase Iterative Design Process

```
需求分析 → 初步和详细设计 → 构建与实现 → 评估
  ↑_______________________________________________↓
                （反馈循环 / Feedback Loop）
```

| 阶段 / Phase | 中文说明 / Chinese | English |
|---|---|---|
| **需求分析 / Requirements Analysis** | 收集UID需求是整体需求分析和管理阶段的一部分，通常直接影响UID的工程方面 | Collecting UID requirements is part of the overall requirements analysis and management phase |
| **初步和详细设计 / Preliminary and Detailed Design** | 初步设计（策略/Strategy）：映射高层概念（用户、控件、UI显示、导航机制、整体工作流）及其关系，开发用户应具有的心智模型；详细设计（战术/Tactics）：规划每个初步设计结果的具体内容 | Preliminary design (Strategy): mapping high-level concepts and relations, developing mental model; Detailed design (Tactics): planning specifics of each preliminary design outcome |
| **构建与实现 / Build and Implementation** | 实际的软件和硬件工程（超出本课程范围） | Actual software and hardware engineering (outside course scope) |
| **评估 / Evaluation** | 开发者测试和验证UI系统实现，确保符合设计和需求 | Developers test and validate the UI system implementation |

### 4.6 需求分析详细内容 / Requirements Analysis Details

**三类需求 / Three Types of Requirements**:

| 类型 / Type | 中文说明 / Chinese | English |
|---|---|---|
| **功能需求 / Functional requirements** | 定义UI系统应支持的具体行为（通常用用例捕获） | Define specific behaviour that the UI system should support (often captured in use cases) |
| **非功能需求 / Non-functional requirements** | 规定UI系统操作的整体标准（硬件、软件、系统性能、可靠性等），不绑定到特定操作或行为 | Specify overall criteria governing the operation of the UI system without being tied to a specific action or behaviour |
| **用户体验需求 / UX requirements** | 规定用户交互和UI系统的具体非功能需求（导航、输入、颜色等） | Specify concrete non-functional requirements for user interaction and the UI system (navigation, input, colours, etc.) |

**用例 / Use Cases**:
- 来自软件工程的概念，用于编写功能需求
- 形式化的场景，逐步捕获参与者（actor）与系统之间的操作
- 在UID上下文中，"参与者"聚焦于人类用户和UI系统
- **UI功能集应简单等于其用例的总和**：不应实现任何不明确支持至少一个用例的功能
- 用例为UI系统评估提供直接的方案：如果所有用例都能成功完成，UI系统就是正确和有效的

### 4.7 设计框架 / Design Frameworks

| 框架 / Framework | 中文说明 / Chinese | English |
|---|---|---|
| **以用户为中心的设计 / User-Centered Design (UCD)** | 规定一种设计过程，在设计过程的每个阶段主要考虑实际最终用户的需求、愿望和限制 | Prescribes a design process that primarily takes the needs, wants, and limitations of the actual end users into account during each phase of the design process |
| **参与式设计 / Participatory Design** | 用户直接参与他们所使用的事物和技术的设计（又称协作设计/cooperative design） | Direct involvement of users in the design of the things and technologies they use (a.k.a. cooperative design) |
| **敏捷设计 / Agile Design** | 一系列设计/开发方法，适用于自组织、动态团队，促进灵活、自适应、快速的开发，能够稳健应对变化的需求。基于渐进式开发，以增量方式和快速发布周期构建软件 | A family of design/development methods for self-organizing, dynamic teams that facilitate flexible, adaptive, and rapid development robust to changing needs. Based on evolutionary development, where software is built incrementally and in rapid release cycles |

### 4.8 高级主题：设计/开发过程中的误差建模 / Advanced: Error Modelling in Design/Development

#### 4.8.1 开环误差率 / Open-Loop Error Rate

| 符号 / Symbol | 含义 / Meaning |
|---|---|
| R | 需求分析（RA）误差率或误解率 / RA error rate or misunderstanding rate |
| D | 初步和详细设计（PDD）误差率 / PDD error rate |
| I | 构建和实现（BI）误差率 / BI error rate |

**开环（OL）误差率公式**:
$$E = (1 + R) \times (1 + D) \times (1 + I) - 1$$

**示例 / Example**:
- R=15%, D=15%, I=15% → E = (1.15)³ - 1 ≈ **52%**
- R=10%, D=10%, I=10% → E = (1.1)³ - 1 ≈ **33%**

> 误差叠加和放大效应 / Error superposition and enlargement

#### 4.8.2 闭环误差收敛 / Closed-Loop Error Convergence

| 周期 / Cycle | 误差率 / Error Rate |
|---|---|
| 1T（第1个OL周期） | E |
| 2T（第2个OL周期） | E² |
| 3T（第3个OL周期） | E³ |
| nT（第n个OL周期） | Eⁿ |

**收敛准则 / Convergence Criterion**: $E^n \to 0 \iff E < 1$

**达到收敛阈值所需OL周期数**:
$$E^n < C \iff n > \log_E C$$

**示例 / Example**:
- E=33%, C=1%: E²=10.9%, E³=3.6%, E⁴=1.2%, E⁵=**0.4%** < 1% → 需要5个OL周期
- E=52%, C=1%: 需要8个OL周期

> 如果E ≥ 1（即100%），设计过程发散（divergent），无法收敛。

#### 4.8.3 动态需求下的闭环误差 / Closed-Loop Error Under Dynamic Requirements

需求变异率（RV rate）记作 V：

$$E_n = E(E_{n-1} + V)$$

如果 $E < 1$，则 $E_n \to \text{静态误差余量}$，且 $n \to \infty$。

**静态误差率公式**: $E_\infty = \frac{E \cdot V}{1 - E}$

**示例**: E=50%, V=20% → $E_\infty = 0.5 \times 0.2 / (1-0.5) = 20\%$

---

<a name="ch07"></a>

## 第七章：直接操纵与沉浸式环境 / Chapter 7: Direct Manipulation and Immersive Environments

### 7.1 直接操纵概念 / Conception of Direct Manipulation

| 中文 / Chinese | English |
|---|---|
| 当今大多数用户习惯于由直接操纵方法增强的**所见即所得（WYSIWYG / What You See Is What You Get）**环境。 | Most users today are used to a **WYSIWYG (What You See Is What You Get)** environment enhanced by direct-manipulation methods. |

### 7.2 直接操纵的三项原则 / Three Principles of Direct Manipulation

| # | 中文 / Chinese | English |
|---|---|---|
| 1 | 对感兴趣的对象和动作进行**连续表示**，使用有意义的视觉隐喻 | **Continuous representations** of the objects and actions of interest with meaningful visual metaphors |
| 2 | 使用**物理动作或按压带标签的UI对象**，而非复杂语法 | **Physical actions or presses of labeled UI objects** instead of complex syntax |
| 3 | **快速、增量、可逆的操作**，其对感兴趣对象的效果立即可见 | **Rapid, incremental, reversible actions** whose effects on the objects of interest are visible immediately |

### 7.3 UI隐喻 / UI Metaphors

| 中文 / Chinese | English |
|---|---|
| 将熟悉的现实世界概念（源域/source domain）映射到数字实体（目标域/target domain）以创建直观体验的实践。 | Practices of mapping familiar real-world concepts (source domain) onto digital entities (target domain) to create an intuitive experience. |

**常见UI隐喻 / Common UI Metaphors**:

| 隐喻 / Metaphor | 说明 / Description |
|---|---|
| **桌面 / Desktop** | 将屏幕视为带有文件夹、文件和垃圾桶的物理桌面 / Treats the screen as a physical desk with folders, files, a trash can |
| **网页门户/页面 / Web portal/page** | 类似于杂志或书页 / Similar to a magazine or book page |
| **文件文件夹/树状视图 / File folders/tree view** | 表示文件层级结构 / Represents file hierarchies |
| **购物车 / Shopping cart** | 在电子商务中模拟实体店购物 / Used in e-commerce to mimic in-store shopping |
| **工具栏/菜单栏 / Toolbar/menu bar** | 模拟工作台上的工具集 / Simulates a set of tools on a workbench |

> 使用熟悉的隐喻为用户创造更容易的学习条件，减少错误和不当操作的数量。

### 7.4 直接操纵的强度/平移距离 / Strength / Translational Distance

| 强度级别 / Strength | 示例 / Examples |
|---|---|
| **弱 / Weak** | 早期视频游戏控制器 / Early video game controllers |
| **中等 / Medium** | 触摸屏、多点触控 / Touchscreens, multi-touch |
| **强 / Strong** | 数据手套、手势、操纵有型物体 / Data glove, gesturing, manipulating tangible objects |
| **沉浸式 / Immerse** | 虚拟现实（VR）、增强现实（AR）/ VR (virtual reality), AR (augmented reality) |

### 7.5 直接操纵的优缺点 / Pros and Cons

| 优点 / Advantages | 缺点 / Disadvantages |
|---|---|
| 生动呈现任务概念 / Vividly presents task concepts | 可能难以编程 / May be hard to program |
| 允许轻松学习、轻松记忆、更可能避免错误 / Allows easy learning, easy retention, more likely avoidance of errors | 对视觉障碍用户不利 / Is a setback for vision-impaired users |
| 鼓励探索 / Encourages exploration | 消耗宝贵的屏幕空间，需要滚动或多个操作 / Consumes valuable screen space, requires scrolling or multiple actions |
| 提供高主观满意度 / Affords high subjective satisfaction | |

### 7.6 直接操纵的应用示例 / Examples of Direct Manipulation

- **地理系统 / Geographical Systems**: 北斗/GPS卫星导航、百度/谷歌街景
- **视频游戏 / Video Games**: 扫雷、超级马里奥、魔兽世界
- **计算机辅助设计/制造 / CAD/CAM**: AutoCAD、3D Max、数字孪生（Digital Twins）
- **直接操纵编程/配置**: Excel、Labview、RTMaps
- **三维UI / 3D UI**: 处理医疗难题、工业难题
- **远程直接操纵 / Tele/Remote Direct Manipulation**: 远程操作（Teleoperation）、移动远程呈现（MRP）

### 7.7 虚拟现实与增强现实 / VR and AR

| 概念 / Concept | 中文说明 / Chinese | English |
|---|---|---|
| **虚拟现实 / VR** | 生成完全合成的图像，模拟现实世界以及纯粹想象中的现实 | Generating completely synthetic images that simulate the real world as well as purely imagined reality |
| **增强现实 / AR** | 通过虚拟元素增强从现实世界实际捕获的图像，以促进对图像的理解 | Augmenting images actually captured from the real world by virtual elements to facilitate conception of the images |

**VR vs AR 核心区别**: VR生成完全合成的图像；AR在真实捕获的图像上叠加虚拟元素。

---

<a name="ch08"></a>

## 第八章：导航、表单填写与对话框 / Chapter 8: Navigation, Form Fill-In, Dialog Boxes

### 8.1 通过选择导航 / Navigation By Selection

| 中文 / Chinese | English |
|---|---|
| 导航利用用户快速浏览选项、识别相关内容并选择所需内容以实现意图的能力。UID设计师的目标是实现**流畅导航（fluid navigation）**，让用户优雅而自信地到达想去的地方，探索可能的新路径，并在必要时回溯。 | Navigation harnesses users' ability to rapidly skim choices, recognize what is relevant, and select what they need to realize their intentions. The goal for UIDers is to enable **fluid navigation** that allows users to gracefully and confidently get to where they want to go, explore novel possible routes, and back-track when necessary. |

### 8.2 菜单类型 / Menu Types

| 菜单类型 / Menu Type | 说明 / Description |
|---|---|
| **二元菜单 / Binary Menu** | 最简单的显式菜单：Yes/No, True/False, Previous/Next, Agree/Disagree |
| **网格菜单 / Grid Menu** | 一组小图标和标签 / A small set of icons and labels |
| **单选按钮 / Radio Buttons** | 支持从多项目菜单中进行单项选择 / Support single-item selection from a multiple-item menu |
| **复选框 / Check Boxes** | 支持选择菜单中的一个或多个项目 / Support selection of one or more items |
| **菜单栏 / Menu Bar** | 通常位于顶部 / Typically found at the top |
| **下拉菜单 / Pull-Down Menu** | ▶ → 子菜单 / ▶ → Sub-menu; ... → 对话框 / ... → Dialog box |
| **汉堡菜单 / Hamburger Menu** | 访问单独的菜单屏幕 / Access a separate menu screen |
| **弹出菜单 / Pop-Up Menu** | 响应于使用指点设备的点击或轻触而出现 / Appears in response to a click or tap |
| **上下文菜单 / Context Menu** | 当弹出菜单的内容取决于光标位置时 / When the content of the pop-up menu depends on the cursor position |
| **功能区/Ribbons** | 由Microsoft在Office 2007中引入，按任务分组命令的选项卡 / Introduced by Microsoft in Office 2007, tabs grouping commands by task |
| **滚动菜单 / Scrolling Menu** | 用于长列表 / For a long list |
| **工具栏 / Toolbar** | 一组工具按钮 |
| **调色板 / Palette** | 可选颜色/样式集合 |

### 8.3 内容组织 / Content Organization

**树形结构 vs 网络结构 / Tree Structure vs Network Structure**:
- **树形结构**：逻辑清晰，使用吸引人 / Logically clear and appealing for usage
- **网络结构**：有时更合适 / Sometimes network structures are more appropriate

**呈现顺序 / Presentation Sequence**:
- 使用频率可加快最顶部项目的选择速度，但低频率项目失去有意义排序可能会造成干扰
- **自适应分割菜单策略 / Adaptive split-menu strategy**

**措辞 / Phrasing**:
- 使用熟悉且一致的术语 / Use familiar and consistent terminology
- 确保项目彼此区分 / Ensure that items are distinct from one another
- 使用简洁的措辞 / Use concise phrasing
- **将关键词前置 / Bring the keyword forward**

**布局一致性 / Layout Consistency**: 标题、项目、指令、错误消息

### 8.4 表单填写 / Form Fill-In

**表单填写UID的元素 / Elements of Form Fill-In UID**:

| 元素 / Element | 说明 / Description |
|---|---|
| 有意义的标题 | Meaningful title |
| 全面的指令 | Comprehensive instructions |
| 给字段加标签（标签放在一致位置） | Label the fields (place labels in consistent locations) |
| 限制数据输入（确保所有字段确实需要） | Limit data entry (make sure all fields are really needed) |
| 字段的解释性消息 | Explanatory messages for fields |
| 错误预防（用户不能输入不正确的值） | Error prevention (users cannot enter incorrect values) |
| 错误恢复（在页面顶部汇总错误） | Error recovery (summarize errors at the page top) |
| 即时反馈（即时错误反馈更可取） | Immediate feedback (immediate feedback about errors is preferable) |
| 逻辑分组（相关字段相邻，以空白分隔组） | Logical grouping (related fields adjacent, aligned with blank spaces between groups) |
| 字段排序（反映常见模式） | Sequencing of fields (reflect common patterns) |
| 视觉上吸引人的布局（对齐创造秩序感和可理解性） | Visually appealing layout (alignment creates a feeling of order and comprehensibility) |
| 熟悉的字段标签（"家庭地址"而非"住所"） | Familiar field labels ("Home address" instead of "domicile") |
| 一致的术语和缩写 | Consistent terminology and abbreviations |
| 数据输入字段的可见空间和边界 | Visible space and boundaries for data-entry fields |
| 必填字段清晰标记 | Required fields clearly marked |
| 隐私信息（用户分享个人信息时会焦虑） | Privacy information (users will be anxious sharing personal information) |
| 完成信号（明确的提交和确认） | Completion signal (explicit submission and confirmation) |

**格式特定字段 / Format-Specific Fields**:
- 使用自定义小部件和直接操纵可促进数据输入
- 日历用于输入日期；座位图帮助选择飞机座位
- 格式：电话号码、日期、时间、金额、密码
- **双因素认证（2FA）**：需要提供两种不同形式的身份验证来访问账户

### 8.5 对话框 / Dialog Boxes

| 中文 / Chinese | English |
|---|---|
| 许多任务被中断，要求用户选择选项、执行有限的数据输入或查看警报和错误消息。最常见的解决方案是提供对话框。 | Many tasks are interrupted to request users to select options, perform limited data entry, or review alerts and error messages. The most common solution is to provide a dialog box. |

---

<a name="ch09"></a>

## 第九章：表达性人类语言与命令语言 / Chapter 9: Expressive Human and Command Languages

### 9.1 语音识别 / Speech Recognition

| 中文 / Chinese | English |
|---|---|
| 语音识别（或更广泛地说，自然语言处理/NLP）近年来取得了重大进展，现在已被广泛使用。 | Speech recognition (or more generally Natural Language Processing, a.k.a. NLP) has made significant progress in recent years and is now well used. |

**适合语音交互的场景 / Place for Spoken Interaction**:

| 场景 / Scenario | 说明 / Description |
|---|---|
| 用户有身体障碍时 | When users have physical impairments |
| 说话者双手忙碌时（驾驶、烹饪） | When the speaker's hands are busy (driving, cooking) |
| 需要移动性时（拍照自拍） | When mobility is required (photo self-taking) |
| 说话者眼睛被占用时（运输/发货） | When the speaker's eyes are occupied (shipping) |
| 用户无法读写时（儿童、非常老的一代、外国人） | When the user is unable to read or write (children, very old generation, foreigners) |

**语音识别应用 / Speech Recognition Applications**:

| 应用 / Application | 说明 / Description |
|---|---|
| 语音翻译 | 促进人类交流；帮助外国旅行者或士兵在不懂的语言中交流 |
| 信息语音应答（IVR）系统 | 即电话服务，为公司节省大量资金，为消费者提供24/7服务 |
| 听写（Dictation） | 基于语音输入生成文本；转录在线讲话或录制的音频材料；允许用户撰写文档 |
| UI语音命令 | 用户可以说出UI被训练有效识别的命令 |
| 说话人验证（语音生物识别） | 当用户回答问题时，系统验证他们是否如所声称的身份 |

**语音交互设计 / Designing Spoken Interaction**:

| 方面 / Aspect | 说明 / Description |
|---|---|
| **启动 / Initiation** | 用户表明希望开始语音交互的第一步。趋势是无启动的语音交互（更自然） |
| **知道该说什么 / Knowing what to say** | 用户需要知道什么可以被说并能被可靠识别 |
| **鲁棒识别 / Robust recognition** | 处理地区或外国口音、背景噪音；处理未知新词；用户可能说错或使用错误术语 |
| **异常处理 / Abnormality handling** | 识别尝试使用不识别的命令的新手用户，将其切换到列出可能命令的更指导模式 |
| **映射到可能的操作 / Mapping to possible actions** | 当今最成功的语音识别应用的秘密：限于狭窄的应用领域（操作世界有限），使用精心选择的命令来增加识别率 |
| **反馈和对话 / Feedback and dialogues** | 听写时，识别的文本在短延迟后显示在文档中；显示的可用性可以大大加速交互 |

### 9.2 语音生成 / Speech Production

**生成语音的通用方法 / General Methods to Produce Speech**:

| 方法 / Method | 说明 / Description |
|---|---|
| **预录语音 / Canned speech** | 由固定的数字化语音片段集组成，可组装成更长的片段。例如："下一班公交车将在"+"十一"+"分钟后到达"。可能的完整句子数量有限。片段之间的接缝可能听起来不自然。 |
| **共振峰合成 / Formant synthesis** | 使用基于文本语音表示的算法生成完全机器生成的语音 |
| **拼接合成 / Concatenated synthesis** | 将微小的录制人声片段组合成音素、单词、短语和完整句子。声音更自然，但需要显著更多的存储和计算能力来即时组装句子 |

### 9.3 传统命令语言 / Traditional Command Languages

**命令行/语言接口（CLI）/ Command-Line/Language Interface**:

常见命令：`ls`, `cd`, `pwd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `less`, `head`, `tail`, `find`, `grep`, `ps`, `kill`, `df`, `du`, `chmod`, `chown`, `sudo`, `man`, `history`, `passwd`, `top`, `awk`, `sed`, `ssh`, `scp`, `sshd`

| 中文 / Chinese | English |
|---|---|
| 当应用程序以高级方式使用时，CLI通常是首选。专业人士每天使用CLI数小时。Web地址或URL可以看作命令语言的一种形式。 | CLIs are often preferred when the application is used in an advanced way. Professionals use CLIs for hours every day. Web addresses or URLs can be seen as a form of command language. |

---

<a name="ch10"></a>

## 第十章：设备 / Chapter 10: Devices

### 10.1 键盘 / Keyboards

- **QWERTY键盘**：标准键盘布局
- **特殊键盘 / Special Keyboards**: 有多种特殊用途键盘设计

### 10.2 指点设备 / Pointing Devices

**交互任务类型 / Types of Interaction Tasks**:

| 任务 / Task | 说明 / Description |
|---|---|
| **选择 / Select** | 从一组项目中选择 / Choose from a set of items |
| **定位 / Position** | 在一维、二维或更高维空间中选择一个点 / Choose a point in a one-, two-, or higher-dimensional space |
| **定向 / Orient** | 在二维或更高维空间中选择一个方向。方向可以在屏幕上旋转符号、指示运动方向或控制设备操作（如机器人手臂） |
| **路径 / Path** | 定义一系列定位和定向操作 / Define a series of positioning and orientation operations |
| **量化 / Quantify** | 指定一个数值 / Specify a numeric value |
| **手势 / Gesture** | 通过执行预定义动作来执行操作。如：在某对象上停留（唤出上下文菜单）、向左/右滑动（向前/后翻页）、捏合/分离手指（缩小/放大） |
| **文本 / Text** | 在二维空间中输入、移动和编辑文本。指点设备指示插入、删除或更改的位置 |

**指点设备类型 / Types of Pointing Devices**:

| 类型 / Type | 示例 / Examples |
|---|---|
| **直接控制设备 / Direct Control Devices** | 触控笔 / Stylus |
| **间接控制设备 / Indirect Control Devices** | 鼠标 / Mouse, 操纵杆 / Joysticks |
| **新型控制设备 / Novel Control Devices** | 手部追踪器 / Hand tracker |

### 10.3 显示器 / Displays

| 中文 / Chinese | English |
|---|---|
| 显示器是UI向用户提供视觉反馈的主要来源。 | The display is the primary source of visual feedback to users from UI. |

**显示器特性 / Display Characteristics**:

- 物理尺寸（通常是对角线尺寸）/ Physical dimensions (usually the diagonal dimension)
- 分辨率（可用像素数）/ Resolution (the number of pixels available)
- 可用颜色数量和颜色准确性 / Number of available colours and colour correctness
- 亮度、对比度和眩光 / Luminance, contrast, and glare
- 功耗 / Power consumption
- 刷新率（足够支持动画和视频）/ Refresh rates (sufficient to allow animation and video)
- 成本 / Cost
- 可靠性 / Reliability

**显示技术 / Display Technology**: CRT（阴极射线管）、LCD（液晶显示）、LED（发光二极管）、OLED（有机发光二极管）

**显示类型 / Display Types**: 大型墙面显示器 / Large Wall Displays、桌面（水平）显示器 / Tabletop (Horizontal) Displays、可变形（形状变化）显示器 / Deformable (Shape-Changing) Displays

---

<a name="ch11"></a>

## 第十一章：通信与协作 / Chapter 11: Communication and Collaboration

### 11.1 社会性质 / Social Nature

| 中文 / Chinese | English |
|---|---|
| 在日益网络化的世界中，与家人、朋友、合作者、同事、同伴甚至宠物的持续即时通信和交互现在已司空见惯。 | Constant and immediate communication and interaction with family, friends, collaborators, colleagues, coworkers, and even pets are now commonplace in the increasingly networked world. |
| 代表性网站：Twitter、Facebook、Weibo（微博） | Representative websites: Twitter, Facebook, Weibo |

### 11.2 负面方面的关注 / Attention on Negative Aspects

| 中文 / Chinese | English |
|---|---|
| UID设计师还必须考虑和应对通信与协作UI的负面和不利因素。犯罪分子、恐怖分子招募者和压迫性政治领导人可以使用社交网络进行负面目的。霸凌、欺骗、仇恨言论、无意的隐私泄露等。UID设计师必须意识到这些行为，并考虑规避或减轻最坏可能性的UI选项。 | UIDers must also consider and account for the downsides and negative exigencies of communication and collaboration UIs. Criminals, terrorist recruiters, oppressive political leaders, bullying, deception, hate speech, inadvertent privacy leaks, etc. UIDers must be aware of such behaviours and consider UI options that circumvent or mitigate the worst possibilities. |
| 良好的UID、有效的社区领导和深思熟虑的治理政策和策略可以带来更积极的社会结果。 | Good UID, effective community leadership, and thoughtful governance policies and strategies can lead to more positive social outcomes. |

### 11.3 在线通信的各种模态 / Various Modalities of Online Communication

社交网络站点、短信、语音通话、视频通话、电子邮件、在线会议、在线教学

### 11.4 协作模型 / Models of Collaboration

**时间/空间矩阵 / Time/Space Matrix**（四个象限）:

| | 同地 / Same Place (Co-located) | 异地 / Different Place (Remote) |
|---|---|---|
| **同步 / Same Time (Synchronous)** | 共享桌面显示、墙面显示 | 远程会议 / Teleconferencing |
| **异步 / Different Time (Asynchronous)** | 公共显示 / Public display | 电子邮件、论坛、版本控制 / E-mail, discussion forums, version control |

**更多维度 / More Dimensions**:
- **同步性 / Synchronicity**
- **物理分布 / Physical distribution**
- **协作规模 / Scale of the collaboration**
- **实践社区数量 / Number of communities of practice**
- **新兴程度 / Nascence**（协作存在的时间 / Time of existence of collaboration）
- **计划持久性 / Planned permanence**
- **人员流动 / Turnover**（参与协作的人员稳定性，即新参与者进入和离开群体的频率）

### 11.5 具体目标和情境 / Specific Goals and Contexts

| 目标/情境 / Goal/Context | 说明 / Description |
|---|---|
| **通信和对话 / Communication and Conversation** | 大多数人每天参与的基本协调行动之一是通过对话与他人交流想法、信息和知识 |
| **会议协调 / Meeting Coordination** | 用户需要通信工具来协调现实世界的会议时间和地点 |
| **在线市场 / Online Markets** | 购买、销售和交易。**协同过滤算法（collaborative filtering algorithms）**根据个人购买/偏好数据识别具有相似画像的其他用户 |
| **创意生产和众包工作 / Creative Production and Crowdwork** | 大型创意项目需要用户一起工作。平台和工具：GitHub（社交编码）、Dropbox（文件共享）。**MOOC（大规模开放在线课程）**：Coursera、Udacity |
| **娱乐和游戏 / Entertainment and Gaming** | |
| **教育 / Education** | |

### 11.6 UID考量 / UID Considerations

**认知因素 / Cognitive Factors**:

| 因素 / Factor | 说明 / Description |
|---|---|
| **共同基础 / Common ground** | 沟通者共有的知识以及沟通中共同理解的引用，对有效协作至关重要 |
| **社交线索 / Social cues** | 增强沟通的非语言线索：面部表情、注视方向、姿势、接近度和身体朝向 |
| **活动意识 / Activity awareness** | 使社交行为可见有助于促进意识和对自己行为的责任感 |

**个人因素 / Individual Factors**:

| 因素 / Factor | 说明 / Description |
|---|---|
| **隐私 / Privacy** | 隐式收集活动可能影响系统使用/采用；需要知道谁贡献了什么以便指导纠正或表扬 |
| **身份 / Identity** | 在线社区中，当人们的身体不被显示时，他们如何表现和描绘自己。文本或虚拟形象成为主要交流媒介 |
| **信任和声誉 / Trust and reputation** | 与身份相关的是声誉概念和围绕该声誉发展信任感的能力 |
| **动机 / Motivation** | 人际连接的强烈内在动机；利他主义、互惠、声誉或地位、习惯等大量其他原因 |

**集体因素 / Collective Factors**:

| 因素 / Factor | 说明 / Description |
|---|---|
| **越轨行为 / Deviance** | 人们并不总是完美的。UID设计师必须考虑各种调节越轨行为的方式，或使社会规范更加明显和突出 |
| **审核 / Moderation** | 处理越轨行为的方法之一是让审核员评估贡献并对帖子采取各种操作 |
| **政策和规范 / Policies and norms** | 用户知道什么构成可接受vs不可接受行为的重要信号。政策文档通常发布在用户容易找到的地方 |

---

<a name="ch12"></a>

## 第十二章：提升用户体验 / Chapter 12: Advancing the User Experience

### 12.1 用户体验的演变 / Evolution of User Experience

| 中文 / Chinese | English |
|---|---|
| **早期忽视UX**：早期汽车纯粹是功能性的，亨利·福特可以开玩笑说客户可以要任何颜色，只要是黑色的。 | **Early negligence of UX**: Early automobiles were purely functional. Henry Ford could joke about customers getting any colour as long as it was black. |
| **当今高度重视UX**：现代汽车设计师学会了平衡功能和时尚。 | **Nowadays highly-valued UX**: Modern car designers have learned to balance function and fashion. |

### 12.2 显示设计 / Display Design

| 中文 / Chinese | English |
|---|---|
| 对于大多数交互系统，显示是成功UID的关键组成部分。 | For most interactive systems, the displays are a key component of successful UIDs. |

**代表性指南 / Representative Guidelines**:
- UID设计师应从彻底了解用户任务开始
- 有效的显示设计必须按正确顺序提供所有必要数据来执行任务
- 有意义的项目分组（带有适合用户知识的标签）、一致的组顺序和有序的格式支持任务执行
- **格式塔感知法则（Gestalt Laws of Perception）**适用
- 组可以用空白或边框围绕；相关项目可以通过高亮、背景阴影、颜色或特殊字体来指示
- 组内的有序格式可以通过左右对齐、数字小数点对齐或分解长字段的标记来实现

**代表性设计原则 / Representative Principles**:

| 原则 / Principle | 细化 / Sub-principles |
|---|---|
| **优雅与简洁 / Elegance and simplicity** | 统一、精致、合适 / Unity, refinement, and fitness |
| **比例、对比与均衡 / Scale, contrast, and proportion** | 清晰、和谐 / Clarity, harmony |
| **组织与视觉结构 / Organization and visual structure** | 分组、层次、关系、平衡 / Grouping, hierarchy, relationship, and balance |
| **模块与程序 / Module and program** | 聚焦、灵活、一致应用 / Focus, flexibility, and consistent application |
| **图像与表现 / Image and representation** | 即时性、通用性、凝聚力、特征化 / Immediacy, generality, cohesiveness, and characterization |
| **风格 / Style** | 独特性、完整性、全面性、适当性 / Distinctiveness, integrity, comprehensiveness, and appropriateness |

**字段布局 / Field Layout**:
- 使用粗体和大小写混合来显示内容
- 通过使用阴影或边框描绘相关信息集来创建逻辑分组
- 专家用户可能更喜欢密集打包、多显示和高编码字段

### 12.3 视图（窗口）管理 / View (Window) Management

**多窗口显示策略 / Multiple-Window Display Strategy**: 直接操纵策略应用于窗口操作。

**协调多个视图（窗口）/ Coordinating Multiple Views (Windows)**:
- 协调窗口是指作为用户操作直接结果而出现、改变内容、自动调整大小和关闭的窗口
- 协调是一个任务概念，描述信息对象如何基于用户操作而变化

| 技术 / Technique | 说明 / Description |
|---|---|
| **同步滚动 / Synchronized scrolling** | 用于比较程序或文档的两个版本 |
| **分层浏览 / Hierarchical browsing** | |
| **平铺或重叠窗口 / Tiled or overlapping windows** | |
| **打开/关闭依赖窗口 / Opening/closing of dependent windows** | |
| **保存窗口状态 / Saving of window state** | |
| **标签页浏览 / Tabbed browsing** | |

**浏览大视图 / Browsing Large Views**:
- 应用：大型地图、电路图、艺术品
- 交互：**概览（上下文/context）+ 细节视图（焦点/focus）**
- **缩放视图 / Zoom Views**
- **鱼眼视图 / Fisheye Views**

### 12.4 动画 / Animation

| 中文 / Chinese | English |
|---|---|
| 感知和解释运动是人类感知的基本元素，我们的眼睛被现实世界中移动的物体所吸引。平滑的动画被期望在UI交互期间保持用户的方向感。 | Perceiving and interpreting motion is a fundamental element of human perception, and our eyes are attracted to moving objects in the real world. Smooth animations are expected to keep users oriented during UI interaction. |

### 12.5 网页设计 / Webpage Design

- 避免顶级错误 / Avoiding top mistakes
- 遵循指南 / Following guidelines

### 12.6 颜色 / Colour

**颜色的用途 / Uses of Colour**:

| 中文 / Chinese | English |
|---|---|
| 抚慰或冲击眼睛 | Soothe or strike the eye |
| 为无趣的显示增添亮点 | Add accents to an uninteresting display |
| 促进复杂显示中的微妙区分 | Facilitate subtle discrimination in complex displays |
| 强调信息的逻辑组织 | Emphasize the logical organization of information |
| 引起对警告的注意 | Draw attention to warnings |
| 唤起强烈的情感反应（喜悦、兴奋、恐惧或愤怒） | Evoke strong emotional reactions of joy, excitement, fear, or anger |

**颜色指南 / Colour Guidelines**:

| 指南 / Guideline | 说明 / Description |
|---|---|
| 保守使用颜色 | 当颜色不显示有意义的关系时，它们可能误导用户寻找不存在的关系 |
| 限制颜色数量 | 单个显示中最多四种颜色；整个显示序列中最多七种颜色 |
| 认识颜色作为编码技术的威力 | 颜色加速许多任务的识别（如空中交通管制UI中高低空飞机不同颜色；编程IDE中关键字和变量不同颜色） |
| 确保颜色编码支持任务 | |
| 颜色编码以最小用户努力出现 | 用户不必每次执行任务时激活颜色编码 |
| 将颜色编码置于用户控制下 | 在适当时，用户应能关闭颜色编码 |
| **首先为单色设计/开发** | 先尝试诉诸逻辑模式而非颜色 |
| 考虑色盲用户的需求 | |
| 在颜色编码上保持一致 | |
| 警惕关于颜色代码的常见或文化期望 | |
| 使用颜色变化指示状态变化 | |

### 12.7 错误消息 / Error Messages

| 中文 / Chinese | English |
|---|---|
| 错误消息是指导用户整体UID策略的关键部分。 | Error messages are a key part of an overall UID strategy of guidance for the user. |

**代表性格南 / Representative Guidelines**:

| 指南 / Guideline | 说明 / Description |
|---|---|
| **具体性 / Specificity** | 过于通用的消息使新手难以确定出了什么问题。适当的具体性很重要。 |
| **建设性指导 / Constructive Guidance** | 避免纯粹谴责用户出了什么问题。指出用户需要做什么来纠正问题。 |

### 12.8 及时的用户体验（系统响应时间） / Timely User Experience (System Response Time)

| 中文 / Chinese | English |
|---|---|
| 对用户来说，主要的用户体验是**系统响应时间（SRT）**，也简称为响应时间。 | For users, the main user experience is the **system response time (SRT)**, also referred to simply as response time. |

**相关人因 / Related Human Factors**:

| 因素 / Factor | 说明 / Description |
|---|---|
| **时间延迟 / Time delay** | 人们无法感知小于25毫秒的事件时间差异；直到接近100毫秒，人们才难以感知短事件时间 |
| **反应时间 / Reaction time** | 每个用户各不相同，但通常在亚秒级别。实践中，用户似乎不太被PC应用程序屏幕切换的一秒延迟所困扰 |

**SRT经验知识 / Empirical Knowledge of SRT**:

| 中文 / Chinese | English |
|---|---|
| 用户偏好快速交互，尽管可能接受某些任务（如计算）的较慢响应（延迟）。 | Users prefer rapid interactions, though they may accept slower responses (latency) for some tasks (e.g., calculations). |
| 长时间（超过5秒）响应时间通常对生产力有害，增加错误率并降低满意度。 | Lengthy (longer than 5 seconds) response times are generally detrimental to productivity, increasing error rates and decreasing satisfaction. |
| 更快速的（少于1秒）交互通常更受欢迎并提高生产力，但可能增加复杂任务的错误率。 | More rapid (less than 1 second) interactions are generally preferred and increase productivity, but may also increase error rates for complex tasks. |

**影响可接受SRT的三个因素 / Three Factors Influencing Acceptable SRT**:

| 因素 / Factor | 说明 / Description |
|---|---|
| **先前经验 / Previous experiences** | 用户基于过去经验建立了对完成任务所需时间的期望 |
| **个性差异 / Individual personality differences** | 个人对延迟的容忍度差异很大（个性、成本、年龄、心情、文化背景、时间、噪音、完成工作的感知压力等） |
| **任务差异 / Task differences** | 任务复杂性以及用户对任务的熟悉程度 |

---

<a name="ch14"></a>

## 第十三章（第十四章PPT）：文档与用户支持 / Chapter 14: Documentation and User Support

> 注：PPT编号为Chapter 14，即第十四章。

### 14.1 为什么需要文档 / Why Having Documentation?

| 原因 / Reason | 说明 / Description |
|---|---|
| **启用使用 / Enabling usage** | 尽管标准化和改进使UI更易使用，但使用新UI仍然是一个挑战。研究表明，精心编写和设计的用户手册（纸质或在线）可以有效，但当今用户对详细手册兴趣不大。当今UI期望在线提供一切，辅以快速入门指南和交互式教程。 |
| **社会考量 / Societal consideration** | 新UI的预期使用方式可能并非不言自明。可以引导用户进入UI的预期使用方式，避免意外的社会后果。 |
| **隐式法律层面免责声明 / Implicit law-level disclaimer** | |

### 14.2 文档原则 / Principles of Documentation

| 中文 / Chinese | English |
|---|---|
| 文档本身是一种特殊的UI。 | Documentation is a special kind of UI itself. |

**塑造文档内容 / Shaping Documentation Content**:

**灵活便捷的访问 / Flexible and Convenient Accessing**:

| 方式 / Method | 说明 / Description |
|---|---|
| **在线文档 / Online documentation** | |
| **在线帮助 / Online help** | 用户通常寻求解决特定问题的帮助，希望直接转到所需信息 |
| **在线教程和动画演示 / Online tutorials and animated demonstrations** | |
| **在线社区 / Online communities** | |

**妥善管理的文档制作 / Properly-Managed Production of Documentation**:
- 文档的制作，如同任何项目，必须得到妥善管理，由合适的人员处理，并以适当的里程碑进行监控。

---

<a name="ch15_16"></a>

## 第十四章/第十五章（第十五+十六章PPT）：信息搜索与数据可视化 / Information Search & Data Visualization

> 注：PPT编号为Chapter 15+16，即第十五+十六章。

### 15/16.1 信息搜索 / Information Search

**五阶段搜索框架 / Five-Stage Search Framework**:

| 阶段 / Stage | 中文 / Chinese | English |
|---|---|---|
| **1. 制定 / Formulation** | 表达搜索 / Expressing the search | |
| **2. 启动行动 / Initiation of action** | 启动搜索 / Launching the search | |
| **3. 查看结果 / Review of results** | 阅读消息和结果 / Reading messages and outcomes | |
| **4. 细化 / Refinement** | 制定下一步 / Formulating the next step | |
| **5. 使用 / Use** | 编纂或传播见解 / Compiling or disseminating insight | |

**启动行动的类型 / Types of Initiation**:

| 类型 / Type | 说明 / Description |
|---|---|
| **显式启动 / Explicit initiation** | 点击搜索按钮（或按键盘Enter键）来启动搜索 |
| **隐式启动 / Implicit initiation** | 对制定阶段的每个组件的任何更改立即产生新的搜索结果集。**动态查询（Dynamic queries）**使用户能够调整查询小部件以产生连续更新 |

**搜索细化 / Refinement**: 搜索UI可以提供有意义的消息来解释搜索结果，并支持逐步细化。

**搜索模态与数据类型 / Miscellaneous Modalities & Data**:
- 基于命令语言的搜索 / Command language based search
- 基于自然语言的搜索 / Natural language based search
- 图像搜索 / Image search
- 视频搜索 / Video search
- 音频搜索 / Audio search
- 地理信息搜索 / Geographic information search

### 15/16.2 数据可视化 / Data Visualization

**数据可视化中的任务 / Tasks in Data Visualization**: 多种可视化任务类型。

**按数据类型可视化 / Visualization by Data Type**: 根据不同的数据类型（数值、类别、时间序列、地理空间等）选择合适的可视化方法。

> 注：PPT中该章节主要展示了大量可视化示例图像，核心知识点集中在五阶段搜索框架和可视化的基本概念上。

---

<a name="quiz"></a>

## Quiz 1 & Quiz 2 参考分析 / Quiz 1 & Quiz 2 Reference Analysis

### Quiz 1 内容分析 / Quiz 1 Content Analysis

Quiz 1 覆盖 **第1-3章**（可用性、通用可用性、指南/原则/理论）。

根据Quiz 1复习文档和图片内容，重点知识点包括：

| 知识点 / Knowledge Point | 所属章节 / Chapter |
|---|---|
| HCI的跨学科性质（实验心理学+计算机科学+多学科整合） | Ch1 |
| UI/UID的定义和重要性 | Ch1 |
| Miller's Law (7±2规则) | Ch1 |
| Fitts's Law | Ch1 |
| 可用性三大目标：Usability, Universality, Usefulness | Ch1 |
| 不存在"平均"用户的概念 | Ch2 |
| 个体多样性（身体能力、认知能力、个性差异—大五人格） | Ch2 |
| 物理层面感知 vs 认知层面感知的区别 | Ch2 |
| 形状区分（SDB）vs 光线区分（LDB）的UI设计偏好 | Ch2 |
| 为什么交通灯是LDB而非SDB | Ch2 |
| 三层知识组织（Guidelines-Principles-Theories） | Ch3 |
| 四层理论（概念-语义-语法-词法） | Ch3C |
| 七阶段行动理论 | Ch3C |
| 八条黄金规则 | Ch3B |
| 三类用户技能水平（新手-间歇-专家） | Ch3B |
| 五种主要交互风格 | Ch3B |

### Quiz 2 内容分析 / Quiz 2 Content Analysis

根据Quiz 2的四张图片（4.jpg, 3.jpg, 2.jpg, 1.jpg），Quiz 2 覆盖了后续章节的内容，主要涉及直接操纵、菜单导航、表单设计等知识点。

---

<a name="exam"></a>

## 期末考试范围与占比分析 / Final Exam Scope & Weight Analysis

### 考试覆盖范围总览 / Overview of Exam Coverage

根据课程大纲（Syllabus）和现有PPT材料，课程涉及的知识体系如下：

| 章节 / Chapter | 主题 / Topic | PPT状态 / PPT Status | 预计占比 / Est. Weight |
|---|---|---|---|
| **Ch1** | 交互系统的可用性 / Usability of Interactive Systems | ✅ 已发布 | ★★★★★ 10-15% |
| **Ch2** | 通用可用性 / Universal Usability | ✅ 已发布 | ★★★★★ 10-15% |
| **Ch3A** | 指南 / Guidelines | ✅ 已发布 | |
| **Ch3B** | 原则 / Principles | ✅ 已发布 | ★★★★★ 15-20% |
| **Ch3C** | 理论 / Theories | ✅ 已发布 | |
| **Ch4** | 设计 / Design | ✅ 已发布 | ★★★★ 10-12% |
| **Ch5** | 评估 / Evaluation | ❓ 未在文件夹中/Not in folder | 可能未讲授或并入其他章节 |
| **Ch6** | （未知主题） | ❓ 未在文件夹中/Not in folder | 可能未讲授 |
| **Ch7** | 直接操纵与沉浸式环境 / Direct Manipulation & Immersive Environments | ✅ 已发布 | ★★★★ 8-10% |
| **Ch8** | 导航、表单填写与对话框 / Navigation, FFI, Dialog Boxes | ✅ 已发布 | ★★★★ 8-10% |
| **Ch9** | 表达性人类语言与命令语言 / Expressive Human & Command Languages | ✅ 已发布 | ★★★ 5-8% |
| **Ch10** | 设备 / Devices | ✅ 已发布 | ★★★ 5-8% |
| **Ch11** | 通信与协作 / Communication & Collaboration | ✅ 已发布 | ★★★★ 8-10% |
| **Ch12** | 提升用户体验 / Advancing the UX | ✅ 已发布 | ★★★★ 8-10% |
| **Ch13** | （未知主题） | ❓ 未在文件夹中/Not in folder | 可能未讲授 |
| **Ch14** | 文档与用户支持 / Documentation & User Support | ✅ 已发布 | ★★★ 3-5% |
| **Ch15+16** | 信息搜索与数据可视化 / Information Search & Data Visualization | ✅ 已发布 | ★★★ 3-5% |

### 考试重点分析 / Key Exam Focus Analysis

根据教师说明和材料分布，期末考试的**重点章节**（按重要性排序）：

| 优先级 / Priority | 章节 / Chapters | 理由 / Rationale |
|---|---|---|
| 🔴 **最高 / Highest** | Ch1, Ch2, Ch3A/B/C | Quiz 1已考，但作为基础理论，期末必定重点考查。三层知识体系、八条黄金规则、四层理论、七阶段行动理论是核心。 |
| 🟠 **高 / High** | Ch4, Ch7, Ch8, Ch11, Ch12 | 设计过程、直接操纵、导航设计、通信协作、用户体验提升是UID核心实践内容。特别是Ch4中的误差建模公式（开环/闭环误差率）是计算题重点。 |
| 🟡 **中等 / Medium** | Ch9, Ch10 | 语音识别、命令语言、设备知识，概念性内容较多。 |
| 🟢 **较低 / Lower** | Ch14, Ch15+16 | 文档、信息搜索、数据可视化，内容相对较少，概念性为主。 |

### 考试题型预测 / Expected Question Types

根据教师说明（"记忆型考点完全基于教学PPT，应用型考点可以灵活" / "Memory-style exam points are totally based on PPTs; knowledge-application-style exam points can be flexible"）：

| 题型 / Question Type | 说明 / Description |
|---|---|
| **概念题 / Concept Questions** | 定义、分类、列举（如：八条黄金规则是什么？五阶段搜索框架是什么？） |
| **辨析题 / Discrimination Questions** | 判断正误、概念区分（如：物理感知 vs 认知感知；VR vs AR） |
| **简答题 / Short Answer Questions** | 解释原理、描述过程（如：四层理论各层含义；七阶段行动理论） |
| **计算题 / Calculation Questions** | Ch4的误差建模公式（开环误差率、闭环收敛、动态需求下的误差） |
| **应用题 / Application Questions** | 给定场景，应用UID原则/指南进行分析和设计 |

### 复习策略建议 / Study Strategy Recommendations

1. **硬知识（记忆型）**：重点背诵PPT中出现的所有概念、分类、规则、原则和理论框架。中英文术语对照要熟练。
2. **软知识（应用型）**：理解每个原则/指南背后的逻辑，能够在给定场景中识别好的/坏的UI设计实践。
3. **计算题**：熟练掌握Ch4中的误差建模公式：
   - $E = (1+R)(1+D)(1+I) - 1$
   - 收敛条件 $E < 1$
   - $E_\infty = \frac{E \cdot V}{1-E}$
4. **跨章节关联**：注意各章节之间的联系，如通用可用性(Ch2)与指南/原则(Ch3)的关系，设计过程(Ch4)与直接操纵(Ch7)的关系等。

---

## 附录：核心公式汇总 / Appendix: Key Formulas Summary

| 公式名称 / Name | 公式 / Formula | 所属章节 / Chapter |
|---|---|---|
| **Fitts's Law** | $T = a + b \cdot \log_2(D/W + 1)$ | Ch1 |
| **Miller's Law** | 短期记忆容量 ≈ 7 ± 2 组块 | Ch1 |
| **开环误差率 / OL Error Rate** | $E = (1 + R) \times (1 + D) \times (1 + I) - 1$ | Ch4 |
| **闭环误差收敛 / CL Error Convergence** | $E_n = E^n$, 收敛当 $E < 1$ | Ch4 |
| **收敛所需周期数 / Periods for Convergence** | $n > \log_E C$ | Ch4 |
| **动态需求静态误差率** | $E_\infty = \frac{E \cdot V}{1 - E}$ | Ch4 |
| **动态需求迭代误差** | $E_n = E(E_{n-1} + V)$ | Ch4 |

---

> **📌 重要提醒 / Important Reminder**:
> - 所有记忆型考点均来自教学PPT，PPT中未出现的概念不会考察。
> - PPT风格"verbally sollen"（有意的文字丰富），目的是方便复习。
> - 应用型考点可能涉及PPT中未出现的新案例/场景，但所需知识均在PPT中讲授过。
> - 学术诚信 / Academic integrity。

---

*本文档基于 ISE 333 Spring 2026 课程全部教学PPT整理，涵盖所有已发布章节的完整知识点。*
*This document is compiled based on all teaching PPTs of ISE 333 Spring 2026, covering complete knowledge points from all published chapters.*
