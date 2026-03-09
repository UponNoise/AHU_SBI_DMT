这是 **HM9 (Homework 9)** 的整理内容，主要涵盖 **Chapter 12: Chi-Square Tests (卡方检验)**，包括拟合优度检验、独立性检验和同质性检验。

---

# HM9: Chi-Square Tests (卡方检验)

## Part 1: Goodness-of-Fit Test (拟合优度检验)

### Question 1
**Topic:** Hypotheses for Goodness-of-Fit
**题目主题：** 拟合优度检验的假设

**Question:**
State the null hypothesis and alternative hypothesis for a test of goodness of fit.
(To determine if three comparable restaurants are equally popular...)
为拟合优度检验陈述零假设和备择假设。（为了确定三家相当的餐厅是否同样受欢迎...）

**Correct Answer (正确答案):**
**H0: $\pi_1 = \pi_2 = \pi_3$, H1: Not all proportions are the same.**
(H0: $\pi_1 = \pi_2 = \pi_3$，H1: 并非所有比例都相同。)

---

### Question 2
**Topic:** Critical Value Calculation
**题目主题：** 计算临界值

**Question:**
Find the critical value for 5% of significance level (State your answer in three decimal points)
找出5%显著性水平下的临界值（保留三位小数）。

**Given Data (已知数据):**
*   Categories ($k$): 3 (Restaurant 1, 2, 3)
*   Degrees of Freedom ($df$): $k - 1 = 3 - 1 = 2$
*   $\alpha = 0.05$

**Correct Answer (正确答案):**
`5.991`

> **Note (解析):** 查卡方分布表 $\chi^2_{0.05, 2} = 5.991$。

---

### Question 3
**Topic:** Chi-Square Test Statistic Calculation
**题目主题：** 计算卡方检验统计量

**Question:**
Find the Chi-square test statistic value. (State your answer in two decimal points)
计算卡方检验统计量的值。（保留两位小数）。

**Given Data (已知数据):**
*   Observed ($O$): 28, 52, 49
*   Total ($n$): $28 + 52 + 49 = 129$
*   Expected ($E$): Since "equally popular", $E = 129 / 3 = 43$ for each.

**Correct Answer (正确答案):**
`7.95`

> **Note (解析):**
> $\chi^2 = \sum \frac{(O-E)^2}{E} = \frac{(28-43)^2}{43} + \frac{(52-43)^2}{43} + \frac{(49-43)^2}{43}$
> $= \frac{225}{43} + \frac{81}{43} + \frac{36}{43} = \frac{342}{43} \approx 7.95$

---

### Question 4
**Topic:** Conclusion of Goodness-of-Fit Test
**题目主题：** 拟合优度检验的结论

**Question:**
State your conclusion to the Chi-square test above.
陈述上述卡方检验的结论。

**Correct Answer (正确答案):**
**Since $X^2$=(val) > Critical_val, we reject the null hypothesis and conclude that there is sufficient evidence that the num of people in the three restaurants are not the same.**
(因为 $X^2$=7.95 > 5.991，我们拒绝原假设，并得出结论有充分证据表明这三家餐厅的人数不相同。)

---

## Part 2: Test of Independence (独立性检验)

### Question 5
**Topic:** Hypotheses for Test of Independence
**题目主题：** 独立性检验的假设

**Question:**
Which is the best hypothesis for the test of independence?
(At one of the restaurants... surveyed customers regarding their preference of music)
哪一个是独立性检验的最佳假设？（关于性别和音乐偏好的调查）

**Correct Answer (正确答案):**
**H0: Gender and music preference are independent. H1: Gender and music preference are related.**
(H0: 性别和音乐偏好是独立的。H1: 性别和音乐偏好是相关的。)

---

### Question 6
**Topic:** Critical Value Calculation (Independence)
**题目主题：** 计算临界值（独立性）

**Question:**
At significant level of 10%, find the critical value. (State your answer in two decimal points)
在10%的显著性水平下，找出临界值。（保留两位小数）。

**Given Data (已知数据):**
*   Rows ($r$): 2 (Men, Women)
*   Columns ($c$): 3 (Easy Listening, Hard Rock, Country Western)
*   Degrees of Freedom ($df$): $(r-1)(c-1) = (2-1)(3-1) = 2$
*   $\alpha = 0.10$

**Correct Answer (正确答案):**
`4.61`

> **Note (解析):** 查卡方分布表 $\chi^2_{0.10, 2} \approx 4.605$ (rounded to 4.61)。

---

### Question 7
**Topic:** Test Statistic Calculation (Independence)
**题目主题：** 计算检验统计量（独立性）

**Question:**
Find the test statistic $X^2$ value. (State your answer in two decimal points)
找出检验统计量 $X^2$ 的值。（保留两位小数）。

**Correct Answer (正确答案):**
`4.35`

> **Note (解析):** 使用公式 $\chi^2 = \sum \frac{(f_o - f_e)^2}{f_e}$ 计算。

---

### Question 8
**Topic:** Conclusion of Test of Independence
**题目主题：** 独立性检验的结论

**Question:**
State your conclusion to the hypothesis test above.
陈述上述假设检验的结论。

**Correct Answer (正确答案):**
**Since $X^2$=(val)< Critical_val, we do not reject the null hypothesis and conclude that there is insufficient evidence that gender and music preference are related.**
(因为 $X^2$=4.35 < 4.61，我们不拒绝原假设，并得出结论没有充分证据表明性别和音乐偏好相关。)

---

## Part 3: Test of Homogeneity (同质性检验)

### Question 9
**Topic:** Hypotheses for Test of Homogeneity
**题目主题：** 同质性检验的假设

**Question:**
State the null and alternate hypothesis for the homogeneity test.
(A marketing consultant is hired by the three restaurants to determine the age of the customers)
陈述同质性检验的零假设和备择假设。（三家餐厅顾客年龄分布）

**Correct Answer (正确答案):**
**H0: The three populations in all three restaurants are similar. H1: Not all the populations in the three restaurants are the same.**
(H0: 三家餐厅的三个总体是相似的（同质的）。H1: 并非三家餐厅的所有总体都相同。)

---

### Question 10
**Topic:** Conclusion of Homogeneity Test
**题目主题：** 同质性检验的结论

**Question:**
State your conclusion at significant level of 1%.
在1%的显著性水平下陈述你的结论。

**Given Data (推导):**
*   Rows ($r$): 2 (Under 30, 30 and Over)
*   Columns ($c$): 3 (Restaurant 1, 2, 3)
*   Degrees of Freedom ($df$): $(2-1)(3-1) = 2$
*   Critical Value ($\alpha=0.01, df=2$): **9.210**

**Correct Answer (正确答案):**
**Since $X^2$=11.873 > 9.210, we reject the null hypothesis and conclude that there is sufficient evidence that not all the populations in the three restaurants are the same.**
(因为 $X^2$=11.873 > 9.210，我们拒绝原假设，并得出结论有充分证据表明并非三家餐厅的所有总体都相同。)

> **Note (注意):** 图中你选错了选项（选了 $X^2$=11.880 的那个），但正确答案标记在最后一个选项，其统计量数值精确为 **11.873**。