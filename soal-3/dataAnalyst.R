# Soal 3

# Data
n_bandung <- 20
n_bali <- 27
mean_bandung <- 3.64
mean_bali <- 2.79
sd_bandung <- 1.67
sd_bali <- 1.5

# Hypothesis Testing
library(BSDA)
t_test <- tsum.test(
  mean.x = mean_bandung, mean.y = mean_bali,
  n.x = n_bandung, n.y = n_bali,
  s.x = sd_bandung, s.y = sd_bali,
  alternative = "two.sided",
  var.equal = TRUE,
  conf.level = 0.95
)

# Plotting the t-distribution
library(mosaic)
plotDist(dist = 't', df = n_bandung + n_bali - 2, col = "blue")

# Critical Values
critical_left <- qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = TRUE)
critical_right <- qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = FALSE)

# Decision and Conclusion
p_value <- t_test$p.value
if (p_value < 0.05) {
  decision <- "Terdapat perbedaan yang signifikan antara rata-rata jumlah saham di Bandung dan Bali."
} else {
  decision <- "Tidak terdapat perbedaan yang signifikan antara rata-rata jumlah saham di Bandung dan Bali."
}

cat("H0: Rata-rata jumlah saham di Bandung sama dengan rata-rata jumlah saham di Bali\n")
cat("H1: Rata-rata jumlah saham di Bandung berbeda dengan rata-rata jumlah saham di Bali\n\n")

cat("Hitung Sampel Statistik:\n")
print(t_test)

cat("\nNilai Kritis Kiri:", critical_left, "\n")
cat("Nilai Kritis Kanan:", critical_right, "\n")

cat("\nKeputusan:", decision, "\n")
cat("Kesimpulan:")
print(t_test)
