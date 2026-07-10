# 假设检验
hypothesis_test <- t.test(sample_scores, mu = 70, alternative = "two.sided")
cat("\n假设检验结果：\n")
print(hypothesis_test)

# 提取关键值
cat("\n关键统计量：\n")
cat("t统计量：", hypothesis_test$statistic, "\n")
cat("p值：", hypothesis_test$p.value, "\n")
cat("自由度：", hypothesis_test$parameter, "\n")
