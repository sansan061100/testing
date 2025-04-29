-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2025 at 06:13 AM
-- Server version: 11.6.2-MariaDB
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penyakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan`
--

CREATE TABLE `aturan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jika` varchar(255) NOT NULL,
  `maka` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basis_pengetahuan`
--

CREATE TABLE `basis_pengetahuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penyakit_id` bigint(20) UNSIGNED NOT NULL,
  `gejala_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`gejala_id`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basis_pengetahuan`
--

INSERT INTO `basis_pengetahuan` (`id`, `penyakit_id`, `gejala_id`, `created_at`, `updated_at`) VALUES
(1, 2, '[\"1\",\"2\",\"3\"]', '2025-04-12 00:45:24', '2025-04-12 00:45:24'),
(2, 3, '[\"4\",\"6\",\"5\"]', '2025-04-12 02:09:18', '2025-04-12 02:09:18'),
(3, 4, '[\"7\",\"8\",\"3\"]', '2025-04-13 02:57:54', '2025-04-13 02:57:54'),
(4, 5, '[\"9\",\"10\",\"11\"]', '2025-04-13 02:58:32', '2025-04-13 02:58:32'),
(5, 6, '[\"12\",\"13\",\"14\"]', '2025-04-13 02:59:17', '2025-04-13 02:59:17'),
(6, 7, '[\"15\",\"16\",\"4\"]', '2025-04-13 02:59:57', '2025-04-13 02:59:57'),
(7, 8, '[\"17\",\"18\",\"11\"]', '2025-04-13 03:00:34', '2025-04-13 03:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1744529638),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1744529637;', 1744529637),
('livewire-rate-limiter:aa06738065c8c75f373f21df9dcb0a68206bf5d9', 'i:2;', 1744538820),
('livewire-rate-limiter:aa06738065c8c75f373f21df9dcb0a68206bf5d9:timer', 'i:1744538819;', 1744538819),
('livewire-rate-limiter:bd45a4fbaa0f33a445cde5097ab3203201be132e', 'i:1;', 1745559110),
('livewire-rate-limiter:bd45a4fbaa0f33a445cde5097ab3203201be132e:timer', 'i:1745559110;', 1745559110);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama_gejala` varchar(255) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `kode`, `nama_gejala`, `pertanyaan`, `created_at`, `updated_at`) VALUES
(1, 'SPK-001', 'Sekret hidung atau Lendir', 'Apakah burung mengalami sekret hidung atau lendir ?', '2025-04-12 00:33:13', '2025-04-24 20:48:00'),
(2, 'SPK-002', 'Mata Berair dan Bengkak', 'apakah mata pada burung berair dan bengkak ?', '2025-04-12 00:40:52', '2025-04-24 20:48:00'),
(3, 'SPK-003', ' iritasi pada lubang hidung ', 'Apakah terdapat iritasi pada lubang hidung ?', '2025-04-12 00:41:06', '2025-04-24 20:48:00'),
(4, 'SPK-004', 'Penurunan Nafsu Makan', 'apakah burung tidak nafsu makan ?', '2025-04-12 01:49:40', '2025-04-24 20:48:00'),
(5, 'SPK-005', 'Perut Kembung atau Pembengkakan', 'apakah burung mengalami pembengkakan pada bagian perut ?', '2025-04-12 02:08:56', '2025-04-24 20:48:00'),
(6, 'SPK-006', 'Keterlambatan Bertelur', 'apakah burung tidak dapat mengeluarkan telur meskipun telah memasuki periode bertelur ?', '2025-04-12 02:09:01', '2025-04-24 20:48:00'),
(7, 'SPK-007', 'Kejang-kejang', 'apakah burung mengalami kejang-kejang', '2025-04-13 00:55:44', '2025-04-24 20:48:00'),
(8, 'SPK-008', 'kepala terkulai dan sering di putar-putar', 'apakah burung sering memutar kepala ?', '2025-04-13 00:59:13', '2025-04-24 20:48:00'),
(9, 'SPK-009', 'Fases berwarna putih ', 'apakah kotoran burung berwarna putih ?', '2025-04-13 02:43:28', '2025-04-24 20:48:00'),
(10, 'SPK-010', 'gangguan pencernaan', 'apakah burung  mengalami pencernaan yang buruk ?', '2025-04-13 02:46:04', '2025-04-24 20:48:00'),
(11, 'SPK-011', 'lesu dan tidak aktif', 'apakah burung tidak aktif dan lesu ?', '2025-04-13 02:47:02', '2025-04-24 20:48:00'),
(12, 'SPK-012', 'Rontok pada bulu dan tidak merata', 'apakah burung mengalami kerontokan yang tidak merata ?', '2025-04-13 02:48:22', '2025-04-24 20:48:00'),
(13, 'SPK-013', 'serng menggaruk tubuh', 'apakah burung sering menggaruk bagian tubuh ?', '2025-04-13 02:49:35', '2025-04-24 20:48:00'),
(14, 'SPK-014', 'kulit berwarna merah dan terdapat luka', 'apakah kulit burung mengalami luka dan berwarna merah ?', '2025-04-13 02:51:28', '2025-04-24 20:48:00'),
(15, 'SPK-015', 'tulang dada menonjol tajam', 'apakah tulang dada pada burung menonjol tajam ?', '2025-04-13 02:52:33', '2025-04-24 20:48:00'),
(16, 'SPK-016', 'penurunan berat badan', 'apakah burung mengalami penurunan berat badan ?', '2025-04-13 02:53:17', '2025-04-24 20:48:00'),
(17, 'SPK-017', 'pembengkakan pada kaki', 'apakah burung mengalami bengkak pada kaki', '2025-04-13 02:54:26', '2025-04-24 20:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_diagnosa`
--

CREATE TABLE `hasil_diagnosa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `basis_pengetahuan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasil_diagnosa`
--

INSERT INTO `hasil_diagnosa` (`id`, `user_id`, `basis_pengetahuan_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-12 02:27:33', '2025-04-12 02:27:33'),
(2, 2, 1, '2025-04-12 04:30:00', '2025-04-12 04:30:00'),
(3, 7, 6, '2025-04-13 03:09:34', '2025-04-13 03:09:34'),
(4, 8, 1, '2025-04-24 22:33:07', '2025-04-24 22:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`id`, `nama`, `email`, `subject`, `created_at`, `updated_at`) VALUES
(2, 'tes', 'test@gmail.com', 'admin', '2025-04-24 22:29:15', '2025-04-24 22:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_12_070515_create_kontak_table', 1),
(5, '2025_04_12_070520_create_gejala_table', 1),
(6, '2025_04_12_070525_create_aturan_table', 1),
(7, '2025_04_12_070531_create_penyakit_table', 1),
(8, '2025_04_12_070539_create_basis_pengetahuan_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama_penyakit` varchar(255) NOT NULL,
  `deskripsi_penyakit` text NOT NULL,
  `solusi` text NOT NULL,
  `sumber` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `kode`, `nama_penyakit`, `deskripsi_penyakit`, `solusi`, `sumber`, `foto`, `created_at`, `updated_at`) VALUES
(2, 'P-001', 'Snot', 'Penyakit snot pada burung paruh bengkok (seperti lovebird, nuri, kakatua, dll.) adalah istilah umum yang sering digunakan untuk menggambarkan infeksi pada saluran pernapasan atas, khususnya yang menyebabkan keluarnya lendir atau ingus dari hidung (nostril). Dalam dunia medis veteriner, snot sering kali merujuk pada infeksi bakteri Chlamydia psittaci, yang menyebabkan penyakit psittacosis atau parrot fever, tetapi bisa juga disebabkan oleh bakteri lain seperti Mycoplasma atau Pasteurella', 'Untuk mengatasi penyakit snot pada burung paruh bengkok, langkah pertama yang perlu dilakukan adalah mengisolasi burung yang sakit dari burung lainnya. Isolasi ini penting untuk mencegah penularan, karena snot merupakan penyakit yang sangat mudah menyebar melalui udara, percikan lendir, atau peralatan makan dan minum yang terkontaminasi. Tempatkan burung yang sakit di kandang khusus dengan sirkulasi udara yang baik, hangat, dan jauh dari stresor seperti suara keras atau keramaian.', 'https://www.youtube.com/', '01JRPWH4DHVSN13X0NF0RA9P00.jpeg', '2025-04-12 00:41:27', '2025-04-12 23:14:01'),
(3, 'P-002', '`Egg biding', 'Egg binding adalah kondisi medis pada burung betina di mana telur terjebak di saluran reproduksi dan tidak bisa dikeluarkan secara normal. Kondisi ini sering dianggap sebagai keadaan darurat, karena jika tidak ditangani, dapat menyebabkan komplikasi serius, bahkan kematian pada burung. ', 'pemberian suplemen kalsium sangat penting karena kekurangan kalsium sering menjadi penyebab utama egg binding. Kalsium membantu kontraksi otot yang diperlukan untuk mengeluarkan telur', 'pakar', '01JRPYFRKV04JVEVVTDP2ENQ8Y.jpeg', '2025-04-12 02:08:33', '2025-04-12 23:48:13'),
(4, 'P-003', 'Tetelo', 'Tetelo, atau dikenal secara medis sebagai Newcastle Disease (ND), adalah penyakit viral yang sangat menular pada burung, termasuk burung peliharaan seperti Lovebird, kenari, atau ayam. Penyakit ini disebabkan oleh virus dari keluarga Paramyxoviridae (genus Avulavirus), yang menyerang sistem pernapasan, saraf, dan pencernaan burung. ', 'Perawatan suportif diberikan untuk memperkuat daya tahan tubuh burung, seperti pemberian vitamin, elektrolit, dan makanan yang mudah dicerna. Selain itu, pemberian ramuan herbal seperti jahe, kunyit, dan madu sering digunakan untuk membantu mempercepat pemulihan.\n\nLangkah paling penting dalam pencegahan tetelo adalah vaksinasi rutin. Vaksin diberikan sejak dini dan diulang sesuai jadwal untuk melindungi burung dari infeksi. Kebersihan kandang, sanitasi peralatan, dan pembatasan kontak dengan burung liar juga sangat penting untuk mencegah penyebaran virus. Jika terjadi kematian, bangkai burung harus segera dikubur atau dibakar untuk mencegah wabah lebih luas.', 'pakar', '01JRPZ7T7SWBG89HJD1K98SWV7.jpeg', '2025-04-13 00:01:21', '2025-04-13 00:01:21'),
(5, 'P-004', 'Berak kapur', 'Berak kapur adalah istilah yang digunakan untuk menggambarkan penyakit pada burung yang ditandai dengan kotoran berwarna putih seperti kapur. Dalam dunia peternakan unggas, penyakit ini biasanya mengacu pada Pullorum Disease, yang disebabkan oleh bakteri Salmonella pullorum. ', 'Pengobatan utama menggunakan antibiotik spektrum luas seperti streptomycin, sulfonamid, atau furazolidone, yang diberikan sesuai dosis dan petunjuk dokter hewan. Selain antibiotik, burung juga diberi vitamin dan elektrolit untuk mendukung daya tahan tubuh dan mencegah dehidrasi.\n\nPenting juga untuk membersihkan kotoran yang menempel di dubur agar tidak menyumbat saluran pembuangan. Kandang harus dibersihkan secara menyeluruh dan didesinfeksi secara rutin. Untuk mencegah berak kapur ke depannya, diperlukan kebersihan kandang yang ketat, pakan dan air minum yang higienis, serta manajemen penetasan telur yang baik, karena bakteri ini bisa ditularkan dari indukan ke telur.', 'pakar', '01JRPZMMSTMGBSY77AS6K1RS3M.jpeg', '2025-04-13 00:08:22', '2025-04-13 00:08:22'),
(6, 'P-005', 'cabut bulu', 'Perilaku mencabuti bulu sendiri (feather plucking) pada burung paruh bengkok seperti lovebird, parkit, kakaktua, atau nuri merupakan tanda adanya gangguan, baik secara fisik maupun psikologis. Ini bukan sekadar masalah estetika, tapi gejala serius yang membutuhkan perhatian menyeluruh.', 'asupan nutrisi harus diperbaiki. Pakan yang seimbang dengan kandungan vitamin, mineral, dan protein sangat penting untuk kesehatan bulu dan kulit. Sayuran hijau, buah-buahan, dan biji-bijian berkualitas tinggi harus menjadi bagian dari menu hariannya.\n\nBurung yang mencabuti bulu juga harus diperiksa oleh dokter hewan untuk menyingkirkan kemungkinan adanya infeksi kulit, parasit seperti tungau, atau gangguan hormonal. Jika ditemukan penyebab medis, pengobatan yang sesuai akan diberikan.\n\nDalam beberapa kasus, penggunaan kerah pelindung leher (neck collar) bisa diterapkan untuk mencegah burung terus mencabuti bulunya, terutama saat proses penyembuhan berlangsung', 'pakar', '01JRQ044M1AN4KM1W1371N4JMX.jpeg', '2025-04-13 00:16:49', '2025-04-13 00:16:49'),
(7, 'P-005', 'nyilet', 'Nyilet adalah kondisi di mana burung Lovebird menjadi sangat kurus hingga tulang dadanya menonjol dan terasa seperti bilah pisau. Ini adalah tanda bahwa burung sedang mengalami masalah kesehatan serius. Jika tidak ditangani segera, kondisi ini dapat berujung pada kematian.\nPenyebab Nyilet pada Lovebird, malnutrisi, pakan yang tidak sesuai atau kekurangan gizi, terutama protein, vitamin, dan mineral, Infeksi cacing seperti cacing gelang atau cacing pita yang menyerap nutrisi dari tubuh burung, Infeksi bakteri, virus, atau jamur, seperti, Candidiasis (infeksi jamur pada saluran pencernaan), gangguan Pencernaan seperti pada kasus megabacteria atau gangguan hati ', 'meningkatkan asupan nutrisi dengan memberikan pakan yang lebih bervariasi dan kaya gizi, termasuk biji-bijian berkualitas, buah-buahan, sayuran segar, serta suplemen vitamin dan mineral. Burung juga perlu diberi multivitamin dan elektrolit untuk memperkuat sistem imunnya.\n\nJika penyebabnya adalah infeksi cacing atau parasit, maka perlu diberikan obat cacing khusus burung sesuai dosis. Bila ditemukan gejala seperti mencret atau muntah, kemungkinan ada infeksi bakteri atau jamur di pencernaan, sehingga dibutuhkan antibiotik ringan yang aman untuk burung, dengan pengawasan.', 'pakar', '01JRQ0HSV10VNBGB3WKJ5B7T58.jpeg', '2025-04-13 00:24:17', '2025-04-13 00:24:17'),
(8, 'P-006', 'Bubul', 'Penyakit bubul, yang dalam istilah medis disebut bumblefoot, adalah suatu kondisi yang ditandai dengan peradangan atau infeksi pada telapak kaki burung. Kondisi ini sering dijumpai pada burung peliharaan, seperti lovebird, yang berada dalam lingkungan yang tidak mendukung kesehatan kaki mereka. Penyakit ini dapat mengakibatkan gangguan dalam pergerakan dan menimbulkan rasa sakit yang cukup parah bagi burung yang terinfeksi', 'mengisolasi burung yang sakit dari burung lain untuk mencegah penularan infeksi. Setelah itu, luka atau benjolan yang terinfeksi harus dibersihkan menggunakan antiseptik yang lembut seperti larutan saline atau betadine. Ini penting untuk mengurangi kemungkinan infeksi lebih lanjut dan mencegah penyebaran nanah.\n\nJika nanah sudah terbentuk, pengobatan lebih lanjut bisa mencakup drainase untuk mengeluarkan nanah, namun prosedur ini sebaiknya dilakukan oleh dokter hewan untuk memastikan keamanan dan efektivitasnya.\n\nSelanjutnya, pemberian antibiotik sangat diperlukan untuk melawan infeksi bakteri. Dokter hewan mungkin meresepkan antibiotik seperti amoksisilin atau enrofloxacin, yang dapat diberikan melalui air minum atau suntikan, tergantung pada petunjuk dokter.\n\nUntuk mendukung proses penyembuhan, sangat penting untuk memberikan nutrisi yang baik, seperti vitamin dan mineral yang dapat memperkuat sistem imun burung. Selain itu, pastikan burung berada di lingkungan yang bersih dan kering untuk menghindari infeksi lebih lanjut', 'pakar', '01JRQ15FPMY66HN46STX22J335.jpeg', '2025-04-13 00:35:02', '2025-04-13 00:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LFlMC4g4P7yiknAtYWtgpBXLFYyhEVriBe7ALzpM', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUdJT3NQY2VQbDJmQ0NPMDZCRTY4NFRuRTNGNkF4OUV6VnNLbllvQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcHAvbG9naW4iO319', 1745559025),
('VDcUikCyA1k0y8umVBAhqc1LwwdfJf3b5UnAihtM', 8, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSXpKRVgwaEM4SWJlYkpjZ1FKTVBjNDJJcWQxdmZXbkRZc3RqTFZyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcHAvaGFzaWwtZGlhZ25vc2FzLzQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkUUthSFR4ZkdVZ3pxMzljZklMMDZtZWtBanNjOVU0bFdadXlMVGtPTlJ4cUhpVVpvd2tkTkciO3M6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1745559194);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'USER',
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `alamat`, `no_telepon`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'tes', '000000', 'ADMIN', '$2y$12$7mGnQeefOlBB1I1b2SMvtOUl./OTU4Q2Vuc.1kgLQO7qG9.YdgSx2', NULL, NULL),
(7, 'ikhsan', 'ikhsan', 'qwertyui', '67890', 'USER', '$2y$12$C9oJfJvIzRTHjIQpOWy8TecYRiobYR44LLq7GSZMpdWzeetgA2TPm', '2025-04-13 03:06:22', '2025-04-13 03:06:22'),
(8, 'Testing', 'testing', 'tes\n', '018923', 'USER', '$2y$12$QKaHTxfGUgzq39cfIL06mekAjsc9U4lWZuyLTkONRxqHiUZowkdNG', '2025-04-24 20:12:37', '2025-04-24 20:12:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan`
--
ALTER TABLE `aturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basis_pengetahuan_penyakit_id_foreign` (`penyakit_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basis_pengetahuan_id` (`basis_pengetahuan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aturan`
--
ALTER TABLE `aturan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD CONSTRAINT `basis_pengetahuan_penyakit_id_foreign` FOREIGN KEY (`penyakit_id`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  ADD CONSTRAINT `fk_basis_pengetahuan` FOREIGN KEY (`basis_pengetahuan_id`) REFERENCES `basis_pengetahuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
