# Soal 4

# Data
data <- read.csv("/Users/alfanlukeyanrizki/Development/Probstat/Prak2_Probstat2023_C_5025211046/soal-4/GTL.csv")

# 4a: Visualisasi Data
library(ggplot2)

ggplot(data, aes(x = Glass, y = Light, color = factor(Temp))) +
  geom_point() +
  labs(x = "Jenis Kaca", y = "Keluaran Cahaya", color = "Suhu Operasi") +
  ggtitle("Pengaruh Suhu dan Jenis Kaca pada Keluaran Cahaya") +
  theme_minimal()

# 4b: Uji ANOVA Dua Arah
model <- aov(Light ~ Glass * Temp, data = data)
anova_result <- anova(model)
print(anova_result)

# 4c: Tabel Mean dan Standar Deviasi
library(doBy)
summary_table <- summaryBy(
  Light ~ Temp + Glass,
  data = data,
  FUN = function(x) c(Mean = mean(x), SD = sd(x))
)
print(summary_table)
