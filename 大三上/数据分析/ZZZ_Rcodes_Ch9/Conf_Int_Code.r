# Sample data
data <- c(23, 28, 32, 27, 25, 30, 31, 29, 26, 24)

# Calculate necessary statistics
n <- length(data)
sample_mean <- mean(data)
sample_sd <- sd(data)
confidence_level <- 0.95

# Calculate the standard error of the mean
se <- sample_sd / sqrt(n)

# Find the critical t-value (for a two-tailed test)
t_critical <- qt((1 - confidence_level) / 2, df = n-1, lower.tail = FALSE)

# Calculate the margin of error
margin_of_error <- t_critical * se

# Construct the confidence interval
ci_lower <- sample_mean - margin_of_error
ci_upper <- sample_mean + margin_of_error

# Print the results
print(paste("Sample Mean:", round(sample_mean, 2)))
print(paste(confidence_level * 100, "% Confidence Interval: [", 
            round(ci_lower, 2), ",", round(ci_upper, 2), "]"))