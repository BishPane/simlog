-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 05:30 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_09_043611_create_roles_table', 1),
(5, '2020_12_09_043635_create_user_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permission`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '[{\"resourceName\":\"Lists\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"lists\"},{\"resourceName\":\"Users\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"users\"},{\"resourceName\":\"Role\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"AssignPermission\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignPermission\"},{\"resourceName\":\"Home\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"home\"},{\"resourceName\":\"Posts\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"posts\"}]', NULL, '2020-12-10 06:04:54'),
(2, 'User', '[{\"resourceName\":\"Lists\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"lists\"},{\"resourceName\":\"Users\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"users\"},{\"resourceName\":\"Role\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"AssignPermission\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignPermission\"},{\"resourceName\":\"Home\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"home\"},{\"resourceName\":\"Posts\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"posts\"}]', NULL, '2020-12-10 06:05:07'),
(3, 'Editor', '[{\"resourceName\":\"Lists\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"lists\"},{\"resourceName\":\"Users\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"users\"},{\"resourceName\":\"Role\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"role\"},{\"resourceName\":\"AssignPermission\",\"read\":false,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"assignPermission\"},{\"resourceName\":\"Home\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"home\"},{\"resourceName\":\"Posts\",\"read\":true,\"write\":false,\"update\":false,\"delete\":false,\"name\":\"posts\"}]', NULL, '2020-12-10 06:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Bibek', 'bibek@mail.com', '$2y$10$m2cKcjfIo9pJyjpboL0dXeQBqGUdxom9q90J0MW2rtOkHHpWnRvum', NULL, '2020-12-09 01:01:44', '2020-12-09 01:01:44'),
(5, 'Bishal', 'bishal@mail.com', '$2y$10$cSH4GMVs4xSfchCduRQDS.2EdV4bEDgBuXZHnb9DOWjxgZFd3c0iK', NULL, '2020-12-09 01:02:00', '2020-12-09 01:02:00'),
(6, 'Pratik', 'pratik@mail.com', '$2y$10$OjuHRfDOxSm5qQXLvXy5Eu.2W6ZKgTg9HQDa0TG/.2EP1zg0lgw0y', NULL, '2020-12-09 01:02:10', '2020-12-09 01:02:10'),
(7, 'Pratik', 'pratik123@mail.com', '$2y$10$6jOUGuD5Hd8.KqV1lUFEdOfzI/QPQLHSILuT4PpFPAbYiQFhDAlCC', NULL, '2020-12-09 01:04:30', '2020-12-09 01:04:30'),
(16, 'test', 'test@test.com', '$2y$10$occK4.QU4qIis1fUAyGOxe/55nmxK1647PrkqPFRoEy1FBTosiH2q', NULL, '2020-12-09 22:13:43', '2020-12-09 22:13:43'),
(17, 'test', 'try@try.com', '$2y$10$1BGXFlLIN1DinPMdZe3r.OspajPKpaUJFgyDeum7gjEEAwtWz0Csy', NULL, '2020-12-09 22:15:39', '2020-12-09 22:15:39'),
(18, 'qwe', 'qwe@pop.com', '$2y$10$R0f2BEMOeb28jdWdbesSw.V2QLWFRWBL4xdTM3kUEmSqB1IZO2chC', NULL, '2020-12-10 06:16:33', '2020-12-10 06:16:33'),
(19, 'testname', 't@t.com', '$2y$10$rGwBjvBPgbeFfnM5sO4wreUiUvQbOOzjHytas456kFye3rrdBifGW', NULL, '2020-12-10 21:54:43', '2020-12-10 21:54:43'),
(20, 'tqwe', 'a@a.com', '$2y$10$e6rUgWMtlH7wDlpBHAeA7ODMqysCSs4oxIr4.hie4hb.aVmbNuqfm', NULL, '2020-12-10 21:56:48', '2020-12-10 21:56:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 1),
(3, 2),
(4, 1),
(5, 3),
(6, 2),
(7, 1),
(8, 1),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(12, 2),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(20, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
