这是 **HM7 (Homework 7)** 的整理内容，主要涵盖 **Chapter 10: Two-Sample Tests (双样本检验)** 的相关计算与结论判断。

---

# HM7: Two-Sample Tests (双样本检验)

### Question 1
**Topic:** Difference Between Two Means - Independent Samples (Variances Unknown and Unequal)
**题目主题：** 双样本均值之差 - 独立样本（方差未知且不相等）

**Question:**
The population variances are unknown and assumed not equal for population 1 and 2 below:
What is the value of degrees of freedom for the hypothesis test? (Answer should be an integer number).
已知总体方差未知且假设总体1和总体2的方差不相等。请计算假设检验的自由度（答案应为整数）。

**Given Data (已知数据):**
| | $n$ | $\bar{x}$ | $s^2$ |
|---|---|---|---|
| **1** | 21 | 34.5 | 10.38 |
| **2** | 30 | 31.3 | 4.67 |

**Correct Answer (正确答案):**
`32`

---

### Question 2
**Topic:** Test Statistic Calculation (Unequal Variances)
**题目主题：** 计算检验统计量（方差不相等）

**Question:**
Calculate the value of the test statistic for the hypothesis test for $H_0: \mu_1 = \mu_2$ and $H_1: \mu_1 \neq \mu_2$ at 5% confidence level. (Round your answer to two decimal points).
计算在5%显著性水平下，针对 $H_0: \mu_1 = \mu_2$ 与 $H_1: \mu_1 \neq \mu_2$ 的检验统计量的值。（保留两位小数）。

**Correct Answer (正确答案):**
`3.97`

> **Note (解析):** 使用分离方差t检验公式 (Separate-Variance t-test formula):
> $$t = \frac{\bar{x}_1 - \bar{x}_2}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}$$

---

### Question 3
**Topic:** Hypothesis Conclusion (Unequal Variances)
**题目主题：** 假设检验结论（方差不相等）

**Question:**
What is your conclusion to the above hypothesis test?
对于上述假设检验，你的结论是什么？

**Correct Answer (正确答案):**
**Since t=(Q2's answer) > 2.03, we reject the null hypothesis and conclude that there is sufficient evidence that $\mu_1 \neq \mu_2$.**
(因为 t=3.97 > 2.03，我们拒绝原假设，并得出结论有充分证据表明 $\mu_1 \neq \mu_2$。)

---

### Question 4
**Topic:** Pooled Standard Deviation ($S_p$) Calculation
**题目主题：** 计算合并标准差 ($S_p$)

**Question:**
The variances for populations A and B above are unknown, which are assume equal. Calculate the $S_p$. Note that $Sp^2$ is the pooled variance. (Round your answer to two decimal points).
假设总体A和B的方差未知但相等。计算 $S_p$。注意 $Sp^2$ 是合并方差。（保留两位小数）。

**Given Data (已知数据):**
| | A | B |
|---|---|---|
| **$n$** | 21 | 30 |
| **$\bar{X}$** | 34.5 | 31.3 |
| **$S^2$** | 10.38 | 4.67 |

**Correct Answer (正确答案):**
`2.65`

> **Note (解析):**
> $$S_p = \sqrt{\frac{(n_1-1)s_1^2 + (n_2-1)s_2^2}{n_1+n_2-2}}$$

---

### Question 5
**Topic:** Test Statistic Calculation (Pooled Variance)
**题目主题：** 计算检验统计量（合并方差）

**Question:**
Referring to Q4 above, calculate the value of the test statistic for the hypothesis test for $H_0: \mu_1 = \mu_2$ and $H_1: \mu_1 \neq \mu_2$ at 5% confidence level. (Round your answer to two decimal points).
参考Q4，计算在5%显著性水平下，针对 $H_0: \mu_1 = \mu_2$ 与 $H_1: \mu_1 \neq \mu_2$ 的检验统计量的值。（保留两位小数）。

**Correct Answer (正确答案):**
`4.25`

> **Note (解析):** 使用合并方差t检验公式 (Pooled-Variance t-test formula):
> $$t = \frac{\bar{x}_1 - \bar{x}_2}{S_p \sqrt{\frac{1}{n_1} + \frac{1}{n_2}}}$$

---

### Question 6
**Topic:** Hypothesis Conclusion (Pooled Variance)
**题目主题：** 假设检验结论（合并方差）

**Question:**
Referring to Q4 above, state your conclusion. Make sure that you know the degrees of freedom and the critical value t(49, 0.025) before making this conclusion.
参考Q4，陈述你的结论。在下结论前，请确保你知道自由度和临界值 t(49, 0.025)。

**Correct Answer (正确答案):**
**Since t=(Q5's answer) > 2.009, we reject the null hypothesis and conclude that there is sufficient evidence that $\mu_1 \neq \mu_2$.**
(因为 t=4.25 > 2.009，我们拒绝原假设，并得出结论有充分证据表明 $\mu_1 \neq \mu_2$。)

---

### Question 7
**Topic:** Paired Difference Test (Z-test)
**题目主题：** 配对差异检验（Z检验）

**Question:**
Test $H_0: \mu_1 = \mu_2$ and $H_1: \mu_1 \neq \mu_2$ at 5% confidence level.
Calculate the Z-test value. (Round your answer to 2 decimal points).
在5%置信水平下检验 $H_0$ 和 $H_1$。计算Z检验值。（保留两位小数）。

**Given Data (已知数据):**
$\bar{D} = 0.572$, $\sigma_d = 1.58$, $n = 10$

**Correct Answer (正确答案):**
`1.14`

> **Note (解析):**
> $$Z = \frac{\bar{D} - 0}{\sigma_d / \sqrt{n}}$$

---

### Question 8
**Topic:** Hypothesis Conclusion (Paired Z-test)
**题目主题：** 假设检验结论（配对Z检验）

**Question:**
State your conclusion to Q7 above.
陈述对Q7的结论。

**Correct Answer (正确答案):**
**Since Z= (Q7's answer) < 1.96, we do not reject the null hypothesis and conclude that there is insufficient evidence that $\mu_1 \neq \mu_2$.**
(因为 Z=1.14 < 1.96，我们不拒绝原假设，并得出结论没有充分证据表明 $\mu_1 \neq \mu_2$。)

---

### Question 9
**Topic:** F-Test for Two Variances
**题目主题：** 两总体方差的F检验

**Question:**
Calculate the F-statistics, specify the F-test value here. (Round your answer to one decimal point).
计算F统计量，在此处注明F检验值。（保留一位小数）。

**Given Data (已知数据):**
Two groups of students, Group A and Group B.
*   Group A: $n_A = 12$, sample variance $s_A^2 = 25$.
*   Group B: $n_B = 10$, sample variance $s_B^2 = 10$.
Test for significant difference in variances at 5% significance level.

**Correct Answer (正确答案):**
`2.5`

> **Note (解析):**
> $$F = \frac{S_{max}^2}{S_{min}^2} = \frac{25}{10} = 2.5$$

---

### Question 10
**Topic:** Degrees of Freedom (F-Test)
**题目主题：** 自由度（F检验）

**Question:**
For Q9, what is the degrees of freedom for Group A? (Specify an integer value).
对于Q9，A组的自由度是多少？（指定一个整数值）。

**Correct Answer (正确答案):**
`11`

> **Note (解析):** $df_A = n_A - 1 = 12 - 1 = 11$。

---

### Question 11
**Topic:** F-Test Critical Value ($F_L$)
**题目主题：** F检验临界值（下限 $F_L$）

**Question:**
For Q9, find the lower critical value F_L (Round your answer to two decimal points).
对于Q9，找出下临界值 F_L。（保留两位小数）。

**Correct Answer (正确答案):**
`0.28`

> **Note (解析):** 这是一个双尾检验（$\alpha = 0.05$）。$F_L = \frac{1}{F_{U(df_2, df_1, \alpha/2)}}$。

---

### Question 12
**Topic:** F-Test Critical Value ($F_U$)
**题目主题：** F检验临界值（上限 $F_U$）

**Question:**
For Q9, find the upper critical value F_U (Round your answer to two decimal points).
对于Q9，找出上临界值 F_U。（保留两位小数）。

**Correct Answer (正确答案):**
*(The screenshot cuts off the value, but marked as correct. Based on standard tables for $df_1=11, df_2=9$ at $\alpha/2=0.025$, the value is approximately **3.92** or similar depending on interpolation).*
*(截图中答案数值被切掉，但显示为正确。根据标准表推算，约为 3.92 左右)*