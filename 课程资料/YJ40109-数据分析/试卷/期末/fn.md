根据Week 10-18的课件内容，以下是按照章节顺序整理的中英双语详细知识点复习大纲。

---

# Chapter 10: Two-Sample Tests (双样本检验)
**Week 10-11**

### 1. Difference Between Two Means: Independent Samples (两均值之差：独立样本)
*   **Definition (定义):** Samples selected from one population have no effect on the sample selected from the other population. (从一个总体中抽取的样本对从另一个总体中抽取的样本没有影响。)
*   **Scenario A: Population Variances Known ($\sigma_1, \sigma_2$ known)**
    *   **Test Statistic (检验统计量):** **Z-test**.
    *   **Assumptions (假设):** Samples are randomly and independently drawn; populations are normal or sample sizes $\ge 30$.
*   **Scenario B: Population Variances Unknown ($\sigma_1, \sigma_2$ unknown)**
    *   **Case 1: Assumed Equal ($\sigma_1^2 = \sigma_2^2$)**
        *   Use **Pooled-Variance t-test (合并方差t检验)**.
        *   Calculate pooled variance ($S_p^2$) to estimate common variance.
        *   Degrees of freedom (自由度): $df = n_1 + n_2 - 2$.
    *   **Case 2: Not Assumed Equal ($\sigma_1^2 \neq \sigma_2^2$)**
        *   Use **Separate-Variance t-test (分离方差t检验)**.
        *   Degrees of freedom calculated via complex formula (Welch's approximation).

### 2. Difference Between Two Means: Related Samples (两均值之差：相关样本)
*   **Types (类型):** Paired or matched samples (配对样本), Repeated measures (重复测量, before/after).
*   **Method (方法):** Use difference between paired values $D_i = X_{1i} - X_{2i}$.
*   **Test Statistic (检验统计量):** **Paired t-test (配对t检验)**.
    *   Hypothesis (假设): $H_0: \mu_D = 0$ (Mean difference is zero).
    *   Statistic depends on sample mean difference ($\bar{D}$) and sample standard deviation of differences ($S_D$).
*   **Advantage (优势):** Eliminates variation among subjects (消除受试者之间的变异).

### 3. Difference Between Two Proportions (两比例之差)
*   **Goal (目标):** Test hypothesis for the difference between two population proportions ($\pi_1 – \pi_2$).
*   **Test Statistic (检验统计量):** **Z-test**.
*   **Pooled Estimate (合并估计):** Under $H_0: \pi_1 = \pi_2$, use pooled estimate for the overall proportion ($\bar{p}$).
*   **Assumptions (假设):** $n\pi \ge 5$ and $n(1-\pi) \ge 5$ for both populations.

### 4. F-Test for the Difference Between Two Variances (两方差之差的F检验)
*   **Goal (目标):** Test if two independent populations have equal variances ($H_0: \sigma_1^2 = \sigma_2^2$).
*   **Test Statistic (检验统计量):** **F-test statistic = $S_1^2 / S_2^2$**.
*   **Degrees of Freedom (自由度):** Numerator ($n_1 - 1$) and Denominator ($n_2 - 1$).
*   **Critical Value (临界值):** Found in **F-table**.
*   **Application (应用):** Used to decide whether to use pooled-variance or separate-variance t-test.

---

# Chapter 11: Analysis of Variance (ANOVA) (方差分析)
**Week 12**

### 1. One-Way ANOVA (单因素方差分析)
*   **Purpose (目的):** Evaluate the difference among the means of three or more groups (evaluating one factor). (评估三个或更多组的均值差异。)
*   **Hypotheses (假设):**
    *   $H_0: \mu_1 = \mu_2 = \dots = \mu_c$ (All means are equal).
    *   $H_1$: Not all population means are the same (at least one is different).
*   **Partitioning Variation (变异分解):**
    *   **SST (Total Variation):** Total Sum of Squares.
    *   **SSA (Among-Group Variation):** Variation due to factor/treatment differences.
    *   **SSW (Within-Group Variation):** Variation due to random sampling/error.
    *   **Relationship:** $SST = SSA + SSW$.
*   **F-Test Statistic (F统计量):** $F = MSA / MSW$.
    *   **MSA (Mean Square Among):** $SSA / (c - 1)$.
    *   **MSW (Mean Square Within):** $SSW / (n - c)$.
*   **Decision Rule (决策规则):** Reject $H_0$ if $F > F_{critical}$.

### 2. Multiple Comparisons: The Tukey-Kramer Procedure (多重比较：Tukey-Kramer过程)
*   **Purpose (目的):** If ANOVA rejects $H_0$, use this to determine *which* specific means are significantly different. (如果在ANOVA中拒绝了原假设，用此方法确定具体哪两组均值不同。)
*   **Method (方法):** Compare absolute mean differences against a **Critical Range**.
*   **Critical Range Formula:** Depends on $Q_U$ (Studentized Range Distribution), $MSW$, and sample sizes.

### 3. Randomized Block Design (随机区组设计)
*   **Purpose (目的):** Control for possible variation from a second factor (blocks) to reduce Error Variance (SSE).
*   **Partitioning:** $SST = SSA (Treatment) + SSBL (Block) + SSE (Random Error)$.
*   **Tests:** Can test both Factor A effects and Block effects using F-ratios.

### 4. Two-Way ANOVA (双因素方差分析)
*   **Purpose (目的):** Examine the effect of **Two Factors** and their **Interaction (交互作用)**.
*   **Interaction (交互作用):** Occurs when the effect of one factor depends on the level of the other factor. (当一个因素的效应取决于另一个因素的水平时发生。)
*   **Sources of Variation:** Factor A, Factor B, Interaction (AB), Error.
*   **F-Tests:** Three separate tests performed (Factor A effect, Factor B effect, Interaction effect).

---

# Chapter 12: Chi-Square Tests and Nonparametric Tests (卡方检验与非参数检验)
**Week 13-14**

### 1. Chi-Square Goodness-of-Fit Test (卡方拟合优度检验)
*   **Purpose (目的):** Determine if sample data conforms to a hypothesized distribution (e.g., Uniform, Normal).
*   **Test Statistic (检验统计量):** $\chi^2 = \sum \frac{(f_o - f_e)^2}{f_e}$.
    *   $f_o$: Observed frequency (观测频数).
    *   $f_e$: Expected frequency (期望频数).
*   **Degrees of Freedom (自由度):** $k - p - 1$ (where $k$ is categories, $p$ is estimated parameters).

### 2. Chi-Square Test of Independence (卡方独立性检验)
*   **Purpose (目的):** Test if two categorical variables are independent (using Contingency Tables / r x c tables). (检验两个分类变量是否独立。)
*   **Hypotheses:**
    *   $H_0$: Variables are independent (no relationship).
    *   $H_1$: Variables are dependent (relationship exists).
*   **Expected Frequency (期望频数):** $f_e = \frac{\text{Row Total} \times \text{Column Total}}{n}$.
*   **Degrees of Freedom:** $(r - 1)(c - 1)$.

### 3. Marascuilo Procedure (Marascuilo过程)
*   **Purpose (目的):** Post-hoc test used when the Chi-square test for differences among proportions ($c > 2$) is rejected.
*   **Method:** Compares all pairs of proportions to a calculated critical range.

### 4. Nonparametric Tests (非参数检验)
*   **Characteristics:** Distribution-free methods, often used for ranks or categorical data.
*   **Wilcoxon Rank-Sum Test (Wilcoxon秩和检验):**
    *   Nonparametric alternative to the independent t-test.
    *   Tests two independent population **medians**.
    *   Uses **ranks** (T1) instead of raw values.
*   **Kruskal-Wallis Rank Test (Kruskal-Wallis秩检验):**
    *   Nonparametric alternative to One-Way ANOVA.
    *   Tests equality of more than 2 population **medians**.
    *   Uses an H-statistic based on ranks.

---

# Chapter 13: Simple Linear Regression (简单线性回归)
**Week 15-16**

### 1. Linear Regression Model (线性回归模型)
*   **Equation (方程):** $Y_i = \beta_0 + \beta_1 X_i + \epsilon_i$.
    *   **Dependent Variable (Y):** Predicted variable.
    *   **Independent Variable (X):** Predictor variable.
    *   $\beta_0$: Population Y-intercept (截距).
    *   $\beta_1$: Population Slope (斜率).
    *   $\epsilon_i$: Random Error term.

### 2. Least Squares Method (最小二乘法)
*   **Goal:** Minimize the sum of squared residuals (SSE = $\sum(Y_i - \hat{Y}_i)^2$).
*   **Prediction Equation (预测方程):** $\hat{Y} = b_0 + b_1 X$.
    *   $b_1$: Estimated slope (Estimate of change in Y per unit change in X).
    *   $b_0$: Estimated intercept (Average value of Y when X=0).

### 3. Measures of Variation (变异的度量)
*   **SST (Total Sum of Squares):** Total variation.
*   **SSR (Regression Sum of Squares):** Explained variation.
*   **SSE (Error Sum of Squares):** Unexplained variation.
*   **Identity:** $SST = SSR + SSE$.
*   **Coefficient of Determination ($r^2$):** $SSR / SST$. Represents the proportion of variation in Y explained by X. (判定系数：Y的变异中能被X解释的比例。)
*   **Standard Error of Estimate ($S_{YX}$):** Measure of the variation of observed Y values around the regression line.

### 4. Assumptions (L.I.N.E.)
*   **L**inearity (线性).
*   **I**ndependence of Errors (误差的独立性).
*   **N**ormality of Error (误差的正态性).
*   **E**qual Variance (Homoscedasticity) (方差齐性/同方差性).

### 5. Inference (统计推断)
*   **t-test for Slope:** Test if $\beta_1 \neq 0$ (Linear relationship exists).
*   **Confidence Interval for Slope:** Estimate the range of $\beta_1$.

---

# Chapter 14: Introduction to Multiple Regression (多元回归简介)
**Week 17-18**

### 1. Multiple Regression Model (多元回归模型)
*   **Equation:** $Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \dots + \beta_k X_{ki} + \epsilon_i$.
*   **Interpretation:** Coefficients ($\beta_k$) represent the change in Y per unit change in $X_k$, **holding all other variables constant**.

### 2. Evaluating the Model (模型评估)
*   **Coefficient of Multiple Determination ($r^2$):** Proportion of total variation in Y explained by *all* X variables together.
*   **Adjusted $r^2$ (调整后的$r^2$):** Accounts for sample size and number of predictors. Penalizes adding unimportant variables.
*   **F-Test for Overall Significance (总体显著性的F检验):**
    *   $H_0: \beta_1 = \beta_2 = \dots = \beta_k = 0$.
    *   Test if the *entire* model is significant.

### 3. Evaluating Individual Variables (评估单个变量)
*   **t-Test for Individual Slope:** Tests if a specific variable significantly contributes to the model ($H_0: \beta_j = 0$).
*   **Partial F-Test:** Tests the contribution of a *set* of variables or a single variable given others are already in the model.

### 4. Dummy Variables (虚拟变量/哑变量)
*   Used for **Categorical Variables** (e.g., Gender, Season).
*   Coded as 0 or 1.
*   If a category has $c$ levels, use $c-1$ dummy variables.
*   Interpretation: The coefficient represents the difference in the intercept compared to the baseline (coded as 0).

### 5. Interaction Effects (交互效应)
*   Modeled by cross-product terms (e.g., $X_1 \times X_2$).
*   Present when the effect of one independent variable on Y depends on the level of another independent variable.

### 6. Logistic Regression (逻辑回归)
*   **Use Case:** When the dependent variable ($Y$) is **Binary** (categorical with two values, e.g., Yes/No).
*   **Concept:** Predicts the **probability** of success.
*   **Odds Ratio:** Probability of success divided by probability of failure. The model predicts the natural log of the odds ratio ($ln(\text{odds})$).