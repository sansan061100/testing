-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2025 at 11:52 AM
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
(2, 3, '[\"4\",\"6\",\"5\"]', '2025-04-12 02:09:18', '2025-04-12 02:09:18');

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
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1744448971),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1744448971;', 1744448971),
('livewire-rate-limiter:aa06738065c8c75f373f21df9dcb0a68206bf5d9', 'i:2;', 1744457223),
('livewire-rate-limiter:aa06738065c8c75f373f21df9dcb0a68206bf5d9:timer', 'i:1744457223;', 1744457223),
('livewire-rate-limiter:bd45a4fbaa0f33a445cde5097ab3203201be132e', 'i:2;', 1744457919),
('livewire-rate-limiter:bd45a4fbaa0f33a445cde5097ab3203201be132e:timer', 'i:1744457919;', 1744457919);

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
  `nama_gejala` varchar(255) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `nama_gejala`, `pertanyaan`, `created_at`, `updated_at`) VALUES
(1, 'tes', 'tes', '2025-04-12 00:33:13', '2025-04-12 00:33:13'),
(2, 'tes2', 'tes2', '2025-04-12 00:40:52', '2025-04-12 00:41:00'),
(3, 'tes3', 'tes3', '2025-04-12 00:41:06', '2025-04-12 00:41:06'),
(4, 'tes4', 'tes4', '2025-04-12 01:49:40', '2025-04-12 01:49:40'),
(5, 'tes6', 'tes6', '2025-04-12 02:08:56', '2025-04-12 02:09:26'),
(6, 'tes5', 'tes5', '2025-04-12 02:09:01', '2025-04-12 02:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_diagnosa`
--

CREATE TABLE `hasil_diagnosa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `basis_pengetahuan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasil_diagnosa`
--

INSERT INTO `hasil_diagnosa` (`id`, `user_id`, `basis_pengetahuan_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-12 02:27:33', '2025-04-12 02:27:33'),
(2, 2, 1, '2025-04-12 04:30:00', '2025-04-12 04:30:00');

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
(1, 'qweqwe', 'qweqwe@gmail.com', 'qweqwe', '2025-04-12 03:44:08', '2025-04-12 03:44:08');

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

INSERT INTO `penyakit` (`id`, `nama_penyakit`, `deskripsi_penyakit`, `solusi`, `sumber`, `foto`, `created_at`, `updated_at`) VALUES
(2, 'penyakit 1', 'tes', 'tes', 'tes', '01JRMF4GK7XNSCQMS3XD0DFPRC.png', '2025-04-12 00:41:27', '2025-04-12 00:41:27'),
(3, 'penyakit 2', 'qqwe', 'qwe', 'tes', '01JRMM40E3PE5X66KXSVZRFF5C.png', '2025-04-12 02:08:33', '2025-04-12 02:08:33');

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
('UIL82xdDIlQ0MPHOUEN84YNeXP1BdM3TlssvPQQx', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaUwzQmpJWmxqUmZiOW44WGlrWWdDUU9vTXo0ejI0UzdtN2hPMjlKSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9nZWphbGFzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJDdtR25RZWVmT2xCQjFJMWIyU012dE9VbC4vT1RVNFEyVnVjLjFrZ0xRTzdxRzkuWWRnU3gyIjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1744458674);

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
(2, 'Sansan', 'sansan061100', 'testing', '091297123', 'USER', '$2y$12$9isAGXO1ZOomUo4.mhkWSeAG0YeYVfGFYzriplvkfKfR9u4zAbN.i', '2025-04-12 04:26:43', '2025-04-12 04:26:43'),
(5, 'testing', 'testing', 'testing', 'testing', 'ADMIN', 'testing', '2025-04-12 04:39:30', '2025-04-12 04:39:30'),
(6, 'testing', 'testing', 'testing', 'testing', 'USER', '$2y$12$x2GcfwOyplrpAPtCYwSWreteJ0kaNNq2IO3jRaACG1uxikN1reeVG', '2025-04-12 04:40:59', '2025-04-12 04:40:59');

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
  ADD KEY `basis_pengetahuan_id` (`basis_pengetahuan_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
