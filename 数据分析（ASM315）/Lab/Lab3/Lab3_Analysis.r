# Lab 3 stuff
# just some basic R code

# clean up first
rm(list = ls())

# get data - try different ways
tryCatch({
  library(openxlsx)
  my_data <- read.xlsx("Data_Scores.xlsx", sheet = "Data")
  cat("Successfully read Excel file\n")
}, error = function(e) {
  cat("Excel read failed, using manual data\n")
  # Manual data as backup
  class_a <- c(66,95,87,84,88,80,88,68,78,73,53,86,88,81,78,94,77,88,67,90,90,55,
               74,84,55,75,83,91,82,70,84,80,92,82,96,72,84,89,34,89,69,89,62,71,
               96,80,88,77,70,64,93,83,82,94,91,72,84,84,80,82,78,77,80,60,73,84,
               84,82,73,74,82,88,85,70,89,85,86,90,89,80,75,92,82,84,91,83,71,79,
               87,29,82,71,80,57,88)
  
  # Create a dummy data frame
  my_data <- data.frame(Class.A = class_a, Class.B = NA)
})

# get class A numbers and remove empty ones
class_a <- my_data$Class.A
class_a <- class_a[!is.na(class_a)]

# make sure it's numbers
class_a <- as.numeric(class_a)
class_a <- class_a[!is.na(class_a)]

cat("Class A has", length(class_a), "numbers\n")
cat("First few numbers:", class_a[1:5], "\n\n")

# take some random samples
set.seed(123)
n <- 35
my_sample <- sample(class_a, n, replace = FALSE)

# look at my sample
cat("My sample has", n, "numbers\n")
cat("Average of my sample:", round(mean(my_sample), 2), "\n")
cat("Standard deviation of my sample:", round(sd(my_sample), 2), "\n")
cat("My sample numbers:", sort(my_sample), "\n\n")

# Part A - confidence thing
cat("=== PART A - Confidence Interval ===\n")
ci_stuff <- t.test(my_sample, conf.level = 0.95)
cat("95% confidence interval is between", 
    round(ci_stuff$conf.int[1], 2), "and", 
    round(ci_stuff$conf.int[2], 2), "\n\n")

# Part B - hypothesis test
cat("=== PART B - Hypothesis Test ===\n")
test_stuff <- t.test(my_sample, mu = 70, alternative = "two.sided")
cat("t-statistic =", round(test_stuff$statistic, 4), "\n")
cat("p-value =", round(test_stuff$p.value, 4), "\n")
cat("degrees of freedom =", test_stuff$parameter, "\n\n")

# answers to questions
cat("=== ANSWERS TO QUESTIONS ===\n\n")

cat("1. Sample size and sampling method:\n")
cat("   I used n =", n, "because it's large enough for Central Limit Theorem.\n")
cat("   Used simple random sampling - each student has equal chance to be selected.\n\n")

cat("2. Confidence interval interpretation:\n")
cat("   We are 95% confident that the true population mean is between", 
    round(ci_stuff$conf.int[1], 2), "and", round(ci_stuff$conf.int[2], 2), "\n\n")

cat("3. Six-step hypothesis testing procedure:\n")
cat("   Step 1: H0: μ = 70, H1: μ ≠ 70\n")
cat("   Step 2: α = 0.05\n")
cat("   Step 3: Test statistic: t =", round(test_stuff$statistic, 4), "\n")
cat("   Step 4: p-value =", round(test_stuff$p.value, 4), "\n")
cat("   Step 5: Decision rule: Reject H0 if p-value < 0.05\n")
cat("   Step 6: Conclusion: ")
if(test_stuff$p.value < 0.05) {
  cat("Reject H0 - There is evidence that mean is not 70\n\n")
} else {
  cat("Do not reject H0 - No evidence that mean differs from 70\n\n")
}

cat("4. P-value interpretation:\n")
cat("   p-value =", round(test_stuff$p.value, 4), "\n")
cat("   This means if the true mean was really 70, the probability of getting\n")
cat("   a sample like ours is", round(test_stuff$p.value * 100, 2), "%\n")
cat("   Since p-value is", ifelse(test_stuff$p.value < 0.05, "less", "greater"), 
    "than 0.05, we", ifelse(test_stuff$p.value < 0.05, "reject", "do not reject"), "H0\n\n")

cat("5. Effect of larger sample size:\n")
cat("   If sample size doubles, the confidence interval becomes narrower\n")
cat("   because we have more information about the population.\n\n")

cat("6. t-distribution vs z-distribution:\n")
cat("   We use t-distribution when population standard deviation is unknown\n")
cat("   and we have to estimate it from the sample (which is our case).\n")
cat("   We use z-distribution when population standard deviation is known.\n\n")

# Try to make a simple plot
cat("=== BONUS: Making a histogram ===\n")
try({
  hist(my_sample, main = paste("Sample of", n, "Scores"), 
       xlab = "Exam Scores", col = "lightblue")
  cat("Histogram created successfully!\n")
})

# save results
cat("\n=== SAVING RESULTS ===\n")
sink("lab3_results.txt")
cat("Lab 3 Results\n")
cat("=============\n")
cat("Sample mean:", round(mean(my_sample), 2), "\n")
cat("Sample SD:", round(sd(my_sample), 2), "\n")
cat("95% CI: [", round(ci_stuff$conf.int[1], 2), ",", round(ci_stuff$conf.int[2], 2), "]\n")
cat("t-statistic:", round(test_stuff$statistic, 4), "\n")
cat("p-value:", round(test_stuff$p.value, 4), "\n")
sink()

cat("All done! Results saved to lab3_results.txt\n")
cat("Copy the output above to your PDF report.\n")

