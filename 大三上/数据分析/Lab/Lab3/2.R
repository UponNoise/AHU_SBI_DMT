# 从Class A随机抽取30个样本
set.seed(123)  # 确保结果可重现
class_a_scores <- c(66,95,87,84,88,80,88,68,78,73,53,86,88,81,78,94,77,88,67,90,
                    90,55,74,84,55,75,83,91,82,70,84,80,92,82,96,72,84,89,34,89,
                    69,89,62,71,96,80,88,77,70,64,93,83,82,94,91,72,84,84,80,82,
                    78,77,80,60,73,84,84,82,73,74,82,88,85,70,89,85,86,90,89,80,
                    75,92,82,84,91,83,71,79,87,29,82,71,80,57,88)

sample_scores <- sample(class_a_scores, 30)

# 描述性统计
cat("样本数据：\n")
print(sample_scores)
cat("\n样本均值：", mean(sample_scores), "\n")
cat("样本标准差：", sd(sample_scores), "\n")
cat("样本量：", length(sample_scores), "\n")

# 95%置信区间
conf_int_result <- t.test(sample_scores, conf.level = 0.95)
cat("\n95%置信区间结果：\n")
print(conf_int_result)
