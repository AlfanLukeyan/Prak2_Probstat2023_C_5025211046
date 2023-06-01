# Soal 1
x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# 1a. Menghitung Standar Deviasi
selisih <- y - x 
standar_deviasi <- sd(selisih)
cat("Standar Deviasi:", standar_deviasi, "\n")

# 1b. Menghitung Nilai t dan p-value
t_test <- t.test(x, y, paired = TRUE)
t_value <- t_test$statistic
p_value <- t_test$p.value
cat("Nilai t:", t_value, "\n")
cat("Nilai p:", p_value, "\n")

# 1c. Uji Hipotesis
conf_level <- 0.95
t_test_conf <- t.test(x, y, paired = TRUE, conf.level = conf_level)
cat("Uji Hipotesis dengan Tingkat Kepercayaan", conf_level * 100, "%\n")
print(t_test_conf)