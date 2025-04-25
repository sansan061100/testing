-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2022 at 04:14 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `burung_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan`
--

CREATE TABLE `aturan` (
  `kode_aturan` varchar(11) NOT NULL,
  `jika` varchar(15) NOT NULL,
  `maka` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aturan`
--

INSERT INTO `aturan` (`kode_aturan`, `jika`, `maka`) VALUES
('A01', 'G01ANDG02ANDG03', 'P01'),
('A02', 'G01ANDG03ANDG02', 'P01'),
('A03', 'G02ANDG01ANDG03', 'P01'),
('A04', 'G02ANDG03ANDG01', 'P01'),
('A05', 'G03ANDG01ANDG02', 'P01'),
('A06', 'G03ANDG02ANDG01', 'P01'),
('A07', 'G04ANDG05ANDG06', 'P02'),
('A08', 'G04ANDG06ANDG05', 'P02'),
('A09', 'G05ANDG04ANDG06', 'P02'),
('A10', 'G05ANDG06ANDG04', 'P02'),
('A11', 'G06ANDG05ANDG04', 'P02'),
('A12', 'G06ANDG04ANDG05', 'P02'),
('A13', 'G07AnDG08ANDG09', 'P03'),
('A14', 'G07ANDG09ANDG08', 'P03'),
('A15', 'G08ANDG07ANDG09', 'P03'),
('A16', 'G08ANDG09ANDG07', 'P03'),
('A17', 'G09ANDG08ANDG07', 'P03'),
('A18', 'G09ANDG07ANDG08', 'P03'),
('A19', 'G02ANDG10ANDG11', 'P04'),
('A20', 'G02ANDG11ANDG10', 'P04'),
('A21', 'G10ANDG02ANDG11', 'P04'),
('A22', 'G10ANDG11ANDG02', 'P04'),
('A23', 'G11ANDG10ANDG02', 'P04'),
('A24', 'G11ANDG02ANDG10', 'P04'),
('A25', 'G12ANDG13', 'P05'),
('A26', 'G13ANDG12', 'P05'),
('A27', 'G14ANDG15', 'P06'),
('A28', 'G15ANDG14', 'P06'),
('A29', 'G16ANDG17', 'P07'),
('A30', 'G17ANDG16', 'P07');

-- --------------------------------------------------------

--
-- Table structure for table `basis_pengetahuan`
--

CREATE TABLE `basis_pengetahuan` (
  `kode_pengetahuan` varchar(11) NOT NULL,
  `penyakit` varchar(500) NOT NULL,
  `gejala` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basis_pengetahuan`
--

INSERT INTO `basis_pengetahuan` (`kode_pengetahuan`, `penyakit`, `gejala`) VALUES
('B01', '[p01] sinusitis', '[g01] sekret hidung akut atau kronis [g02] Hidung tersumbat, pernapasan mulut terbuka, [g03] Distensi lubang hidung iritasi pada nares'),
('B02', '[p02] rinitis', '[g04] hidung dan mata mengeluarkan cairan[g05] bersin terus-menerus, [g06] menggosok kepala dan hidung terus-menerus'),
('B03', '[p03] trakeitis', '[g07] sesak napas akut [g08] sayap terkulai dan ekor yang terombang ambing [g09]pernapasan dapat disertai dengan suara mengi dengan ronki yang terdengar dari jarak yang cukup jauh'),
('B04', '[p04] pneumonia', '[g02] hidung tersumbat, pernapasan mulut terbuka [g10] Keluarnya cairan mukopurulen dari daerah hidung atau mata[g11] perubahan suara yang tiba-tiba'),
('B05', '[p05] osteitis dan osteomielitis', '[g12] gaya berjalan dengan postur yang menyakitkan[g13] tidak dapat bergerak atau terbang dengan kepincangan'),
('B06', '[p06] bulu kista', '[g14] infeksi pada titik bulu yang baru tumbuh[g15] pembengkakan pada daerah bulu yang baru tumbuh'),
('B07', '[p07] mutilasi diri', '[g16] burung sangat gatal , merusak bagian tubuh mereka sendiri secara berulang[g17] mengunyah bulu, menggigit badan secara berulang');

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `kode_gejala` varchar(11) NOT NULL,
  `nama_gejala` varchar(200) NOT NULL,
  `pertanyaan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `pertanyaan`) VALUES
('G01', 'Sekret hidung akut atau kronis', 'Apakah burung mengalami sekret hidung akut atau kronis?'),
('G02', 'Hidung tersumbat, pernapasan mulut terbuka', 'Apakah hidung burung tersumbat dan pernapasan terbuka?'),
('G03', 'Distensi lubang hidung iritasi pada nares', 'Apakah terdapat iritasi pada lubang hidung ?'),
('G04', 'Hidung dan mata mengeluarkan cairan', 'Apakah hidung dan mata pada burung mengeluarkan cairan?'),
('G05', 'Bersin terus-menerus', 'Apakah burung mengalami bersin secara terus-menerus?'),
('G06', 'Menggosok kepala dan hidung terus-menerus', 'Apakah burung selalu menggosokan kepala dan hidung secara terus-menerus?'),
('G07', 'Sesak napas akut', 'Apakah burung mengalami sesak napas akut?'),
('G08', 'Sayap terkulai dan ekor yang terombang ambing', 'Apakah sayap terkulai dan ekor burung terombang ambing ?'),
('G09', 'Pernapasan dapat disertai dengan suara mengi dengan ronki yang terdengar dari jarak yang cukup jauh', 'Apakah ketika burung bernapas mengeluarkan sura mengi dengan ronki?'),
('G10', 'Keluarnya cairan mukopurulen dari daerah hidung atau mata', 'Apakah pernah keluar cairan mukopurulen dari daerah hidung atau mata ?'),
('G11', 'Perubahan suara yang tiba-tiba', 'Apakah suara burung mengalami perubahan secara tiba-tiba ?'),
('G12', 'Gaya berjalan dengan postur yang menyakitkan', 'Apakah burung mengalami gaya berjalan dengan postur yang menyakitkan?'),
('G13', 'Tidak dapat bergerak atau terbang dengan kepincangan', 'Apakah burung dapat bergerak atau terbangan dengan kepincangan?'),
('G14', 'Infeksi pada titik bulu yang baru tumbuh', 'Apakah terdapat infeksi pada titik bulu yang baru tumbuh ?'),
('G15', 'Pembengkakan pada daerah bulu yang baru tumbuh', 'Apakah burung mengalami pembengkakan pada daerah bulu yang baru tumbuh ?'),
('G16', 'Burung sangat gatal , merusak bagian tubuh mereka sendiri secara berulang', 'Apakah burung sering merusak bagian tubuh secara berulang ?'),
('G17', 'Mengunyah bulu, menggigit badan secara berulang', 'Apakah burung sering menguyang bulu atau menggigit badan secara berulang ?');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `kode_kontak` varchar(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `subject` varchar(65) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kode_penyakit` varchar(11) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `deskripsi_penyakit` varchar(2000) NOT NULL,
  `solusi` varchar(2000) NOT NULL,
  `sumber` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`kode_penyakit`, `nama_penyakit`, `deskripsi_penyakit`, `solusi`, `sumber`) VALUES
('P01', 'Sinusitis', 'Sinusitis merupakan konsisi ketika rongga hidung terinfeksi, bengkak, dan meradang. Kondisi ini bisa menyebabkan penumpukkan cairan di rongga sinus yang menjadi tempat berkembangnya bakteri. Sinusitis bisa disebabkan infeksi virus ataupun infeksi bakteri.', 'Pertama sinus yang tersumbat harus dibilas dengan saline hangat untuk membersihkan sumbatan. Pengenceran asetilsistein mungkin merupakan pilihan lain yang dapat secara efektif menghilangkan lendir yang mengental karena sifat mukolitiknya. Jika penyumbatan cukup parah, debridement bedah dan drainase mungkin diperlukan. Meskipun efektif , kehati-hatian harus diambil untuk menghindari cedera pada saraf hidung atau mata. Tetes hidung yang mengandung sorbitol dan beta adrenergic blocker seperti xylometazoline/oxymetazoline hydrochloride dan semprotan hidung dengan fl uticasone propionate adalah alternatif yang baik untuk memberikan bantuan kepada burung yang terkena - seperti yang kami alami secara klinis. Jika dalam peradangan parah cukup lokal aplikasi dari NSAID dan kering panas hasutan adalah berguna. Antibiotik oral atau parenteral seperti amoksisilin dan flu urokuinon adalah pilihan yang baik. Namun, konfirmasi sebelumnya dengan uji sensitivitas antibiotik lebih baik sebelum inisiasi terapi.', 'Pakar Konservasi Nusa Manuk'),
('P02', 'Rinitis', 'Seperti hewan dan burung lainnya, rinitis sangat umum terjadi pada burung peliharaan. Sebagian besar rinitis atau rinotrakeitis dapat terjadi karena asal alergi setelah iritasi yang disebabkan oleh patogen infeksius, debu, dan gas. Hipertrofi ceres, perkembangan rhinolith dan infeksi Knemidocoptes dapat menyebabkan perkembangan rinitis. Secara umum, rinitis paling banyak terdeteksi di antara burung beo, kakatua, dan burung budgerigar.', 'Rhinitis sederhana sering membaik dengan obat anti alergi oral seperti chlorpheniramine maleate dan setirizin hidroklorida. Vitamin C adalah terapi tambahan yang baik yang digunakan oleh banyak dokter hewan ke mengurangi menekankan dan meningkatkan kekebalan', 'Pakar Konservasi Nusa Manuk'),
('P03', 'Trakeitis', 'Trakeitis terlihat pada merpati, burung beo, kakatua dan cockatiel. Infeksi bakteri seperti Pseudomonas aeruginosa, E. coli, K. pneumonia sangat umum terjadi. Lainnya dari infeksi bakteri berbagai virus (herpesvirus, ILT, paramyxovirus, adenovirus dan cytomegalovirus) parasit ( Sternastoma tracheacolum , Trichomonas gallinae atau Syngamus trachea ) dan jamur ( Mucor dan Aspergillus ) infeksi dilaporkan sebelumnya. Penempatan benda asing di trakea seperti yang terjadi pada cockatiel dengan millet, atau merpati dan burung beo dengan dedak padi atau biji gram dapat menyebabkan trakeitis parah atau obstruksi trakea dengan infeksi sekunder', 'Kateterisasi jalan napas adalah satu-satunya pilihan untuk membebaskan unggas yang mengalami obstruksi trakea/trakea kompresi/stenosis. Bedah pemindahan atau debridemen mungkin berguna untuk koreksi pembentukan membran kaseosa atau difteri, penempatan benda asing atau pembentukan granuloma', 'Pakar Konservasi Nusa Manuk'),
('P04', 'Pneumonia', 'Pneumonia sebagian besar berkembang dari bakteri ( K. pneumonia, E. coli dan P. multocida , Mycobacterium dan Mycoplasma ) virus (paramyxovirus, herpesvirus, avian in flu uenza ), jamur (Mucor,Aspergillus, Cryptococcus) atau parasit ( Cryptosporidium spp., Toxoplasma spp.,\nInfeksi Sternastoma spp., Sarcocystis spp., Atoxoplasma spp).\n', 'Ivermectin dan moxidection direkomendasikan untuk pengobatan. Aplikasi intradermal ivermectin biasanya diberikan tiga kali dalam interval mingguan', 'Pakar Konservasi Nusa Manuk'),
('P05', 'Osteitis dan Osteomielitis', 'Berkenaan dengan sungsum rongga adalah dikenal sebagai osteomielitis. Ini adalah kondisi kronis yang ditandai dengan nekrosis dan penghancuran tulang, pengangkatannya dan penggantian selanjutnya dengan yang baru tulang.', 'Sebelum inisiasi dari terapi sebuah budaya kepekaan uji harus menjadi dilakukan ke tentukan optimal antimikroba terapi. SEBUAH nomor dari antibiotik adalah efektif tergantung pada jenis organisme infektif seperti gentamisin, neomisin, ceftiofur, lincomycin, tobramycin dan cefalothin. Biomaterial yang dilapisi antibiotik seperti manik-manik polimetil metakrilat harus ditempatkan untuk mendapatkan antibiotik yang efektif dan konsentrasi tinggi setelah koreksi bedah dan debridemen tulang dan jaringan yang terkena. sistemik antibiotika terapi Sebaiknya menjadi lanjutan untuk pada paling sedikit 2 – 3 bulan', 'Pakar Konservasi Nusa Manuk'),
('P06', 'Bulu Kista', 'Perkembangan kista bulu adalah masalah umum pada burung peliharaan. Hal ini umumnya terdeteksi di macaw, kenari dan burung beo. Kista bulu biasanya berkembang dalam perjalanan generasi bulu baru. Kista biasanya menyakitkan dan menghalangi tumbuhnya bulu baru\r\n', 'Aplikasi topikal antibiotik dan pencucian berkala dengan antiseptik dianjurkan untuk mengurangi rasa sakit, infeksi dan pruritus. Aplikasi yodium tingtur 5% yang sering bersama dengan larutan neomisin dan tolnaftat membantu untuk memeriksa infeksi.', 'Pakar Konservasi Nusa Manuk'),
('P07', 'Mutilasi Diri', 'Pada cockatiel, mutilasi diri seperti itu sangat umum sebagai akibat dari infeksi protozoa usus seperti giardiasis. Infeksi semacam itu sering menyebabkan defisiensi vitamin E dan selenium dan enteropati kehilangan protein. Hal ini menyebabkan serpihan kering dan bulu yang buruk sering menggoda burung untuk melukai diri sendiri.', 'Faktor stres harus diminimalkan dengan memberikan ruang lingkup untuk tidur nyenyak, latihan fisik yang baik.', 'Pakar Konservasi Nusa Manuk');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `no_telepon` varchar(12) NOT NULL,
  `role` varchar(10) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `no_telepon`, `role`, `username`, `password`) VALUES
('SPK001', 'Super User', 'Jalan merkurius', '2445', 'user', 'superuser', 'superuser'),
('SPK002', 'Super Admin', 'Sillicon Valey ', '123123123123', 'admin', 'superadmin', 'superadmin'),
('SPK003', 'Aji Santoso', 'Jalan jalan terus', '018456498458', 'user', 'Superuser2', 'Superuser2'),
('SPK004', 'Coba', 'Jakarta', '085861085294', 'user', 'superadmin', '12345'),
('SPK005', 'contoh', 'jakarta', '0858', 'user', 'angga', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan`
--
ALTER TABLE `aturan`
  ADD PRIMARY KEY (`kode_aturan`);

--
-- Indexes for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD PRIMARY KEY (`kode_pengetahuan`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`kode_kontak`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kode_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
