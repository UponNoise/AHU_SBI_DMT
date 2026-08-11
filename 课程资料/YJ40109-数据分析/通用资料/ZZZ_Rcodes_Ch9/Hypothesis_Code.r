# Same sample data
data <- c(23, 28, 32, 27, 25, 30, 31, 29, 26, 24)

# Perform a one-sample t-test (the default null hypothesis is mu=0)
t_test_result <- t.test(data, conf.level = 0.95)

# Extract just the confidence interval
confidence_interval <- t_test_result$conf.int
print(confidence_interval)

# Or view the full output, which includes the CI
print(t_test_result)
