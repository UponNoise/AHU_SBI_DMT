
## 📚 AMS 315 数据分析课程期中考试范围  AMS 315 Data Analysis Course Midterm Exam Scope



## **第4章：基础概率**
## **Chapter 4: Basic Probability**

| **英文知识点** | **中文知识点** |
|---------------|---------------|
| Basic probability concepts and definitions | 基础概率概念和定义 |
| Conditional probability | 条件概率 |
| To use Bayes' Theorem to revise probabilities | 使用贝叶斯定理修正概率 |
| Various counting rules | 各种计数法则 |

---

## **第5章：重要离散概率分布**
## **Chapter 5: Some Important Discrete Probability Distributions**

| **英文知识点** | **中文知识点** |
|---------------|---------------|
| The properties of a probability distribution | 概率分布的性质 |
| To calculate the expected value and variance of a probability distribution | 计算概率分布的期望值和方差 |
| To calculate the covariance and its use in finance | 计算协方差及其在金融中的应用 |
| To calculate probabilities from binomial, hypergeometric, and Poisson distributions | 计算二项分布、超几何分布和泊松分布的概率 |
| How to use the binomial, hypergeometric, and Poisson distributions to solve business problems | 如何使用这些分布解决商业问题 |

---

## **第6章：正态分布和其他连续分布**
## **Chapter 6: The Normal Distribution and Other Continuous Distributions**

| **英文知识点** | **中文知识点** |
|---------------|---------------|
| To compute probabilities from the normal distribution | 计算正态分布的概率 |
| To use the normal probability plot to determine whether a set of data is approximately normally distributed | 使用正态概率图判断数据是否近似正态分布 |
| To compute probabilities from the uniform distribution | 计算均匀分布的概率 |
| To compute probabilities from the exponential distribution | 计算指数分布的概率 |
| To compute probabilities from the normal distribution to approximate probabilities from the binomial distribution | 使用正态分布逼近二项分布的概率 |

---

## **第7章：抽样分布**
## **Chapter 7: Sampling Distributions**

### **核心概念和公式**
### **Core Concepts and Formulas**

| **英文** | **中文** | **公式** |
|----------|----------|----------|
| **Sampling Distribution** | **抽样分布** | 统计量的概率分布 |
| **Sample Mean Distribution** | **样本均值分布** | $\mu_{\bar{X}} = \mu$ <br> $\sigma_{\bar{X}} = \frac{\sigma}{\sqrt{n}}$ |
| **Central Limit Theorem (CLT)** | **中心极限定理** | $n \geq 30$ 时，$\bar{X} \sim N\left(\mu, \frac{\sigma^2}{n}\right)$ |
| **Sample Proportion Distribution** | **样本比例分布** | $\mu_{\hat{p}} = p$ <br> $\sigma_{\hat{p}} = \sqrt{\frac{p(1-p)}{n}}$ |
| **Normality Conditions** | **正态近似条件** | 样本均值：$n \geq 30$ <br> 样本比例：$np \geq 5$ 且 $n(1-p) \geq 5$ |

### **抽样方法**
### **Sampling Methods**

| **抽样类型** | **英文** | **中文** | **优缺点** |
|-------------|----------|----------|------------|
| **概率抽样** | Probability Samples | 概率抽样 |  |
| Simple Random Sample | 简单随机抽样 | 简单易用，可能不代表总体特征 |
| Systematic Sample | 系统抽样 | 简单易用，可能不代表总体特征 |
| Stratified Sample | 分层抽样 | 确保各群体的代表性 |
| Cluster Sample | 整群抽样 | 成本低，效率较低 |
| **非概率抽样** | Nonprobability Samples | 非概率抽样 |  |

---

## **第8章：置信区间估计**
## **Chapter 8: Confidence Interval Estimation**

### **核心公式**
### **Core Formulas**

| **估计类型** | **公式** | **条件** |
|-------------|----------|----------|
| **均值的置信区间（σ已知）** | $\bar{X} \pm Z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}}$ | 总体正态分布或大样本 |
| **均值的置信区间（σ未知）** | $\bar{X} \pm t_{\alpha/2} \cdot \frac{S}{\sqrt{n}}$ | 使用t分布，自由度$n-1$ |
| **比例的置信区间** | $p \pm Z_{\alpha/2} \cdot \sqrt{\frac{p(1-p)}{n}}$ | $np \geq 5$, $n(1-p) \geq 5$ |

### **常用置信水平**
### **Common Confidence Levels**

| **置信水平** | **置信系数 (1-α)** | **Z值** | **t值 (n=30)** |
|-------------|-------------------|---------|----------------|
| 80% | 0.80 | 1.28 | 1.310 |
| 90% | 0.90 | 1.645 | 1.697 |
| 95% | 0.95 | 1.96 | 2.042 |
| 99% | 0.99 | 2.58 | 2.750 |

### **样本量确定**
### **Sample Size Determination**

| **参数** | **均值样本量公式** | **比例样本量公式** |
|----------|-------------------|-------------------|
| **公式** | $n = \left(\frac{Z_{\alpha/2} \cdot \sigma}{e}\right)^2$ | $n = \frac{(Z_{\alpha/2})^2 \cdot p(1-p)}{e^2}$ |
| **参数** | $e$：容许误差 <br> $\sigma$：标准差 | $e$：容许误差 <br> $p$：预估比例 |

---

## **第9章：假设检验基础：单样本检验**
## **Chapter 9: Fundamentals of Hypothesis Testing: One-Sample Tests**

### **假设检验基本概念**
### **Basic Concepts of Hypothesis Testing**

| **英文术语** | **中文术语** | **说明** |
|-------------|-------------|----------|
| **Null Hypothesis (H₀)** | **原假设** | 待检验的断言，包含=、≤、≥ |
| **Alternative Hypothesis (H₁)** | **备择假设** | 原假设的反面，包含≠、>、< |
| **Level of Significance (α)** | **显著性水平** | 常用0.01、0.05、0.10 |
| **Type I Error** | **第一类错误** | 拒绝正确的H₀，概率为α |
| **Type II Error** | **第二类错误** | 未拒绝错误的H₀，概率为β |
| **p-value** | **p值** | 在H₀为真的前提下，得到更极端结果的概率 |

### **检验统计量**
### **Test Statistics**

| **检验类型** | **统计量公式** | **分布** |
|-------------|---------------|----------|
| **均值检验（σ已知）** | $Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}$ | 标准正态分布 |
| **均值检验（σ未知）** | $t = \frac{\bar{X} - \mu_0}{S/\sqrt{n}}$ | t分布（自由度n-1） |
| **比例检验** | $Z = \frac{p - \pi_0}{\sqrt{\pi_0(1-\pi_0)/n}}$ | 标准正态分布 |

### **假设检验的6个步骤**
### **6 Steps of Hypothesis Testing**

1. **确定原假设H₀和备择假设H₁**
   **State H₀ and H₁**
2. **选择显著性水平α和样本量n**
   **Choose α and n**
3. **确定适当的检验统计量和抽样分布**
   **Determine test statistic and sampling distribution**
4. **确定临界值**
   **Determine critical values**
5. **收集数据并计算检验统计量**
   **Collect data and compute test statistic**
6. **做出统计决策并给出管理结论**
   **Make statistical decision and managerial conclusion**

### **决策规则**
### **Decision Rules**

| **方法** | **规则** |
|----------|----------|
| **临界值法** | 若统计量落在拒绝域，拒绝H₀ |
| **p值法** | 若p值 < α，拒绝H₀ |

---

## **🔑 期中考试重点公式汇总**
## **🔑 Midterm Exam Key Formulas Summary**

### **抽样分布**
### **Sampling Distributions**
```
样本均值：μₓ̄ = μ, σₓ̄ = σ/√n
样本比例：μₚ̂ = p, σₚ̂ = √[p(1-p)/n]
```

### **置信区间**
### **Confidence Intervals**
```
均值(σ已知)：X̄ ± Zα/2 × (σ/√n)
均值(σ未知)：X̄ ± tα/2 × (S/√n)
比例：p ± Zα/2 × √[p(1-p)/n]
```

### **假设检验**
### **Hypothesis Testing**
```
Z检验：Z = (X̄-μ₀)/(σ/√n)
t检验：t = (X̄-μ₀)/(S/√n)
比例Z检验：Z = (p-π₀)/√[π₀(1-π₀)/n]
```

---

## **📝 考试备考建议**
## **📝 Exam Preparation Tips**

1. **熟练掌握核心公式** ✅
2. **理解中心极限定理的应用条件** ✅
3. **能够区分各种抽样方法** ✅
4. **掌握置信区间的构建和解释** ✅
5. **熟悉假设检验的6个步骤** ✅
6. **理解I类和II类错误的含义** ✅
7. **能够进行p值和临界值两种决策方法** ✅

**祝考试顺利！** 🎉  
**Good luck on your exam!** 🎉

---

此整理完全基于课程文件内容，涵盖了第4-9章所有学习目标和核心公式，采用中英双语对照，便于复习和理解。