-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 10:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technopa_adittiya_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `delete`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<i class=\"fad fa-analytics\"></i>', 1, 1, 1, '2023-07-10 16:40:27', '2023-08-08 10:16:58'),
(2, 2, NULL, 'User Management', NULL, '<i class=\"fad fa-users\"></i>', 2, 1, 1, '2023-07-10 16:40:43', '2023-08-08 10:17:36'),
(4, 4, 2, 'Role Setup', 'admin.role.index', NULL, 1, 1, 1, '2023-07-10 16:41:55', '2023-07-10 16:41:55'),
(5, 5, 2, 'User Setup', 'admin.user.index', NULL, 2, 1, 1, '2023-07-10 16:42:09', '2023-07-10 16:42:09'),
(7, 21, NULL, 'Site Settings', NULL, '<i class=\"fad fa-cogs\"></i>', 99, 1, 1, '2023-07-16 14:25:12', '2023-08-09 07:19:44'),
(8, 22, 7, 'App info', 'admin.settings.index', NULL, 1, 1, 1, '2023-07-16 14:44:05', '2023-07-16 14:44:05'),
(9, 24, 2, 'Menu Setup', 'admin.admin-menu.index', NULL, 3, 1, 1, '2023-07-16 15:59:24', '2023-07-16 15:59:24'),
(17, 52, 7, 'Site Menu', 'admin.menu.index', NULL, 2, 1, 1, '2023-08-01 17:52:44', '2023-08-05 16:08:26'),
(19, 60, 7, 'Page Setup', 'admin.page.index', NULL, 3, 1, 1, '2023-08-04 17:05:07', '2023-08-04 17:05:07'),
(20, 68, 7, 'Admin Info', 'admin.admin-settings.index', NULL, 4, 1, 1, '2023-08-08 04:40:09', '2023-08-08 04:40:09'),
(21, 69, NULL, 'Product Management', NULL, '<i class=\"fad fa-box-check\"></i>', 5, 1, 1, '2023-08-09 07:21:50', '2023-08-09 07:21:50'),
(22, 70, 21, 'All Products', 'admin.product.index', NULL, 1, 1, 1, '2023-08-09 07:22:37', '2023-08-09 07:22:37'),
(23, 71, 21, 'Add New Product', 'admin.product.create', NULL, 2, 1, 1, '2023-08-09 07:23:01', '2023-08-09 07:23:01'),
(24, 72, NULL, 'Basic Setup', NULL, '<i class=\"fad fa-store\"></i>', 3, 1, 1, '2023-08-09 07:28:51', '2023-08-09 07:28:51'),
(25, 73, 24, 'Category Setup', 'admin.category.index', NULL, 1, 1, 1, '2023-08-09 07:30:58', '2023-08-09 07:30:58'),
(28, 76, 24, 'Brands', 'admin.brand.index', NULL, 4, 1, 1, '2023-08-09 09:28:41', '2023-08-09 09:28:41'),
(29, 103, 24, 'Slider Banner', 'admin.slider.index', NULL, 5, 1, 1, '2023-08-29 09:41:11', '2023-08-29 09:41:11'),
(30, 108, NULL, 'Home Page Section Setup', 'admin.home-product-section.index', '<i class=\"fad fa-paint-roller\"></i>', 6, 1, 1, '2023-08-30 06:08:11', '2023-09-12 09:57:53'),
(31, 114, 24, 'Attribute Setup', 'admin.attribute.index', NULL, 6, 1, 1, '2023-09-03 09:19:35', '2023-09-03 09:19:35'),
(32, 125, 7, 'Location Setup', 'admin.location.index', NULL, 1, 1, 1, '2023-09-09 05:39:25', '2023-09-09 05:39:25'),
(33, 130, NULL, 'Customer Management', 'admin.customers.index', '<i class=\"fad fa-users\"></i>', 6, 1, 1, '2023-09-09 13:06:35', '2023-09-09 13:06:53'),
(34, 132, NULL, 'Order Management', 'admin.order.index', '<i class=\"fad fa-chart-network\"></i>', 7, 1, 1, '2023-09-10 04:23:40', '2023-09-10 04:23:40'),
(35, 133, NULL, 'Marketing', NULL, '<i class=\"fad fa-bullhorn\"></i>', 5, 1, 1, '2023-09-12 09:57:18', '2023-09-12 09:57:39'),
(36, 134, 35, 'Flash Deals', 'admin.deal.index', NULL, 1, 1, 1, '2023-09-12 09:58:26', '2023-09-12 09:58:26'),
(37, 137, NULL, 'Special Offer', 'admin.special-offer-products.index', '<i class=\"fad fa-badge-percent\"></i>', 6, 1, 1, '2023-10-18 08:09:43', '2023-10-18 08:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_actions`
--

CREATE TABLE `admin_menu_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `admin_menu_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `route` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_actions`
--

INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 4, 'create', 'admin.role.create', 1, '2023-07-10 16:45:14', '2023-07-10 16:45:14'),
(2, 7, 4, 'store', 'admin.role.store', 1, '2023-07-10 16:45:55', '2023-07-10 16:45:55'),
(3, 8, 4, 'edit', 'admin.role.edit', 1, '2023-07-10 16:46:07', '2023-07-10 16:46:07'),
(4, 9, 4, 'update', 'admin.role.update', 1, '2023-07-10 16:46:16', '2023-07-10 16:46:16'),
(5, 10, 4, 'delete', 'admin.role.destroy', 1, '2023-07-10 16:46:26', '2023-07-10 16:46:50'),
(6, 11, 5, 'create', 'admin.user.create', 1, '2023-07-10 16:48:07', '2023-07-10 16:48:07'),
(7, 12, 5, 'store', 'admin.user.store', 1, '2023-07-10 16:48:16', '2023-07-10 16:48:16'),
(8, 13, 5, 'edit', 'admin.user.edit', 1, '2023-07-10 16:48:32', '2023-07-10 16:48:32'),
(9, 14, 5, 'update', 'admin.user.update', 1, '2023-07-10 16:48:48', '2023-07-10 16:48:48'),
(10, 15, 5, 'delete', 'admin.user.destroy', 1, '2023-07-10 16:48:56', '2023-07-10 16:48:56'),
(11, 18, 5, 'change password', 'admin.user.password', 1, '2023-07-13 15:00:14', '2023-07-13 15:00:14'),
(12, 19, 5, 'password update', 'admin.user.password-update', 1, '2023-07-13 15:06:59', '2023-07-13 15:06:59'),
(14, 23, 8, 'update', 'admin.settings.update', 1, '2023-07-16 14:46:53', '2023-07-16 14:46:53'),
(15, 25, 9, 'create', 'admin.admin-menu.create', 1, '2023-07-16 16:01:01', '2023-07-16 16:01:01'),
(16, 26, 9, 'store', 'admin.admin-menu.store', 1, '2023-07-16 16:01:10', '2023-07-16 16:01:10'),
(17, 27, 9, 'delete', 'admin.admin-menu.destroy', 1, '2023-07-16 16:01:28', '2023-07-16 16:01:28'),
(18, 28, 9, 'update', 'admin.admin-menu.update', 1, '2023-07-16 16:01:37', '2023-07-16 16:01:37'),
(19, 29, 9, 'action view', 'admin.admin-menuAction.index', 1, '2023-07-16 16:03:42', '2023-07-16 16:19:09'),
(20, 30, 9, 'action create', 'admin.admin-menuAction.create', 1, '2023-07-16 16:03:53', '2023-07-16 16:18:56'),
(21, 31, 9, 'action store', 'admin.admin-menuAction.store', 1, '2023-07-16 16:04:17', '2023-07-16 16:18:50'),
(22, 32, 9, 'action update', 'admin.admin-menuAction.update', 1, '2023-07-16 16:04:30', '2023-07-16 16:15:23'),
(23, 33, 9, 'action delete', 'admin.admin-menuAction.destroy', 1, '2023-07-16 16:04:45', '2023-07-16 16:18:15'),
(24, 34, 9, 'action status', 'admin.admin-menuAction.status', 1, '2023-07-16 16:05:10', '2023-07-16 16:18:26'),
(25, 35, 9, 'action edit', 'admin.admin-menuAction.edit', 1, '2023-07-16 16:20:16', '2023-07-16 16:20:16'),
(26, 36, 9, 'edit', 'admin.admin-menu.edit', 1, '2023-07-18 08:47:07', '2023-07-18 08:47:07'),
(36, 61, 19, 'Create', 'admin.page.create', 1, '2023-08-04 17:19:30', '2023-08-04 17:19:30'),
(37, 62, 19, 'store', 'admin.page.store', 1, '2023-08-04 17:20:02', '2023-08-04 17:20:02'),
(38, 63, 19, 'edit', 'admin.page.edit', 1, '2023-08-04 17:20:22', '2023-08-04 17:20:22'),
(39, 64, 19, 'update', 'admin.page.update', 1, '2023-08-04 17:20:33', '2023-08-04 17:20:33'),
(40, 65, 19, 'delete', 'admin.page.destroy', 1, '2023-08-04 17:20:42', '2023-08-04 17:20:42'),
(41, 66, 4, 'permission edit', 'admin.rolePermission.edit', 1, '2023-08-06 15:15:01', '2023-08-06 15:15:01'),
(42, 67, 4, 'permission update', 'admin.rolePermission.update', 1, '2023-08-06 15:15:27', '2023-08-06 15:15:27'),
(43, 77, 17, 'create', 'admin.menu.create', 1, '2023-08-09 10:59:18', '2023-08-09 10:59:18'),
(44, 78, 17, 'store', 'admin.menu.store', 1, '2023-08-09 10:59:28', '2023-08-09 10:59:28'),
(45, 79, 17, 'edit', 'admin.menu.edit', 1, '2023-08-09 10:59:34', '2023-08-09 10:59:34'),
(46, 80, 17, 'update', 'admin.menu.update', 1, '2023-08-09 10:59:44', '2023-08-09 10:59:44'),
(47, 81, 17, 'delete', 'admin.menu.destroy', 1, '2023-08-09 10:59:51', '2023-08-09 10:59:51'),
(48, 82, 20, 'update', 'admin.admin-settings.update', 1, '2023-08-09 11:00:37', '2023-08-09 11:00:54'),
(49, 83, 22, 'edit', 'admin.product.edit', 1, '2023-08-09 11:02:17', '2023-08-09 11:02:17'),
(50, 84, 22, 'update', 'admin.product.update', 1, '2023-08-09 11:02:24', '2023-08-09 11:02:24'),
(51, 85, 22, 'delete', 'admin.product.destroy', 1, '2023-08-09 11:02:35', '2023-08-09 11:02:35'),
(52, 86, 23, 'store', 'admin.product.store', 1, '2023-08-09 11:02:58', '2023-08-09 11:02:58'),
(53, 87, 25, 'edit', 'admin.category.edit', 1, '2023-08-09 11:03:29', '2023-08-09 11:03:29'),
(54, 88, 25, 'store', 'admin.category.store', 1, '2023-08-09 11:03:39', '2023-08-09 11:03:39'),
(55, 89, 25, 'update', 'admin.category.update', 1, '2023-08-09 11:03:49', '2023-08-09 11:03:49'),
(56, 90, 25, 'delete', 'admin.category.destroy', 1, '2023-08-09 11:04:00', '2023-08-09 11:04:00'),
(65, 99, 28, 'store', 'admin.brand.store', 1, '2023-08-09 11:06:00', '2023-08-09 11:06:00'),
(66, 100, 28, 'edit', 'admin.brand.edit', 1, '2023-08-09 11:06:04', '2023-08-09 11:06:04'),
(67, 101, 28, 'update', 'admin.brand.update', 1, '2023-08-09 11:06:22', '2023-08-09 11:06:22'),
(68, 102, 28, 'delete', 'admin.brand.destroy', 1, '2023-08-09 11:06:29', '2023-08-09 11:06:29'),
(69, 104, 29, 'store', 'admin.slider.store', 1, '2023-08-29 09:52:08', '2023-08-29 09:52:08'),
(70, 105, 29, 'edit', 'admin.slider.edit', 1, '2023-08-29 09:52:14', '2023-08-29 09:52:14'),
(71, 106, 29, 'update', 'admin.slider.update', 1, '2023-08-29 09:52:20', '2023-08-29 09:52:20'),
(72, 107, 29, 'delete', 'admin.slider.destroy', 1, '2023-08-29 09:52:27', '2023-08-29 09:52:27'),
(73, 109, 30, 'add', 'admin.home-product-section.create', 1, '2023-08-30 06:08:51', '2023-08-30 06:08:51'),
(74, 110, 30, 'store', 'admin.home-product-section.store', 1, '2023-08-30 06:08:59', '2023-08-30 06:08:59'),
(75, 111, 30, 'edit', 'admin.home-product-section.edit', 1, '2023-08-30 06:09:53', '2023-08-30 06:09:53'),
(76, 112, 30, 'update', 'admin.home-product-section.update', 1, '2023-08-30 06:09:59', '2023-08-30 06:09:59'),
(77, 113, 30, 'delete', 'admin.home-product-section.destroy', 1, '2023-08-30 06:10:06', '2023-08-30 06:10:06'),
(78, 115, 31, 'store', 'admin.attribute.store', 1, '2023-09-04 09:33:00', '2023-09-04 09:33:00'),
(79, 116, 31, 'edit', 'admin.attribute.edit', 1, '2023-09-04 09:33:05', '2023-09-04 09:33:05'),
(80, 117, 31, 'update', 'admin.attribute.update', 1, '2023-09-04 09:33:10', '2023-09-04 09:33:10'),
(81, 118, 31, 'delete', 'admin.attribute.destroy', 1, '2023-09-04 09:33:15', '2023-09-04 09:33:15'),
(82, 119, 31, 'values', 'admin.attribute-value.index', 1, '2023-09-04 09:33:41', '2023-09-04 09:33:41'),
(83, 120, 31, 'value store', 'admin.attribute-value.store', 1, '2023-09-04 09:33:50', '2023-09-04 09:33:50'),
(84, 121, 31, 'value edit', 'admin.attribute-value.edit', 1, '2023-09-04 09:33:57', '2023-09-04 09:33:57'),
(86, 123, 31, 'value update', 'admin.attribute-value.update', 1, '2023-09-04 09:34:17', '2023-09-04 09:34:17'),
(87, 124, 31, 'value delete', 'admin.attribute-value.destroy', 1, '2023-09-04 09:34:27', '2023-09-04 09:34:27'),
(88, 126, 32, 'store', 'admin.location.store', 1, '2023-09-09 13:00:18', '2023-09-09 13:00:18'),
(89, 127, 32, 'edit', 'admin.location.edit', 1, '2023-09-09 13:00:23', '2023-09-09 13:00:23'),
(90, 128, 32, 'update', 'admin.location.update', 1, '2023-09-09 13:00:31', '2023-09-09 13:00:31'),
(91, 129, 32, 'delete', 'admin.location.destroy', 1, '2023-09-09 13:00:37', '2023-09-09 13:00:54'),
(92, 131, 33, 'delete', 'admin.customers.destroy', 1, '2023-09-09 13:15:10', '2023-09-09 13:15:10'),
(93, 135, 34, 'View Order Or Print', 'admin.order.view', 1, '2023-09-12 14:14:09', '2023-09-12 14:14:09'),
(94, 136, 34, 'Change Status', 'admin.order.edit', 1, '2023-09-12 14:14:24', '2023-09-12 14:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `secondary_color` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `logo`, `favicon`, `title`, `footer_text`, `secondary_color`, `primary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
(1, 'media/admin-setting/2023-10-07-sqhQ5hWUfn5iNU5zNLCv8V2bdBgaCQdNauJ9oZ0V.webp', 'media/admin-setting/2023-10-07-e9JHuIl9S12zXQuiV0f7MR5x3YmwGugpNm52gOO3.webp', 'Adittiya', '© 2023 Developed by <a target=\"_blank\" href=\"http://www.technoparkbd.com/\">Techno Park Bangladesh</a>', NULL, NULL, 'https://www.facebook.com', 'https://twitter.com/', 'https://linkedin.com', 'https://whatsapp.com', NULL, '2023-08-08 05:19:43', '2023-10-07 03:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Color', 1, '2023-09-04 09:34:49', '2023-09-04 09:34:49'),
(8, 'Size', 1, '2023-09-04 13:17:30', '2023-09-04 13:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 7, 'Red', 1, '2023-09-04 12:17:47', '2023-09-04 12:17:47'),
(7, 7, 'Blue', 1, '2023-09-04 12:17:52', '2023-09-04 12:17:52'),
(8, 7, 'Yellow', 1, '2023-09-04 12:17:58', '2023-09-04 12:17:58'),
(9, 8, 'XL', 1, '2023-09-04 13:18:27', '2023-09-04 13:18:27'),
(10, 8, 'L', 1, '2023-09-04 13:18:34', '2023-09-04 13:18:34'),
(11, 8, 'M', 1, '2023-09-04 13:18:39', '2023-09-04 13:18:39'),
(12, 8, 'S', 1, '2023-09-04 13:18:42', '2023-09-04 13:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0,
  `order` bigint(20) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `image`, `featured`, `order`, `status`, `created_at`, `updated_at`) VALUES
(18, NULL, 'Ladies Fashion', 'ladies-fashion', NULL, 1, 0, 1, '2023-09-10 09:15:26', '2023-10-14 16:25:23'),
(58, NULL, 'Puja Special', 'puja-special', 'media/category/2023-10-05-ZY4bnYvOESd1gne7LPX1M7JXSqRrweACjxrbG8ag.webp', 1, 0, 1, '2023-09-10 10:38:31', '2023-10-05 08:36:30'),
(59, 18, 'Shari', 'shari', NULL, 1, 0, 1, '2023-10-04 10:06:53', '2023-10-04 13:01:24'),
(60, 18, 'Three Pcs', 'three-pcs', NULL, 1, 0, 1, '2023-10-04 10:07:40', '2023-10-04 13:01:26'),
(61, 18, 'Two Pcs', 'two-pcs', NULL, 1, 0, 1, '2023-10-04 10:07:56', '2023-10-04 10:07:56'),
(62, 18, 'One Pcs', 'one-pcs', NULL, 1, 0, 1, '2023-10-04 10:08:30', '2023-10-04 10:08:30'),
(63, 18, 'Salwar Kameez', 'salwar-kameez', NULL, 1, 0, 1, '2023-10-04 10:08:56', '2023-10-04 10:08:56'),
(65, 18, 'Four Pcs', 'four-pcs', NULL, 1, 0, 1, '2023-10-14 16:02:06', '2023-10-14 16:02:06'),
(66, NULL, 'Jewellery', 'jewellery', NULL, 1, 0, 1, '2023-10-14 16:18:00', '2023-10-14 16:27:22');

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
-- Table structure for table `flashdeals`
--

CREATE TABLE `flashdeals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `featured` tinyint(4) NOT NULL DEFAULT 1,
  `banner` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flashdeal_products`
--

CREATE TABLE `flashdeal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount` double NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_product_sections`
--

CREATE TABLE `home_product_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_ids` text DEFAULT NULL,
  `first_row_content` varchar(255) NOT NULL DEFAULT 'product',
  `second_row_content` varchar(255) NOT NULL DEFAULT 'product',
  `banner_one` varchar(255) DEFAULT NULL,
  `banner_one_link` varchar(255) DEFAULT NULL,
  `banner_two` varchar(255) DEFAULT NULL,
  `banner_two_link` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_product_sections`
--

INSERT INTO `home_product_sections` (`id`, `category_id`, `brand_ids`, `first_row_content`, `second_row_content`, `banner_one`, `banner_one_link`, `banner_two`, `banner_two_link`, `order`, `status`, `created_at`, `updated_at`) VALUES
(10, 58, NULL, 'product', 'product', NULL, NULL, NULL, NULL, 1, 1, '2023-10-14 01:52:31', '2023-10-14 14:24:20'),
(11, 18, NULL, 'product', 'product', NULL, NULL, NULL, NULL, 2, 1, '2023-10-14 16:03:25', '2023-10-14 16:08:55'),
(12, 66, NULL, 'product', 'blank', NULL, NULL, NULL, NULL, 3, 1, '2023-10-14 16:19:01', '2023-10-14 16:19:01');

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
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `district` tinyint(4) NOT NULL DEFAULT 0,
  `thana` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `parent_id`, `name`, `delivery_charge`, `district`, `thana`, `created_at`, `updated_at`) VALUES
(13, NULL, 'Dhaka', 60, 0, 0, '2023-02-02 09:23:07', '2023-07-29 09:19:33'),
(14, NULL, 'Rajshahi', 120, 0, 0, '2023-02-02 09:23:30', '2023-07-29 09:20:36'),
(15, NULL, 'Rangpur', 120, 0, 0, '2023-02-02 09:23:45', '2023-07-29 09:20:54'),
(16, NULL, 'Mymensingh', 120, 0, 0, '2023-02-02 09:23:54', '2023-07-29 09:20:03'),
(17, NULL, 'Sylhet', 120, 0, 0, '2023-02-02 09:24:12', '2023-07-29 09:20:13'),
(18, NULL, 'Khulna', 120, 0, 0, '2023-02-02 09:24:30', '2023-07-29 09:19:50'),
(19, NULL, 'Barisal', 120, 0, 0, '2023-02-02 09:24:39', '2023-07-29 09:21:06'),
(20, NULL, 'Chittagong', 120, 0, 0, '2023-02-02 09:24:49', '2023-07-29 09:18:42'),
(28, 19, 'Barguna', 0, 1, 0, NULL, NULL),
(29, 19, 'Barisal', 0, 1, 0, NULL, NULL),
(30, 19, 'Bhola', 0, 1, 0, NULL, NULL),
(31, 19, 'Jhalokati', 0, 1, 0, NULL, NULL),
(32, 19, 'Patuakhali', 0, 1, 0, NULL, NULL),
(33, 19, 'Pirojpur', 0, 1, 0, NULL, NULL),
(34, 20, 'Bandarban', 0, 1, 0, NULL, NULL),
(35, 20, 'Brahmanbaria', 0, 1, 0, NULL, NULL),
(36, 20, 'Chandpur', 0, 1, 0, NULL, NULL),
(37, 20, 'Chittagong', 0, 1, 0, NULL, NULL),
(38, 20, 'Comilla', 0, 1, 0, NULL, NULL),
(39, 20, 'Cox\'s Bazar', 0, 1, 0, NULL, NULL),
(40, 20, 'Feni', 0, 1, 0, NULL, NULL),
(41, 20, 'Khagrachhari', 0, 1, 0, NULL, NULL),
(42, 20, 'Lakshmipur', 0, 1, 0, NULL, NULL),
(43, 20, 'Noakhali', 0, 1, 0, NULL, NULL),
(44, 20, 'Rangamati', 0, 1, 0, NULL, NULL),
(45, 13, 'Dhaka', 0, 1, 0, NULL, NULL),
(46, 13, 'Faridpur', 0, 1, 0, NULL, NULL),
(47, 13, 'Gazipur', 0, 1, 0, NULL, NULL),
(48, 13, 'Gopalganj', 0, 1, 0, NULL, NULL),
(49, 13, 'Jamalpur', 0, 1, 0, NULL, NULL),
(50, 13, 'Kishoreganj', 0, 1, 0, NULL, NULL),
(51, 13, 'Madaripur', 0, 1, 0, NULL, NULL),
(52, 13, 'Manikganj', 0, 1, 0, NULL, NULL),
(53, 13, 'Munshiganj', 0, 1, 0, NULL, NULL),
(54, 13, 'Mymensingh', 0, 1, 0, NULL, NULL),
(55, 13, 'Narayanganj', 0, 1, 0, NULL, NULL),
(56, 13, 'Narsingdi', 0, 1, 0, NULL, NULL),
(57, 13, 'Netrokona', 0, 1, 0, NULL, NULL),
(58, 13, 'Rajbari', 0, 1, 0, NULL, NULL),
(59, 13, 'Shariatpur', 0, 1, 0, NULL, NULL),
(60, 13, 'Sherpur', 0, 1, 0, NULL, NULL),
(61, 13, 'Tangail', 0, 1, 0, NULL, NULL),
(62, 18, 'Bagerhat', 0, 1, 0, NULL, NULL),
(63, 18, 'Chuadanga', 0, 1, 0, NULL, NULL),
(64, 18, 'Jessore', 0, 1, 0, NULL, NULL),
(65, 18, 'Jhenaidah', 0, 1, 0, NULL, NULL),
(66, 18, 'Khulna', 0, 1, 0, NULL, NULL),
(67, 18, 'Kushtia', 0, 1, 0, NULL, NULL),
(68, 18, 'Magura', 0, 1, 0, NULL, NULL),
(69, 18, 'Meherpur', 0, 1, 0, NULL, NULL),
(70, 18, 'Narail', 0, 1, 0, NULL, NULL),
(71, 18, 'Satkhira', 0, 1, 0, NULL, NULL),
(72, 14, 'Bogra', 0, 1, 0, NULL, NULL),
(73, 14, 'Joypurhat', 0, 1, 0, NULL, NULL),
(74, 14, 'Naogaon', 0, 1, 0, NULL, NULL),
(75, 14, 'Natore', 0, 1, 0, NULL, NULL),
(76, 14, 'Nawabganj', 0, 1, 0, NULL, NULL),
(77, 14, 'Pabna', 0, 1, 0, NULL, NULL),
(78, 14, 'Rajshahi', 0, 1, 0, NULL, NULL),
(79, 14, 'Sirajganj', 0, 1, 0, NULL, NULL),
(80, 15, 'Dinajpur', 0, 1, 0, NULL, NULL),
(81, 15, 'Gaibandha', 0, 1, 0, NULL, NULL),
(82, 15, 'Kurigram', 0, 1, 0, NULL, NULL),
(83, 15, 'Lalmonirhat', 0, 1, 0, NULL, NULL),
(84, 15, 'Nilphamari', 0, 1, 0, NULL, NULL),
(85, 15, 'Panchagarh', 0, 1, 0, NULL, NULL),
(86, 15, 'Rangpur', 0, 1, 0, NULL, NULL),
(87, 15, 'Thakurgaon', 0, 1, 0, NULL, NULL),
(88, 17, 'Habiganj', 0, 1, 0, NULL, NULL),
(89, 17, 'Moulvibazar', 0, 1, 0, NULL, NULL),
(90, 17, 'Sunamganj', 0, 1, 0, NULL, NULL),
(91, 17, 'Sylhet', 0, 1, 0, NULL, NULL),
(92, 73, 'Akkelpur', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(93, 73, 'Joypurhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(94, 73, 'Kalai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(95, 73, 'Khetlal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(96, 73, 'Panchbibi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(97, 72, 'Adamdighi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(98, 72, 'Bogra Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(99, 72, 'Dhunat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(100, 72, 'Dhupchanchia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(101, 72, 'Gabtali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(102, 72, 'Kahaloo ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(103, 72, 'Nandigram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(104, 72, 'Sariakandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(105, 72, 'Shajahanpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(106, 72, 'Sherpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(107, 72, 'Shibganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(108, 72, 'Sonatola ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(109, 74, 'Atrai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(110, 74, 'Badalgachhi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(111, 74, 'Manda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(112, 74, 'Dhamoirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(113, 74, 'Mohadevpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(114, 74, 'Naogaon Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(115, 74, 'Niamatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(116, 74, 'Patnitala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(117, 74, 'Porsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(118, 74, 'Raninagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(119, 74, 'Sapahar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(120, 75, 'Bagatipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(121, 75, 'Baraigram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(122, 75, 'Gurudaspur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(123, 75, 'Lalpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(124, 75, 'Natore Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(125, 75, 'Singra ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(126, 75, 'Naldanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(127, 76, 'Bholahat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(128, 76, 'Gomastapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(129, 76, 'Nachole ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(130, 76, 'Nawabganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(131, 76, 'Shibganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(132, 77, 'Ataikula ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(133, 77, 'Atgharia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(134, 77, 'Bera ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(135, 77, 'Bhangura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(136, 77, 'Chatmohar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(137, 77, 'Faridpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(138, 77, 'Ishwardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(139, 77, 'Pabna Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(140, 77, 'Santhia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(141, 77, 'Sujanagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(142, 79, 'Belkuchi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(143, 79, 'Chauhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(144, 79, 'Kamarkhanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(145, 79, 'Kazipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(146, 79, 'Raiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(147, 79, 'Shahjadpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(148, 79, 'Sirajganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(149, 79, 'Tarash ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(150, 79, 'Ullahpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(151, 78, 'Bagha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(152, 78, 'Bagmara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(153, 78, 'Charghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(154, 78, 'Durgapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(155, 78, 'Godagari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(156, 78, 'Mohanpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(157, 78, 'Paba ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(158, 78, 'Puthia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(159, 78, 'Tanore ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(160, 78, 'Boalia Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(161, 78, 'Matihar Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(162, 78, 'Rajpara Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(163, 78, 'Shah Mokdum Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(164, 80, 'Birampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(165, 80, 'Birganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(166, 80, 'Biral ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(167, 80, 'Bochaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(168, 80, 'Chirirbandar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(169, 80, 'Phulbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(170, 80, 'Ghoraghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(171, 80, 'Hakimpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(172, 80, 'Kaharole ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(173, 80, 'Khansama ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(174, 80, 'Dinajpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(175, 80, 'Nawabganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(176, 80, 'Parbatipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(177, 81, 'Phulchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(178, 81, 'Gaibandha Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(179, 81, 'Gobindaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(180, 81, 'Palashbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(181, 81, 'Sadullapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(182, 81, 'Sughatta ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(183, 81, 'Sundarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(184, 82, 'Bhurungamari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(185, 82, 'Char Rajibpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(186, 82, 'Chilmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(187, 82, 'Phulbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(188, 82, 'Kurigram Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(189, 82, 'Nageshwari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(190, 82, 'Rajarhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(191, 82, 'Raomari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(192, 82, 'Ulipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(193, 83, 'Aditmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(194, 83, 'Hatibandha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(195, 83, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(196, 83, 'Lalmonirhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(197, 83, 'Patgram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(198, 84, 'Dimla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(199, 84, 'Domar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(200, 84, 'Jaldhaka ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(201, 84, 'Kishoreganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(202, 84, 'Nilphamari Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(203, 84, 'Saidpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(204, 85, 'Atwari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(205, 85, 'Boda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(206, 85, 'Debiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(207, 85, 'Panchagarh Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(208, 85, 'Tetulia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(209, 86, 'Badarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(210, 86, 'Gangachhara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(211, 86, 'Kaunia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(212, 86, 'Rangpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(213, 86, 'Mithapukur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(214, 86, 'Pirgachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(215, 86, 'Pirganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(216, 86, 'Taraganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(217, 87, 'Baliadangi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(218, 87, 'Haripur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(219, 87, 'Pirganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(220, 87, 'Ranisankail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(221, 87, 'Thakurgaon Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(222, 28, 'Amtali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(223, 28, 'Bamna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(224, 28, 'Barguna Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(225, 28, 'Betagi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(226, 28, 'Patharghata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(227, 28, 'Taltoli ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(228, 29, 'Agailjhara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(229, 29, 'Babuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(230, 29, 'Bakerganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(231, 29, 'Banaripara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(232, 29, 'Gaurnadi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(233, 29, 'Hizla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(234, 29, 'Barisal Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(235, 29, 'Mehendiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(236, 29, 'Muladi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(237, 29, 'Wazirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(238, 30, 'Bhola Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(239, 30, 'Burhanuddin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(240, 30, 'Char Fasson ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(241, 30, 'Daulatkhan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(242, 30, 'Lalmohan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(243, 30, 'Manpura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(244, 30, 'Tazumuddin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(245, 31, 'Jhalokati Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(246, 31, 'Kathalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(247, 31, 'Nalchity ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(248, 31, 'Rajapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(249, 32, 'Bauphal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(250, 32, 'Dashmina ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(251, 32, 'Galachipa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(252, 32, 'Kalapara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(253, 32, 'Mirzaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(254, 32, 'Patuakhali Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(255, 32, 'Rangabali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(256, 32, 'Dumki ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(257, 33, 'Bhandaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(258, 33, 'Kawkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(259, 33, 'Mathbaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(260, 33, 'Nazirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(261, 33, 'Pirojpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(262, 33, 'Nesarabad (Swarupkati) ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(263, 33, 'Zianagor ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(264, 34, 'Ali Kadam ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(265, 34, 'Bandarban Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(266, 34, 'Lama ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(267, 34, 'Naikhongchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(268, 34, 'Rowangchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(269, 34, 'Ruma ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(270, 34, 'Thanchi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(271, 35, 'Akhaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(272, 35, 'Bancharampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(273, 35, 'Brahmanbaria Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(274, 35, 'Kasba ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(275, 35, 'Nabinagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(276, 35, 'Nasirnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(277, 35, 'Sarail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(278, 35, 'Ashuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(279, 35, 'Bijoynagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(280, 36, 'Chandpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(281, 36, 'Faridganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(282, 36, 'Haimchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(283, 36, 'Haziganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(284, 36, 'Kachua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(285, 36, 'Matlab Dakshin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(286, 36, 'Matlab Uttar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(287, 36, 'Shahrasti ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(288, 37, 'Anwara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(289, 37, 'Banshkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(290, 37, 'Boalkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(291, 37, 'Chandanaish ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(292, 37, 'Fatikchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(293, 37, 'Hathazari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(294, 37, 'Lohagara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(295, 37, 'Mirsharai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(296, 37, 'Patiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(297, 37, 'Rangunia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(298, 37, 'Raozan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(299, 37, 'Sandwip ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(300, 37, 'Satkania ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(301, 37, 'Sitakunda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(302, 37, 'Bandor (Chittagong Port) Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(303, 37, 'Chandgaon Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(304, 37, 'Double Mooring Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(305, 37, 'Kotwali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(306, 37, 'Pahartali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(307, 37, 'Panchlaish Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(308, 38, 'Barura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(309, 38, 'Brahmanpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(310, 38, 'Burichang ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(311, 38, 'Chandina ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(312, 38, 'Chauddagram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(313, 38, 'Daudkandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(314, 38, 'Debidwar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(315, 38, 'Homna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(316, 38, 'Laksam ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(317, 38, 'Muradnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(318, 38, 'Nangalkot ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(319, 38, 'Comilla Adarsha Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(320, 38, 'Meghna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(321, 38, 'Titas ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(322, 38, 'Monohargonj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(323, 38, 'Comilla Sadar Dakshin ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(324, 39, 'Chakaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(325, 39, 'Cox\'s Bazar Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(326, 39, 'Kutubdia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(327, 39, 'Maheshkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(328, 39, 'Ramu ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(329, 39, 'Teknaf ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(330, 39, 'Ukhia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(331, 39, 'Pekua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(332, 40, 'Chhagalnaiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(333, 40, 'Daganbhuiyan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(334, 40, 'Feni Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(335, 40, 'Parshuram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(336, 40, 'Sonagazi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(337, 40, 'Fulgazi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(338, 41, 'Dighinala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(339, 41, 'Khagrachhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(340, 41, 'Lakshmichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(341, 41, 'Mahalchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(342, 41, 'Manikchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(343, 41, 'Matiranga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(344, 41, 'Panchhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(345, 41, 'Ramgarh ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(346, 42, 'Lakshmipur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(347, 42, 'Raipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(348, 42, 'Ramganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(349, 42, 'Ramgati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(350, 42, 'Kamalnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(351, 43, 'Begumganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(352, 43, 'Noakhali Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(353, 43, 'Chatkhil ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(354, 43, 'Companiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(355, 43, 'Hatiya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(356, 43, 'Senbagh ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(357, 43, 'Sonaimuri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(358, 43, 'Subarnachar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(359, 43, 'Kabirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(360, 44, 'Bagaichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(361, 44, 'Barkal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(362, 44, 'Kawkhali (Betbunia) ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(363, 44, 'Belaichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(364, 44, 'Kaptai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(365, 44, 'Juraichhari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(366, 44, 'Langadu ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(367, 44, 'Naniyachar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(368, 44, 'Rajasthali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(369, 44, 'Rangamati Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(370, 45, 'Dhamrai ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(371, 45, 'Dohar ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(372, 45, 'Dhaka City Corporation Area', 80, 0, 1, NULL, '2023-08-14 07:55:43'),
(373, 45, 'Keraniganj ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(374, 45, 'Nawabganj ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(375, 45, 'Savar ', 100, 0, 1, NULL, '2023-08-14 07:55:43'),
(376, 46, 'Alfadanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(377, 46, 'Bhanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(378, 46, 'Boalmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(379, 46, 'Charbhadrasan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(380, 46, 'Faridpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(381, 46, 'Madhukhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(382, 46, 'Nagarkanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(383, 46, 'Sadarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(384, 46, 'Saltha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(385, 47, 'Gazipur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(386, 47, 'Kaliakair ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(387, 47, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(388, 47, 'Kapasia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(389, 47, 'Sreepur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(390, 48, 'Gopalganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(391, 48, 'Kashiani ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(392, 48, 'Kotalipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(393, 48, 'Muksudpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(394, 48, 'Tungipara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(395, 49, 'Baksiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(396, 49, 'Dewanganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(397, 49, 'Islampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(398, 49, 'Jamalpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(399, 49, 'Madarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(400, 49, 'Melandaha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(401, 49, 'Sarishabari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(402, 50, 'Astagram ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(403, 50, 'Bajitpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(404, 50, 'Bhairab ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(405, 50, 'Hossainpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(406, 50, 'Itna ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(407, 50, 'Karimganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(408, 50, 'Katiadi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(409, 50, 'Kishoreganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(410, 50, 'Kuliarchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(411, 50, 'Mithamain ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(412, 50, 'Nikli ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(413, 50, 'Pakundia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(414, 50, 'Tarail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(415, 51, 'Rajoir ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(416, 51, 'Madaripur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(417, 51, 'Kalkini ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(418, 51, 'Shibchar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(419, 52, 'Daulatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(420, 52, 'Ghior ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(421, 52, 'Harirampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(422, 52, 'Manikgonj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(423, 52, 'Saturia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(424, 52, 'Shivalaya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(425, 52, 'Singair ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(426, 53, 'Gazaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(427, 53, 'Lohajang ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(428, 53, 'Munshiganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(429, 53, 'Sirajdikhan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(430, 53, 'Sreenagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(431, 53, 'Tongibari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(432, 54, 'Bhaluka ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(433, 54, 'Dhobaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(434, 54, 'Fulbaria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(435, 54, 'Gaffargaon ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(436, 54, 'Gauripur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(437, 54, 'Haluaghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(438, 54, 'Ishwarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(439, 54, 'Mymensingh Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(440, 54, 'Muktagachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(441, 54, 'Nandail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(442, 54, 'Phulpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(443, 54, 'Trishal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(444, 54, 'Tara Khanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(445, 55, 'Araihazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(446, 55, 'Bandar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(447, 55, 'Narayanganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(448, 55, 'Rupganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(449, 55, 'Sonargaon ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(450, 57, 'Atpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(451, 57, 'Barhatta ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(452, 57, 'Durgapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(453, 57, 'Khaliajuri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(454, 57, 'Kalmakanda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(455, 57, 'Kendua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(456, 57, 'Madan ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(457, 57, 'Mohanganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(458, 57, 'Netrokona Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(459, 57, 'Purbadhala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(460, 58, 'Baliakandi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(461, 58, 'Goalandaghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(462, 58, 'Pangsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(463, 58, 'Rajbari Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(464, 58, 'Kalukhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(465, 59, 'Bhedarganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(466, 59, 'Damudya ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(467, 59, 'Gosairhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(468, 59, 'Naria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(469, 59, 'Shariatpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(470, 59, 'Zanjira ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(471, 59, 'Shakhipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(472, 60, 'Jhenaigati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(473, 60, 'Nakla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(474, 60, 'Nalitabari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(475, 60, 'Sherpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(476, 60, 'Sreebardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(477, 61, 'Gopalpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(478, 61, 'Basail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(479, 61, 'Bhuapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(480, 61, 'Delduar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(481, 61, 'Ghatail ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(482, 61, 'Kalihati ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(483, 61, 'Madhupur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(484, 61, 'Mirzapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(485, 61, 'Nagarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(486, 61, 'Sakhipur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(487, 61, 'Dhanbari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(488, 61, 'Tangail Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(489, 56, 'Narsingdi Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(490, 56, 'Belabo ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(491, 56, 'Monohardi ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(492, 56, 'Palash ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(493, 56, 'Raipura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(494, 56, 'Shibpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(495, 62, 'Bagerhat Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(496, 62, 'Chitalmari ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(497, 62, 'Fakirhat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(498, 62, 'Kachua ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(499, 62, 'Mollahat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(500, 62, 'Mongla ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(501, 62, 'Morrelganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(502, 62, 'Rampal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(503, 62, 'Sarankhola ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(504, 63, 'Alamdanga ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(505, 63, 'Chuadanga Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(506, 63, 'Damurhuda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(507, 63, 'Jibannagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(508, 64, 'Abhaynagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(509, 64, 'Bagherpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(510, 64, 'Chaugachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(511, 64, 'Jhikargachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(512, 64, 'Keshabpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(513, 64, 'Jessore Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(514, 64, 'Manirampur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(515, 64, 'Sharsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(516, 65, 'Harinakunda ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(517, 65, 'Jhenaidah Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(518, 65, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(519, 65, 'Kotchandpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(520, 65, 'Maheshpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(521, 65, 'Shailkupa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(522, 66, 'Batiaghata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(523, 66, 'Dacope ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(524, 66, 'Dumuria ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(525, 66, 'Dighalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(526, 66, 'Koyra ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(527, 66, 'Paikgachha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(528, 66, 'Phultala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(529, 66, 'Rupsha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(530, 66, 'Terokhada ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(531, 66, 'Daulatpur Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(532, 66, 'Khalishpur Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(533, 66, 'Khan Jahan Ali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(534, 66, 'Kotwali Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(535, 66, 'Sonadanga Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(536, 66, 'Harintana Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(537, 67, 'Bheramara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(538, 67, 'Daulatpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(539, 67, 'Khoksa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(540, 67, 'Kumarkhali ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(541, 67, 'Kushtia Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(542, 67, 'Mirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(543, 67, 'Shekhpara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(544, 68, 'Magura Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(545, 68, 'Mohammadpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(546, 68, 'Shalikha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(547, 68, 'Sreepur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(548, 69, 'Gangni ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(549, 69, 'Meherpur Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(550, 69, 'Mujibnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(551, 70, 'Kalia ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(552, 70, 'Lohagara ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(553, 70, 'Narail Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(554, 70, 'Naragati Thana', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(555, 71, 'Assasuni ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(556, 71, 'Debhata ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(557, 71, 'Kalaroa ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(558, 71, 'Kaliganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(559, 71, 'Satkhira Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(560, 71, 'Shyamnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(561, 71, 'Tala ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(562, 88, 'Ajmiriganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(563, 88, 'Bahubal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(564, 88, 'Baniyachong ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(565, 88, 'Chunarughat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(566, 88, 'Habiganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(567, 88, 'Lakhai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(568, 88, 'Madhabpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(569, 88, 'Nabiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(570, 89, 'Barlekha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(571, 89, 'Kamalganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(572, 89, 'Kulaura ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(573, 89, 'Moulvibazar Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(574, 89, 'Rajnagar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(575, 89, 'Sreemangal ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(576, 89, 'Juri ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(577, 90, 'Bishwamvarpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(578, 90, 'Chhatak ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(579, 90, 'Derai ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(580, 90, 'Dharampasha ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(581, 90, 'Dowarabazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(582, 90, 'Jagannathpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(583, 90, 'Jamalganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(584, 90, 'Sullah ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(585, 90, 'Sunamganj Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(586, 90, 'Tahirpur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(587, 90, 'South Sunamganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(588, 91, 'Balaganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(589, 91, 'Beanibazar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(590, 91, 'Bishwanath ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(591, 91, 'Companigonj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(592, 91, 'Fenchuganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(593, 91, 'Golapganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(594, 91, 'Gowainghat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(595, 91, 'Jaintiapur ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(596, 91, 'Kanaighat ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(597, 91, 'Sylhet Sadar ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(598, 91, 'Zakiganj ', 120, 0, 1, NULL, '2023-08-14 07:55:43'),
(599, 91, 'South Shurma ', 120, 0, 1, NULL, '2023-08-14 07:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT 'header',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Header Menu', 'header', 1, '2023-08-05 16:25:11', '2023-08-05 16:25:11'),
(4, 'CUSTOMER SERVICE', 'footer', 1, '2023-08-05 16:27:31', '2023-08-29 12:30:21'),
(5, 'CORPORATE INFO', 'footer', 1, '2023-08-05 16:27:37', '2023-08-29 12:30:34'),
(6, 'MY ACCOUNT', 'footer', 1, '2023-08-29 10:49:28', '2023-08-29 12:30:44'),
(7, 'Category Menu', 'sidebar', 1, '2023-08-29 10:51:14', '2023-08-29 10:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `menu_id`, `parent_id`, `category_id`, `page_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
(33, 'new page', 1, NULL, NULL, 3, 1, 1, '2023-08-06 13:57:43', '2023-08-06 13:57:43'),
(34, 'test page', 1, 33, NULL, 4, 1, 1, '2023-08-06 13:57:43', '2023-08-06 14:10:28'),
(35, 'Corporate', 1, NULL, 10, NULL, 2, 1, '2023-08-06 13:57:43', '2023-08-06 14:25:20'),
(36, 'Newspaper', 1, 35, 11, NULL, 1, 1, '2023-08-06 13:57:43', '2023-08-06 14:10:28'),
(37, 'new page', 5, NULL, NULL, 3, 3, 1, '2023-08-06 14:30:06', '2023-08-06 14:30:06'),
(38, 'test page', 5, NULL, NULL, 4, 4, 1, '2023-08-06 14:30:06', '2023-08-06 14:30:06'),
(39, 'Corporate', 5, NULL, 10, NULL, 5, 1, '2023-08-06 14:30:06', '2023-08-06 14:30:06'),
(40, 'Newspaper', 5, NULL, 11, NULL, 6, 1, '2023-08-06 14:30:06', '2023-08-06 14:30:06'),
(62, 'Audio & Sound Devices', 7, NULL, 17, NULL, 7, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(63, 'Cameras & Photo', 7, NULL, 26, NULL, 8, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(64, 'COMPUTERS', 7, NULL, 9, NULL, 9, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(65, 'Computers & Networking', 7, NULL, 22, NULL, 10, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(66, 'Electronics', 7, NULL, 16, NULL, 11, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(67, 'Game Devices & Accessories', 7, NULL, 19, NULL, 12, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(68, 'HOME APPLIANCES', 7, NULL, 15, NULL, 13, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(69, 'Laptop & Accessories', 7, NULL, 23, NULL, 14, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(70, 'Monitor & Television', 7, NULL, 27, NULL, 15, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(71, 'Office Devices', 7, NULL, 25, NULL, 16, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(72, 'Security Devices', 7, NULL, 20, NULL, 17, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(73, 'Smart Home', 7, NULL, 21, NULL, 18, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(74, 'Smart Watches', 7, NULL, 24, NULL, 19, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31'),
(75, 'Smartphone & Tablets', 7, NULL, 18, NULL, 20, 1, '2023-09-10 09:20:31', '2023-09-10 09:20:31');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_26_070249_create_permission_tables', 1),
(6, '2023_04_29_104538_create_admin_menus_table', 1),
(7, '2023_04_30_095422_create_jobs_table', 1),
(8, '2023_06_04_103415_create_admin_menu_actions_table', 1),
(9, '2023_07_16_193339_create_settings_table', 2),
(22, '2023_08_02_000217_create_pages_table', 10),
(25, '2023_08_05_220022_create_menus_table', 12),
(26, '2023_08_05_220028_create_menu_items_table', 12),
(32, '2023_08_08_095304_create_admin_settings_table', 13),
(34, '2023_08_09_115019_create_categories_table', 14),
(39, '2023_08_09_175745_create_product_prices_table', 17),
(40, '2023_08_09_175752_create_product_colors_table', 17),
(41, '2023_08_09_175758_create_product_sizes_table', 17),
(42, '2023_08_09_150125_create_colors_table', 18),
(43, '2023_08_09_150132_create_sizes_table', 18),
(46, '2023_08_09_163637_create_brands_table', 20),
(52, '2023_08_09_161545_create_products_table', 21),
(53, '2023_08_10_113457_add_deleted_at_to_products_table', 21),
(58, '2023_08_29_153258_create_sliders_table', 23),
(60, '2023_08_30_114536_create_home_product_sections_table', 24),
(63, '2023_09_02_152658_create_attributes_table', 26),
(64, '2023_09_02_153152_create_attribute_values_table', 27),
(65, '2023_09_05_104150_create_product_stocks_table', 28),
(70, '2023_09_09_111028_create_locations_table', 32),
(71, '2023_08_10_115133_create_order_products_table', 33),
(72, '2023_09_06_182742_create_shipping_addresses_table', 34),
(73, '2023_08_10_115126_create_orders_table', 35),
(74, '2023_09_09_183847_create_wishlists_table', 36),
(75, '2023_09_12_122146_create_flashdeals_table', 37),
(76, '2023_09_12_122242_create_flashdeal_products_table', 37),
(79, '2023_09_13_175745_create_reviews_table', 38);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 21);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `shipping_address_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_charge` double(8,2) NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `paid` double(8,2) NOT NULL,
  `due` double(8,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL DEFAULT 'cod',
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `pending_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `processing_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `successed_at` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `return_at` timestamp NULL DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `user_name`, `user_phone`, `shipping_address_id`, `shipping_charge`, `sub_total`, `discount`, `total`, `paid`, `due`, `payment_method`, `coupon_id`, `status`, `pending_at`, `confirmed_at`, `processing_at`, `delivered_at`, `successed_at`, `canceled_at`, `return_at`, `order_note`, `created_at`, `updated_at`) VALUES
(10, 'R330832', 22, 'Syed Amir Ali', '01817807594', 6, 0.00, 2100.00, 0.00, 2100.00, 0.00, 2100.00, 'cash', NULL, 'Pending', '2023-10-14 07:57:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-14 07:57:12', '2023-10-14 07:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `flash_deal_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_thumbnail` varchar(255) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `sale_price` double(8,2) NOT NULL,
  `regular_price` double(8,2) NOT NULL,
  `discount_price` double(8,2) NOT NULL DEFAULT 0.00,
  `vendor_price` double(8,2) NOT NULL DEFAULT 0.00,
  `reseller_price` double(8,2) NOT NULL DEFAULT 0.00,
  `order_price` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `variant_id`, `flash_deal_id`, `flash_deal_item_id`, `product_name`, `product_thumbnail`, `discount`, `sale_price`, `regular_price`, `discount_price`, `vendor_price`, `reseller_price`, `order_price`, `quantity`, `created_at`, `updated_at`) VALUES
(17, 10, 64, 131, NULL, NULL, 'হাফ সিল্ক শাড়ি', 'media/product/2023-10-14-jm4CBxnwuN0IMPLmzdCZXwt4yhV2m2IfN83sK9oD.webp', 0.00, 2100.00, 2100.00, 2100.00, 0.00, 0.00, 2100.00, 1, '2023-10-14 07:57:12', '2023-10-14 07:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `sub_title`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'new page', 'new page', 'new-page', '<p>sdfsdf</p>', 0, '2023-08-05 17:30:14', '2023-10-07 03:22:56'),
(4, 'test page', 'test page', 'test-page', '<p>sfsdfsdf</p>', 0, '2023-08-05 17:30:26', '2023-10-07 03:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'web', '2023-07-10 16:40:27', '2023-07-10 18:05:32'),
(2, 'User Management', 'web', '2023-07-10 16:40:43', '2023-07-10 16:40:43'),
(4, 'Role Setup', 'web', '2023-07-10 16:41:55', '2023-07-10 16:41:55'),
(5, 'User Setup', 'web', '2023-07-10 16:42:09', '2023-07-10 16:42:09'),
(6, 'admin.role.create', 'web', '2023-07-10 16:45:14', '2023-07-10 16:45:14'),
(7, 'admin.role.store', 'web', '2023-07-10 16:45:55', '2023-07-10 16:45:55'),
(8, 'admin.role.edit', 'web', '2023-07-10 16:46:07', '2023-07-10 16:46:07'),
(9, 'admin.role.update', 'web', '2023-07-10 16:46:16', '2023-07-10 16:46:16'),
(10, 'admin.role.destroy', 'web', '2023-07-10 16:46:26', '2023-07-10 16:46:26'),
(11, 'admin.user.create', 'web', '2023-07-10 16:48:07', '2023-07-10 16:48:07'),
(12, 'admin.user.store', 'web', '2023-07-10 16:48:16', '2023-07-10 16:48:16'),
(13, 'admin.user.edit', 'web', '2023-07-10 16:48:32', '2023-07-10 16:48:32'),
(14, 'admin.user.update', 'web', '2023-07-10 16:48:48', '2023-07-10 16:48:48'),
(15, 'admin.user.destroy', 'web', '2023-07-10 16:48:56', '2023-07-10 16:48:56'),
(18, 'admin.user.password', 'web', '2023-07-13 15:00:14', '2023-07-13 15:00:14'),
(19, 'admin.user.password-update', 'web', '2023-07-13 15:06:59', '2023-07-13 15:06:59'),
(21, 'Site Settings', 'web', '2023-07-16 14:25:12', '2023-07-16 14:25:12'),
(22, 'App info', 'web', '2023-07-16 14:44:05', '2023-07-16 14:44:05'),
(23, 'admin.settings.update', 'web', '2023-07-16 14:46:53', '2023-07-16 14:46:53'),
(24, 'Menu Setup', 'web', '2023-07-16 15:59:24', '2023-07-16 15:59:24'),
(25, 'admin.admin-menu.create', 'web', '2023-07-16 16:01:01', '2023-07-16 16:01:01'),
(26, 'admin.admin-menu.store', 'web', '2023-07-16 16:01:10', '2023-07-16 16:01:10'),
(27, 'admin.admin-menu.destroy', 'web', '2023-07-16 16:01:28', '2023-07-16 16:01:28'),
(28, 'admin.admin-menu.update', 'web', '2023-07-16 16:01:37', '2023-07-16 16:01:37'),
(29, 'admin.admin-menuAction.index', 'web', '2023-07-16 16:03:42', '2023-07-16 16:19:09'),
(30, 'admin.admin-menuAction.create', 'web', '2023-07-16 16:03:53', '2023-07-16 16:18:56'),
(31, 'admin.admin-menuAction.store', 'web', '2023-07-16 16:04:17', '2023-07-16 16:18:50'),
(32, 'admin.admin-menuAction.update', 'web', '2023-07-16 16:04:30', '2023-07-16 16:15:23'),
(33, 'admin.admin-menuAction.destroy', 'web', '2023-07-16 16:04:45', '2023-07-16 16:18:15'),
(34, 'admin.admin-menuAction.status', 'web', '2023-07-16 16:05:10', '2023-07-16 16:18:26'),
(35, 'admin.admin-menuAction.edit', 'web', '2023-07-16 16:20:16', '2023-07-16 16:20:16'),
(36, 'admin.admin-menu.edit', 'web', '2023-07-18 08:47:07', '2023-07-18 08:47:07'),
(50, 'admin.theme-category.store', 'web', '2023-08-01 15:36:44', '2023-08-01 15:36:44'),
(52, 'Site Menu', 'web', '2023-08-01 17:52:44', '2023-08-01 17:52:44'),
(60, 'Page Setup', 'web', '2023-08-04 17:05:07', '2023-08-04 17:05:07'),
(61, 'admin.page.create', 'web', '2023-08-04 17:19:30', '2023-08-04 17:19:30'),
(62, 'admin.page.store', 'web', '2023-08-04 17:20:02', '2023-08-04 17:20:02'),
(63, 'admin.page.edit', 'web', '2023-08-04 17:20:22', '2023-08-04 17:20:22'),
(64, 'admin.page.update', 'web', '2023-08-04 17:20:33', '2023-08-04 17:20:33'),
(65, 'admin.page.destroy', 'web', '2023-08-04 17:20:42', '2023-08-04 17:20:42'),
(66, 'admin.rolePermission.edit', 'web', '2023-08-06 15:15:01', '2023-08-06 15:15:01'),
(67, 'admin.rolePermission.update', 'web', '2023-08-06 15:15:27', '2023-08-06 15:15:27'),
(68, 'Admin Info', 'web', '2023-08-08 04:40:09', '2023-08-08 04:40:09'),
(69, 'Product Management', 'web', '2023-08-09 07:21:50', '2023-08-09 07:21:50'),
(70, 'All Products', 'web', '2023-08-09 07:22:37', '2023-08-09 07:22:37'),
(71, 'Add New Product', 'web', '2023-08-09 07:23:01', '2023-08-09 07:23:01'),
(72, 'Basic Setup', 'web', '2023-08-09 07:28:51', '2023-08-09 07:28:51'),
(73, 'Category Setup', 'web', '2023-08-09 07:30:58', '2023-08-09 07:30:58'),
(76, 'Brands', 'web', '2023-08-09 09:28:41', '2023-08-09 09:28:41'),
(77, 'admin.menu.create', 'web', '2023-08-09 10:59:18', '2023-08-09 10:59:18'),
(78, 'admin.menu.store', 'web', '2023-08-09 10:59:28', '2023-08-09 10:59:28'),
(79, 'admin.menu.edit', 'web', '2023-08-09 10:59:34', '2023-08-09 10:59:34'),
(80, 'admin.menu.update', 'web', '2023-08-09 10:59:44', '2023-08-09 10:59:44'),
(81, 'admin.menu.destroy', 'web', '2023-08-09 10:59:51', '2023-08-09 10:59:51'),
(82, 'admin.admin-settings.update', 'web', '2023-08-09 11:00:37', '2023-08-09 11:00:54'),
(83, 'admin.product.edit', 'web', '2023-08-09 11:02:17', '2023-08-09 11:02:17'),
(84, 'admin.product.update', 'web', '2023-08-09 11:02:24', '2023-08-09 11:02:24'),
(85, 'admin.product.destroy', 'web', '2023-08-09 11:02:35', '2023-08-09 11:02:35'),
(86, 'admin.product.store', 'web', '2023-08-09 11:02:58', '2023-08-09 11:02:58'),
(87, 'admin.category.edit', 'web', '2023-08-09 11:03:29', '2023-08-09 11:03:29'),
(88, 'admin.category.store', 'web', '2023-08-09 11:03:39', '2023-08-09 11:03:39'),
(89, 'admin.category.update', 'web', '2023-08-09 11:03:49', '2023-08-09 11:03:49'),
(90, 'admin.category.destroy', 'web', '2023-08-09 11:04:00', '2023-08-09 11:04:00'),
(99, 'admin.brand.store', 'web', '2023-08-09 11:06:00', '2023-08-09 11:06:00'),
(100, 'admin.brand.edit', 'web', '2023-08-09 11:06:04', '2023-08-09 11:06:04'),
(101, 'admin.brand.update', 'web', '2023-08-09 11:06:22', '2023-08-09 11:06:22'),
(102, 'admin.brand.destroy', 'web', '2023-08-09 11:06:29', '2023-08-09 11:06:29'),
(103, 'Slider Banner', 'web', '2023-08-29 09:41:11', '2023-08-29 09:41:11'),
(104, 'admin.slider.store', 'web', '2023-08-29 09:52:08', '2023-08-29 09:52:08'),
(105, 'admin.slider.edit', 'web', '2023-08-29 09:52:14', '2023-08-29 09:52:14'),
(106, 'admin.slider.update', 'web', '2023-08-29 09:52:20', '2023-08-29 09:52:20'),
(107, 'admin.slider.destroy', 'web', '2023-08-29 09:52:27', '2023-08-29 09:52:27'),
(108, 'Home Page Section Setup', 'web', '2023-08-30 06:08:11', '2023-08-30 06:08:11'),
(109, 'admin.home-product-section.create', 'web', '2023-08-30 06:08:51', '2023-08-30 06:08:51'),
(110, 'admin.home-product-section.store', 'web', '2023-08-30 06:08:59', '2023-08-30 06:08:59'),
(111, 'admin.home-product-section.edit', 'web', '2023-08-30 06:09:53', '2023-08-30 06:09:53'),
(112, 'admin.home-product-section.update', 'web', '2023-08-30 06:09:59', '2023-08-30 06:09:59'),
(113, 'admin.home-product-section.destroy', 'web', '2023-08-30 06:10:06', '2023-08-30 06:10:06'),
(114, 'Attribute Setup', 'web', '2023-09-03 09:19:35', '2023-09-03 09:19:35'),
(115, 'admin.attribute.store', 'web', '2023-09-04 09:33:00', '2023-09-04 09:33:00'),
(116, 'admin.attribute.edit', 'web', '2023-09-04 09:33:05', '2023-09-04 09:33:05'),
(117, 'admin.attribute.update', 'web', '2023-09-04 09:33:10', '2023-09-04 09:33:10'),
(118, 'admin.attribute.destroy', 'web', '2023-09-04 09:33:15', '2023-09-04 09:33:15'),
(119, 'admin.attribute-value.index', 'web', '2023-09-04 09:33:41', '2023-09-04 09:33:41'),
(120, 'admin.attribute-value.store', 'web', '2023-09-04 09:33:50', '2023-09-04 09:33:50'),
(121, 'admin.attribute-value.edit', 'web', '2023-09-04 09:33:57', '2023-09-04 09:33:57'),
(123, 'admin.attribute-value.update', 'web', '2023-09-04 09:34:17', '2023-09-04 09:34:17'),
(124, 'admin.attribute-value.destroy', 'web', '2023-09-04 09:34:27', '2023-09-04 09:34:27'),
(125, 'Location Setup', 'web', '2023-09-09 05:39:24', '2023-09-09 05:39:24'),
(126, 'admin.location.store', 'web', '2023-09-09 13:00:18', '2023-09-09 13:00:18'),
(127, 'admin.location.edit', 'web', '2023-09-09 13:00:23', '2023-09-09 13:00:23'),
(128, 'admin.location.update', 'web', '2023-09-09 13:00:31', '2023-09-09 13:00:31'),
(129, 'admin.location.destroy', 'web', '2023-09-09 13:00:37', '2023-09-09 13:00:54'),
(130, 'Customer Management', 'web', '2023-09-09 13:06:35', '2023-09-09 13:06:35'),
(131, 'admin.customers.destroy', 'web', '2023-09-09 13:15:10', '2023-09-09 13:15:10'),
(132, 'Order Management', 'web', '2023-09-10 04:23:40', '2023-09-10 04:23:40'),
(133, 'Marketing', 'web', '2023-09-12 09:57:18', '2023-09-12 09:57:18'),
(134, 'Flash Deals', 'web', '2023-09-12 09:58:26', '2023-09-12 09:58:26'),
(135, 'admin.order.view', 'web', '2023-09-12 14:14:09', '2023-09-12 14:14:09'),
(136, 'admin.order.edit', 'web', '2023-09-12 14:14:24', '2023-09-12 14:14:24'),
(137, 'Special Offer', 'web', '2023-10-18 08:09:42', '2023-10-18 08:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` varchar(32) NOT NULL DEFAULT 'new_arrival',
  `code` varchar(20) DEFAULT NULL,
  `category_id` text DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `stock_check` tinyint(1) DEFAULT NULL,
  `more_images` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `additional_info` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `alert_quantity` bigint(20) DEFAULT NULL,
  `min_order` bigint(20) NOT NULL DEFAULT 1,
  `max_order` bigint(20) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `variant_product` tinyint(4) NOT NULL DEFAULT 0,
  `attributes` text NOT NULL DEFAULT '[]',
  `choice_options` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type`, `code`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `stock_check`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(58, 'new_arrival', NULL, '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'হাফ সিল্ক শাড়ি', 'haf-silk-sadi', 'media/product/2023-10-14-PA97vnx7N3THDcoHkkzIVBCKsn0PuFzWPPQrHXMT.webp', NULL, 'media/product/2023-10-14-oE08wJWW4VKkD2xzw1TnGUGuKwdK3929vyMARGn8.webp|media/product/2023-10-14-8OiPHRH9xVgMQHh2HdUgqTpfWfzUUGx2uee4RkNW.webp', '<p>আমাদের হাফ সিল্ক শাড়ি সম্পূর্ণ নির্মিত সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত, সুবর্ণ মৌসুমের জন্য এবং প্রতিষ্ঠান কিংবা সাধারণ উপহারের জন্য একটি আদর্শ পণ্য।<br></p>', '<p>আমরা গর্বিতভাবে উপস্থাপন করছি আমাদের নতুন হাফ সিল্ক শাড়ি, যা প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ানের সুন্দর মিশ্রণ। এই শাড়ির ডিজাইন সমৃদ্ধ, এবং পার্টি, পুজো, বিয়ে, বা যে কোন উপহার দিনে উপযুক্ত। এটি প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী স্টাইল প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী অংশ হওয়ার কারণে এটি একটি আদর্শ পণ্য। আপনি এই অদ্ভুত শাড়ি দিয়ে আপনার প্রকাশ সাজাতে পারেন এবং অত্যন্ত শৃঙ্গারিক দৃষ্টি আকর্ষণ করতে পারেন।<br></p>', '<p>আমরা গর্বিতভাবে উপস্থাপন করছি আমাদের নতুন হাফ সিল্ক শাড়ি, যা প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ানের সুন্দর মিশ্রণ। এই শাড়ির ডিজাইন সমৃদ্ধ, এবং পার্টি, পুজো, বিয়ে, বা যে কোন উপহার দিনে উপযুক্ত। এটি প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী স্টাইল প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী অংশ হওয়ার কারণে এটি একটি আদর্শ পণ্য। আপনি এই অদ্ভুত শাড়ি দিয়ে আপনার প্রকাশ সাজাতে পারেন এবং অত্যন্ত শৃঙ্গারিক দৃষ্টি আকর্ষণ করতে পারেন।<br></p>', 'প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত হাফ সিল্ক শাড়ি - আদর্শ প্রতিষ্ঠানের শৃঙ্গার এবং শান্তি সুলভ করুন', 'আমরা আপনার প্রকাশে উঠানোর জন্য প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত হাফ সিল্ক শাড়ি প্রদান করি, যা আপনার শৃঙ্গারিক অদ্ভুততা এবং সুন্দরতাকে বঢ়াতে সাহায্য করতে পারে। বিয়ে, পার্টি, বা উপহারের জন্য এই আদর্শ শাড়ি সবকিছুতে অনুভব করতে সুপারিশ করে।', 'হাফ সিল্ক শাড়ি, Half Silk Sari, প্রাকৃতিক সিল্ক শাড়ি, Natural Silk Sari, শান্তি শাড়ি, Peaceful Sari, বিয়ের শাড়ি, Wedding Sari, পার্টি শাড়ি, Party Sari, সজীব শাড়ি, Elegant Sari, শৃঙ্গারিক শাড়ি, Glamorous Sari, সুন্দর মৌসুমের শাড়ি, Beautiful Seasonal Sari, উপহার শাড়ি, Gift Sari', NULL, 1, 5, NULL, NULL, 0, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Yellow\"]}]', 1, '2023-10-14 01:48:13', '2023-10-14 06:54:01', '2023-10-14 06:54:01'),
(59, 'new_arrival', NULL, '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'হাফ সিল্ক শাড়ি', 'haf-silk-sadi-2', 'media/product/2023-10-14-WphlIhnO1bPpLGRKTzyGVioBE5Qrb77YleaKXyv4.webp', NULL, 'media/product/2023-10-14-7ClI49i6x7uc83Gv4hhdbPzaDLGmfkcfoHVdwoeD.webp|media/product/2023-10-14-CliOm3Jb7vL4I7yVMX5p8dj3sp7ndwwJ7vobqHNo.webp', '<p>আমাদের হাফ সিল্ক শাড়ি সম্পূর্ণ নির্মিত সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত, সুবর্ণ মৌসুমের জন্য এবং প্রতিষ্ঠান কিংবা সাধারণ উপহারের জন্য একটি আদর্শ পণ্য।<br></p>', '<p>আমরা গর্বিতভাবে উপস্থাপন করছি আমাদের নতুন হাফ সিল্ক শাড়ি, যা প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ানের সুন্দর মিশ্রণ। এই শাড়ির ডিজাইন সমৃদ্ধ, এবং পার্টি, পুজো, বিয়ে, বা যে কোন উপহার দিনে উপযুক্ত। এটি প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী স্টাইল প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী অংশ হওয়ার কারণে এটি একটি আদর্শ পণ্য। আপনি এই অদ্ভুত শাড়ি দিয়ে আপনার প্রকাশ সাজাতে পারেন এবং অত্যন্ত শৃঙ্গারিক দৃষ্টি আকর্ষণ করতে পারেন।<br></p>', '<p>আমরা গর্বিতভাবে উপস্থাপন করছি আমাদের নতুন হাফ সিল্ক শাড়ি, যা প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ানের সুন্দর মিশ্রণ। এই শাড়ির ডিজাইন সমৃদ্ধ, এবং পার্টি, পুজো, বিয়ে, বা যে কোন উপহার দিনে উপযুক্ত। এটি প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী স্টাইল প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী অংশ হওয়ার কারণে এটি একটি আদর্শ পণ্য। আপনি এই অদ্ভুত শাড়ি দিয়ে আপনার প্রকাশ সাজাতে পারেন এবং অত্যন্ত শৃঙ্গারিক দৃষ্টি আকর্ষণ করতে পারেন।<br></p>', 'প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত হাফ সিল্ক শাড়ি - আদর্শ প্রতিষ্ঠানের শৃঙ্গার এবং শান্তি সুলভ করুন', 'আমরা আপনার প্রকাশে উঠানোর জন্য প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত হাফ সিল্ক শাড়ি প্রদান করি, যা আপনার শৃঙ্গারিক অদ্ভুততা এবং সুন্দরতাকে বঢ়াতে সাহায্য করতে পারে। বিয়ে, পার্টি, বা উপহারের জন্য এই আদর্শ শাড়ি সবকিছুতে অনুভব করতে সুপারিশ করে।', 'হাফ সিল্ক শাড়ি, Half Silk Sari, প্রাকৃতিক সিল্ক শাড়ি, Natural Silk Sari, শান্তি শাড়ি, Peaceful Sari, বিয়ের শাড়ি, Wedding Sari, পার্টি শাড়ি, Party Sari, সজীব শাড়ি, Elegant Sari, শৃঙ্গারিক শাড়ি, Glamorous Sari, সুন্দর মৌসুমের শাড়ি, Beautiful Seasonal Sari, উপহার শাড়ি, Gift Sari', NULL, 1, 5, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Yellow\"]}]', 1, '2023-10-14 01:51:04', '2023-10-14 06:54:01', '2023-10-14 06:54:01'),
(60, 'new_arrival', NULL, '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'Test Product', 'test-product', 'media/product/2023-10-14-YQYHPd8a9i8s8u0RVxAL8oumED74SyANrGJwuwTE.webp', NULL, 'media/product/2023-10-14-XGfse10NmBcUPRn72xZlOM3wAN5I8oXiGJo2R2EM.webp|media/product/2023-10-14-F6NlASzAJpjIu75usmLprDASuXpMs1i87VMWHaVz.webp|media/product/2023-10-14-MQaWdmfewlStyHw14YNlYk0tVhoSr66ETcg5KzVC.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-10-14 03:53:48', '2023-10-14 06:41:44', '2023-10-14 06:41:44'),
(61, 'new_arrival', '5555', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'Web Design', 'web-design', 'media/product/2023-10-14-WpOgwFqgzevPMMsRE5f5honX0puaRRtFtflgOdwE.webp', NULL, 'media/product/2023-10-14-PIH9NGbLI5vqJR2704liwGlDxpYYElLuhkpluhbg.webp|media/product/2023-10-14-4FcbvQiOZhy4XPVt2iVk5scI2RGddCdRTAKUL6Dj.webp|media/product/2023-10-14-edDSm61BrDL8eGVtcBDGpTbXij1JC4YPq29Awgs8.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-10-14 04:31:23', '2023-10-14 06:41:44', '2023-10-14 06:41:44'),
(62, 'new_arrival', '55552', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 21, 21, 'Syed Amir Ali', 'syed-amir-ali', 'media/product/2023-10-14-OSmacg7aj9lsE4TMnmmwRokH57z8WhqPSd0wB0Lq.webp', NULL, 'media/product/2023-10-14-hlhnUTmJQMkWSG3M8oF6uVBiWCyGto1xQETTIxbZ.webp|media/product/2023-10-14-qZCpd5p7sv9JEFhOijG1zCd4j9AqlCocy6P5U2tM.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 06:26:44', '2023-10-14 06:41:44', '2023-10-14 06:41:44'),
(63, 'new_arrival', '55554', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"18\"],\"subchild_category_id\":[]}', NULL, 21, 21, 'Site Information', 'site-information', 'media/product/2023-10-14-mHJVmTZEA5BvmbeETt1cGHAC7uuUDIxvpCDN9CK1.webp', NULL, 'media/product/2023-10-14-655TFKVvSvPJeCfKmk3ue5VyebQQSJoSiwFIYbXs.webp|media/product/2023-10-14-o7Ugyzed1vTJdecOOtwQ3IBsHLRmPG4588sAH34w.webp|media/product/2023-10-14-aAMoEMBCsIfb5M516tiyXRYgTdUbpHuayRVTnCfp.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 06:40:38', '2023-10-14 06:41:44', '2023-10-14 06:41:44'),
(64, 'new_arrival', '#SHARE01', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 21, 15, 'হাফ সিল্ক শাড়ি', 'haf-silk-sadi-3', 'media/product/2023-10-14-jm4CBxnwuN0IMPLmzdCZXwt4yhV2m2IfN83sK9oD.webp', NULL, 'media/product/2023-10-14-ENa32Bd0AlXSCWktnMJtiVcH1sivGeWEwfHA7zEI.webp|media/product/2023-10-14-jqvkWCvI5SYr6oFgDnzgUfpKcpUK6N4CAZfD6l5a.webp', '<p>আমাদের হাফ সিল্ক শাড়ি সম্পূর্ণ নির্মিত সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত, সুবর্ণ মৌসুমের জন্য এবং প্রতিষ্ঠান কিংবা সাধারণ উপহারের জন্য একটি আদর্শ পণ্য।<br></p>', '<p>আমরা গর্বিতভাবে উপস্থাপন করছি আমাদের নতুন হাফ সিল্ক শাড়ি, যা প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ানের সুন্দর মিশ্রণ। এই শাড়ির ডিজাইন সমৃদ্ধ, এবং পার্টি, পুজো, বিয়ে, বা যে কোন উপহার দিনে উপযুক্ত। এটি প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী স্টাইল প্রতিষ্ঠানের সবচেয়ে সাহায্যকারী অংশ হওয়ার কারণে এটি একটি আদর্শ পণ্য। আপনি এই অদ্ভুত শাড়ি দিয়ে আপনার প্রকাশ সাজাতে পারেন এবং অত্যন্ত শৃঙ্গারিক দৃষ্টি আকর্ষণ করতে পারেন।<br></p>', NULL, 'প্রাকৃতিক সিল্ক হাফ সিল্ক শাড়ি - প্রতিষ্ঠানের শৃঙ্গার এবং শান্তি সুলভ করুন!', 'আমরা আপনার প্রকাশে উঠানোর জন্য প্রাকৃতিক সিল্ক এবং ন্যাটুরাল রেয়ান মিশ্রিত হাফ সিল্ক শাড়ি প্রদান করি, যা আপনার শৃঙ্গারিক অদ্ভুততা এবং সুন্দরতাকে বঢ়াতে সাহায্য করতে পারে। বিয়ে, পার্টি, বা উপহারের জন্য এই আদর্শ শাড়ি সবকিছুতে অনুভব করতে সুপারিশ করে।', 'হাফ সিল্ক শাড়ি, Half Silk Sari, প্রাকৃতিক সিল্ক শাড়ি, Natural Silk Sari, শান্তি শাড়ি, Peaceful Sari, বিয়ের শাড়ি, Wedding Sari, পার্টি শাড়ি, Party Sari, সজীব শাড়ি, Elegant Sari, শৃঙ্গারিক শাড়ি, Glamorous Sari, সুন্দর মৌসুমের শাড়ি, Beautiful Seasonal Sari, উপহার শাড়ি, Gift Sari', NULL, 1, 5, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Blue\",\"Yellow\"]}]', 1, '2023-10-14 06:53:07', '2023-10-18 08:03:35', NULL),
(65, 'new_arrival', 'JS-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'জামদানি (কাজ করা)', 'jamdani-kaj-kra', 'media/product/2023-10-14-JL4OVwQVEaOefGcC87wWeIs8qRXAnx7Gh07lbHz9.webp', NULL, 'media/product/2023-10-14-QXA8Q0D885xenbyRpKMKsJ9p9N5be48fGMJhf6L0.webp|media/product/2023-10-14-Ph2sJSKSyngaIb9vnawr64VARHntTNodakR46rIC.webp|media/product/2023-10-14-T6ifA65LrX1RvpE0FvYCGIBPfgB5hNBDRMshpoWi.webp|media/product/2023-10-14-6hXOMIw3Z4dHXu4xBVdLhOdruG3Zd7QnwfDcecP0.webp|media/product/2023-10-14-pxe4HPOHKCQJCUg1OSyoZiLy2LzSuBByypS21b2P.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 13:48:20', '2023-10-18 08:03:35', NULL),
(66, 'new_arrival', 'HS-002', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'হাফ সিল্ক (হ্যান্ডলুম কাজ)', 'haf-silk-hzandlum-kaj', 'media/product/2023-10-14-0nE3DGT0dXyFROKsEPM5GPi4vVtasdPsVz9oE76P.webp', NULL, 'media/product/2023-10-14-Nm4N5iPnwDhcuNz3WmVwSWn4UUVVc6k1PpniKqAw.webp|media/product/2023-10-14-uQ5bS6sK0JMm8OWYz5EV4ysPFGoP1P3QgeB5Ax7L.webp|media/product/2023-10-14-uI1XfvOTdqYDMadHF9qL1RBhGvEWKTsColB9lLWj.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 13:51:46', '2023-10-18 08:03:35', NULL),
(67, 'new_arrival', 'SSM-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'স্পেশাল সুতি (এপ্লিকের কাজ)', 'spesal-suti-epliker-kaj', 'media/product/2023-10-14-8jDXl4cHB2mAzA6sGXeBIjYB2Lxy7Rmc93zDhfxC.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 13:53:21', '2023-10-18 08:03:35', NULL),
(68, 'new_arrival', 'TPJS-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'জয়পুরী থ্রি পিস সুতি', 'jzpuree-thri-pis-suti', 'media/product/2023-10-14-ac0vR4I62YO1pNpxp7orjmZreoBeQie0gsbOA7FP.webp', NULL, 'media/product/2023-10-14-J8fFhrtxaQElqPkrUSGBRNxDAnIvITmAiMsWD5Py.webp|media/product/2023-10-14-aVNNkDtfpmMjwD8KdUpiMuedbXzuo3pvWmBWVESO.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 13:56:04', '2023-10-18 08:03:35', NULL),
(69, 'new_arrival', 'DB001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'দিল্লি বুটিকস', 'dilli-butiks', 'media/product/2023-10-14-TBSjQtxbCknJLv9FJBWlu9GmT8yzH6ybohdAVeuj.webp', NULL, 'media/product/2023-10-14-6VOphMgCV5C8GHkIt24SXnyrpXxwKVVY9H3BSJx6.webp|media/product/2023-10-14-RRO60TlRgGvwPK6MwDyy5DOcmy6oKk8tKuhdJTsM.webp|media/product/2023-10-14-9ETfxmNNt4pGWUYi4lwaPJJN3SRW17O23M4uQC1z.webp|media/product/2023-10-14-6zG3Ma7Rp4ESzjkjcZqotskAo998Ku5KAyRqEZOm.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 14:00:13', '2023-10-18 08:03:35', NULL),
(70, 'new_arrival', 'DBO-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'দিল্লি বুটিকস (অর্গানজা ওরনা)', 'dilli-butiks-organja-oorna', 'media/product/2023-10-14-gmkPaFepERHF3Un0vLcZmjtIASwHCG9oVwvm7kkT.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 14:16:09', '2023-10-18 08:03:35', NULL),
(71, 'new_arrival', 'J4P-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'জর্জেট (ফোর পিস)', 'jrjet-for-pis', 'media/product/2023-10-14-DS7NxKKm0M6uZ7FQjc7SHTeNoNjNcdtO3zoFY8UD.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 14:31:17', '2023-10-18 08:03:35', NULL),
(72, 'new_arrival', 'SK4P-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'সিল্ক ( কাজ করা ফোর পিস )', 'silk-kaj-kra-for-pis', 'media/product/2023-10-14-0bDovd9juYrD4JPqVobj9KeZq3Q2Opc57vNeQFQO.webp', NULL, 'media/product/2023-10-14-CFv4c2cORiRHwgIj2YdFP6LJLgOPYiKsgfm4ct6Z.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:31:44', '2023-10-18 08:03:35', NULL),
(73, 'new_arrival', 'S4P-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'সিল্ক (ফোর পিস )', 'silk-for-pis', 'media/product/2023-10-14-RF2uwC9cyyH5ruSBsfTDGlgCF5Brh0g9D4CAn4Ob.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:33:39', '2023-10-18 08:03:35', NULL),
(74, 'new_arrival', 'JGK4P-01', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'জর্জেট গোল্ডেন কাজ (ফোর পিস)', 'jrjet-golden-kaj-for-pis', 'media/product/2023-10-14-Dko93GMYiTuPg6TRkrsgXNjHqDCaAm0AC466xFOB.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:35:27', '2023-10-18 08:03:35', NULL),
(75, 'new_arrival', 'JNK4P-01', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'জর্জেট চিকেনের কাজ (ফোর পিস)', 'jrjet-cikener-kaj-for-pis', 'media/product/2023-10-14-ZzxwXiBvDXnQGNvnnQqNPUubWX6VW2LMAcs6CgKg.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:37:20', '2023-10-18 08:03:35', NULL),
(76, 'new_arrival', 'BAK-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'বৃহস্পতির ওপর অলওভার কাজ', 'brrihsptir-oopr-oloovar-kaj', 'media/product/2023-10-14-irPPT57dRTDUrgado2FHRnCiG91mD0wlO85fqndW.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:38:26', '2023-10-18 08:03:35', NULL),
(77, 'new_arrival', 'L1P-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'লিলেনের ওয়ান পিস', 'lilener-wan-pis', 'media/product/2023-10-14-WKqVUXNFmexWiYonWKT1y72K6BNBqC19JDCs76Cz.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:40:03', '2023-10-18 08:03:35', NULL),
(78, 'new_arrival', 'KM-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'কুর্তি  মসলিন', 'kurti-mslin', 'media/product/2023-10-14-XguboZPOFuIdmglRENs4k6r7uBdAGjlRZjI9np97.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:41:21', '2023-10-18 08:03:35', NULL),
(79, 'new_arrival', 'KPS-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'কুর্তি পিওর সুতি', 'kurti-pioor-suti', 'media/product/2023-10-14-xKIn67sClzUSiFcj3s2cZtUEiiyA1xkrvuD60gXk.webp', NULL, 'media/product/2023-10-14-JckJgrDaV5AFhHmAmVh7V3kIq1hVcN1RwdREV7pR.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:42:55', '2023-10-18 08:03:35', NULL),
(80, 'new_arrival', 'KS-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'কুর্তি শার্টিন', 'kurti-sartin', 'media/product/2023-10-14-kl9mGq8IefnlWdGxnJ1rKBhlXtFN9xDAxuiQbps9.webp', NULL, 'media/product/2023-10-14-KnFE67KLDMzkExMZbDEkW2hB7Ypum1jjbrRe0Ed1.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:44:41', '2023-10-18 08:03:35', NULL),
(81, 'new_arrival', 'AK-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'অ্যান্ডি কটন', 'ozandi-ktn', 'media/product/2023-10-14-uMFtR4eSntbnR8B2EXl2Ff2mTtXNj2ExdtrOZ2Oq.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-14 15:45:34', '2023-10-18 08:03:35', NULL),
(82, 'new_arrival', 'STP-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, NULL, 'সুতি থ্রি পিস', 'suti-thri-pis', 'media/product/2023-10-15-6SKwRJTaEuUQwYuvSZ6vKO1WdAEzkyJZQ3fkMg7W.webp', NULL, 'media/product/2023-10-15-qm4d4tkGWrCK4az1DEEErFgb6y8KBqj0UORc8pBI.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-15 06:48:54', '2023-10-18 08:03:35', NULL),
(83, 'new_arrival', 'SBO-001', '{\"main_category_id\":[\"18\"],\"child_category_id\":[\"60\",\"63\"],\"subchild_category_id\":[]}', NULL, 15, 1, 'সিল্কের বাটিক ওড়না', 'silker-batik-oodna', 'media/product/2023-10-15-DpciRMzmIOvCqkUV4OFlF51pteCb2sRedryvD46Q.webp', NULL, 'media/product/2023-10-15-fWT6n5f1BHE1rfpOzTO7kXonZcoaQSHCPWY5X1xq.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-15 06:54:15', '2023-10-18 08:07:40', NULL),
(84, 'new_arrival', 'JWC-001', '{\"main_category_id\":[\"66\",\"18\",\"58\"],\"child_category_id\":[\"59\",\"60\",\"61\",\"62\",\"63\",\"65\"],\"subchild_category_id\":[]}', NULL, 15, 15, 'চুরি রাজা রানী এক মুঠ', 'curi-raja-ranee-ek-muth', 'media/product/2023-10-15-HMtTBlnR0tAh8AxYnW2RMIFHjbkFEWdL5vS6m7Nx.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-15 06:55:38', '2023-10-18 08:03:35', NULL),
(85, 'new_arrival', 'JWC-002', '{\"main_category_id\":[\"66\"],\"child_category_id\":[],\"subchild_category_id\":[]}', NULL, 15, 1, 'চুড়ি', 'curi-2-2', 'media/product/2023-10-15-BFoD8EsHh9Uaa6tUdyYKQfo1mmNv7EgqxgrplCLW.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-15 06:56:39', '2023-10-18 08:06:40', NULL),
(86, 'new_arrival', 'JWC-003', '{\"main_category_id\":[\"66\"],\"child_category_id\":[],\"subchild_category_id\":[]}', NULL, 15, 1, 'গোল্ডেন চুরি', 'golden-curi', 'media/product/2023-10-15-vjYROQrpL7UvdnrvzTs9FlicjSTLYXHvF7z6IgpI.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-10-15 07:00:03', '2023-10-18 08:06:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `regular_price` double(8,2) DEFAULT NULL,
  `sale_price` double(8,2) DEFAULT NULL,
  `offer_price` double(8,2) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `discount_tk` double(8,2) NOT NULL DEFAULT 0.00,
  `vendor_price` double(8,2) NOT NULL DEFAULT 0.00,
  `reseller_price` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `regular_price`, `sale_price`, `offer_price`, `discount`, `discount_tk`, `vendor_price`, `reseller_price`, `created_at`, `updated_at`) VALUES
(57, 58, 2100.00, 2100.00, NULL, 0, 0.00, 2100.00, 2100.00, '2023-10-14 01:48:13', '2023-10-14 01:48:13'),
(58, 59, 2100.00, 2100.00, NULL, 0, 0.00, 2100.00, 2100.00, '2023-10-14 01:51:04', '2023-10-14 01:51:36'),
(59, 60, 2100.00, 2000.00, NULL, 5, 100.00, 0.00, 0.00, '2023-10-14 03:53:48', '2023-10-14 03:53:48'),
(60, 61, 1200.00, 1000.00, NULL, 17, 200.00, 0.00, 0.00, '2023-10-14 04:31:23', '2023-10-14 04:31:23'),
(61, 62, 12.00, 12.00, NULL, 0, 0.00, 0.00, 0.00, '2023-10-14 06:26:44', '2023-10-14 06:26:44'),
(62, 63, 100.00, 100.00, NULL, 0, 0.00, 0.00, 0.00, '2023-10-14 06:40:38', '2023-10-14 06:40:38'),
(63, 64, 2400.00, 2100.00, 2100.00, 13, 300.00, 0.00, 0.00, '2023-10-14 06:53:07', '2023-10-18 08:11:45'),
(64, 65, 1700.00, 1400.00, 1400.00, 18, 300.00, 0.00, 0.00, '2023-10-14 13:48:20', '2023-10-18 08:11:45'),
(65, 66, 2000.00, 1600.00, 1600.00, 20, 400.00, 0.00, 0.00, '2023-10-14 13:51:46', '2023-10-18 08:11:45'),
(66, 67, 1800.00, 1500.00, 1500.00, 17, 300.00, 0.00, 0.00, '2023-10-14 13:53:21', '2023-10-18 08:11:45'),
(67, 68, 1200.00, 1050.00, 1050.00, 13, 150.00, 0.00, 0.00, '2023-10-14 13:56:04', '2023-10-18 08:11:45'),
(68, 69, 2000.00, 1800.00, 1800.00, 10, 200.00, 0.00, 0.00, '2023-10-14 14:00:13', '2023-10-18 08:11:45'),
(69, 70, 5600.00, 5300.00, 5300.00, 6, 300.00, 0.00, 0.00, '2023-10-14 14:16:09', '2023-10-18 08:11:45'),
(70, 71, 5000.00, 5000.00, NULL, 0, 0.00, 0.00, 0.00, '2023-10-14 14:31:17', '2023-10-14 14:31:17'),
(71, 72, 2400.00, 2100.00, 2100.00, 13, 300.00, 0.00, 0.00, '2023-10-14 15:31:44', '2023-10-18 08:11:45'),
(72, 73, 4200.00, 3800.00, 3800.00, 10, 400.00, 0.00, 0.00, '2023-10-14 15:33:39', '2023-10-18 08:11:45'),
(73, 74, 5000.00, 5000.00, 5000.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:35:27', '2023-10-18 08:11:45'),
(74, 75, 3000.00, 2700.00, 2700.00, 10, 300.00, 0.00, 0.00, '2023-10-14 15:37:20', '2023-10-18 08:11:45'),
(75, 76, 4000.00, 4000.00, 4000.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:38:26', '2023-10-18 08:11:45'),
(76, 77, 1700.00, 1700.00, 1700.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:40:03', '2023-10-18 08:11:45'),
(77, 78, 2400.00, 2400.00, 2400.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:41:21', '2023-10-18 08:11:45'),
(78, 79, 1500.00, 1500.00, 1500.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:42:55', '2023-10-18 08:11:45'),
(79, 80, 2200.00, 2200.00, 2300.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:44:41', '2023-10-18 08:11:45'),
(80, 81, 2200.00, 2200.00, 2100.00, 0, 0.00, 0.00, 0.00, '2023-10-14 15:45:34', '2023-10-18 08:11:45'),
(81, 82, 950.00, 950.00, 950.00, 0, 0.00, 0.00, 0.00, '2023-10-15 06:48:54', '2023-10-18 08:11:45'),
(82, 83, 500.00, 500.00, 500.00, 0, 0.00, 0.00, 0.00, '2023-10-15 06:54:15', '2023-10-18 08:11:45'),
(83, 84, 500.00, 500.00, 500.00, 0, 0.00, 0.00, 0.00, '2023-10-15 06:55:38', '2023-10-18 08:11:45'),
(84, 85, 300.00, 300.00, 300.00, 0, 0.00, 0.00, 0.00, '2023-10-15 06:56:39', '2023-10-18 08:11:45'),
(85, 86, 300.00, 300.00, 300.00, 0, 0.00, 0.00, 0.00, '2023-10-15 07:00:03', '2023-10-18 08:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `ordered` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `ordered`, `image`, `created_at`, `updated_at`) VALUES
(115, 59, 'Yellow', 'Yellow', 2100, 25, 0, NULL, '2023-10-14 01:51:36', '2023-10-14 01:51:36'),
(116, 60, 'Red', 'Red', 2000, 10, 0, NULL, '2023-10-14 03:53:48', '2023-10-14 03:53:48'),
(117, 60, 'Blue', 'Blue', 2000, 10, 0, NULL, '2023-10-14 03:53:48', '2023-10-14 03:53:48'),
(118, 60, 'Yellow', 'Yellow', 2000, 10, 0, NULL, '2023-10-14 03:53:48', '2023-10-14 03:53:48'),
(122, 61, 'Red', 'Red', 1000, 10, 0, NULL, '2023-10-14 05:42:31', '2023-10-14 05:42:31'),
(123, 61, 'Blue', 'Blue', 1000, 10, 0, NULL, '2023-10-14 05:42:31', '2023-10-14 05:42:31'),
(124, 61, 'Yellow', 'Yellow', 1000, 10, 0, NULL, '2023-10-14 05:42:31', '2023-10-14 05:42:31'),
(126, 62, NULL, NULL, 12, 10, 0, NULL, '2023-10-14 06:39:41', '2023-10-14 06:39:41'),
(128, 63, NULL, NULL, 100, 10, 0, NULL, '2023-10-14 06:41:01', '2023-10-14 06:41:01'),
(133, 65, NULL, NULL, 1400, 10, 0, NULL, '2023-10-14 13:48:20', '2023-10-14 13:48:20'),
(134, 66, NULL, NULL, 1600, 10, 0, NULL, '2023-10-14 13:51:46', '2023-10-14 13:51:46'),
(138, 64, 'Blue', 'Blue', 2100, 100, 0, NULL, '2023-10-14 13:57:58', '2023-10-14 13:57:58'),
(139, 64, 'Yellow', 'Yellow', 2100, 50, 0, NULL, '2023-10-14 13:57:58', '2023-10-14 13:57:58'),
(140, 69, NULL, NULL, 1800, 10, 0, NULL, '2023-10-14 14:00:13', '2023-10-14 14:00:13'),
(141, 70, NULL, NULL, 5300, 10, 0, NULL, '2023-10-14 14:16:09', '2023-10-14 14:16:09'),
(149, 78, NULL, NULL, 2400, 10, 0, NULL, '2023-10-14 15:41:21', '2023-10-14 15:41:21'),
(150, 79, NULL, NULL, 1500, 10, 0, NULL, '2023-10-14 15:42:55', '2023-10-14 15:42:55'),
(151, 80, NULL, NULL, 2200, 10, 0, NULL, '2023-10-14 15:44:41', '2023-10-14 15:44:41'),
(152, 81, NULL, NULL, 2200, 10, 0, NULL, '2023-10-14 15:45:34', '2023-10-14 15:45:34'),
(153, 75, NULL, NULL, 2700, 10, 0, NULL, '2023-10-14 16:02:42', '2023-10-14 16:02:42'),
(154, 74, NULL, NULL, 5000, 10, 0, NULL, '2023-10-14 16:03:02', '2023-10-14 16:03:02'),
(155, 73, NULL, NULL, 3800, 10, 0, NULL, '2023-10-14 16:04:01', '2023-10-14 16:04:01'),
(156, 72, NULL, NULL, 2100, 10, 0, NULL, '2023-10-14 16:04:21', '2023-10-14 16:04:21'),
(157, 71, NULL, NULL, 5000, 10, 0, NULL, '2023-10-14 16:04:58', '2023-10-14 16:04:58'),
(158, 68, NULL, NULL, 1050, 10, 0, NULL, '2023-10-14 16:05:38', '2023-10-14 16:05:38'),
(159, 77, NULL, NULL, 1700, 10, 0, NULL, '2023-10-14 16:05:57', '2023-10-14 16:05:57'),
(160, 76, NULL, NULL, 4000, 10, 0, NULL, '2023-10-14 16:08:25', '2023-10-14 16:08:25'),
(161, 82, NULL, NULL, 950, 10, 0, NULL, '2023-10-15 06:48:54', '2023-10-15 06:48:54'),
(166, 67, NULL, NULL, 1500, 10, 0, NULL, '2023-10-15 07:08:42', '2023-10-15 07:08:42'),
(169, 84, NULL, NULL, 500, 10, 0, NULL, '2023-10-15 07:13:54', '2023-10-15 07:13:54'),
(171, 86, NULL, NULL, 300, 10, 0, NULL, '2023-10-18 08:06:22', '2023-10-18 08:06:22'),
(172, 85, NULL, NULL, 300, 10, 0, NULL, '2023-10-18 08:06:40', '2023-10-18 08:06:40'),
(173, 83, NULL, NULL, 500, 10, 0, NULL, '2023-10-18 08:07:40', '2023-10-18 08:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `star` tinyint(4) NOT NULL DEFAULT 1,
  `title` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'web', '2023-07-10 16:41:30', '2023-07-10 16:41:30'),
(2, 'Software Admin', 'web', '2023-07-10 16:41:33', '2023-07-10 16:41:33'),
(5, 'Web Admin', 'web', '2023-10-14 06:08:54', '2023-10-14 06:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 2),
(2, 5),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 5),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(11, 5),
(12, 1),
(12, 2),
(12, 5),
(13, 1),
(13, 2),
(13, 5),
(14, 1),
(14, 2),
(14, 5),
(15, 1),
(15, 2),
(15, 5),
(18, 1),
(18, 2),
(18, 5),
(19, 1),
(19, 2),
(19, 5),
(21, 1),
(21, 2),
(21, 5),
(22, 1),
(22, 2),
(22, 5),
(23, 1),
(23, 2),
(23, 5),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(52, 1),
(52, 2),
(52, 5),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(69, 1),
(69, 2),
(69, 5),
(70, 1),
(70, 2),
(70, 5),
(71, 1),
(71, 2),
(71, 5),
(72, 1),
(72, 2),
(72, 5),
(73, 1),
(73, 2),
(73, 5),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(77, 5),
(78, 1),
(78, 2),
(78, 5),
(79, 1),
(79, 2),
(79, 5),
(80, 1),
(80, 2),
(80, 5),
(81, 1),
(81, 2),
(81, 5),
(82, 1),
(83, 1),
(83, 2),
(83, 5),
(84, 1),
(84, 2),
(84, 5),
(85, 1),
(85, 2),
(85, 5),
(86, 1),
(86, 2),
(86, 5),
(87, 1),
(87, 2),
(87, 5),
(88, 1),
(88, 2),
(88, 5),
(89, 1),
(89, 2),
(89, 5),
(90, 1),
(90, 2),
(90, 5),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(103, 5),
(104, 1),
(104, 2),
(104, 5),
(105, 1),
(105, 2),
(105, 5),
(106, 1),
(106, 2),
(106, 5),
(107, 1),
(107, 2),
(107, 5),
(108, 1),
(108, 2),
(108, 5),
(109, 1),
(109, 2),
(109, 5),
(110, 1),
(110, 2),
(110, 5),
(111, 1),
(111, 2),
(111, 5),
(112, 1),
(112, 2),
(112, 5),
(113, 1),
(113, 2),
(113, 5),
(114, 1),
(114, 2),
(114, 5),
(115, 1),
(115, 2),
(115, 5),
(116, 1),
(116, 2),
(116, 5),
(117, 1),
(117, 2),
(117, 5),
(118, 1),
(118, 2),
(118, 5),
(119, 1),
(119, 2),
(119, 5),
(120, 1),
(120, 2),
(120, 5),
(121, 1),
(121, 2),
(121, 5),
(123, 1),
(123, 2),
(123, 5),
(124, 1),
(124, 2),
(124, 5),
(125, 1),
(125, 2),
(125, 5),
(126, 1),
(126, 2),
(126, 5),
(127, 1),
(127, 2),
(127, 5),
(128, 1),
(128, 2),
(128, 5),
(129, 1),
(129, 2),
(129, 5),
(130, 1),
(130, 2),
(130, 5),
(131, 1),
(131, 2),
(131, 5),
(132, 1),
(132, 2),
(132, 5),
(133, 1),
(133, 2),
(134, 1),
(134, 2),
(135, 1),
(135, 2),
(135, 5),
(136, 1),
(136, 2),
(136, 5),
(137, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `primary_mobile` varchar(255) DEFAULT NULL,
  `secondary_mobile` varchar(255) DEFAULT NULL,
  `primary_email` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `office_time` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `google_map` text DEFAULT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_logo` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `facebook_page` varchar(255) DEFAULT NULL,
  `facebook_group` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `banner_one` varchar(255) DEFAULT NULL,
  `banner_one_link` varchar(255) DEFAULT NULL,
  `banner_two` varchar(255) DEFAULT NULL,
  `banner_two_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `primary_mobile`, `secondary_mobile`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `banner_one`, `banner_one_link`, `banner_two`, `banner_two_link`, `created_at`, `updated_at`) VALUES
(1, 'Adittiya', '01720127782', '01720127782', 'sales@adittiya.com', 'support@domain.com', NULL, '123 Suspendis matti, Visaosang Building VST District, NY Accums, North American', '<div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur<br>adipiscing elit. Integer condimentum. Duis<br>quam tortor eleifend.</div><ul class=\"footer-info__list\"><li>Monday To Friday : 8.00 AM - 8.00 PM</li><li>Satuday : 9.00 AM - 17.30 PM</li><li>Sunday : 9.00 AM - 18.00 PM</li></ul>', NULL, NULL, 'Meta', 'media/default/2023-10-05-DDEBsUY0M7nFIPuuaWtxkQIx6sQGhXbmv4L2pdNe.webp', NULL, 'media/default/2023-10-05-orxWvCIky8napwFzZqR1EJbig8fjRlQulUOM58YG.webp', 'media/default/2023-10-05-c9MhmlSMH087ol0g5j2lXl7Grpva5MpWtGKT0Mbf.webp', 'media/default/2023-10-05-q99b6LhXW9IA9UJKVCNTUvmyh43tC4gusC9QtKLK.webp', 'media/default/2023-10-05-OX8tqMj9NZHclITGf2HJZMMkVu0uv9GyVvwc7fkm.webp', 'https://facebook.com', NULL, 'https://www.youtube.com/', 'https://twitter.com', 'https://linkedin.com', NULL, 'https://whatsapp.com', NULL, NULL, 'media/home-banner/2023-10-15-sJZp4JFl4r4n1iwvVmpkPVgWukaP10c3jvIUN1SL.webp', '#', 'media/home-banner/2023-10-05-XyVCKBeCIQOfWJqDWujPa0mjotpdahW7ooFt8QfU.webp', '#', '2023-07-16 15:55:30', '2023-10-15 12:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(255) NOT NULL DEFAULT 'home',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `upozila_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `address_type`, `name`, `email`, `phone`, `street`, `address`, `division_id`, `district_id`, `upozila_id`, `created_at`, `updated_at`) VALUES
(6, 22, 'home', 'Syed Amir Ali', 'amirralli300400@gmail.com', '01817807594', 'Sherpur, Mymenshingh', 'Sherpur, Mymenshingh, Barguna, Amtali , Barisal', 19, 222, 28, '2023-10-14 07:56:57', '2023-10-14 07:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, NULL, 'media/slider/2023-08-29-Uw4N2qhZjRjTHzS04yijz4Was45zFzfgKKTs89KJ.webp', 0, '2023-08-29 09:48:14', '2023-10-05 04:56:21'),
(4, 'https://zozothemes.com/html/mist/light/index-corporate.html', 'media/slider/2023-08-29-7aAILsdt1SnOwbAnNvIomVThDIMQzsv2JoPh1Ysv.webp', 0, '2023-08-29 09:51:35', '2023-10-05 04:56:18'),
(5, NULL, 'media/slider/2023-10-05-BQT2HmwdTWXq1bxzEg9CawRVhI3UUa8o25RJTJRh.webp', 1, '2023-10-05 04:57:32', '2023-10-05 04:57:32'),
(7, NULL, 'media/slider/2023-10-15-JQsf7YWZ1k4dj0gJQRxamOlaWtfYNpwRbh043rnq.webp', 1, '2023-10-15 11:57:00', '2023-10-15 11:57:00'),
(8, NULL, 'media/slider/2023-10-15-79sBgxSemQjaAuGXTVHGpJiGL8Vub9CLOJ2PFLMp.webp', 1, '2023-10-15 12:20:13', '2023-10-15 12:20:13'),
(9, NULL, 'media/slider/2023-10-15-JdrDEXPbVUnmLMJP8UoZaNHKkEjEAnrlKP9USEVg.webp', 1, '2023-10-15 12:20:34', '2023-10-15 12:20:34'),
(10, NULL, 'media/slider/2023-10-15-TxdyEzg9OjKqRAHfTr8IvuIEdlcGj2jtpEcQX16g.webp', 1, '2023-10-15 12:20:56', '2023-10-15 12:20:56'),
(11, NULL, 'media/slider/2023-10-15-E2MbfjCbzz7svjDkYltHQluFymaszo2POEusjQjd.webp', 1, '2023-10-15 12:21:16', '2023-10-15 12:21:16'),
(12, NULL, 'media/slider/2023-10-15-eg1F7CDITSCaMRoy8D9y1gfQsZBRYNufrvkxuMCT.webp', 1, '2023-10-15 12:21:34', '2023-10-15 12:21:34'),
(13, NULL, 'media/slider/2023-10-15-uPv6aqeE2rz7ailV3NVYpnHvPC3bnMAkYMSHjaN2.webp', 1, '2023-10-15 12:21:55', '2023-10-15 12:21:55'),
(14, NULL, 'media/slider/2023-10-15-Al4zbB82OOL6iETfJh7PtZQPoIwi3uPXsrnT5CSv.webp', 1, '2023-10-15 12:22:09', '2023-10-15 12:22:09'),
(15, NULL, 'media/slider/2023-10-15-bNmJTmPYOTJKqFWfo94aWZA5lDa8UL4Rrb3WD9UM.webp', 1, '2023-10-15 12:22:26', '2023-10-15 12:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `special_offer_products`
--

CREATE TABLE `special_offer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_ids` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serial` int(20) DEFAULT 1,
  `slug` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_offer_products`
--

INSERT INTO `special_offer_products` (`id`, `product_ids`, `name`, `status`, `serial`, `slug`, `created_at`, `updated_at`) VALUES
(2, '[\"86\",\"85\",\"84\",\"83\",\"82\",\"81\",\"80\",\"79\",\"78\",\"77\",\"76\",\"75\",\"74\",\"73\",\"72\",\"70\",\"69\",\"68\",\"67\",\"66\",\"65\",\"64\"]', 'Puja Special', 1, 1, 'puja-special-1', '2023-10-17 19:38:44', '2023-10-18 08:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'admin@gmail.com', NULL, NULL, 'backend/images/avatar/profile-sIWetmiHWXoIuJCDehirsN6DjeCUfRQIua4FNDNo.jpg', 'backend/images/avatar/cover-1ycEtnIsVAWASMAfUeHrMKwnL1FqzkHSRFdKeGln.jpg', 1, NULL, '$2y$10$9d2htXcLjbKQM1blqUFWAeTVvBhRCkLdHs6yzzI5G4h8NvfX8AV92', 'a8ZJrlN8CNvzKd6shk9JUiJtfpagInIw5gNGAmWg28OEIMveDSiPp7QVFKL2', '2023-07-10 16:39:44', '2023-10-18 07:50:27'),
(15, 1, 'Fattah', 'fattah', 'admin2@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$zFzRUyRyT.vNxJJf/mwaL.UcylPgbhAyGsA2hUiJS/2f6NQu5nKcW', NULL, '2023-09-12 14:12:41', '2023-09-12 14:12:41'),
(21, 1, 'Anupom', 'Anupom', 'anupom9@yahoo.com', '8801720127782', NULL, 'backend/images/avatar/profile-ueLyu67uixfG94LmrhZWoUvAVuFkQcLqPqf3Oa9g.png', 'backend/images/avatar/cover-HAtNupL2BX8Y7rFjtuYGGUI3wQqJZNS5o38ER3GW.jpg', 1, NULL, '$2y$10$H5nSLlLoqXTbHlfWGahjXemd5d3wDEDND9FAp5BORVC0x7mPI9y0i', NULL, '2023-10-14 06:14:39', '2023-10-14 16:35:52'),
(22, 0, 'Syed Amir Ali', NULL, 'amirralli300400@gmail.com', '01817807594', NULL, NULL, NULL, 1, NULL, '$2y$10$cnxsbQv9LBqq2BkeKGcbiuEqdpwGTf9idWGDimlleqCsrkwKVkic2', NULL, '2023-10-14 07:55:12', '2023-10-14 07:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flashdeals`
--
ALTER TABLE `flashdeals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flashdeals_slug_unique` (`slug`);

--
-- Indexes for table `flashdeal_products`
--
ALTER TABLE `flashdeal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_product_sections`
--
ALTER TABLE `home_product_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_name_unique` (`name`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offer_products`
--
ALTER TABLE `special_offer_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `special_offer_products_slug_unique` (`slug`) USING HASH;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `admin_menu_actions`
--
ALTER TABLE `admin_menu_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashdeals`
--
ALTER TABLE `flashdeals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flashdeal_products`
--
ALTER TABLE `flashdeal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `home_product_sections`
--
ALTER TABLE `home_product_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `special_offer_products`
--
ALTER TABLE `special_offer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
