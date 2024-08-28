-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for complexdb
CREATE DATABASE IF NOT EXISTS `complexdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `complexdb`;

-- Dumping structure for table complexdb.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.cache: ~0 rows (approximately)

-- Dumping structure for table complexdb.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.cache_locks: ~0 rows (approximately)

-- Dumping structure for table complexdb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table complexdb.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.jobs: ~0 rows (approximately)

-- Dumping structure for table complexdb.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.job_batches: ~0 rows (approximately)

-- Dumping structure for table complexdb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000001_create_cache_table', 1),
	(2, '0001_01_01_000002_create_jobs_table', 1),
	(3, '2024_08_28_020625_create_users_table', 1),
	(4, '2024_08_28_021048_create_posts_table', 1),
	(5, '2024_08_28_022447_create_personal_access_tokens_table', 1),
	(6, '2024_08_28_032721_create_sessions_table', 2);

-- Dumping structure for table complexdb.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table complexdb.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.posts: ~0 rows (approximately)
INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `created_at`, `updated_at`) VALUES
	(7, 'Pengertian HTML Tag', 'Tag HTML adalah elemen dasar yang digunakan untuk membangun struktur dan format konten di halaman web.Bayangkan kamu sedang membaca sebuah buku. Ada judul, paragraf, gambar, dan mungkin juga kutipan di dalamnya. Di dunia web, setiap komponen tersebut direpresentasikan dengan tag HTML tertentu.Sebagai contoh, judul direpresentasikan dengan tag < h1 > sampai < h6 >, sementara paragraf dengan tag < p >. Ada banyak juga tag lainnya yang membantu kita mengatur dan menampilkan konten web lebih rapi.', 6, '2024-08-27 22:14:11', '2024-08-27 22:14:11'),
	(8, 'Pengertian HTML Tag', 'Tag HTML adalah elemen dasar yang digunakan untuk membangun struktur dan format konten di halaman web.Bayangkan kamu sedang membaca sebuah buku. Ada judul, paragraf, gambar, dan mungkin juga kutipan di dalamnya. Di dunia web, setiap komponen tersebut direpresentasikan dengan tag HTML tertentu.Sebagai contoh, judul direpresentasikan dengan tag < h1 > sampai < h6 >, sementara paragraf dengan tag < p >. Ada banyak juga tag lainnya yang membantu kita mengatur dan menampilkan konten web lebih rapi.', 6, '2024-08-27 22:14:46', '2024-08-27 22:14:46'),
	(9, 'Pengertian HTML Tag', 'Tag HTML adalah elemen dasar yang digunakan untuk membangun struktur dan format konten di halaman web.Bayangkan kamu sedang membaca sebuah buku. Ada judul, paragraf, gambar, dan mungkin juga kutipan di dalamnya. Di dunia web, setiap komponen tersebut direpresentasikan dengan tag HTML tertentu.Sebagai contoh, judul direpresentasikan dengan tag < h1 > sampai < h6 >, sementara paragraf dengan tag < p >. Ada banyak juga tag lainnya yang membantu kita mengatur dan menampilkan konten web lebih rapi.', 6, '2024-08-27 22:14:48', '2024-08-27 22:14:48'),
	(10, 'Pengertian HTML Tag', 'Tag HTML adalah elemen dasar yang digunakan untuk membangun struktur dan format konten di halaman web.Bayangkan kamu sedang membaca sebuah buku. Ada judul, paragraf, gambar, dan mungkin juga kutipan di dalamnya. Di dunia web, setiap komponen tersebut direpresentasikan dengan tag HTML tertentu.Sebagai contoh, judul direpresentasikan dengan tag < h1 > sampai < h6 >, sementara paragraf dengan tag < p >. Ada banyak juga tag lainnya yang membantu kita mengatur dan menampilkan konten web lebih rapi.', 6, '2024-08-27 22:14:48', '2024-08-27 22:14:48');

-- Dumping structure for table complexdb.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('NKi0Aq5s42oY6UUUZlCBwXsYDekPuRAaYzqur0DH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWhwc0FvSTV5RXBmVWhZN2dVajFzbU54eU42OUZVczJqMVl4T1hBeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1724815696);

-- Dumping structure for table complexdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table complexdb.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(3, 'Jonidan', 'jonidan@example.com', '$2y$12$AFVhf786kOvRC72utGI64OkyKstVtEt58haHPgfABapWtEplx335W', '2024-08-27 20:59:31', '2024-08-27 20:59:31'),
	(4, 'Jonidani', 'jonidani@example.com', '$2y$12$mBvljLhVKYdJg4YuppOqzuxJ5G296LrPWedxoNe5LXE7eTT4ux1yi', '2024-08-27 21:00:40', '2024-08-27 21:00:40'),
	(5, 'Jonidanida', 'jonidandai@example.com', '$2y$12$itKcyUEhx/Z2aqbGZMGBF.0c/H9sEN0NGtUX8xo7YXexk9vnP2hMi', '2024-08-27 21:01:13', '2024-08-27 21:01:13'),
	(6, 'saeful', 'saeful@example.com', '$2y$12$900QFdLhE/wPH1HHg8KEyeodi9w6FRIGL.6Mhnii5udjNX/ById6i', '2024-08-27 21:43:16', '2024-08-27 21:43:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
