这是 **HM8 (Homework 8)** 的整理内容，主要涵盖 **Chapter 11: Analysis of Variance (ANOVA, 方差分析)** 的计算与推断。

---

# HM8: One-Way ANOVA (单因素方差分析)

### Question 1
**Topic:** Hypotheses for One-Way ANOVA
**题目主题：** 单因素方差分析的假设

**Question:**
Choose the correct null hypothesis H0 and alternative hypothesis H1.
选择正确的零假设 H0 和备择假设 H1。

**Given Data (已知数据):**
You are testing three teaching methods for their impact on student scores. The test scores for five students per method are as follows:
(你正在测试三种教学方法对学生成绩的影响。每种方法的五名学生的考试成绩如下：)
| Method 1 | Method 2 | Method 3 |
| :---: | :---: | :---: |
| 85 | 78 | 80 |
| 88 | 82 | 83 |
| 90 | 79 | 81 |
| 86 | 81 | 84 |
| 89 | 80 | 79 |

At the $\alpha = 0.05$ significance level, is there evidence to suggest a difference in mean test scores?

**Correct Answer (正确答案):**
**H0: All population means are equal, H1: Not all population means are equal**
(H0: 所有总体均值相等，H1: 并非所有总体均值都相等)

---

### Question 2
**Topic:** Calculation of Grand Mean ($\bar{\bar{x}}$)
**题目主题：** 计算总均值 ($\bar{\bar{x}}$)

**Question:**
Calculate sample means and the grand mean. Input only the grand mean as your answer (state answer in one decimal points).
计算样本均值和总均值。仅输入总均值作为答案（保留一位小数）。

**Correct Answer (正确答案):**
`83.0`

> **Note (解析):**
> 1.  Calculate sum of all scores (计算所有分数的总和):
>     Method 1 Sum = 438, Method 2 Sum = 400, Method 3 Sum = 407. Total = 1245.
> 2.  Total number of observations ($n$) = 15.
> 3.  Grand Mean = $1245 / 15 = 83.0$.

---

### Question 3
**Topic:** Critical F Value ($F_c$)
**题目主题：** F 检验临界值

**Question:**
What is the critical F value (F_c) ? (Answer in two decimal points)
临界 F 值是多少？（保留两位小数）

**Correct Answer (正确答案):**
`3.89`

> **Note (解析):**
> *   $k = 3$ (groups), $n = 15$ (total sample size).
> *   $df_{numerator} (df_1) = k - 1 = 2$.
> *   $df_{denominator} (df_2) = n - k = 12$.
> *   Look up $F(2, 12)$ at $\alpha = 0.05$.

---

### Question 4
**Topic:** Sum of Squares Among Groups (SSA)
**题目主题：** 组间平方和 (SSA)

**Question:**
Calculate the SSA (state your answer in one decimal point)
计算 SSA（保留一位小数）。

**Correct Answer (正确答案):**
`163.6`

> **Note (解析):**
> Formula: $SSA = \sum n_j (\bar{x}_j - \bar{\bar{x}})^2$
> *   $\bar{x}_1 = 87.6, \bar{x}_2 = 80.0, \bar{x}_3 = 81.4$.
> *   $SSA = 5(87.6-83)^2 + 5(80-83)^2 + 5(81.4-83)^2 = 105.8 + 45 + 12.8 = 163.6$.

---

### Question 5
**Topic:** Sum of Squares Within Groups (SSW)
**题目主题：** 组内平方和 (SSW)

**Question:**
Calculate SSW (state your answer in one decimal point)
计算 SSW（保留一位小数）。

**Correct Answer (正确答案):**
`44.4`

> **Note (解析):**
> Formula: $SSW = \sum (x_{ij} - \bar{x}_j)^2$
> Sum of squared deviations within each group (计算每组内的离差平方和并相加):
> *   Method 1: 17.2
> *   Method 2: 10.0
> *   Method 3: 17.2
> *   Total SSW = 44.4

---

### Question 6
**Topic:** Mean Square Among (MSA)
**题目主题：** 组间均方 (MSA)

**Question:**
Calculate MSA (state your answer in one decimal point)
计算 MSA（保留一位小数）。

**Correct Answer (正确答案):**
`81.8`

> **Note (解析):**
> $MSA = SSA / df_1 = 163.6 / 2 = 81.8$.

---

### Question 7
**Topic:** Mean Square Within (MSW)
**题目主题：** 组内均方 (MSW)

**Question:**
Calculate MSW (state your answer in one decimal point)
计算 MSW（保留一位小数）。

**Correct Answer (正确答案):**
`3.7`

> **Note (解析):**
> $MSW = SSW / df_2 = 44.4 / 12 = 3.7$.

---

### Question 8
**Topic:** F-Test Statistic Calculation
**题目主题：** 计算 F 检验统计量

**Question:**
Calculate the F-test value. (Answer in one decimal point)
计算 F 检验值。（保留一位小数）。

**Correct Answer (正确答案):**
`22.1`

> **Note (解析):**
> $F = MSA / MSW = 81.8 / 3.7 \approx 22.1$.

---

### Question 9
**Topic:** ANOVA Conclusion
**题目主题：** 方差分析结论

**Question:**
State your decision to the above ANOVA
陈述你对上述 ANOVA 的决定。

**Correct Answer (正确答案):**
**Since F= (val above) > Fu, we reject the null hypothesis and conclude that there is sufficient evidence that at least one mean is different from the others.**
(因为 F=22.1 > 3.89，我们拒绝原假设，并得出结论有充分证据表明至少有一个均值与其他均值不同。)

---

### Question 10 (Context for 11-15)
**Topic:** ANOVA Table Analysis
**题目主题：** 分析 ANOVA 表

**Given Data (已知数据):**
An ANOVA table is provided:
| Source | SS | df | MS | F |
| :--- | :--- | :--- | :--- | :--- |
| **Between Samples** | 112 | 2 | | |
| **Within Samples** | 238 | 27 | | |

---

### Question 11
**Topic:** Critical F Value ($F_c$)
**题目主题：** F 检验临界值

**Question:**
What is the critical F value (F_c) at alpha = 0.05? (State your answer in two decimal points)
在 alpha = 0.05 时，临界 F 值是多少？（保留两位小数）。

**Correct Answer (正确答案):**
`3.35`

> **Note (解析):**
> Look up $F(2, 27)$ at $\alpha = 0.05$.

---

### Question 12
**Topic:** MSA Calculation from Table
**题目主题：** 根据表格计算 MSA

**Question:**
Calculate MSA (State your answer as an integer)
计算 MSA（答案为整数）。

**Correct Answer (正确答案):**
`56`

> **Note (解析):**
> $MSA = SS_{Between} / df_{Between} = 112 / 2 = 56$.

---

### Question 13
**Topic:** MSW Calculation from Table
**题目主题：** 根据表格计算 MSW

**Question:**
Find MSW (State your answer in two decimal points)
计算 MSW（保留两位小数）。

**Correct Answer (正确答案):**
`8.81`

> **Note (解析):**
> $MSW = SS_{Within} / df_{Within} = 238 / 27 \approx 8.81$.

---

### Question 14
**Topic:** F Statistic Calculation from Table
**题目主题：** 根据表格计算 F 统计量

**Question:**
What is the value of F statistic? (State your answer in one decimal point)
F 统计量的值是多少？（保留一位小数）。

**Correct Answer (正确答案):**
`6.4`

> **Note (解析):**
> $F = MSA / MSW = 56 / 8.81 \approx 6.35$ (rounded to 6.4).

---

### Question 15
**Topic:** Hypothesis Conclusion
**题目主题：** 假设检验结论

**Question:**
State your conclusion to the hypothesis test (1-way ANOVA) above
陈述你对上述假设检验（单因素方差分析）的结论。

**Correct Answer (正确答案):**
**Since F=(val above)>F_u, we reject the null hypothesis and conclude that there is sufficient evidence that not all means are equal.**
(因为 F=6.4 > 3.35，我们拒绝原假设，并得出结论有充分证据表明并非所有均值都相等。)