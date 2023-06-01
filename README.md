# Praktikum Probabilitas dan Statistik - Modul 2
*Estimasi Parameter, Uji Hipotesis, dan ANOVA*

# Penulis

|   Alfan Lukeyan Rizki   | 5025211046 |    Probabilitas dan statistik (C)    |
| :---------------------: | :--------: | :----------------------------------: |

## Soal 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas.

|   Responden   |     X     |     Y      |
| :-----------: | :-------: | :--------: |
|1              |78         |100         |
|2              |75         |95          |
|3              |67         |70          |
|4              |77         |90          |
|5              |70         |90          |
|6              |72         |90          |
|7              |78         |89          |
|8              |70         |100         |
|9              |77         |100         |

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.
-   Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas 
-   Carilah nilai t (p-value)
-   Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴”.

### Penyelesaian
Data yang digunakan dalam penyelesaian ini terdiri dari dua vektor, yaitu vektor x yang berisi kadar saturasi oksigen sebelum aktivitas A, dan vektor y yang berisi kadar saturasi oksigen setelah aktivitas A. Data ini diperoleh dari 9 responden.
-   Menghitung Standar Deviasi
```R
x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

selisih <- y - x 
standar_deviasi <- sd(selisih)
cat("Standar Deviasi:", standar_deviasi, "\n")
```
Pertama, kita menghitung standar deviasi dari selisih antara kadar saturasi oksigen setelah aktivitas A dengan kadar saturasi oksigen sebelum aktivitas A. Standar deviasi memberikan informasi tentang sejauh mana variasi data selisih tersebut.

Dalam potongan kode, standar deviasi dihitung menggunakan fungsi `sd()` dengan argumen `selisih`. Selisih dihitung dengan mengurangi vektor `y` dengan vektor `x`. Hasil standar deviasi kemudian dicetak menggunakan fungsi `cat()`.

- Menghitung nilai t dan p-value
```R
t_test <- t.test(x, y, paired = TRUE)
t_value <- t_test$statistic
p_value <- t_test$p.value
cat("Nilai t:", t_value, "\n")
cat("Nilai p:", p_value, "\n")
```
Langkah ini melibatkan uji t-test berpasangan untuk mengetahui apakah terdapat perbedaan yang signifikan antara kadar saturasi oksigen sebelum dan setelah melakukan aktivitas A. Nilai t-statistik dan p-value digunakan untuk mengevaluasi signifikansi statistik perbedaan tersebut.

Pada potongan kode, uji t-test berpasangan dilakukan menggunakan fungsi `t.test()` dengan argumen `x` dan `y`. Hasil uji t-test disimpan dalam variabel `t_test`. Nilai t-statistik diakses menggunakan `t_test$statistic` dan nilai `p-value` diakses menggunakan `t_test$p.value`. Kedua nilai tersebut dicetak menggunakan fungsi `cat()`.

- Uji hipotesis
```R
conf_level <- 0.95
t_test_conf <- t.test(x, y, paired = TRUE, conf.level = conf_level)
cat("Uji Hipotesis dengan Tingkat Kepercayaan", conf_level * 100, "%\n")
print(t_test_conf)
```
Terakhir, melakukan uji hipotesis dengan menggunakan tingkat kepercayaan tertentu. Uji hipotesis memberikan informasi lebih lanjut tentang perbedaan yang signifikan antara kadar saturasi oksigen sebelum dan sesudah aktivitas A, termasuk interval kepercayaan untuk estimasi perbedaan rata-rata populasi.

Dalam kode, uji hipotesis dilakukan menggunakan fungsi `t.test()` dengan argumen `x` dan `y`, serta `paired = TRUE` untuk uji t-test berpasangan. Kode juga menggunakan argumen `conf.level` untuk menentukan tingkat kepercayaan. Hasil uji hipotesis disimpan dalam variabel `t_test_conf`. Hasil tersebut dicetak menggunakan fungsi `cat()` dan `print()`.

### Output
![output-soal-1](img/Screenshot%202023-06-02%20at%2001.43.41.png)
## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer (kerjakan menggunakan library seperti referensi pada modul).
-   Apakah Anda setuju dengan klaim tersebut? Jelaskan.
-   Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

### Penyelesaian
Dalam masalah ini, kita ingin menguji klaim bahwa rata-rata jarak tempuh mobil lebih dari 25.000 kilometer per tahun. Untuk itu, kita memiliki sampel acak dari 100 pemilik mobil yang mencatat jarak yang mereka tempuh. Rata-rata dari sampel ini adalah 23.500 kilometer dengan standar deviasi 3.000 kilometer.

Untuk melakukan uji hipotesis, kita menggunakan fungsi `zsum.test()` yang tersedia dalam paket `BSDA` di R. Berikut adalah penjelasan singkat tentang setiap fungsi yang digunakan dalam kode:

-   `zsum.test()`: Fungsi ini digunakan untuk melakukan uji hipotesis `z` pada satu sampel dengan varian yang diketahui. Argumen yang diperlukan adalah `mean.x` (rata-rata sampel), `sigma.x` (standar deviasi sampel), `n.x` (ukuran sampel), `mu` (nilai hipotesis nol), dan `alternative` (hipotesis alternatif). Dalam kasus ini, kita menggunakan `alternative` = `"greater"` untuk menguji apakah rata-rata lebih besar dari nilai hipotesis `nol`.
```R
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
```

Dalam kode tersebut, kita menggunakan fungsi `zsum.test()` untuk melakukan uji hipotesis. Hasil uji hipotesis digunakan untuk menghasilkan kesimpulan berdasarkan p-value yang diperoleh. Jika `p-value lebih kecil` dari tingkat signifikansi yang ditetapkan (0.05), kita `menolak` klaim bahwa rata-rata jarak tempuh mobil lebih dari 25.000 kilometer per tahun. Jika `p-value lebih besar` atau sama dengan tingkat signifikansi, kita `menerima` klaim tersebut.

### Output
![output-soal-2](img/Screenshot%202023-06-02%20at%2002.41.13.png)
## Soal 3
Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

|   Nama Kota/Atribut   |     Bandung     |     Bali      |
| :-------------------: | :-------------: | :-----------: |
|Jumlah Saham           |20               |27             |
|Sampel Mean            |3.64             |2.79           |
|Sampel Standar Deviasi |1.67             |1.5            |


Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah:
-   H0 dan H1
-   Hitung sampel statistik
-   Lakukan uji statistik (df =2)
-   Nilai kritikal 
-   Keputusan 
-   Kesimpulan

### Penyelesaian
Dalam permasalahan ini, kita ingin menentukan apakah terdapat perbedaan pada rata-rata jumlah saham antara kota Bandung dan Bali. Asumsikan variancenya sama untuk kedua kota. Maka,

-   H0 dan H1
    -   H0 (Hipotesis Nol): Rata-rata jumlah saham di Bandung sama dengan rata-rata jumlah saham di Bali.
    -   H1 (Hipotesis Alternatif): Rata-rata jumlah saham di Bandung tidak sama dengan rata-rata jumlah saham di Bali.
-   Hitung sampel statistik menggunakan uji t
```R
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

```
-  Lakukan uji statistik (df =2)
```R
# Plotting the t-distribution
library(mosaic)
plotDist(dist = 't', df = n_bandung + n_bali - 2, col = "blue")
```
-   Nilai kritikal
```R
# Critical Values
critical_left <- qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = TRUE)
critical_right <- qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = FALSE)
```
-   Keputusan
```R
# Decision and Conclusion
p_value <- t_test$p.value
if (p_value < 0.05) {
  decision <- "Terdapat perbedaan yang signifikan antara rata-rata jumlah saham di Bandung dan Bali."
} else {
  decision <- "Tidak terdapat perbedaan yang signifikan antara rata-rata jumlah saham di Bandung dan Bali."
}

cat("\nKeputusan:", decision, "\n")
cat("Kesimpulan:")
print(t_test)
```

Berikut adalah penjelasan mengenai fungsi-fungsi yang digunakan dalam potongan kode:

| Fungsi | Penjelasan |
| --- | --- |
| `tsum.test()` | Fungsi ini digunakan untuk melakukan uji hipotesis menggunakan statistik `t-test` pada dua sampel independen dengan asumsi variancenya sama. Dalam kode tersebut, fungsi ini digunakan untuk menghitung uji statistik pada data `Bandung` dan `Bali`. |
| `library(BSDA)` | Perintah ini memuat paket BSDA yang berisi fungsi-fungsi untuk melakukan analisis statistik. Paket ini diperlukan karena fungsi `tsum.test()` digunakan. |
| `library(mosaic)` | Perintah ini memuat paket mosaic yang berisi fungsi untuk visualisasi statistik. Pada kode tersebut, paket ini digunakan untuk memplot distribusi t. |
| `plotDist(dist = 't', df = n_bandung + n_bali - 2, col = "blue")` | Fungsi ini digunakan untuk memplot distribusi t dengan derajat kebebasan (df) yang dihitung dari jumlah sampel di Bandung dan Bali. Hal ini membantu dalam memvisualisasikan distribusi t dan mengidentifikasi nilai kritis. |
| `qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = TRUE)` | Fungsi ini digunakan untuk menghitung nilai kritis (quantile) `t-distribusi` pada tingkat signifikansi `α/2`. Dalam kasus ini, digunakan untuk menghitung nilai kritis di ekor kiri. |
| `qt(p = 0.025, df = n_bandung + n_bali - 2, lower.tail = FALSE)` | Fungsi ini digunakan untuk menghitung nilai kritis (quantile) `t-distribusi` pada tingkat signifikansi `α/2`. Dalam kasus ini, digunakan untuk menghitung nilai kritis di ekor kanan. |
| `cat()` | Fungsi ini digunakan untuk mencetak (print) teks ke konsol. |
| `print()` | Fungsi ini digunakan untuk mencetak objek ke konsol. Pada kode tersebut, digunakan untuk mencetak hasil uji statistik dari `tsum.test()`. |

### Output
![output-soal-3](img/Screenshot%202023-06-02%20at%2003.12.18.png)
## Soal 4
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100 ̊C, 125 ̊C dan 150 ̊C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data pada file [GTL.csv](https://drive.google.com/file/d/1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4/view) sebagai berikut:

|   Glass   |     Temp     |     Light      |
| :-------: | :----------: | :------------: |
|A          |100           |580             |
|A          |100           |568             |
|A          |100           |570             |
|B          |100           |550             |
|B          |100           |530             |
|B          |100           |579             |
|C          |100           |546             |
|C          |100           |575             |
|C          |100           |599             |
|A          |125           |1090            |
|A          |125           |1087            |
|A          |125           |1085            |
|B          |125           |1070            |
|B          |125           |1035            |
|B          |125           |1000            |
|C          |125           |1045            |
|C          |125           |1053            |
|C          |125           |1066            |
|A          |150           |1392            |
|A          |150           |1380            |
|A          |150           |1386            |
|B          |150           |1328            |
|B          |150           |1312            |
|B          |150           |1299            |
|C          |150           |867             |
|C          |150           |904             |
|C          |150           |889             |

Dengan data tersebut:
-   Buatlah plot sederhana untuk visualisasi data.
-   Lakukan uji ANOVA dua arah.
-   Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi).

### Penyelesaian
Soal ini melibatkan data eksperimen yang bertujuan untuk mengetahui pengaruh suhu operasi (100 ̊C, 125 ̊C, dan 150 ̊C) dan tiga jenis kaca pelat muka (A, B, dan C) terhadap keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan data hasil percobaan disajikan dalam bentuk tabel.

- Visualisasi data
```R
# Data
data <- read.csv("/Users/alfanlukeyanrizki/Development/Probstat/Prak2_Probstat2023_C_5025211046/soal-4/GTL.csv")

library(ggplot2)

ggplot(data, aes(x = Glass, y = Light, color = factor(Temp))) +
  geom_point() +
  labs(x = "Jenis Kaca", y = "Keluaran Cahaya", color = "Suhu Operasi") +
  ggtitle("Pengaruh Suhu dan Jenis Kaca pada Keluaran Cahaya") +
  theme_minimal()
```
Pertama, digunakan library `ggplot2` untuk membuat visualisasi data berupa scatter plot dengan menggunakan fungsi `ggplot()`. Data dipetakan ke sumbu `x (Glass)`, sumbu `y (Light)`, dan `warna (Temp)`. Fungsi `geom_point()` digunakan untuk menampilkan titik-titik data, `labs()` untuk memberi label pada sumbu dan judul, serta `theme_minimal()` untuk mengatur tampilan grafik menjadi minimalis.

- Uji ANOVA dua arah
```R
model <- aov(Light ~ Glass * Temp, data = data)
anova_result <- anova(model)
print(anova_result)
```
Selanjutnya, digunakan fungsi `aov()` untuk melakukan uji ANOVA dua arah dengan memodelkan variabel `Light` terhadap interaksi antara variabel `Glass` dan `Temp`. Hasil uji ANOVA disimpan dalam variabel `anova_result` menggunakan fungsi `anova()`. Data diambil dari objek `data`.


- Tabel mean dan standar deviasi
```R
library(doBy)
summary_table <- summaryBy(
  Light ~ Temp + Glass,
  data = data,
  FUN = function(x) c(Mean = mean(x), SD = sd(x))
)
print(summary_table)
```
Terakhir, digunakan library `doBy` yang menyediakan fungsi `summaryBy()` untuk menghasilkan tabel yang berisi nilai mean dan standar deviasi keluaran cahaya (`Light`) untuk setiap kombinasi `Temp` dan `Glass`. Fungsi `summaryBy()` menerima argumen `Light ~ Temp + Glass` untuk menentukan variabel mana yang akan dihitung statistiknya. Hasilnya disimpan dalam variabel `summary_table` dan dicetak menggunakan fungsi `print()`.

### Output
![output-soal-4](img/Screenshot%202023-06-02%20at%2003.38.36.png)