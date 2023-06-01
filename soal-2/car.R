library(BSDA)

# Data
population_mean <- 25000
sample_size <- 100
sample_mean <- 23500
sample_sd <- 3000

# Hypothesis testing
result <- zsum.test(mean.x = sample_mean, sigma.x = sample_sd, n.x = sample_size, alternative = "greater", mu = population_mean, conf.level = 0.95)

# Conclusion based on p-value
p_value <- result$p.value

if (p_value < 0.05) {
  conclusion <- "Klaim bahwa rata-rata jarak tempuh mobil lebih dari 25.000 kilometer per tahun TIDAK dapat diterima."
} else {
  conclusion <- "Klaim bahwa rata-rata jarak tempuh mobil lebih dari 25.000 kilometer per tahun dapat diterima."
}

# Print conclusion
cat("Kesimpulan:", conclusion)
