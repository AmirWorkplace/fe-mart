-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2023 at 05:27 AM
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
-- Database: `leadmartbd`
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
(36, 134, 35, 'Flash Deals', 'admin.deal.index', NULL, 1, 1, 1, '2023-09-12 09:58:26', '2023-09-12 09:58:26');

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
(1, 'media/admin-setting/2023-08-08-3lE6jyckpZQ3mVvuRAkPAOSNY3P4vdna5gkZoxRQ.webp', 'media/admin-setting/2023-08-08-drgzUWyQRyoAZuQHbZHKva1LiCfkirWCILmm1uN3.webp', 'Leardmart BD', '© 2023 Developed by <a target=\"_blank\" href=\"http://www.technoparkbd.com/\">Techno Park Bangladesh</a>', NULL, NULL, 'https://www.facebook.com', 'https://twitter.com/', 'https://linkedin.com', 'https://whatsapp.com', NULL, '2023-08-08 05:19:43', '2023-08-08 10:12:07');

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

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Brand 1', 'media/brand/2023-08-30-AoSt28eB7TA6LMIz4eHvh4b2QPzjzsIUWTFf8GF2.webp', 'brand-1', 1, '2023-08-10 06:21:48', '2023-08-30 06:57:26'),
(4, 'Brand 2', 'media/brand/2023-08-30-w2sjFs6qyFExLGPLKZMiPM6kAFaGRD3NMinvGXiH.webp', 'brand-2', 1, '2023-08-10 06:21:56', '2023-08-30 06:57:37'),
(5, 'Brand 3', 'media/brand/2023-08-30-jTnotptLmAz7oC3q62qcuUTPAFCEDaYwt4HLasVb.webp', 'brand-3', 1, '2023-08-30 06:59:01', '2023-08-30 06:59:01'),
(6, 'Brand 4', 'media/brand/2023-08-30-Pa96XuugKUOvarZDw28bBbWgur26VFLbMPuONyvn.webp', 'brand-4', 1, '2023-08-30 07:10:45', '2023-08-30 07:10:45'),
(7, 'Brand 5', 'media/brand/2023-08-30-TbMWWDT6yUR8vbWGMKclMy9Z4mZB4cIah4nh8Xnv.webp', 'brand-5', 1, '2023-08-30 07:10:53', '2023-08-30 07:10:53'),
(8, 'Brand 6', 'media/brand/2023-08-30-Y9ou4GYw23pv4PnNaeUmAshhV0t9bP7MG3sobs0L.webp', 'brand-6', 1, '2023-08-30 07:11:00', '2023-08-30 07:11:00'),
(9, 'Riro', 'media/brand/2023-09-12-OvLEBLzo9iTcS9U2jTQj7syPpqufG59dY58LuvTv.webp', 'riro', 1, '2023-09-12 03:43:57', '2023-09-12 03:43:57'),
(10, 'Gearup', 'media/brand/2023-09-12-7JrbE2ekQzJnzgUwFRQXNUZWou2rdueGjzamQWRs.webp', 'gearup', 1, '2023-09-12 03:44:09', '2023-09-12 03:44:09'),
(11, 'Noise', 'media/brand/2023-09-12-uzXpE7gNW1qfZZCuPUIEzyNmjx6HhRh2irhO5ZmP.webp', 'noise', 1, '2023-09-12 03:44:21', '2023-09-12 03:44:21'),
(12, 'Jisulife', 'media/brand/2023-09-12-FxnQrDwuinVPUBzWwibKml9qK9mXsHtbKH3zMfMP.webp', 'jisulife', 1, '2023-09-12 03:44:35', '2023-09-12 03:44:35'),
(13, 'Joyroom', 'media/brand/2023-09-12-p58zLu8n3iuo2Cix7homDp98rkWLHmJEsxx9G46P.webp', 'joyroom', 1, '2023-09-12 03:44:47', '2023-09-12 03:44:47'),
(14, 'Boya', 'media/brand/2023-09-12-FFWMxupeoGCq4ZLczDkoXctLocdOd1inPapasCWB.webp', 'boya', 1, '2023-09-12 03:44:56', '2023-09-12 03:44:56'),
(15, 'Havit', 'media/brand/2023-09-12-99CoROLv0NYkX581W1w7ezfQzYUuwCvcPBefwFlL.webp', 'havit', 1, '2023-09-12 03:45:06', '2023-09-12 03:45:06'),
(16, 'Hoco', 'media/brand/2023-09-12-quxR3Wej9OPIyk854ZlwAnB4bv8G4xidTHIUIP0g.webp', 'hoco', 1, '2023-09-12 03:52:32', '2023-09-12 03:52:32'),
(17, 'Wiwu', 'media/brand/2023-09-12-RNSyCzAeZCDs94Zt4MJA3FmJzHVenZbmFn52aPG6.webp', 'wiwu', 1, '2023-09-12 03:52:42', '2023-09-12 03:52:42'),
(18, 'Ulanzi', 'media/brand/2023-09-12-NgzJdCnuZvhYKK4H7Zvs6tWg3AJTYfNkbnDGWABs.webp', 'ulanzi', 1, '2023-09-12 03:52:56', '2023-09-12 03:52:56');

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
(9, NULL, 'COMPUTERS', 'computers', 'media/category/2023-08-30-FsVueUt3ia86IZc7vyZOkSbHCsg89ArbXesDU6Vh.webp', 1, 0, 1, '2023-08-10 06:14:24', '2023-08-30 10:33:36'),
(10, 9, 'child1', 'child1', NULL, 0, 0, 1, '2023-08-10 06:14:32', '2023-08-10 06:14:32'),
(11, 9, 'child 2', 'child-2', NULL, 0, 0, 1, '2023-08-10 06:14:41', '2023-08-10 06:14:41'),
(12, 9, 'child 3', 'child-3', NULL, 0, 0, 1, '2023-08-10 06:14:49', '2023-08-10 06:14:49'),
(13, 10, 'subchild 1', 'subchild-1', NULL, 0, 0, 1, '2023-08-10 06:15:00', '2023-08-10 06:15:00'),
(14, 10, 'UPS', 'ups', 'media/category/2023-08-29-jRXRBaM2lFggZhqEEImWDKWC3jZkmE92VHbfjwO7.webp', 1, 0, 1, '2023-08-10 06:15:12', '2023-08-29 09:29:36'),
(15, NULL, 'HOME APPLIANCES', 'home-appliances', 'media/category/2023-08-30-WmOl4A2um3vCr3uJyzIShb17jYUe5wjJVj5R1jVi.webp', 1, 0, 1, '2023-08-30 08:21:35', '2023-08-30 10:39:22'),
(16, NULL, 'Electronics', 'electronics', 'media/category/2023-08-30-XH3vniGaUatZISBYlvCtxXzPoBRxYiedpIkdw98O.webp', 1, 0, 1, '2023-08-30 10:42:02', '2023-09-12 04:32:45'),
(17, NULL, 'Audio & Sound Devices', 'audio-sound-devices', 'media/category/2023-09-10-IocbhF9blCzqPkuV9LFHfZBlkXJ7ctOcR2EWpOka.webp', 1, 0, 1, '2023-09-10 09:14:46', '2023-09-12 04:33:06'),
(18, NULL, 'Smartphone & Tablets', 'smartphone-tablets', 'media/category/2023-09-10-9uCkmaojHeV7AWidtscHvx13MdzgKnki1n3CaK79.webp', 0, 0, 1, '2023-09-10 09:15:26', '2023-09-10 09:15:26'),
(19, NULL, 'Game Devices & Accessories', 'game-devices-accessories', 'media/category/2023-09-10-dsRY61Et2gi4DQ6CeqsxVRmAmuhm0TMs3zbiM5ln.webp', 1, 0, 1, '2023-09-10 09:16:03', '2023-09-12 04:33:16'),
(20, NULL, 'Security Devices', 'security-devices', 'media/category/2023-09-10-yhECh2iA5YBBTYfyrzYxOr5CXFQaxwMNoWjA2s7W.webp', 0, 0, 1, '2023-09-10 09:16:33', '2023-09-10 09:16:33'),
(21, NULL, 'Smart Home', 'smart-home', 'media/category/2023-09-10-y92lLp7k9gN0Qm9vy4mDOb8dIc03QUbCFwlDV5iX.webp', 0, 0, 1, '2023-09-10 09:16:55', '2023-09-10 09:16:55'),
(22, NULL, 'Computers & Networking', 'computers-networking', 'media/category/2023-09-10-0kkkRFIyFZau558THIeGKO05JAmdHkQuOW9iAnNA.webp', 1, 0, 1, '2023-09-10 09:17:41', '2023-09-12 04:37:10'),
(23, NULL, 'Laptop & Accessories', 'laptop-accessories', 'media/category/2023-09-10-MrPnTVKWjntPdnUmD9f6TmfLMezi1Ah5brXXOyzk.webp', 0, 0, 1, '2023-09-10 09:18:15', '2023-09-10 09:18:15'),
(24, NULL, 'Smart Watches', 'smart-watches', 'media/category/2023-09-10-mRMVD2YBUwpATqfWpswaCu2qsO1vp3KvLYQwwkhF.webp', 1, 0, 1, '2023-09-10 09:18:45', '2023-09-12 04:36:30'),
(25, NULL, 'Office Devices', 'office-devices', 'media/category/2023-09-10-KI9C5vsLJJwP61aOwoMQzJQz1lnqfIvSZTz7gkqK.webp', 1, 0, 1, '2023-09-10 09:19:15', '2023-09-12 04:33:35'),
(26, NULL, 'Cameras & Photo', 'cameras-photo', 'media/category/2023-09-10-iNJU0sOrMSfPs8GcIySJDpFqIN4TNpR12dQ3LmA4.webp', 0, 0, 1, '2023-09-10 09:19:44', '2023-09-10 09:19:44'),
(27, NULL, 'Monitor & Television', 'monitor-television', 'media/category/2023-09-10-qGh6mb3Z6WI9xhRDXR20R9dNIKQmyCLXhEDKJvY8.webp', 1, 0, 1, '2023-09-10 09:20:07', '2023-09-12 04:36:39'),
(28, 22, 'Laptop', 'laptop', NULL, 0, 0, 1, '2023-09-10 10:20:38', '2023-09-10 10:20:38'),
(29, 22, 'Desktop', 'desktop', NULL, 0, 0, 1, '2023-09-10 10:20:55', '2023-09-10 10:20:55'),
(30, 22, 'PC Gaming', 'pc-gaming', NULL, 0, 0, 1, '2023-09-10 10:21:10', '2023-09-10 10:21:10'),
(31, 22, 'Teblets', 'teblets', NULL, 0, 0, 1, '2023-09-10 10:21:22', '2023-09-10 10:21:22'),
(32, 22, 'USB', 'usb', NULL, 0, 0, 1, '2023-09-10 10:21:30', '2023-09-10 10:21:30'),
(33, 22, 'Hard Disk', 'hard-disk', NULL, 0, 0, 1, '2023-09-10 10:21:38', '2023-09-12 04:47:33'),
(34, 22, 'Modem Wifi', 'modem-wifi', NULL, 0, 0, 1, '2023-09-10 10:21:57', '2023-09-10 10:21:57'),
(35, 22, 'Keyboard', 'keyboard', NULL, 0, 0, 1, '2023-09-10 10:22:06', '2023-09-10 10:22:06'),
(36, 22, 'Mouse', 'mouse', NULL, 0, 0, 1, '2023-09-10 10:22:14', '2023-09-12 04:47:42'),
(37, 22, 'Monitor', 'monitor', NULL, 0, 0, 1, '2023-09-10 10:22:24', '2023-09-10 10:22:24'),
(38, 15, 'Kitchen', 'kitchen', NULL, 0, 0, 1, '2023-09-10 10:28:30', '2023-09-10 10:28:30'),
(39, 15, 'Laundry', 'laundry', NULL, 0, 0, 1, '2023-09-10 10:28:39', '2023-09-10 10:28:39'),
(40, 15, 'Outdoor', 'outdoor', NULL, 0, 0, 1, '2023-09-10 10:28:50', '2023-09-10 10:28:50'),
(41, 15, 'Home Solutions', 'home-solutions', NULL, 0, 0, 1, '2023-09-10 10:29:00', '2023-09-10 10:29:00'),
(42, 15, 'Heating', 'heating', NULL, 0, 0, 1, '2023-09-10 10:29:08', '2023-09-10 10:29:08'),
(43, 15, 'Vacuum Cleaners', 'vacuum-cleaners', NULL, 0, 0, 1, '2023-09-10 10:29:22', '2023-09-10 10:29:22'),
(44, 15, 'Air Quality', 'air-quality', NULL, 0, 0, 1, '2023-09-10 10:29:34', '2023-09-10 10:29:34'),
(45, 15, 'Laundry Appliance', 'laundry-appliance', NULL, 0, 0, 1, '2023-09-10 10:29:46', '2023-09-10 10:29:51'),
(46, 15, 'Floor Care', 'floor-care', NULL, 0, 0, 1, '2023-09-10 10:30:02', '2023-09-10 10:30:02'),
(47, 15, 'Appliance Accessories', 'appliance-accessories', NULL, 0, 0, 1, '2023-09-10 10:30:16', '2023-09-10 10:30:16'),
(48, 18, 'Smart Phone', 'smart-phone', NULL, 0, 0, 1, '2023-09-10 10:36:37', '2023-09-10 10:36:37'),
(49, 18, 'Smart Phone', 'smart-phone-64fd9c359daf2', NULL, 0, 0, 1, '2023-09-10 10:36:37', '2023-09-10 10:36:37'),
(50, 18, 'Tablet', 'tablet', NULL, 0, 0, 1, '2023-09-10 10:36:46', '2023-09-10 10:36:46'),
(51, 18, 'Apple Tablets', 'apple-tablets', NULL, 0, 0, 1, '2023-09-10 10:36:57', '2023-09-10 10:36:57'),
(52, 18, 'Windows Tablets', 'windows-tablets', NULL, 0, 0, 1, '2023-09-10 10:37:10', '2023-09-10 10:37:10'),
(53, 18, 'Android Tablets', 'android-tablets', NULL, 0, 0, 1, '2023-09-10 10:37:21', '2023-09-10 10:37:21'),
(54, 18, 'Feature Phones', 'feature-phones', NULL, 0, 0, 1, '2023-09-10 10:37:35', '2023-09-10 10:37:35'),
(55, 18, 'Cell Phone Case', 'cell-phone-case', NULL, 0, 0, 1, '2023-09-10 10:37:46', '2023-09-10 10:37:46'),
(56, 18, 'Cables & Adapters', 'cables-adapters', NULL, 0, 0, 1, '2023-09-10 10:38:01', '2023-09-10 10:38:01'),
(57, 18, 'Photography', 'photography', NULL, 0, 0, 1, '2023-09-10 10:38:12', '2023-09-10 10:38:12'),
(58, 18, 'Headsets & Headphones', 'headsets-headphones', NULL, 0, 0, 1, '2023-09-10 10:38:31', '2023-09-10 10:38:31');

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

--
-- Dumping data for table `flashdeals`
--

INSERT INTO `flashdeals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(3, 'DEAL OF THE WEEK', '2023-09-12 01:05:00', '2023-10-30 23:45:00', 1, 1, 'media/flash-deal/2023-09-12-mn2akfJT5HyWjkW5qHnzcumJRWBa2dunE3S1oa6q.webp', 'deal-of-the-week', '2023-09-12 13:10:24', '2023-09-12 13:58:55');

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

--
-- Dumping data for table `flashdeal_products`
--

INSERT INTO `flashdeal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(62, 3, 35, 0, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(63, 3, 34, 0, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(64, 3, 26, 0, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(65, 3, 33, 0, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(66, 3, 22, 0, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(67, 3, 31, 500, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(68, 3, 30, 400, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(69, 3, 24, 500, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55'),
(70, 3, 23, 300, 'amount', '2023-09-12 13:58:55', '2023-09-12 13:58:55');

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
(5, 22, '[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', 'product', 'product', NULL, NULL, NULL, NULL, 1, 1, '2023-09-10 09:55:44', '2023-09-10 09:55:44'),
(6, 15, '[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\"]', 'product', 'banner', 'media/section-banner/2023-09-10-C4uCDNuTDx2Y8VsDEiLsRphL9MY6LK6vFiDHuDua.webp', '#', NULL, NULL, 2, 1, '2023-09-10 10:08:26', '2023-09-10 10:08:26'),
(7, 18, '[\"3\"]', 'product', 'blank', 'media/section-banner/2023-09-10-0LvKQMbG9V3z2X0WPiXdhM70ieImf3SYUVtTUDbS.webp', '#', 'media/section-banner/2023-09-10-Rt0ea8tsmjRE0TvSXgbLhDJuz6APJ7Q4gTnf3x6e.webp', '#', 3, 1, '2023-09-10 10:18:13', '2023-09-12 04:58:42');

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
(2, 'App\\Models\\User', 15);

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
(5, 'R586902', 16, 'Mosharraf Hossain', '01997316189', 3, 0.00, 25050.00, 0.00, 25050.00, 0.00, 25050.00, 'cash', NULL, 'Pending', '2023-09-13 07:43:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-13 07:43:43', '2023-09-13 07:43:43'),
(6, 'R588680', 16, 'Mosharraf Hossain', '01997316189', 3, 0.00, 25000.00, 0.00, 25000.00, 0.00, 25000.00, 'cash', NULL, 'Pending', '2023-09-17 03:11:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-17 03:11:38', '2023-09-17 03:11:38'),
(7, 'R863586', 16, 'Mosharraf Hossain', '01997316189', 3, 0.00, 15600.00, 0.00, 15600.00, 0.00, 15600.00, 'cash', NULL, 'Pending', '2023-09-17 04:10:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-17 04:10:48', '2023-09-17 04:10:48');

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
(10, 5, 40, 87, NULL, NULL, 'Hoco W102 Cool Tour Gaming Headset', 'media/product/2023-09-12-uP00HYqvBEtBqhxko3l9VuNT3mP2Pq5jQVib4eX4.webp', 0.00, 1350.00, 1350.00, 1350.00, 0.00, 0.00, 5400.00, 4, '2023-09-13 07:43:43', '2023-09-13 07:43:43'),
(11, 5, 47, 97, NULL, NULL, 'Hoco HB24 6-in-1 Multimedia USB Type-C Hub', 'media/product/2023-09-12-FGPBe9oIO6vwIumJyTHaApxikuFUREYdzLOGrkN3.webp', 0.00, 1800.00, 1800.00, 1800.00, 0.00, 0.00, 7200.00, 4, '2023-09-13 07:43:43', '2023-09-13 07:43:43'),
(12, 5, 50, 100, NULL, NULL, 'Redragon GS812 Andante RGB Bluetooth Black Gaming Speaker', 'media/product/2023-09-12-q7Q28hgwuQhZll5Qp63pvXoXKd51vi3u63ohC0sI.webp', 0.00, 4150.00, 4150.00, 4150.00, 0.00, 0.00, 12450.00, 3, '2023-09-13 07:43:43', '2023-09-13 07:43:43'),
(13, 6, 30, 75, NULL, NULL, 'Nullam et turpis nec nunc', 'media/product/2023-09-10-NYtbKyLLyt5y6k3EyuoWANLaz5HrlnzoJVJAfK3A.webp', 0.00, 25000.00, 25000.00, 25000.00, 0.00, 0.00, 25000.00, 1, '2023-09-17 03:11:38', '2023-09-17 03:11:38'),
(14, 7, 23, 37, NULL, NULL, 'Faded short sleeves t-shirt with high neckline', 'media/product/2023-09-10-k2Dkbc8QIwfJeCQiKy01hFGjhH5mlWl4txEn4rp9.webp', 0.00, 15600.00, 15600.00, 15600.00, 0.00, 0.00, 15600.00, 1, '2023-09-17 04:10:48', '2023-09-17 04:10:48');

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
(3, 'new page', 'new page', 'new-page', '<p>sdfsdf</p>', 1, '2023-08-05 17:30:14', '2023-08-05 17:30:14'),
(4, 'test page', 'test page', 'test-page', '<p>sfsdfsdf</p>', 1, '2023-08-05 17:30:26', '2023-08-05 17:30:26');

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
(136, 'admin.order.edit', 'web', '2023-09-12 14:14:24', '2023-09-12 14:14:24');

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
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `more_images` text DEFAULT NULL,
  `short_description` text NOT NULL,
  `description` longtext NOT NULL,
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

INSERT INTO `products` (`id`, `product_type`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 'new_arrival', 14, NULL, 1, NULL, 'Test One', 'test-one', 'media/product/2023-09-06-JbPksA8UVXSF5bvv10kaGRDlRjfnmwpYQucbfJWI.webp', 'media/product/2023-09-06-RAlYFokTgmKyEBAug3odHtfGkTsfOTdiiwRG6m4k.webp|media/product/2023-09-06-rXpAsSX91HD7HKMoZpPdjtAuOs3HiuGmoDASfH9V.webp|media/product/2023-09-06-m8WttQxyf04wmrNJ2XBicNJH7kq5XmspEC5Bs3rh.webp', '<p>fdfg</p>', '<p>dsdfds</p>', '<p>sdfsdf</p>', 'sdfsd', 'sdfsdf', 'sdfsdf', NULL, 1, NULL, NULL, NULL, 1, '[\"7\",\"8\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]},{\"attribute_id\":\"8\",\"values\":[\"XL\",\"L\",\"M\"]}]', 1, '2023-09-06 09:16:16', '2023-09-06 09:34:14', NULL),
(22, 'new_arrival', 15, 5, 1, NULL, 'Nunc euismod fringilla', 'nunc-euismod-fringilla', 'media/product/2023-09-10-jLhEz8OAo863Z6eAhLQxlX0g8abt90L7oh3XjUso.webp', NULL, '<p>Sleeveless knee-length chiffon dress. V-neckline with elastic under the bust lining.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\",\"8\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]},{\"attribute_id\":\"8\",\"values\":[\"XL\",\"L\"]}]', 1, '2023-09-10 09:25:32', '2023-09-10 09:25:32', NULL),
(23, 'new_arrival', 22, 5, 1, NULL, 'Faded short sleeves t-shirt with high neckline', 'faded-short-sleeves-t-shirt-with-high-neckline', 'media/product/2023-09-10-k2Dkbc8QIwfJeCQiKy01hFGjhH5mlWl4txEn4rp9.webp', 'media/product/2023-09-10-HN5jJmk8RryyYBIwgxZcrsi3UwJ8okGtapXjVma5.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-09-10 09:27:47', '2023-09-10 09:27:47', NULL),
(24, 'new_arrival', 22, 5, 1, 1, 'Accessorize with a straw hat and you\'re ready for summer!', 'accessorize-with-a-straw-hat-and-youre-ready-for-summer', 'media/product/2023-09-10-SI958B3HQqFS3yCglbA7H0tTKT5wrKuiOwUvhGXw.webp', 'media/product/2023-09-10-imbfatWd1T80fRr2848xCndVY7POZwjOB6YWxWV1.webp|media/product/2023-09-10-ecwwAvix0a4BfYZ2IFF3w0OxjPMw92pjuGbyVwIB.webp|media/product/2023-09-10-yHA1EgtuDSmjCJaaRx0BYWFLxrhXqnURAQaCSAni.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-09-10 09:29:19', '2023-09-10 09:58:50', NULL),
(25, 'new_arrival', 18, 5, 1, 1, 'Curabitur ultricies ipsum at quam lobortis maximus eu quis urna', 'curabitur-ultricies-ipsum-at-quam-lobortis-maximus-eu-quis-urna', 'media/product/2023-09-10-2eEHWSGgDBP7WA2bkwwZER7mW7OXlhDgk4IMj698.webp', 'media/product/2023-09-10-uj90GnrAwtPmZncAy6oh85f7NBqTk47GfOU2Jwx4.webp|media/product/2023-09-10-nIJah3Rw5lVxWYdS3n0EgvGaDurq4evWKDHIrS6n.webp|media/product/2023-09-10-db3QqTmbQyFcLGTLkqHyoCaX0cZx8hJCPNqpEjk9.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-09-10 09:31:16', '2023-09-10 10:19:36', NULL),
(26, 'new_arrival', 15, 5, 1, NULL, 'Fashion has been creating well-designed collections since 2010.', 'fashion-has-been-creating-well-designed-collections-since-2010', 'media/product/2023-09-10-gMRLtsuFllNxRGAZkuklFKKZo8xCjhj4MMChsVjw.webp', 'media/product/2023-09-10-4gr2sQ6K9llqbR0vbklY7RY6mFmc5b3MFpo2uk2X.webp|media/product/2023-09-10-Hye3HNBzUt8CNP9CZKgAh1wS2T6OKE9CmmCdweFN.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\",\"8\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]},{\"attribute_id\":\"8\",\"values\":[\"M\",\"S\"]}]', 1, '2023-09-10 09:33:13', '2023-09-10 09:33:13', NULL),
(27, 'new_arrival', 23, 5, 1, NULL, 'Fashion has been creating well-designed collections since 2010.', 'fashion-has-been-creating-well-designed-collections-since-2010-2', 'media/product/2023-09-10-Qoc2uQMQxjpizzIUylAWVdlC27pB1mnW8prdkVKs.webp', 'media/product/2023-09-10-OqXz7nEjZvCXreYKgEch5X0ooYBn530bF6W8amZk.webp|media/product/2023-09-10-zPh4HtWDSj3uHYpuMQ9Ia7IIJ5GYf3hdzD8wq8O0.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-09-10 09:34:46', '2023-09-10 09:34:46', NULL),
(28, 'new_arrival', 19, 5, 1, NULL, 'Quisque dapibus et mi', 'quisque-dapibus-et-mi', 'media/product/2023-09-10-ozbbhVHgBjMAmYukszNZYPGZ8trO7RDFgnILj31w.webp', 'media/product/2023-09-10-M0zVpUw5ZOXY5I5U8RJoyXgTxRsmDkD05Cm7JIbc.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]}]', 1, '2023-09-10 09:36:41', '2023-09-10 09:36:41', NULL),
(29, 'new_arrival', 19, 5, 1, NULL, 'Iphone 5s 64gb', 'iphone-5s-64gb', 'media/product/2023-09-10-SQjznCS4KSi6UfjxOHEb1jO6Celdnorp8DEHsF59.webp', 'media/product/2023-09-10-IupIZUU59bXw6KGMGMaGtxP2Bs7h5IZKEh6j0CZX.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Yellow\"]}]', 1, '2023-09-10 09:38:00', '2023-09-10 09:38:00', NULL),
(30, 'new_arrival', 22, 5, 1, 1, 'Nullam et turpis nec nunc', 'nullam-et-turpis-nec-nunc', 'media/product/2023-09-10-NYtbKyLLyt5y6k3EyuoWANLaz5HrlnzoJVJAfK3A.webp', 'media/product/2023-09-10-HomVvZe9bXpP2wmYX0yjGXp78dVL45r8lyClw0bi.webp|media/product/2023-09-10-AljxChKurdpkxwf3LLZS99UkKVVU3BMN86GzF5KH.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]}]', 1, '2023-09-10 09:39:30', '2023-09-10 09:58:07', NULL),
(31, 'new_arrival', 22, 5, 1, 1, 'Zepp E Square AMOLED Display Waterproof Smartwatch', 'zepp-e-square-amoled-display-waterproof-smartwatch', 'media/product/2023-09-10-QAznXNO9Lqdu1MLbqxetm9fYdjz1xDFwDlJKlKSA.webp', 'media/product/2023-09-10-eE380dVXIcECbcCrAtfLr8VxHlaiRlWDy0DF48De.webp|media/product/2023-09-10-zGLBBq6t5msqRa2ds9iLhPEbXhUGPk9PTgE2TGZk.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Yellow\"]}]', 1, '2023-09-10 09:41:20', '2023-09-10 09:58:27', NULL),
(32, 'new_arrival', 17, 5, 1, 1, 'HUAWEI FreeBuds 5 In-Ear True Wireless Earbuds', 'huawei-freebuds-5-in-ear-true-wireless-earbuds', 'media/product/2023-09-10-MylMUPw7LmarOtopdpKmJA1qUoeNt8g9eVSP20SW.webp', 'media/product/2023-09-10-Yq6u0wAPwrl6TImRwxwmb7iwK96aZJ5ig2aBEfH8.webp|media/product/2023-09-10-gJs3x91iaPQOaWLGulWwPup9eXSneujwInQIh2ck.webp|media/product/2023-09-10-m3uicjzpd89ZztJajdqOSPAmpdTb42FkaCEuX602.webp|media/product/2023-09-10-aUkye8tdZxeZBsilnyB2UFXMIrPui06RnmDVAtQ5.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\",\"Yellow\"]}]', 1, '2023-09-10 09:42:57', '2023-09-10 09:43:31', NULL),
(33, 'new_arrival', 15, 5, 1, 1, 'Brother JA1450NT Electric Sewing Machine', 'brother-ja1450nt-electric-sewing-machine', 'media/product/2023-09-10-3vr26qPFODD9yp6AmaR4m4oDZ5TtUeeADFjeWU3U.webp', NULL, '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-10 09:45:24', '2023-09-10 10:10:54', NULL),
(34, 'new_arrival', 15, 5, 1, NULL, 'Pantum P2506 Single Function Mono Laser Printer (22 PPM)', 'pantum-p2506-single-function-mono-laser-printer-22-ppm', 'media/product/2023-09-10-LKay2dkVDKGCpvzJrOHzePn80dEMzAuBqqsCqHKI.webp', NULL, '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Blue\"]}]', 1, '2023-09-10 09:46:17', '2023-09-10 09:46:17', NULL),
(35, 'new_arrival', 15, 5, 1, NULL, 'Xiaomi Mi A2 L55M7-EAUKR/EAME 55-Inch 4K UltraHD Android Smart LED TV with Netflix Global Version', 'xiaomi-mi-a2-l55m7-eaukreame-55-inch-4k-ultrahd-android-smart-led-tv-with-netflix-global-version', 'media/product/2023-09-10-GznNOHu9T2Jj3gRchUnM1GNcnb6JFpl50dcCbhYy.webp', 'media/product/2023-09-10-qo0FukUs82g3gMP7Jjav8eqNnVmmHlaNSGiD6zC1.webp|media/product/2023-09-10-XMHUPpmH4Ty9Y73J0OAKq7wLhBRNSwNIqd1YRyVk.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Yellow\"]}]', 1, '2023-09-10 09:47:56', '2023-09-10 09:47:56', NULL);
INSERT INTO `products` (`id`, `product_type`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(36, 'new_arrival', 19, 5, 1, NULL, 'Xiaomi Mi A2 L55M7-EAUKR/EAME 55-Inch 4K UltraHD Android Smart LED TV with Netflix Global Version', 'xiaomi-mi-a2-l55m7-eaukreame-55-inch-4k-ultrahd-android-smart-led-tv-with-netflix-global-version-2', 'media/product/2023-09-10-QnM9TO8oRgIJjv8CLDs5kOJosnl4XwoTuYpDoSn3.webp', 'media/product/2023-09-10-9k4xfCn6q3lY2dXF5JkYrSJXFy20Amw3YROlHJ1V.webp|media/product/2023-09-10-VfqqpTVuPpRDffPRjsPfDXjf1kxgUUxEufSI9DlU.webp|media/product/2023-09-10-PCWrbFnxBd9DOr2FvNc37x3BS4kp8LsgjD4stT4Q.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-10 09:50:56', '2023-09-10 09:50:56', NULL),
(37, 'new_arrival', 19, 5, 1, NULL, 'DJ1 Dual Battery Folding Camera Toy Drone', 'dj1-dual-battery-folding-camera-toy-drone', 'media/product/2023-09-10-nAruhNiPjTexqM6aY6PUEqKEUKy1wCZqaDIuBDY3.webp', NULL, '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-10 09:52:13', '2023-09-10 09:52:13', NULL),
(38, 'new_arrival', 27, 5, 1, NULL, 'MSI G2722 27\" FHD 170Hz 1ms IPS Esports Gaming Monitor', 'msi-g2722-27-fhd-170hz-1ms-ips-esports-gaming-monitor', 'media/product/2023-09-10-5fJHaVFR7vpRSJrsxTgZAQ1prZP9o9r8CPb0h6wz.webp', 'media/product/2023-09-10-yWmpGXHmr2irPGMCumjTsmI7vfInIBFkKpoWUxDY.webp|media/product/2023-09-10-SivtQ47MUEYWQcD5BuMwFrJh9PJ3TkWhug2Ixyu1.webp|media/product/2023-09-10-BxGVVzrnENusQJoahn2gnHRlmi3nZr9wpKfndzr6.webp|media/product/2023-09-10-h3Ujdx2twAFSDWTDbDv8dYef5kOFQnXMMSM6QXSp.webp', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!<br></p>', '<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultricies ipsum at quam lobortis maximus eu quis urna. Donec dignissim leo purus, ac euismod tortor volutpat ut. Proin sed semper justo, at tempus orci. Quisque ac mauris sed elit euismod elementum sed eget purus. Pellentesque sit amet libero ac odio mattis placerat. Aenean commodo ullamcorper magna eu iaculis. Fusce laoreet vel justo sed aliquam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pharetra lectus a purus eleifend hendrerit. Nam ac libero sed enim congue ullamcorper ut ac massa. Suspendisse congue maximus tellus, accumsan accumsan augue iaculis sit amet. Nulla facilisi. Cras hendrerit massa tincidunt nisi eleifend, id vulputate nunc tincidunt. In hac habitasse platea dictumst. Mauris ac porta nibh. Sed dictum nunc nec purus fringilla convallis.<br></p>', 'Nunc euismod fringilla', 'Nunc euismod fringilla', 'Nunc euismod fringilla', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-10 09:53:43', '2023-09-10 09:53:43', NULL),
(39, 'new_arrival', 35, NULL, 1, NULL, 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', 'havit-kb487l-usb-multi-function-backlit-black-gaming-keyboard', 'media/product/2023-09-12-FKRZBLQfryA2ghTwQ6syiHKOc7tUIQz8SpUH9mVj.webp', 'media/product/2023-09-12-lhMK2thX0dOHfztJARFXpZ1Hw6S7ul4c9wrl6uCP.webp|media/product/2023-09-12-8aBySeQE8jrUCzdLsCqDztJxNqdsrFtQjQqwL0Ei.webp', '<p>HAVIT KB487L TKL mechanical keyboard with 89-key design saves space on the premise of preserving commonly used number keys. Perfect for office and games. NumLock key is Fn + Backspace, With unique high-quality PBT keycaps, which have excellent wear resistance, can be used for a long time.<br></p>', '<table class=\"data-table flex-table\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: separate; width: 1123.25px; border-spacing: 0px; font-size: 15px; margin-bottom: 1.41575em; color: rgb(68, 68, 68); font-family: &quot;IBM Plex Sans&quot;;\"><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Main Features</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Type</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Multi-Function Backlit Gaming Keyboard</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Wired/Wireless</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Wired</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Keys</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">87</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Cable Length</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">1.5 meter</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Switch Color</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Content Blue switch</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Switch Lifecycle</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">50,000,000 times (keyboard)</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Interface</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">USB</td></tr></tbody><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Physical Attribute</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">System Requirements</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Windows 10, 8, 7, XP, VISTA, Mac OS</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Color</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Black</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Dimensions</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">358.5 x 137 x 37mm</td></tr></tbody><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Warranty Information</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Warranty</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">01 year warranty</td></tr></tbody></table>', '<p>Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard<br></p>', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 03:57:59', '2023-09-12 03:57:59', NULL),
(40, 'new_arrival', 30, 16, 1, NULL, 'Hoco W102 Cool Tour Gaming Headset', 'hoco-w102-cool-tour-gaming-headset', 'media/product/2023-09-12-uP00HYqvBEtBqhxko3l9VuNT3mP2Pq5jQVib4eX4.webp', 'media/product/2023-09-12-JzVs2ZQYb3souin3xwqNexFvC8jMfJ672hv5RBQ0.webp', '<p>HAVIT KB487L TKL mechanical keyboard with 89-key design saves space on the premise of preserving commonly used number keys. Perfect for office and games. NumLock key is Fn + Backspace, With unique high-quality PBT keycaps, which have excellent wear resistance, can be used for a long time.<br></p>', '<table class=\"data-table flex-table\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: separate; width: 1123.25px; border-spacing: 0px; font-size: 15px; margin-bottom: 1.41575em; color: rgb(68, 68, 68); font-family: &quot;IBM Plex Sans&quot;;\"><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Main Features</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Type</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Multi-Function Backlit Gaming Keyboard</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Wired/Wireless</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Wired</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Keys</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">87</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Cable Length</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">1.5 meter</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Switch Color</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Content Blue switch</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Switch Lifecycle</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">50,000,000 times (keyboard)</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Interface</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">USB</td></tr></tbody><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Physical Attribute</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">System Requirements</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Windows 10, 8, 7, XP, VISTA, Mac OS</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Color</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Black</td></tr><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Dimensions</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">358.5 x 137 x 37mm</td></tr></tbody><thead><tr><td class=\"heading-row\" colspan=\"3\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Warranty Information</td></tr></thead><tbody><tr><td class=\"name\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">Warranty</td><td class=\"value\" style=\"border-color: inherit; border-width: 0px; padding-top: 0px; padding-right: 1.41575em; padding-left: 0px; vertical-align: top; background: 0px 0px;\">01 year warranty</td></tr></tbody></table>', '<p>Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard<br></p>', 'Hoco W102 Cool Tour Gaming Headset', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 03:59:51', '2023-09-12 03:59:51', NULL),
(41, 'new_arrival', 30, 16, 1, 1, 'S8 Ultra 4G SIM Supported Android Smart Watch 1GB/16GB', 's8-ultra-4g-sim-supported-android-smart-watch-1gb16gb', 'media/product/2023-09-12-i3o5kol7P7groPxqFYEQaagOWZM1bOz9o9R24Ptw.webp', 'media/product/2023-09-12-asnwGc9WaGSEB4KMCoXBRafomkudpdFehuHV4zmu.webp', '<ul ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc; font-family: Heebo, sans-serif; color: rgb(68, 68, 68);\"><li style=\"margin-bottom: 3px;\">Processor type: SL8541E, Quad-core ARM CortexTM A53 MP processor, up to 1.4GHz.</li><li style=\"margin-bottom: 3px;\">GPU: Mali 820MP1 @ 680MH.</li><li style=\"margin-bottom: 3px;\">WIFI blue tooth: WIFI:2.4G 802.11b\\g\\n BT: v2.1 EDR V4.2 low energy.</li><li style=\"margin-bottom: 3px;\">Positioning: Supports GPS/Beidou/Grants, WIFI2.4G, BT.</li></ul>', '<ul ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc; font-family: Heebo, sans-serif; color: rgb(68, 68, 68);\"><li style=\"margin-bottom: 3px;\">Processor type: SL8541E, Quad-core ARM CortexTM A53 MP processor, up to 1.4GHz.</li><li style=\"margin-bottom: 3px;\">GPU: Mali 820MP1 @ 680MH.</li><li style=\"margin-bottom: 3px;\">WIFI blue tooth: WIFI:2.4G 802.11b\\g\\n BT: v2.1 EDR V4.2 low energy.</li><li style=\"margin-bottom: 3px;\">Positioning: Supports GPS/Beidou/Grants, WIFI2.4G, BT.</li><li style=\"margin-bottom: 3px;\">display:2.02inch,320×386 px.</li><li style=\"margin-bottom: 3px;\">battery:700Mah.</li><li style=\"margin-bottom: 3px;\">E-Sim card: support.</li><li style=\"margin-bottom: 3px;\">TOUCH PANEL: support.</li><li style=\"margin-bottom: 3px;\">2G network:GSM B2/B3/B5/B8.</li><li style=\"margin-bottom: 3px;\">3G network: WCDMA： B1/B2/B5/B8.</li><li style=\"margin-bottom: 3px;\">4G network:LTE_FDD:B1/B2/B3/B5/B7/B8/B20</li><li style=\"margin-bottom: 3px;\">LTE-TDD:B38/39/40/41(100MHz).</li><li style=\"margin-bottom: 3px;\">USB jack: Pogo PIN 4-pin USB.</li><li style=\"margin-bottom: 3px;\">SIM card: Single card NANO SIM card (supports flip card holder).</li><li>7 Days Replacement Warranty.</li></ul>', '<p>Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard<br></p>', 'Hoco W102 Cool Tour Gaming Headset', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', 'Havit KB487L USB Multi-Function Backlit Black Gaming Keyboard', NULL, 1, NULL, NULL, NULL, 1, '[\"7\"]', '[{\"attribute_id\":\"7\",\"values\":[\"Red\",\"Yellow\"]}]', 1, '2023-09-12 04:01:12', '2023-09-12 04:02:36', NULL),
(42, 'new_arrival', 58, NULL, 1, NULL, 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'jisulife-neck-fan-pro1-jisulife-neck-fan-pro1-jisulife-fa45-neck-fan-pro1-deep', 'media/product/2023-09-12-OGMXPtiVgnpvjyRISAfZCr9dP4kLsauqFAVxE60b.webp', 'media/product/2023-09-12-TSgksA78RvzsbIX8QnyOlqcqaAaEFrc1bNFOenwD.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Brand : JisuLife</li><li style=\"margin-bottom: 3px;\">Color : Moonlight/Sakura/Deep Ocean</li><li style=\"margin-bottom: 3px;\">Electric fan design : Wearable Fan</li><li style=\"margin-bottom: 3px;\">Power Source : Battery Powered</li><li style=\"margin-bottom: 3px;\">Product Dimensions : 9.13″D x 2.64″W x 11.02″H</li><li style=\"margin-bottom: 3px;\">Material : Plastic</li><li style=\"margin-bottom: 3px;\">Weight : 11.64 Ounces</li><li style=\"margin-bottom: 3px;\">Special Feature : Breathable Neck Collar, 100 Speeds Turbo Air Duct, LED Display, Stepless Knob</li></ul>', '<h2 class=\"product-title product_title entry-title\" style=\"line-height: 1.25;\">JISULIFE FA45 Neck Fan Pro1 Price in Bangladesh</h2><h3 style=\"margin-bottom: 20px;\">Lightweight, Stylish, Cool</h3><p style=\"margin-bottom: 1.41575em;\">Introducing the Pro Series by Jisulife in 2023, offering an unparalleled high-speed ice-cooling sensation. Mini fashion design, 322g ultra-light and no burden.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Industry Pioneer</h3><p style=\"margin-bottom: 1.41575em;\">100-speed step-less hurricane technology, personalized wind power, adjustable as you like.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Super Battery Life</h3><p style=\"margin-bottom: 1.41575em;\">Power and wind conditions are always informed.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Turbo Wind Gathering</h3><p style=\"margin-bottom: 1.41575em;\">360° surround cold air, with four air duct outlets for zone-based air supply. The outer side is equipped with a wall-mounted high-speed pressurized intake, doubling the intake speed. The inner side has dual turbochargers for strong suction, providing a cool and refreshing sensation.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Cooling Silicone Neck Pillow</h3><p style=\"margin-bottom: 1.41575em;\">Soft and cool silicone material provides a refreshing touch while ensuring comfort for the body, eliminating the annoyance of sticky sweat on the skin when worn.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Pour Attention To Every Detail</h3><p style=\"margin-bottom: 1.41575em;\">Leading the industry with advanced electroplating technology, a fashionable appearance, and a cool touch, it brings you a brand new experience.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Compact Design, Cool Experience</h3><p style=\"margin-bottom: 1.41575em;\">322g super lightweight and burden-free, without adding extra pressure to your cervical spine while providing a refreshing sensation, perfectly embodies the characteristics of Neck Pro1 – compact yet powerful performance.</p><h3 style=\"margin-top: 1.29068em; margin-bottom: 20px;\">Leading Fashion in This Summer</h3><p style=\"margin-bottom: 1.41575em;\">Full hidden enclosed design, preventing hair from getting tangled, allowing people with long hair to wear it without any trouble, and enjoy a silky and cool breeze sensation.</p>', NULL, 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:06:49', '2023-09-12 04:06:49', NULL),
(43, 'new_arrival', 58, NULL, 1, NULL, 'Ulanzi J12 Dual Wireless Microphone For iPhone With Charging Case', 'ulanzi-j12-dual-wireless-microphone-for-iphone-with-charging-case', 'media/product/2023-09-12-zRIKrmTF8Sxfc7qvvQophtZsB4kgYeXk19Ga3biW.webp', 'media/product/2023-09-12-AKdn0lNo83mhKu07rFTO35QXCKnAFt3tbvDwXRHn.webp|media/product/2023-09-12-DIeOn0CvcKCm4GV3e8VJh5Hi6scYyD5cf3CbQM8L.webp|media/product/2023-09-12-thvpkhWkA8dajuGsma9yF7YYUNDKgcR7YBJE6emf.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Color: Black or white</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Product weight: 69g</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Product material: ABS</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Transmission distance: 20m/65ft</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Sound delay: ≤25ms</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Headphone monitoring: Support</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Transmitter battery capacity: 80mAh</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Rechargeable case battery capacity: 800mAh</span></li><li style=\"margin-bottom: 3px;\"><span class=\"a-list-item\">Adapter: 5V/1A</span></li></ul>', '<h2><b>Ulanzi J12 Dual Wireless Microphone</b></h2><h2 class=\"product-title product_title entry-title\" style=\"line-height: 1.25;\"><ul class=\"a-unordered-list a-vertical\" ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc; font-family: Heebo, sans-serif; font-size: 13px; color: rgb(68, 68, 68);\"><li style=\"margin-bottom: 3px;\"><p ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; color: rgb(33, 37, 41); font-size: 14px;\">The Original Ulanzi J12 2-in-1 Plug-Play Wireless Lavalier Microphone is perfect for anyone who wants to make their presentations and videos more exciting. This microphone gives you the freedom to move around and be more expressive while still delivering your message loud and clear.</p><p ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; color: rgb(33, 37, 41); font-size: 14px;\">With our wireless microphone, you can easily amplify your voice and sing along to your favorite songs. The mic is perfect for karaoke, speeches, or just making everyone feel like they’re a part of the show.</p><p ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; color: rgb(33, 37, 41); font-size: 14px;\"><span style=\"font-weight: bolder;\">Features:</span></p><ul ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc; font-size: 14px;\"><li style=\"margin-bottom: 3px;\">Additional Microphone for Wider Use: Support dual-microphone simultaneous recording. Suitable for Living streaming, V-log, Interviews, Short Videos, Mukbang, etc.</li><li style=\"margin-bottom: 3px;\">Adopt an omnidirectional condenser microphone, 360° surround sound pickup, and better spatial sense</li><li style=\"margin-bottom: 3px;\">The built-in intelligent denoise module can effectively filter out the noise, high fidelity sound quality</li><li style=\"margin-bottom: 3px;\">65ft Wireless Receiving</li><li style=\"margin-bottom: 3px;\">No APP is needed. Plug in the receiver on the phone to connect automatically</li><li style=\"margin-bottom: 3px;\">Long-lasting Charging Case: Using wireless earbud type box design, easy to store, lightweight and portable</li></ul><p ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; color: rgb(33, 37, 41); font-size: 14px;\">&nbsp;</p><p ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; color: rgb(33, 37, 41); font-size: 14px;\"><span style=\"font-weight: bolder;\">Tips:</span></p><ul ibm=\"\" plex=\"\" sans\";=\"\" font-size:=\"\" 17px;\"=\"\" style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc; font-size: 14px;\"><li style=\"margin-bottom: 3px;\">There may be some cell phones such as can not use, please try to open OTG, such as OPPO and VIVO. The general way to open OTG: search OTG in the phone settings to open.</li><li style=\"margin-bottom: 3px;\">Incompatible phone models: Samsung S8, S9, S20, Google</li></ul></li></ul></h2>', NULL, 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:10:43', '2023-09-12 04:10:43', NULL),
(44, 'new_arrival', 58, NULL, 1, NULL, 'G7 Bluetooth Neckband With Magnetic Headsets', 'g7-bluetooth-neckband-with-magnetic-headsets', 'media/product/2023-09-12-EEeQzBYMVBWTeVBx3y3i6rikGf27p6cWiZlqqG5z.webp', 'media/product/2023-09-12-4Q2FCDvvp9yuoAfYGTxGlQCnKD6NglWMCZR6rK3Z.webp|media/product/2023-09-12-frBuLezHfjgnlLeNKGtdCPohlZwYGa8t0G79AV1p.webp|media/product/2023-09-12-bxUwVEs1BgZ3m69Iudb6YJD9Zky81x3M8kjWaVNk.webp|media/product/2023-09-12-ewewTvqk2YIAT42y6dU7LfIA65xkvx1WC9mRuQUr.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">High-fidelity stereo sound quality.</li><li style=\"margin-bottom: 3px;\">Built-in high sensitivity microphone and noise canceling technology, ensure crystal high-quality sound no matter whether you are calling or listening to music.!</li><li style=\"margin-bottom: 3px;\">Advanced Bluetooth-compatible 5.2 The upgraded BT V5.2 chip provides a fast, stable, and low-power connection.</li><li style=\"margin-bottom: 3px;\">These headsets are compatible with most smartphones, iPhone, Android devices, and other Bluetooth-enabled devices.!</li><li style=\"margin-bottom: 3px;\">Outstanding battery performance.</li><li style=\"margin-bottom: 3px;\">Built-in large capacity battery, which provides up to 6 hours of continuous music time and 72 hours ultra long standby with a single charge.!</li></ul>', '<h2>G7 Bluetooth Neckband</h2><h2><p style=\"margin-bottom: 1.41575em;\"><span style=\"font-size: 14px;\">Our wireless headphones are perfect for people on the go. With up to 6 hours of talk time, you can stay connected even when you’re not near your phone. And with our 10-meter transmission distance, you can move around freely without losing connection.</span><br><span style=\"font-size: 14px;\">The best part about our headphones is that they come in a stylish neckband design. You can wear them comfortably all day long without feeling weighed down by bulky earphones. Plus, the built-in microphone ensures clear calling quality so you can always be heard loud and clear.</span><br><span style=\"font-size: 14px;\">The G7 neckband is a popular wireless Bluetooth headset in Bangladesh. It is known for its sleek design and high-quality sound output. The neckband is designed to fit comfortably around the neck, with earbuds that can be easily inserted into the ears. It is popular among music lovers, as well as people who use it for making phone calls.</span><br><span style=\"font-size: 14px;\">One of the key features of the G7 neckband is its Bluetooth connectivity. It can be easily paired with a wide range of devices, including smartphones, tablets, and laptops. This makes it a versatile accessory that can be used for a variety of purposes, such as listening to music, watching movies, or making phone calls.</span><br><span style=\"font-size: 14px;\">The G7 neckband is also known for its long battery life. It can provide up to 8 hours of continuous playback on a single charge, which is more than enough for a day’s worth of use. The neckband also features a built-in microphone and call control buttons, making it easy to answer or end phone calls without having to take out your phone.</span><br><span style=\"font-size: 14px;\">Overall, the G7 neckband is a popular choice among music and tech enthusiasts in Bangladesh. Its wireless Bluetooth connectivity, long battery life, and high-quality sound output make it a great accessory for anyone who enjoys listening to music or making phone calls on the go.</span></p></h2>', NULL, 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', 'JISULIFE Neck Fan Pro1 JISULIFE Neck Fan Pro1 JISULIFE FA45 Neck Fan Pro1- Deep', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:14:05', '2023-09-12 04:14:05', NULL),
(45, 'new_arrival', 58, NULL, 1, NULL, 'Awei T13 Pro TWS Touch Earbuds', 'awei-t13-pro-tws-touch-earbuds', 'media/product/2023-09-12-EzqDSonZnrh1JjTX7f7yNp88NduLta4jSJFM98kd.webp', NULL, '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Model: T13 Pro</li><li style=\"margin-bottom: 3px;\">Charging Box Battery: 300mAh</li><li style=\"margin-bottom: 3px;\">Charging Time: 1.5 Hours</li><li style=\"margin-bottom: 3px;\">Waterproof: IPX6</li><li style=\"margin-bottom: 3px;\">Transmission Distance: 10m</li></ul>', '<p>Awei T13 Pro TWS Waterproof Touch Sports Earbuds fit well the ear canal and reduce ear pressure, ensuring in-ear wear comfort and stability. Precise touch control allows you to switch music, adjust volume, and answer/hang up calls easily by simple tapping. It features fast pairing, high-speed transmission, stable connection, and ultra-low latency performance. It also has fast pairing, high-speed transmission, stable connection, and ultra-low latency performance.</p>', NULL, 'Awei T13 Pro TWS Touch Earbuds', 'Awei T13 Pro TWS Touch Earbuds', 'Awei T13 Pro TWS Touch Earbuds', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:15:57', '2023-09-12 04:15:57', NULL),
(46, 'new_arrival', 58, 17, 1, NULL, 'WIWU Crystal Transparent Wireless Mouse', 'wiwu-crystal-transparent-wireless-mouse', 'media/product/2023-09-12-FAHuWbbrLhw7qrChJQtADjKQ5HkpEidEcwiE2VHr.webp', 'media/product/2023-09-12-ZgrnlUWxKOfhG3pEqxefOOsXLNJHxVxZKishGv04.webp|media/product/2023-09-12-wuL1QExLRFfx0jUbarUODLExyXPGt1lO7xcG5vPa.webp|media/product/2023-09-12-GTEHR7EjxX6Xc2RK0AWnwDBrEcMJFWx66Rv9YdXY.webp|media/product/2023-09-12-4RCafdibG3ntHKrOPcMQa5BUKS9dDJXcKgKQpFQa.webp|media/product/2023-09-12-LdabyoeIJvH20KxuHMlcBtnYW7qvp8O2DWhJjnjS.webp|media/product/2023-09-12-HVzrVQCG3sjys7dmHaPkeywBfVKftoBRujFw2DgE.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Bluetooth version:&nbsp;2.4G</li><li style=\"margin-bottom: 3px;\">Connection range:&nbsp;10 meters</li><li style=\"margin-bottom: 3px;\">Battery capacity:&nbsp;400mAh</li><li style=\"margin-bottom: 3px;\">Working time:&nbsp;Up to 12 months</li><li style=\"margin-bottom: 3px;\">Charging time:&nbsp;About 2 hours</li><li style=\"margin-bottom: 3px;\">Weight:&nbsp;76g</li><li style=\"margin-bottom: 3px;\">Connection range:&nbsp;10 meters</li><li style=\"margin-bottom: 3px;\">Battery capacity:&nbsp;400mAh</li><li style=\"margin-bottom: 3px;\">Working time:&nbsp;Up to 12 months</li><li style=\"margin-bottom: 3px;\">Charging time:&nbsp;About 2 hours</li><li style=\"margin-bottom: 3px;\">Weight:&nbsp;76g</li></ul>', '<p style=\"margin-bottom: 1.41575em;\">The WIWU Crystal Transparent Wireless Mouse 2.4G is a unique and stylish mouse that is perfect for anyone who wants a clear view of the inner workings of their mouse. It is made of transparent plastic, which allows you to see the circuit board and other components. The mouse also has a comfortable ergonomic design and a smooth scroll wheel.</p><p style=\"margin-bottom: 1.41575em;\"><img decoding=\"async\" class=\"aligncenter wp-image-40518 size-large perfmatters-lazy entered pmloaded lazy-loaded\" src=\"https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-561x1024.jpeg\" alt=\"WIWU Transparent Crystal Magnetic Wireless Mouse\" width=\"561\" height=\"1024\" title=\"Trendy Hot Selling WIWU Crystal Transparent Wireless Mouse- Gray Color Inside\" data-src=\"https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-561x1024.jpeg\" data-srcset=\"https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-561x1024.jpeg 561w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-164x300.jpeg 164w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-768x1403.jpeg 768w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-841x1536.jpeg 841w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-441x805.jpeg 441w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-250x457.jpeg 250w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-800x1461.jpeg 800w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-150x274.jpeg 150w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD.jpeg 950w\" data-sizes=\"(max-width: 561px) 100vw, 561px\" data-ll-status=\"loaded\" sizes=\"(max-width: 561px) 100vw, 561px\" srcset=\"https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-561x1024.jpeg 561w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-164x300.jpeg 164w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-768x1403.jpeg 768w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-841x1536.jpeg 841w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-441x805.jpeg 441w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-250x457.jpeg 250w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-800x1461.jpeg 800w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD-150x274.jpeg 150w, https://dropshop.com.bd/wp-content/uploads/2023/07/WIWU-Transparent-Crystal-Magnetic-Wireless-Mouse-Price-in-BD.jpeg 950w\" style=\"height: auto; display: block; border: 0px; border-radius: 0px; clear: both; margin-right: auto; margin-left: auto;\"></p><p style=\"margin-bottom: 1.41575em;\">The WIWU Crystal Transparent Wireless Mouse 2.4G connects to your computer using a 2.4GHz wireless connection, which provides a reliable and stable connection. It also has a built-in rechargeable battery, which provides up to 12 months of battery life on a single charge.</p><p style=\"margin-bottom: 1.41575em;\">The WIWU Crystal Transparent Wireless Mouse 2.4G is a great choice for anyone who wants a stylish and functional mouse. It is available in a variety of colors, so you can find the perfect one to match your style.</p>', NULL, 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:18:48', '2023-09-12 04:18:48', NULL),
(47, 'new_arrival', 34, 16, 1, NULL, 'Hoco HB24 6-in-1 Multimedia USB Type-C Hub', 'hoco-hb24-6-in-1-multimedia-usb-type-c-hub', 'media/product/2023-09-12-FGPBe9oIO6vwIumJyTHaApxikuFUREYdzLOGrkN3.webp', 'media/product/2023-09-12-curCjSDQDstlRt2wieoC6bPCHWjxzHis1xZ9foaa.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Material: zinc alloy + ABS + acrylic panel.</li><li style=\"margin-bottom: 3px;\">Interface Type-C male to HDMI + USB3.0 + USB2.0 + SD + TF + PD.</li><li style=\"margin-bottom: 3px;\">Support 4K / 30Hz resolution. Type-C female port supports data transmission. PD maximum support 60W (20V / 3A). SD&amp;TF: 2.0 card reader (does not support simultaneous reading).</li><li style=\"margin-bottom: 3px;\">Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most operating systems such as Windows and for Mac OS).</li></ul>', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Material: zinc alloy + ABS + acrylic panel.</li><li style=\"margin-bottom: 3px;\">Interface Type-C male to HDMI + USB3.0 + USB2.0 + SD + TF + PD.</li><li style=\"margin-bottom: 3px;\">Support 4K / 30Hz resolution. Type-C female port supports data transmission. PD maximum support 60W (20V / 3A). SD&amp;TF: 2.0 card reader (does not support simultaneous reading).</li><li style=\"margin-bottom: 3px;\">Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most operating systems such as Windows and for Mac OS).</li></ul>', NULL, 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:21:31', '2023-09-12 04:21:31', NULL),
(48, 'new_arrival', 34, 11, 1, NULL, 'Dahua HAC-HFW1200TLP 2.0MP Bullet CC Camera', 'dahua-hac-hfw1200tlp-20mp-bullet-cc-camera', 'media/product/2023-09-12-DkWhsCqvCjZuciZ1nIcQxWTLHfeRfowFUpvYRrai.webp', 'media/product/2023-09-12-xyutMgzlMbii6sJ7xuJ2lJR9zFi11JWYg0jwuXKf.webp|media/product/2023-09-12-iDxdAte2NZTjMTSjYTp1kn18pdaXr8h6gSYO5v9L.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Material: zinc alloy + ABS + acrylic panel.</li><li style=\"margin-bottom: 3px;\">Interface Type-C male to HDMI + USB3.0 + USB2.0 + SD + TF + PD.</li><li style=\"margin-bottom: 3px;\">Support 4K / 30Hz resolution. Type-C female port supports data transmission. PD maximum support 60W (20V / 3A). SD&amp;TF: 2.0 card reader (does not support simultaneous reading).</li><li style=\"margin-bottom: 3px;\">Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most operating systems such as Windows and for Mac OS).</li></ul>', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\">Material: zinc alloy + ABS + acrylic panel.</li><li style=\"margin-bottom: 3px;\">Interface Type-C male to HDMI + USB3.0 + USB2.0 + SD + TF + PD.</li><li style=\"margin-bottom: 3px;\">Support 4K / 30Hz resolution. Type-C female port supports data transmission. PD maximum support 60W (20V / 3A). SD&amp;TF: 2.0 card reader (does not support simultaneous reading).</li><li style=\"margin-bottom: 3px;\">Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most operating systems such as Windows and for Mac OS).</li></ul>', NULL, 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:26:27', '2023-09-12 04:26:27', NULL);
INSERT INTO `products` (`id`, `product_type`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(49, 'new_arrival', 34, 11, 1, NULL, 'Deepcool AG400 PLUS Single Tower Air CPU Cooler #R-AG400-BKNNMD-G', 'deepcool-ag400-plus-single-tower-air-cpu-cooler-r-ag400-bknnmd-g', 'media/product/2023-09-12-quQg4570tx09D56FnIa0Ibf3fO3j13Wd4aDc9c8C.webp', 'media/product/2023-09-12-hpslqsVRRSF6TbfOnC83BxXs4LA4b735NJslpR1l.webp|media/product/2023-09-12-SHkX7uxcmQ20mfweIHGQfQPInJ19moZIbJGIYUcD.webp|media/product/2023-09-12-KgDFMCX8gpFF2gxDpLsi9R2ejDEnU1oia4XqU1ct.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Cooler Type - Air CPU Cooler</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Fan Size (Height) - 120mm</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Fan Speed - 2000 RPM</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">LED Color - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Supported Socket - Intel - LGA1700/ LGA1200/ LGA1155/ LGA1150/ LGA1151, AMD - AM5/ AM4</li></ul>', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li style=\"margin-bottom: 3px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 134.125px;\"><h6 class=\"fw-bold\" style=\"\">General</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Brand</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Deepcool</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Model</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Deepcool AG400 PLUS</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Cooler Type</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Air CPU Cooler</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Part No</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">R-AG400-BKNNMD-G</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 381.75px;\"><h6 class=\"fw-bold\">Fan Details</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Bearing Type</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Hydro Bearing</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Number of Fans</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">2</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Size (Height)</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">120mm</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Speed</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">2000 RPM</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Noise Level</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">&lt; -31.6 dB(A)</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Air Flow</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">75.89 CFM</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Air Pressure</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">2.53 mmAq</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Power Connector</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">4-pin PWM</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Rated Current</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">0.17 A</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Rated Voltage</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">12 VDC</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Fan Dimensions</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">120 x 120 x 25mm</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 46.375px;\"><h6 class=\"fw-bold\">Heat Sink &amp; Radiator Details</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Dimension (Heat Sink/Radiator)</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">120 x 92 x 150mm</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 134.125px;\"><h6 class=\"fw-bold\">Technical Info</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">LED Color</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">PWM Mode</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Yes</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Supported CPU Socket Brand</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Intel &amp; AMD</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Supported Socket</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Intel - LGA1700/ LGA1200/ LGA1155/ LGA1150/ LGA1151, AMD - AM5/ AM4</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 63.375px;\"><h6 class=\"fw-bold\">Power</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Cooling Power</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">220W</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Power Consumption</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">2.04 W (Fan)</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 98.75px;\"><h6 class=\"fw-bold\">Physical Description</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Body Color</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Black</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Body Dimensions</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">125 x 107 x 150mm</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Weight (Kg)</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">0.75 kg</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 28px;\"><h6 class=\"fw-bold\">Warranty</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Warranty Details</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">1 year</span></div></div></div></div></div><hr style=\"margin: 0.2rem; border-color: initial; position: relative; left: -15px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x));\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 444.875px;\"><h6 class=\"fw-bold\">Additional Info</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\" style=\"\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Feature</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">High Efficiency Fans, Enjoy better system performance by keeping things cool with up to 220W of heat dissipation power featuring four direct touch heat pipes that rapidly draw heat away from the CPU.</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Specialty</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">Enjoy better system performance by keeping things cool with up to 220W of heat dissipation power featuring four direct touch heat pipes that rapidly draw heat away from the CPU. The AG400 PLUS maintains excellent hardware compatibility with its compact design for 100% RAM clearance and has a slight offset for quick and easy installation. Its superb thermal performance also allows it to be compatible with demanding processing workloads. By optimizing the internal capillary structure and injecting a precise amount of liquid, the heat pipe achieves the best heat dissipation performance regardless of whether the cooler is in a vertical or horizontal case. This perfect ratio facilitates a highly efficient phase change throughout the heat pipe and achieves lower thermal resistance over a wide TDP range.</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Others</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">The DeepCool AG400 PLUS is a single tower 120mm CPU cooler that builds upon our legacy for high-quality cooling performance but stripped down for a streamlined and efficient package. Heatpipe: 6mm x 4pcs., Fan Speed: 500 - 2000 RPM + -10%</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Warranty</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">1 Year</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Country Of Origin</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">China</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"\">Made in/ Assemble</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"\">China</span></div></div></div></div></div></li></ul>', NULL, 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:29:15', '2023-09-12 04:29:15', NULL);
INSERT INTO `products` (`id`, `product_type`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(50, 'new_arrival', 34, 11, 1, NULL, 'Redragon GS812 Andante RGB Bluetooth Black Gaming Speaker', 'redragon-gs812-andante-rgb-bluetooth-black-gaming-speaker', 'media/product/2023-09-12-q7Q28hgwuQhZll5Qp63pvXoXKd51vi3u63ohC0sI.webp', 'media/product/2023-09-12-BaFmCN9cpyImCj9Echlkt6bcJm2HRJrJzsm7hHmL.webp', '<ul style=\"margin-bottom: 1.41575em; margin-left: 20px; list-style-type: disc;\"><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Channel - 2:0</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Connectivity Mode - Bluetooth</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Memory Card Slot - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">USB Port - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Remote Control - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">FM Radio - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Voice Enabled - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Touch Controls - No</li></ul>', '<div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 98.75px;\"><h6 class=\"fw-bold\">General</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Brand</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Redragon</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Model</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Redragon GS812 Andante</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Type</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Gaming</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 134.125px;\"><h6 class=\"fw-bold\">Audio Details</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Channel</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">2:0</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">RMS/Channel (Watt)</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">5Watt x 2</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">RMS/Subwoofer (Watt)</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Output Power</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">10Watt</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 98.75px;\"><h6 class=\"fw-bold\">Connectivity</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Connectivity Mode</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Bluetooth</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">USB Port</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">USB Type</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 63.375px;\"><h6 class=\"fw-bold\">Bluetooth</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Bluetooth Range</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">10 Meter</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Bluetooth Version</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Bluetooth 5.0</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 63.375px;\"><h6 class=\"fw-bold\">Slots</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Memory Card Slot</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Memory Card Type</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 28px;\"><h6 class=\"fw-bold\">Portable PA System</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Number of Input Channel</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">2</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 169.5px;\"><h6 class=\"fw-bold\">Technical Info</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Microphone</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">FM Radio</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Sound Mode</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Stereo</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Input Interface</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">1 x 3.5mm (Headphone), 1 x 3.5mm (Microphone)</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Driver Unit</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">75mm</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 204.875px;\"><h6 class=\"fw-bold\">Performance</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Lighting Effect</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">RGB</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Waterproof</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Waterproof Level/Grade</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Dustproof</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Voice Enabled</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Touch Controls</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 240.25px;\"><h6 class=\"fw-bold\">Power</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Internal Battery Capacity</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Battery.</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Approximate Battery Life</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Rechargeable Battery</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Charging Time</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Operating Range</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">PA System</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 134.125px;\"><h6 class=\"fw-bold\">Physical Description</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Remote Control</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">No</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Dimensions</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">161 x 122 x 208mm</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Color</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Black</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Package Contents</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">Redragon GS812 Andante, DC power cable</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 28px;\"><h6 class=\"fw-bold\">Warranty</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Warranty Details</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">1 Year (Without Adapter)</span></div></div></div></div></div><hr style=\"margin: 0.2rem; color: rgb(33, 37, 41); border-color: initial; position: relative; left: -15px; font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"row justify-content-center\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;\"><div class=\"col-lg-2 col-12\" style=\"width: 217.656px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"h-100 d-flex align-items-center mt-lg-0 mt-2\" style=\"height: 553.5px;\"><h6 class=\"fw-bold\">Additional Info</h6></div></div><div class=\"col-lg-10 col-12\" style=\"width: 1088.33px; padding-right: calc(var(--bs-gutter-x) * .5); padding-left: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><div class=\"grid-container for-last-hr\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Feature</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">4 Real Sound Units, Updated Bass Control, Wooden Enclosure, RGB Lighting Bar. Volume and Bass Knob, RGB Mode Button, BT/AUX Mode Button, Headset and Mic Jacks, AUS 3.5mm Cables, L Speaker Connect Port, DC In Port.</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Others</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">WIRELESS RGB WOODEN DESKTOP SPEAKERS, 3-INCH AUDIO BASS UNIT</span></div></div><hr class=\"details-column-hr\" style=\"margin: 0.2rem; border-color: initial; opacity: 0.1; position: relative; left: -15px;\"><div class=\"row table-hr-remove\" itemprop=\"description\" style=\"--bs-gutter-x: 1.5rem; --bs-gutter-y: 0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-.5 * var(--bs-gutter-x)); margin-left: calc(-.5 * var(--bs-gutter-x)); padding: 2px 0px;\"><div class=\"col-lg-4 col-12 ps-4 ps-lg-0\" style=\"width: 362.766px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-title context\" style=\"font-size: 14px;\">Specialty</span></div><div class=\"col-lg-8 col-12 ps-5 ps-lg-0\" style=\"width: 725.547px; padding-right: calc(var(--bs-gutter-x) * .5); margin-top: var(--bs-gutter-y);\"><span class=\"att-value context\" style=\"font-size: 14px;\">5.0 Bluetooth wireless connection adopted for premium lossless sound quality, stable and no-delay audio</span></div></div></div></div></div>', NULL, 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', 'WIWU Crystal Transparent Wireless Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:32:06', '2023-09-12 04:32:06', NULL);
INSERT INTO `products` (`id`, `product_type`, `category_id`, `brand_id`, `user_id`, `updated_by`, `name`, `slug`, `thumbnail`, `more_images`, `short_description`, `description`, `additional_info`, `meta_title`, `meta_description`, `meta_keyword`, `alert_quantity`, `min_order`, `max_order`, `video`, `video_id`, `variant_product`, `attributes`, `choice_options`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(51, 'new_arrival', 36, NULL, 1, NULL, 'Xtreme XJOGOS XG08 Wired Gaming Mouse', 'xtreme-xjogos-xg08-wired-gaming-mouse', 'media/product/2023-09-12-8DDla1yFqbsx3O0pZaXDVjFh9cJgU3lObwKv9YMp.webp', 'media/product/2023-09-12-AknQQx2O1ZgWvrNxjOjKClqDvzR5naKRKMBhhFJP.webp', '<ul class=\"mt-2 mb-2 category-info\" style=\"padding-left: 20px;\"><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Type - Gaming Mouse</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Connection Type - Wired</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Interface - USB</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Style &amp; Size - Regular Big</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">2X Click - No</li><li class=\"card-text p-0 m-0 fw-normal context\" style=\"\">Lighting - No</li></ul>', '<ul class=\"mt-2 mb-2 category-info\" style=\"padding-left: 20px;\"><li class=\"card-text p-0 m-0 fw-normal context\">Type - Gaming Mouse</li><li class=\"card-text p-0 m-0 fw-normal context\">Connection Type - Wired</li><li class=\"card-text p-0 m-0 fw-normal context\">Interface - USB</li><li class=\"card-text p-0 m-0 fw-normal context\">Style &amp; Size - Regular Big</li><li class=\"card-text p-0 m-0 fw-normal context\">2X Click - No</li><li class=\"card-text p-0 m-0 fw-normal context\">Lighting - No</li></ul>', NULL, 'Xtreme XJOGOS XG08 Wired Gaming Mouse', 'Xtreme XJOGOS XG08 Wired Gaming Mouse', 'Xtreme XJOGOS XG08 Wired Gaming Mouse', NULL, 1, NULL, NULL, NULL, 0, '[]', '[]', 1, '2023-09-12 04:39:54', '2023-09-12 04:39:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `regular_price` double(8,2) NOT NULL,
  `sale_price` double(8,2) NOT NULL,
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

INSERT INTO `product_prices` (`id`, `product_id`, `regular_price`, `sale_price`, `discount`, `discount_tk`, `vendor_price`, `reseller_price`, `created_at`, `updated_at`) VALUES
(20, 21, 1800.00, 1600.00, 12, 200.00, 1400.00, 1500.00, '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(21, 22, 7500.00, 7500.00, 0, 0.00, 7000.00, 7200.00, '2023-09-10 09:25:32', '2023-09-10 09:25:32'),
(22, 23, 15600.00, 15600.00, 0, 0.00, 7000.00, 7200.00, '2023-09-10 09:27:47', '2023-09-10 09:27:47'),
(23, 24, 35000.00, 35000.00, 0, 0.00, 7000.00, 7200.00, '2023-09-10 09:29:19', '2023-09-10 09:29:19'),
(24, 25, 4500.00, 4500.00, 0, 0.00, 4000.00, 4200.00, '2023-09-10 09:31:16', '2023-09-10 09:31:16'),
(25, 26, 5200.00, 5200.00, 0, 0.00, 4800.00, 5000.00, '2023-09-10 09:33:13', '2023-09-10 09:33:13'),
(26, 27, 1350.00, 1350.00, 0, 0.00, 1100.00, 1200.00, '2023-09-10 09:34:46', '2023-09-10 09:34:46'),
(27, 28, 59999.00, 59999.00, 0, 0.00, 55000.00, 57000.00, '2023-09-10 09:36:41', '2023-09-10 09:36:41'),
(28, 29, 33000.00, 33000.00, 0, 0.00, 30000.00, 32000.00, '2023-09-10 09:38:00', '2023-09-10 09:38:00'),
(29, 30, 25000.00, 25000.00, 0, 0.00, 23000.00, 24000.00, '2023-09-10 09:39:30', '2023-09-10 09:39:30'),
(30, 31, 14400.00, 14400.00, 0, 0.00, 13400.00, 14000.00, '2023-09-10 09:41:20', '2023-09-10 09:41:20'),
(31, 32, 15199.00, 15199.00, 0, 0.00, 14000.00, 14500.00, '2023-09-10 09:42:57', '2023-09-10 09:42:57'),
(32, 33, 10300.00, 10300.00, 0, 0.00, 9300.00, 9900.00, '2023-09-10 09:45:24', '2023-09-10 09:45:24'),
(33, 34, 10500.00, 10500.00, 0, 0.00, 9500.00, 9900.00, '2023-09-10 09:46:17', '2023-09-10 09:46:17'),
(34, 35, 58000.00, 58000.00, 0, 0.00, 55000.00, 56000.00, '2023-09-10 09:47:56', '2023-09-10 09:47:56'),
(35, 36, 25999.00, 25999.00, 0, 0.00, 25999.00, 25999.00, '2023-09-10 09:50:56', '2023-09-10 09:50:56'),
(36, 37, 5500.00, 5500.00, 0, 0.00, 5500.00, 5500.00, '2023-09-10 09:52:13', '2023-09-10 09:52:13'),
(37, 38, 31500.00, 31500.00, 0, 0.00, 31500.00, 31500.00, '2023-09-10 09:53:43', '2023-09-10 09:53:43'),
(38, 39, 1350.00, 1350.00, 0, 0.00, 1350.00, 1350.00, '2023-09-12 03:57:59', '2023-09-12 03:57:59'),
(39, 40, 1350.00, 1350.00, 0, 0.00, 1350.00, 1350.00, '2023-09-12 03:59:51', '2023-09-12 03:59:51'),
(40, 41, 4800.00, 4800.00, 0, 0.00, 4800.00, 4800.00, '2023-09-12 04:01:12', '2023-09-12 04:01:12'),
(41, 42, 4800.00, 4800.00, 0, 0.00, 4800.00, 4800.00, '2023-09-12 04:06:49', '2023-09-12 04:06:49'),
(42, 43, 3500.00, 3500.00, 0, 0.00, 3500.00, 3500.00, '2023-09-12 04:10:43', '2023-09-12 04:10:43'),
(43, 44, 390.00, 390.00, 0, 0.00, 390.00, 390.00, '2023-09-12 04:14:05', '2023-09-12 04:14:05'),
(44, 45, 1250.00, 1250.00, 0, 0.00, 1250.00, 1250.00, '2023-09-12 04:15:57', '2023-09-12 04:15:57'),
(45, 46, 1750.00, 1750.00, 0, 0.00, 1750.00, 1750.00, '2023-09-12 04:18:48', '2023-09-12 04:18:48'),
(46, 47, 1800.00, 1800.00, 0, 0.00, 1800.00, 1800.00, '2023-09-12 04:21:31', '2023-09-12 04:21:31'),
(47, 48, 2350.00, 2350.00, 0, 0.00, 2350.00, 2350.00, '2023-09-12 04:26:27', '2023-09-12 04:26:27'),
(48, 49, 2500.00, 2500.00, 0, 0.00, 2500.00, 2500.00, '2023-09-12 04:29:15', '2023-09-12 04:29:15'),
(49, 50, 4150.00, 4150.00, 0, 0.00, 4150.00, 4150.00, '2023-09-12 04:32:06', '2023-09-12 04:32:06'),
(50, 51, 550.00, 550.00, 0, 0.00, 550.00, 550.00, '2023-09-12 04:39:54', '2023-09-12 04:39:54');

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
(27, 21, 'Red-XL', 'Red-XL', 1600, 10, 0, 'media/product/2023-09-06-A6hLWcK3yiY05DIwXxn2vnnMbvGKxSlEH9dP7nis.webp', '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(28, 21, 'Red-L', 'Red-L', 1600, 10, 0, 'media/product/2023-09-06-lwLqt8Xa5m1phj4X8wlA7YrkZ2Fs44E0ZhahZc6O.webp', '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(29, 21, 'Red-M', 'Red-M', 1600, 10, 0, NULL, '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(30, 21, 'Blue-XL', 'Blue-XL', 1600, 10, 0, NULL, '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(31, 21, 'Blue-L', 'Blue-L', 1600, 10, 0, NULL, '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(32, 21, 'Blue-M', 'Blue-M', 1600, 10, 0, NULL, '2023-09-06 09:16:16', '2023-09-06 09:16:16'),
(33, 22, 'Red-XL', 'Red-XL', 7500, 10, 0, NULL, '2023-09-10 09:25:32', '2023-09-10 09:25:32'),
(34, 22, 'Red-L', 'Red-L', 7500, 10, 0, NULL, '2023-09-10 09:25:32', '2023-09-10 09:25:32'),
(35, 22, 'Blue-XL', 'Blue-XL', 7500, 10, 0, NULL, '2023-09-10 09:25:32', '2023-09-10 09:25:32'),
(36, 22, 'Blue-L', 'Blue-L', 7500, 10, 0, NULL, '2023-09-10 09:25:32', '2023-09-10 09:25:32'),
(37, 23, 'Red', 'Red', 15600, 10, 10, NULL, '2023-09-10 09:27:47', '2023-09-17 04:10:48'),
(38, 23, 'Blue', 'Blue', 15600, 10, 10, NULL, '2023-09-10 09:27:47', '2023-09-10 09:27:47'),
(39, 23, 'Yellow', 'Yellow', 15600, 10, 10, NULL, '2023-09-10 09:27:47', '2023-09-10 09:27:47'),
(46, 26, 'Red-M', 'Red-M', 5200, 10, 0, NULL, '2023-09-10 09:33:13', '2023-09-10 09:33:13'),
(47, 26, 'Red-S', 'Red-S', 5200, 10, 0, NULL, '2023-09-10 09:33:13', '2023-09-10 09:33:13'),
(48, 26, 'Blue-M', 'Blue-M', 5200, 10, 0, NULL, '2023-09-10 09:33:13', '2023-09-10 09:33:13'),
(49, 26, 'Blue-S', 'Blue-S', 5200, 10, 0, NULL, '2023-09-10 09:33:13', '2023-09-10 09:33:13'),
(50, 27, 'Red', 'Red', 1350, 10, 0, NULL, '2023-09-10 09:34:46', '2023-09-10 09:34:46'),
(51, 27, 'Blue', 'Blue', 1350, 10, 0, NULL, '2023-09-10 09:34:46', '2023-09-10 09:34:46'),
(52, 27, 'Yellow', 'Yellow', 1350, 10, 0, NULL, '2023-09-10 09:34:46', '2023-09-10 09:34:46'),
(53, 28, 'Red', 'Red', 59999, 10, 0, NULL, '2023-09-10 09:36:41', '2023-09-10 09:36:41'),
(54, 28, 'Blue', 'Blue', 59999, 10, 0, NULL, '2023-09-10 09:36:41', '2023-09-10 09:36:41'),
(55, 29, 'Red', 'Red', 33000, 10, 0, NULL, '2023-09-10 09:38:00', '2023-09-10 09:38:00'),
(56, 29, 'Yellow', 'Yellow', 33000, 10, 0, NULL, '2023-09-10 09:38:00', '2023-09-10 09:38:00'),
(64, 32, 'Red', 'Red', 15199, 10, 0, NULL, '2023-09-10 09:43:31', '2023-09-10 09:43:31'),
(65, 32, 'Blue', 'Blue', 15199, 10, 0, NULL, '2023-09-10 09:43:31', '2023-09-10 09:43:31'),
(66, 32, 'Yellow', 'Yellow', 15199, 10, 0, NULL, '2023-09-10 09:43:31', '2023-09-10 09:43:31'),
(68, 34, 'Red', 'Red', 10500, 10, 0, NULL, '2023-09-10 09:46:17', '2023-09-10 09:46:17'),
(69, 34, 'Blue', 'Blue', 10500, 10, 0, NULL, '2023-09-10 09:46:17', '2023-09-10 09:46:17'),
(70, 35, 'Red', 'Red', 58000, 10, 0, NULL, '2023-09-10 09:47:56', '2023-09-13 07:21:38'),
(71, 35, 'Yellow', 'Yellow', 58000, 10, 0, NULL, '2023-09-10 09:47:56', '2023-09-13 07:21:38'),
(72, 36, NULL, 'T3Rush', 25999, 50, 0, NULL, '2023-09-10 09:50:56', '2023-09-10 09:50:56'),
(73, 37, NULL, 'DJ1', 5500, 55, 0, NULL, '2023-09-10 09:52:13', '2023-09-10 09:52:13'),
(74, 38, NULL, 'G2722', 31500, 55, 0, NULL, '2023-09-10 09:53:43', '2023-09-10 09:53:43'),
(75, 30, 'Red', 'Red', 25000, 10, 1, NULL, '2023-09-10 09:58:07', '2023-09-17 03:11:38'),
(76, 30, 'Blue', 'Blue', 25000, 10, 0, NULL, '2023-09-10 09:58:07', '2023-09-13 07:21:38'),
(77, 31, 'Red', 'Red', 14400, 10, 0, NULL, '2023-09-10 09:58:27', '2023-09-10 09:58:27'),
(78, 31, 'Yellow', 'Yellow', 14400, 10, 0, NULL, '2023-09-10 09:58:27', '2023-09-13 06:51:51'),
(79, 24, 'Red', 'Red', 35000, 10, 0, NULL, '2023-09-10 09:58:50', '2023-09-13 07:36:28'),
(80, 24, 'Blue', 'Blue', 35000, 10, 0, NULL, '2023-09-10 09:58:50', '2023-09-10 09:58:50'),
(81, 24, 'Yellow', 'Yellow', 35000, 10, 0, NULL, '2023-09-10 09:58:50', '2023-09-10 09:58:50'),
(82, 33, NULL, 'JA1450NT', 10300, 50, 0, NULL, '2023-09-10 10:10:54', '2023-09-10 10:10:54'),
(83, 25, 'Red', 'Red', 4500, 10, 0, NULL, '2023-09-10 10:19:36', '2023-09-10 10:19:36'),
(84, 25, 'Blue', 'Blue', 4500, 10, 0, NULL, '2023-09-10 10:19:36', '2023-09-10 10:19:36'),
(85, 25, 'Yellow', 'Yellow', 4500, 10, 0, NULL, '2023-09-10 10:19:36', '2023-09-10 10:19:36'),
(86, 39, NULL, NULL, 1350, 10, 0, NULL, '2023-09-12 03:57:59', '2023-09-12 03:57:59'),
(87, 40, NULL, NULL, 1350, 12, 8, NULL, '2023-09-12 03:59:51', '2023-09-13 07:43:43'),
(90, 41, 'Red', 'Red', 4800, 10, 0, NULL, '2023-09-12 04:02:36', '2023-09-12 04:02:36'),
(91, 41, 'Yellow', 'Yellow', 4800, 10, 0, NULL, '2023-09-12 04:02:36', '2023-09-12 04:02:36'),
(92, 42, NULL, NULL, 4800, 10, 0, NULL, '2023-09-12 04:06:49', '2023-09-12 04:06:49'),
(93, 43, NULL, NULL, 3500, 23, 0, NULL, '2023-09-12 04:10:43', '2023-09-12 04:10:43'),
(94, 44, NULL, NULL, 390, 23, 0, NULL, '2023-09-12 04:14:05', '2023-09-12 04:14:05'),
(95, 45, NULL, NULL, 1250, 20, 0, NULL, '2023-09-12 04:15:57', '2023-09-12 04:15:57'),
(96, 46, NULL, NULL, 1750, 20, 0, NULL, '2023-09-12 04:18:48', '2023-09-12 04:18:48'),
(97, 47, NULL, NULL, 1800, 20, 4, NULL, '2023-09-12 04:21:31', '2023-09-13 07:43:43'),
(98, 48, NULL, NULL, 2350, 20, 0, NULL, '2023-09-12 04:26:27', '2023-09-12 04:26:27'),
(99, 49, NULL, NULL, 2500, 20, 0, NULL, '2023-09-12 04:29:15', '2023-09-12 04:29:15'),
(100, 50, NULL, NULL, 4150, 20, 3, NULL, '2023-09-12 04:32:06', '2023-09-13 07:43:43'),
(101, 51, NULL, NULL, 550, 20, 0, NULL, '2023-09-12 04:39:54', '2023-09-12 04:39:54');

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `star`, `title`, `description`, `images`, `created_at`, `updated_at`) VALUES
(3, 23, 16, 5, NULL, 'Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you\'re ready for summer!', 'media/review/2023-09-17-9Hc24MgWhektcmWNkgfS62w4Ubf0JDFG0pBCQkvu.webp|media/review/2023-09-17-9qwFtOkPbKg5pp9zohVeSXYoOIOI5Im9TsaLuQeb.webp|media/review/2023-09-17-95B75wM8jiA9ZP1R45SvIdfYXViGCyCL4bUFDE9G.webp', '2023-09-17 04:17:01', '2023-09-17 04:17:01'),
(4, 47, 16, 5, NULL, 'Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most', 'media/review/2023-09-17-NIB0etZzYp6nxLEiAVWG1OH4c1iN9WvXc0e0yhCB.webp|media/review/2023-09-17-6icx5SEMRuG0cLdrClHkNetJRtMv9nLuIiXSMuna.webp|media/review/2023-09-17-kJgFBywdPHCRvv2ad91TEOQeBVnFN68zuh2At45d.webp|media/review/2023-09-17-OvAQ4q3DSoyaYxRyOcMgiUqLkAfqbw6ZmpGfWj2A.webp', '2023-09-17 04:22:13', '2023-09-17 04:22:13'),
(5, 30, 16, 3, NULL, 'Support some Type-C mobile phones/tablets OTG functions. Support laptop connection to HD TV/projector/monitor (compatible with most', 'media/review/2023-09-17-uxoUJL77s76xmki0rafqx6aXcggK0MzyrCG04JEY.webp|media/review/2023-09-17-HqnoECmpZvXpO2KKHORGa2X34YU4aK8gdh2uS7Yf.webp|media/review/2023-09-17-nSrkMT3aaiQC3eufCTg618JcPkA3VCRUNvYAuYBr.webp', '2023-09-17 04:22:56', '2023-09-17 04:22:56');

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
(2, 'Software Admin', 'web', '2023-07-10 16:41:33', '2023-07-10 16:41:33');

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
(2, 1),
(2, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
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
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
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
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
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
(104, 1),
(104, 2),
(105, 1),
(105, 2),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(108, 1),
(108, 2),
(109, 1),
(109, 2),
(110, 1),
(110, 2),
(111, 1),
(111, 2),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(115, 2),
(116, 1),
(116, 2),
(117, 1),
(117, 2),
(118, 1),
(118, 2),
(119, 1),
(119, 2),
(120, 1),
(120, 2),
(121, 1),
(121, 2),
(123, 1),
(123, 2),
(124, 1),
(124, 2),
(125, 1),
(125, 2),
(126, 1),
(126, 2),
(127, 1),
(127, 2),
(128, 1),
(128, 2),
(129, 1),
(129, 2),
(130, 1),
(130, 2),
(131, 1),
(131, 2),
(132, 1),
(132, 2),
(133, 1),
(133, 2),
(134, 1),
(134, 2),
(135, 1),
(135, 2),
(136, 1),
(136, 2);

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
(1, 'LeadmartBD', '01997316188', '01997316185', 'support@leadmartbd.com', 'support@domain.com', NULL, '123 Suspendis matti, Visaosang Building VST District, NY Accums, North American', '<div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur<br>adipiscing elit. Integer condimentum. Duis<br>quam tortor eleifend.</div><ul class=\"footer-info__list\"><li>Monday To Friday : 8.00 AM - 8.00 PM</li><li>Satuday : 9.00 AM - 17.30 PM</li><li>Sunday : 9.00 AM - 18.00 PM</li></ul>', NULL, NULL, NULL, NULL, NULL, 'media/default/2023-08-30-7RzsUK0ivycSN4UPsmH466mERrV9hvMa1YfY0ULE.webp', 'media/default/2023-09-10-dGvRjEWTMazzeh2CEyMDptzJIhKbphe5e87SaNVU.webp', 'media/default/2023-09-17-YowdrOp9JNAd4Q6oHy2WA33E8JhAjndgBoI51FUw.webp', NULL, 'https://facebook.com', NULL, 'https://www.youtube.com/', 'https://twitter.com', 'https://linkedin.com', NULL, 'https://whatsapp.com', NULL, NULL, 'media/home-banner/2023-08-29-gZkurW0WjfWlmjPKIIAcEFUHanVkBS6W7v1ZymQl.webp', '#', 'media/home-banner/2023-08-29-Snq5rG2Oc8dGZmou8Rdj1PG7cCgnly9ZQEjoMjtI.webp', '#', '2023-07-16 15:55:30', '2023-09-17 07:56:43');

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
(3, 16, 'office', 'Mosharraf Hossain', 'mosharrafhossain801@gmail.com', '01997316189', 'address', 'address, Haziganj , Chandpur, Chittagong', 20, 36, 283, '2023-09-13 07:21:38', '2023-09-13 07:21:38');

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
(3, NULL, 'media/slider/2023-08-29-Uw4N2qhZjRjTHzS04yijz4Was45zFzfgKKTs89KJ.webp', 1, '2023-08-29 09:48:14', '2023-08-29 09:48:14'),
(4, 'https://zozothemes.com/html/mist/light/index-corporate.html', 'media/slider/2023-08-29-7aAILsdt1SnOwbAnNvIomVThDIMQzsv2JoPh1Ysv.webp', 1, '2023-08-29 09:51:35', '2023-08-29 09:51:35');

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
(1, 1, 'Admin', 'admin', 'admin@gmail.com', NULL, NULL, 'backend/images/avatar/profile-sIWetmiHWXoIuJCDehirsN6DjeCUfRQIua4FNDNo.jpg', 'backend/images/avatar/cover-1ycEtnIsVAWASMAfUeHrMKwnL1FqzkHSRFdKeGln.jpg', 1, NULL, '$2y$10$6Ug1btShXsgUu3YmgZ9tWuJTsbMHOHkkc9uC81S8Z.02cEuIYjCoy', 'a8ZJrlN8CNvzKd6shk9JUiJtfpagInIw5gNGAmWg28OEIMveDSiPp7QVFKL2', '2023-07-10 16:39:44', '2023-08-29 08:57:51'),
(15, 1, 'Fattah', 'fattah', NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$zFzRUyRyT.vNxJJf/mwaL.UcylPgbhAyGsA2hUiJS/2f6NQu5nKcW', NULL, '2023-09-12 14:12:41', '2023-09-12 14:12:41'),
(16, 0, 'Mosharraf Hossain', NULL, 'mosharrafhossain801@gmail.com', '01997316189', NULL, NULL, NULL, 1, NULL, '$2y$10$zFzRUyRyT.vNxJJf/mwaL.UcylPgbhAyGsA2hUiJS/2f6NQu5nKcW', NULL, '2023-09-13 06:51:51', '2023-09-13 06:51:51');

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
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 16, 51, '2023-09-17 07:46:18', '2023-09-17 07:46:18'),
(3, 16, 50, '2023-09-17 07:46:54', '2023-09-17 07:46:54'),
(4, 16, 41, '2023-09-17 07:49:32', '2023-09-17 07:49:32');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flashdeals`
--
ALTER TABLE `flashdeals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flashdeal_products`
--
ALTER TABLE `flashdeal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `home_product_sections`
--
ALTER TABLE `home_product_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
