-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2019 at 09:40 AM
-- Server version: 5.7.22
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adminpanel`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_datetime` datetime NOT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cannonical_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Published','Draft','InActive','Scheduled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `name`, `publish_datetime`, `featured_image`, `content`, `meta_title`, `cannonical_link`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Blog', '2018-12-20 10:00:00', '1545296768bmw 730 (1).jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'test', 'www.blogs.com', 'blog', '<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'blog', 'Published', 1, NULL, '2018-12-20 08:06:08', '2018-12-20 08:06:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'blogs', 1, 1, NULL, '2018-12-20 08:03:16', '2018-12-20 08:03:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_map_categories`
--

CREATE TABLE `blog_map_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_map_categories`
--

INSERT INTO `blog_map_categories` (`id`, `blog_id`, `category_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_map_tags`
--

CREATE TABLE `blog_map_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_map_tags`
--

INSERT INTO `blog_map_tags` (`id`, `blog_id`, `tag_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'blogs', 1, 1, NULL, '2018-12-20 08:06:08', '2018-12-20 08:06:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `created_by`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'asdasdasda', 1, 0, 'App\\Models\\Comment\\Comment', '2018-12-27 13:31:40', '2018-12-27 13:31:40', NULL),
(2, 'asdasdasd', 1, 0, 'App\\Models\\Comment\\Comment', '2018-12-27 13:32:45', '2018-12-27 13:32:45', NULL),
(3, 'asdasdasd', 1, 0, 'App\\Models\\Comment\\Comment', '2018-12-27 13:33:17', '2018-12-27 13:33:17', NULL),
(4, 'asdasdasd', 1, 0, 'App\\Models\\Comment\\Comment', '2018-12-27 13:33:55', '2018-12-27 13:33:55', NULL),
(5, 'asdasdasd', 1, 0, 'App\\Models\\Comment\\Comment', '2018-12-27 13:34:06', '2018-12-27 13:34:06', NULL),
(6, 'asdasdas', 1, 3, 'App\\Models\\Company\\Company', '2018-12-27 13:36:32', '2018-12-27 13:36:32', NULL),
(7, 'second comment', 1, 3, 'App\\Models\\Company\\Company', '2018-12-27 14:00:08', '2018-12-27 14:00:08', NULL),
(8, '<p>Comment from executive</p>', 2, 3, 'App\\Models\\Company\\Company', '2018-12-28 07:52:07', '2018-12-28 07:52:07', NULL),
(9, '<p><em><strong>Bold and italic comment</strong></em></p>', 2, 3, 'App\\Models\\Company\\Company', '2018-12-28 07:54:23', '2018-12-28 07:54:23', NULL),
(10, '<p>Test comment for projects</p>', 1, 9, 'App\\Models\\Project\\Project', '2018-12-28 08:17:45', '2018-12-28 08:17:45', NULL),
(11, '<p>oashdasodhasoidh</p>', 1, 9, 'App\\Models\\Project\\Project', '2018-12-28 08:37:28', '2018-12-28 08:37:28', NULL),
(12, '<p>asdiashdiasidhasd</p>', 1, 13, 'App\\Models\\Task\\Task', '2018-12-28 09:03:47', '2018-12-28 09:03:47', NULL),
(13, '<p>asd</p>', 1, 13, 'App\\Models\\Task\\Task', '2018-12-28 09:04:03', '2018-12-28 09:04:03', NULL),
(15, '<p>test</p>\r\n<p>test</p>\r\n<p>&nbsp;</p>', 1, 9, 'App\\Models\\Task\\Task', '2018-12-28 09:40:29', '2018-12-28 09:40:29', NULL),
(16, '<p>test</p>', 1, 18, 'App\\Models\\Task\\Task', '2018-12-28 09:40:49', '2018-12-28 09:40:49', NULL),
(17, '<p>test123</p>', 1, 18, 'App\\Models\\Task\\Task', '2018-12-28 09:41:02', '2018-12-28 09:41:02', NULL),
(18, '<p>askdhasjkda</p>', 1, 3, 'App\\Models\\Task\\Task', '2018-12-28 09:42:53', '2018-12-28 09:42:53', NULL),
(19, '<p>kajsbndjkasdaskbjd</p>', 1, 3, 'App\\Models\\Task\\Task', '2018-12-28 09:46:12', '2018-12-28 09:46:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `title`, `company_slug`, `website`, `address`, `phone_number`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Padberg PLC', 'padberg-plc', 'raynor.org', '275 Lora MountainsLake Ole, TX 60737-7440', '844.857.3592', '<p>Et fugit et ut aut. A qui quam commodi dolorem enim. Explicabo sapiente omnis et quisquam similique. Inventore est asperiores enim explicabo explicabo.</p>', 0, 5, 1, '2018-12-20 08:45:08', '2018-12-24 15:34:10', NULL),
(2, 'Christiansen Ltd', 'christiansen-ltd', 'crist.com', '5468 Theodora Springs Apt. 445Pearlineton, NH 86107', '1-844-297-0270', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 0, 8, 1, '2018-12-20 08:45:08', '2018-12-28 09:25:51', NULL),
(3, 'Batz Ltd', 'batz-ltd', 'dubuque.biz', '932 Witting Canyon Suite 730Felixbury, VT 73809-1689', '(855) 310-1369', '<p>Quibusdam et repellat aut quidem. Dolorum omnis est id consequatur beatae. In magni quia earum nisi eum delectus pariatur. Corporis repellendus tenetur eos illum non dolorem ea.</p>', 1, 9, 1, '2018-12-20 08:45:08', '2018-12-20 08:46:56', NULL),
(4, 'Haley-Prosacco', 'haley-prosacco', 'witting.net', '2596 Russel Lodge Suite 743New Brookhaven, OH 99684', '(888) 586-8975', '<p>Nihil laborum odit similique ad alias qui distinctio. Quisquam reprehenderit non nisi tenetur. Pariatur debitis qui quaerat excepturi non. Earum quasi est culpa autem voluptas modi.</p>', 1, 1, 1, '2018-12-20 08:45:08', '2018-12-20 08:48:18', NULL),
(5, 'Mann, Hintz and Mosciski', 'mann-hintz-and-mosciski', 'trantow.com', '415 Moriah Estate Apt. 442Goodwinshire, HI 76026-3956', '866-368-9894', '<p>Nulla eaque quasi saepe facilis accusamus. Repudiandae magni et corporis velit. Eos culpa suscipit voluptas minus illum a. Cumque in blanditiis exercitationem vitae.</p>', 1, 8, 1, '2018-12-20 08:45:08', '2018-12-20 08:48:13', NULL),
(6, 'Dietrich, Erdman and Botsford', 'dietrich-erdman-and-botsford', 'kautzer.net', '9796 Dasia Rapid Suite 552Kautzerfurt, MA 66523-6649', '888.205.0531', '<p>Voluptas voluptatibus laborum voluptatum quia. Et eligendi et saepe labore. Consequatur voluptas dolores sint dolor et rerum non expedita.</p>', 1, 7, 1, '2018-12-20 08:45:08', '2018-12-20 08:47:27', NULL),
(7, 'Jenkins-Carter', 'jenkins-carter', 'dickinson.com', '3810 Hodkiewicz VilleStehrburgh, KY 92909', '855-549-0013', '<p>Delectus sequi id harum quia quidem quo iure. Animi assumenda optio rerum voluptatibus est dignissimos. Laborum delectus magnam saepe non assumenda quia suscipit.</p>', 1, 3, 1, '2018-12-20 08:45:08', '2018-12-20 09:48:00', NULL),
(8, 'Donnelly Ltd', 'donnelly-ltd', 'funk.biz', '24025 Alfonzo IslandsColumbusfurt, NJ 75080-7637', '1-866-821-8800', '<p>Quo sit tempore vitae. Vel sapiente doloribus officiis qui molestias eligendi tempora. Doloribus quisquam quod voluptatum ullam ab. Excepturi rem sed pariatur ut facere.</p>', 1, 8, 1, '2018-12-20 08:45:08', '2018-12-26 08:16:50', '2018-12-26 08:16:50'),
(9, 'Franecki, Harvey and Haag', 'franecki-harvey-and-haag', 'nicolas.com', '58833 Bill Loop Apt. 436New Janybury, DE 40862-2295', '844.314.1972', '<p>Facilis at et magni animi. Neque provident nobis quaerat illum id natus. Cumque quas accusamus veniam magni similique voluptatem illo omnis.</p>', 1, 8, 1, '2018-12-20 08:45:08', '2018-12-20 08:47:35', NULL),
(10, 'Littel PLC', 'littel-plc', 'spencer.com', '368 Marcelle HighwayEast Geovanny, VT 80996-1370', '866.882.8121', '<p>Incidunt repudiandae et aut non. Ratione eum officia nostrum unde. Voluptatibus illo consequatur est quia molestiae expedita. Dolorem voluptate sit laborum non.</p>', 1, 1, 1, '2018-12-20 08:45:08', '2018-12-20 08:47:43', NULL),
(11, 'Kihn-Sanford', 'kihn-sanford', 'klocko.com', '493 Tristin Cliff Apt. 173Lucianofort, NJ 56489', '844-572-3533', '<p>Et qui omnis aliquid dolorem aliquam laborum. Et consequatur consectetur dolor dolorum et amet repellendus. Et beatae et ut molestiae ut. Voluptates quidem alias suscipit voluptatem.</p>', 1, 5, 1, '2018-12-20 08:45:08', '2018-12-20 08:47:32', NULL),
(12, 'O\'Connell, Koelpin and Beer', 'oconnell-koelpin-and-beer', 'daniel.com', '27328 Greta FieldMargrettown, LA 23350-6049', '(888) 704-4041', '<p>Impedit dolorem vitae eaque et tempora ea. Deleniti fugiat nam rerum quaerat excepturi quam. Accusamus voluptas eligendi alias dolorum minima earum. Perferendis recusandae itaque sit perferendis.</p>', 1, 3, 1, '2018-12-20 08:45:08', '2018-12-20 08:46:48', NULL),
(13, 'Test', 'test', 'test.com', 'test 10a', '1234567', '<p>testtesttesttesttesttest</p>', 1, 1, NULL, '2018-12-24 08:43:00', '2018-12-24 08:43:00', NULL),
(14, 'Second test', 'second-test', 'secondtest.com', 'secondtest1', '1234567', '<p>Second testSecond testSecond testSecond testSecond test</p>', 1, 2, NULL, '2018-12-24 08:48:50', '2018-12-24 08:49:06', '2018-12-24 08:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `type_id`, `user_id`, `entity_id`, `icon`, `class`, `text`, `assets`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 49, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>test-test</strong>', NULL, '2018-12-12 13:32:09', '2018-12-12 13:32:09'),
(2, 3, 1, 49, 'save', 'bg-aqua', 'trans(\"history.backend.permissions.updated\") <strong>test-test</strong>', NULL, '2018-12-12 13:32:33', '2018-12-12 13:32:33'),
(3, 1, 1, 3, 'times', 'bg-yellow', 'trans(\"history.backend.users.deactivated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"User Test\",3]}', '2018-12-14 12:59:38', '2018-12-14 12:59:38'),
(4, 1, 1, 3, 'check', 'bg-green', 'trans(\"history.backend.users.reactivated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"User Test\",3]}', '2018-12-14 12:59:56', '2018-12-14 12:59:56'),
(5, 3, 1, 50, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>view-company</strong>', NULL, '2018-12-17 12:38:35', '2018-12-17 12:38:35'),
(6, 3, 1, 49, 'trash', 'bg-maroon', 'trans(\"history.backend.permissions.deleted\") <strong>test-test</strong>', NULL, '2018-12-17 12:38:49', '2018-12-17 12:38:49'),
(7, 3, 1, 50, 'save', 'bg-aqua', 'trans(\"history.backend.permissions.updated\") <strong>view-company</strong>', NULL, '2018-12-17 12:39:04', '2018-12-17 12:39:04'),
(8, 3, 1, 51, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>create-company</strong>', NULL, '2018-12-17 12:40:03', '2018-12-17 12:40:03'),
(9, 3, 1, 52, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>edit-company</strong>', NULL, '2018-12-17 12:40:49', '2018-12-17 12:40:49'),
(10, 3, 1, 53, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>delete-company</strong>', NULL, '2018-12-17 12:41:20', '2018-12-17 12:41:20'),
(11, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:11:28', '2018-12-19 14:11:28'),
(12, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:11:44', '2018-12-19 14:11:44'),
(13, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:14:09', '2018-12-19 14:14:09'),
(14, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:14:58', '2018-12-19 14:14:58'),
(15, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:15:51', '2018-12-19 14:15:51'),
(16, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:17:26', '2018-12-19 14:17:26'),
(17, 4, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.pages.updated\") <strong>Terms and conditions</strong>', NULL, '2018-12-19 14:17:39', '2018-12-19 14:17:39'),
(18, 8, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Stehr-Batz</strong>', NULL, '2018-12-19 14:51:23', '2018-12-19 14:51:23'),
(19, 8, 1, 10, 'plus', 'bg-green', 'trans(\"history.backend.companies.created\") <strong>Test</strong>', NULL, '2018-12-19 14:51:52', '2018-12-19 14:51:52'),
(20, 8, 1, 10, 'trash', 'bg-maroon', 'trans(\"history.backend.companies.deleted\") <strong>Test</strong>', NULL, '2018-12-19 14:52:05', '2018-12-19 14:52:05'),
(21, 8, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Stehr-Batz</strong>', NULL, '2018-12-19 14:52:31', '2018-12-19 14:52:31'),
(22, 8, 1, 4, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Friesen, Thompson and Dooley</strong>', NULL, '2018-12-20 07:50:34', '2018-12-20 07:50:34'),
(23, 8, 1, 14, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Labadie-Mitchell</strong>', NULL, '2018-12-20 07:52:07', '2018-12-20 07:52:07'),
(24, 8, 1, 5, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Bruen-Daugherty</strong>', NULL, '2018-12-20 07:52:44', '2018-12-20 07:52:44'),
(25, 8, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Rosenbaum, Ebert and Lemke</strong>', NULL, '2018-12-20 07:53:07', '2018-12-20 07:53:07'),
(26, 8, 1, 13, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Labadie, Oberbrunner and Kemmer</strong>', NULL, '2018-12-20 07:53:37', '2018-12-20 07:53:37'),
(27, 8, 1, 6, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Welch-Doyle</strong>', NULL, '2018-12-20 07:53:52', '2018-12-20 07:53:52'),
(28, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Abbott-Schuppe</strong>', NULL, '2018-12-20 07:54:09', '2018-12-20 07:54:09'),
(29, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Abbott-Schuppe</strong>', NULL, '2018-12-20 07:54:33', '2018-12-20 07:54:33'),
(30, 8, 1, 12, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Green Inc</strong>', NULL, '2018-12-20 07:54:46', '2018-12-20 07:54:46'),
(31, 8, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Stehr-Batz</strong>', NULL, '2018-12-20 07:54:57', '2018-12-20 07:54:57'),
(32, 8, 1, 15, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Hoeger-Auer</strong>', NULL, '2018-12-20 07:55:07', '2018-12-20 07:55:07'),
(33, 8, 1, 11, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Gottlieb, Grant and Quigley</strong>', NULL, '2018-12-20 07:55:32', '2018-12-20 07:55:32'),
(34, 6, 1, 1, 'plus', 'bg-green', 'trans(\"history.backend.blogcategories.created\") <strong>blogs</strong>', NULL, '2018-12-20 08:03:16', '2018-12-20 08:03:16'),
(35, 7, 1, 1, 'plus', 'bg-green', 'trans(\"history.backend.blogs.created\") <strong>Blog</strong>', NULL, '2018-12-20 08:06:08', '2018-12-20 08:06:08'),
(36, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Christiansen Ltd</strong>', NULL, '2018-12-20 08:46:42', '2018-12-20 08:46:42'),
(37, 8, 1, 12, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>O\'Connell, Koelpin and Beer</strong>', NULL, '2018-12-20 08:46:48', '2018-12-20 08:46:48'),
(38, 8, 1, 7, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Jenkins-Carter</strong>', NULL, '2018-12-20 08:46:52', '2018-12-20 08:46:52'),
(39, 8, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Batz Ltd</strong>', NULL, '2018-12-20 08:46:56', '2018-12-20 08:46:56'),
(40, 8, 1, 8, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Donnelly Ltd</strong>', NULL, '2018-12-20 08:47:00', '2018-12-20 08:47:00'),
(41, 8, 1, 6, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Dietrich, Erdman and Botsford</strong>', NULL, '2018-12-20 08:47:27', '2018-12-20 08:47:27'),
(42, 8, 1, 11, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Kihn-Sanford</strong>', NULL, '2018-12-20 08:47:32', '2018-12-20 08:47:32'),
(43, 8, 1, 9, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Franecki, Harvey and Haag</strong>', NULL, '2018-12-20 08:47:35', '2018-12-20 08:47:35'),
(44, 8, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Padberg PLC</strong>', NULL, '2018-12-20 08:47:39', '2018-12-20 08:47:39'),
(45, 8, 1, 10, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Littel PLC</strong>', NULL, '2018-12-20 08:47:43', '2018-12-20 08:47:43'),
(46, 8, 1, 5, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Mann, Hintz and Mosciski</strong>', NULL, '2018-12-20 08:48:13', '2018-12-20 08:48:13'),
(47, 8, 1, 4, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Haley-Prosacco</strong>', NULL, '2018-12-20 08:48:18', '2018-12-20 08:48:18'),
(48, 8, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Padberg PLC</strong>', NULL, '2018-12-20 09:24:58', '2018-12-20 09:24:58'),
(49, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Christiansen Ltd</strong>', NULL, '2018-12-20 09:35:24', '2018-12-20 09:35:24'),
(50, 8, 1, 7, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Jenkins-Carter</strong>', NULL, '2018-12-20 09:48:00', '2018-12-20 09:48:00'),
(51, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Christiansen Ltd</strong>', NULL, '2018-12-20 09:53:29', '2018-12-20 09:53:29'),
(52, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Christiansen Ltd</strong>', NULL, '2018-12-20 12:17:48', '2018-12-20 12:17:48'),
(53, 1, 1, 9, 'save', 'bg-aqua', 'trans(\"history.backend.users.updated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"Cecile Metz PhD Santina Huel\",9]}', '2018-12-20 12:36:09', '2018-12-20 12:36:09'),
(54, 8, 1, 13, 'plus', 'bg-green', 'trans(\"history.backend.companies.created\") <strong>Test</strong>', NULL, '2018-12-24 08:43:00', '2018-12-24 08:43:00'),
(55, 1, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.users.updated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"Vipul Basapati\",2]}', '2018-12-24 08:47:34', '2018-12-24 08:47:34'),
(56, 8, 2, 14, 'plus', 'bg-green', 'trans(\"history.backend.companies.created\") <strong>Second test</strong>', NULL, '2018-12-24 08:48:50', '2018-12-24 08:48:50'),
(57, 8, 2, 14, 'trash', 'bg-maroon', 'trans(\"history.backend.companies.deleted\") <strong>Second test</strong>', NULL, '2018-12-24 08:49:06', '2018-12-24 08:49:06'),
(58, 3, 1, 54, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>view-project</strong>', NULL, '2018-12-24 09:39:33', '2018-12-24 09:39:33'),
(59, 3, 1, 55, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>create-project</strong>', NULL, '2018-12-24 09:42:53', '2018-12-24 09:42:53'),
(60, 3, 1, 56, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>edit-project</strong>', NULL, '2018-12-24 09:43:28', '2018-12-24 09:43:28'),
(61, 3, 1, 57, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>delete-project</strong>', NULL, '2018-12-24 09:44:06', '2018-12-24 09:44:06'),
(62, 9, 1, 9, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Animi minima a et.</strong>', NULL, '2018-12-24 13:51:59', '2018-12-24 13:51:59'),
(63, 8, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Padberg PLC</strong>', NULL, '2018-12-24 15:33:19', '2018-12-24 15:33:19'),
(64, 8, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Padberg PLC</strong>', NULL, '2018-12-24 15:34:10', '2018-12-24 15:34:10'),
(65, 9, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Magni unde.</strong>', NULL, '2018-12-26 07:48:16', '2018-12-26 07:48:16'),
(66, 9, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Magni unde.</strong>', NULL, '2018-12-26 07:48:33', '2018-12-26 07:48:33'),
(67, 9, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Magni unde.12</strong>', NULL, '2018-12-26 07:48:47', '2018-12-26 07:48:47'),
(68, 9, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Magni unde.</strong>', NULL, '2018-12-26 07:49:01', '2018-12-26 07:49:01'),
(69, 9, 1, 16, 'plus', 'bg-green', 'trans(\"history.backend.projects.created\") <strong>Update2</strong>', NULL, '2018-12-26 08:07:06', '2018-12-26 08:07:06'),
(70, 8, 1, 8, 'trash', 'bg-maroon', 'trans(\"history.backend.companies.deleted\") <strong>Donnelly Ltd</strong>', NULL, '2018-12-26 08:16:50', '2018-12-26 08:16:50'),
(71, 9, 1, 17, 'plus', 'bg-green', 'trans(\"history.backend.projects.created\") <strong>Update23</strong>', NULL, '2018-12-26 08:35:00', '2018-12-26 08:35:00'),
(72, 9, 1, 16, 'trash', 'bg-maroon', 'trans(\"history.backend.projects.deleted\") <strong>Update2</strong>', NULL, '2018-12-26 08:35:23', '2018-12-26 08:35:23'),
(73, 9, 1, 17, 'trash', 'bg-maroon', 'trans(\"history.backend.projects.deleted\") <strong>Update23</strong>', NULL, '2018-12-26 08:35:34', '2018-12-26 08:35:34'),
(74, 9, 1, 18, 'plus', 'bg-green', 'trans(\"history.backend.projects.created\") <strong>Project test</strong>', NULL, '2018-12-26 08:36:40', '2018-12-26 08:36:40'),
(75, 3, 1, 58, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>view-task</strong>', NULL, '2018-12-26 11:25:12', '2018-12-26 11:25:12'),
(76, 3, 1, 59, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>create-task</strong>', NULL, '2018-12-26 11:26:02', '2018-12-26 11:26:02'),
(77, 3, 1, 60, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>edit-task</strong>', NULL, '2018-12-26 11:26:30', '2018-12-26 11:26:30'),
(78, 3, 1, 61, 'plus', 'bg-green', 'trans(\"history.backend.permissions.created\") <strong>delete-task</strong>', NULL, '2018-12-26 11:27:00', '2018-12-26 11:27:00'),
(79, 9, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Magni unde</strong>', NULL, '2018-12-26 12:10:48', '2018-12-26 12:10:48'),
(80, 9, 1, 18, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Project test</strong>', NULL, '2018-12-26 12:10:56', '2018-12-26 12:10:56'),
(81, 9, 1, 14, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Rerum occaecati sit</strong>', NULL, '2018-12-26 12:11:01', '2018-12-26 12:11:01'),
(82, 9, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Exercitationem quasi velit ut</strong>', NULL, '2018-12-26 12:11:08', '2018-12-26 12:11:08'),
(83, 9, 1, 15, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Aut cumque magnam illo</strong>', NULL, '2018-12-26 12:11:15', '2018-12-26 12:11:15'),
(84, 9, 1, 10, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Consectetur tenetur dolorem</strong>', NULL, '2018-12-26 12:11:23', '2018-12-26 12:11:23'),
(85, 9, 1, 6, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Ea repellendus hic</strong>', NULL, '2018-12-26 12:11:26', '2018-12-26 12:11:26'),
(86, 9, 1, 5, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Voluptatum aliquam ut quam</strong>', NULL, '2018-12-26 12:11:41', '2018-12-26 12:11:41'),
(87, 9, 1, 11, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Beatae eligendi et nemo</strong>', NULL, '2018-12-26 12:11:44', '2018-12-26 12:11:44'),
(88, 9, 1, 13, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Similique deleniti</strong>', NULL, '2018-12-26 12:11:47', '2018-12-26 12:11:47'),
(89, 9, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Repudiandae voluptatem non et</strong>', NULL, '2018-12-26 12:12:26', '2018-12-26 12:12:26'),
(90, 9, 1, 7, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Et omnis fuga</strong>', NULL, '2018-12-26 12:12:28', '2018-12-26 12:12:28'),
(91, 9, 1, 4, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Praesentium quo voluptas sed</strong>', NULL, '2018-12-26 12:12:33', '2018-12-26 12:12:33'),
(92, 9, 1, 12, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Omnis laboriosam</strong>', NULL, '2018-12-26 12:12:36', '2018-12-26 12:12:36'),
(93, 9, 1, 8, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Quos vitae dolor</strong>', NULL, '2018-12-26 12:12:38', '2018-12-26 12:12:38'),
(94, 9, 1, 9, 'save', 'bg-aqua', 'trans(\"history.backend.projects.updated\") <strong>Animi minima a et</strong>', NULL, '2018-12-26 12:12:41', '2018-12-26 12:12:41'),
(95, 10, 1, 7, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Vel aut ab alias</strong>', NULL, '2018-12-26 12:31:23', '2018-12-26 12:31:23'),
(96, 10, 1, 12, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Non voluptates</strong>', NULL, '2018-12-26 12:31:29', '2018-12-26 12:31:29'),
(97, 10, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Laboriosam maxime enim</strong>', NULL, '2018-12-26 12:31:34', '2018-12-26 12:31:34'),
(98, 10, 1, 8, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Enim nihil blanditiis in</strong>', NULL, '2018-12-26 12:31:41', '2018-12-26 12:31:41'),
(99, 10, 1, 5, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Eos pariatur reprehenderit</strong>', NULL, '2018-12-26 12:31:47', '2018-12-26 12:31:47'),
(100, 10, 1, 9, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Sit autem aut debitis</strong>', NULL, '2018-12-26 12:31:53', '2018-12-26 12:31:53'),
(101, 10, 1, 15, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Voluptatum odit dignissimos qui dolor</strong>', NULL, '2018-12-26 12:32:00', '2018-12-26 12:32:00'),
(102, 10, 1, 1, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Laborum eius vero tempora</strong>', NULL, '2018-12-26 12:32:04', '2018-12-26 12:32:04'),
(103, 10, 1, 14, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Cumque quis aut iusto</strong>', NULL, '2018-12-26 12:32:09', '2018-12-26 12:32:09'),
(104, 10, 1, 10, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Nesciunt voluptatibus et</strong>', NULL, '2018-12-26 12:32:45', '2018-12-26 12:32:45'),
(105, 10, 1, 13, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Animi ex tempora a</strong>', NULL, '2018-12-26 12:32:51', '2018-12-26 12:32:51'),
(106, 10, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Quod id perferendis</strong>', NULL, '2018-12-26 12:32:56', '2018-12-26 12:32:56'),
(107, 10, 1, 4, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Porro sint reprehenderit</strong>', NULL, '2018-12-26 12:33:04', '2018-12-26 12:33:04'),
(108, 10, 1, 11, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Illum iusto architecto</strong>', NULL, '2018-12-26 12:33:12', '2018-12-26 12:33:12'),
(109, 10, 1, 7, 'save', 'bg-aqua', 'trans(\"history.backend.tasks.updated\") <strong>Vel aut ab alias</strong>', NULL, '2018-12-26 12:34:22', '2018-12-26 12:34:22'),
(110, 10, 1, 19, 'plus', 'bg-green', 'trans(\"history.backend.tasks.created\") <strong>aaTest</strong>', NULL, '2018-12-26 12:56:34', '2018-12-26 12:56:34'),
(111, 10, 1, 20, 'plus', 'bg-green', 'trans(\"history.backend.tasks.created\") <strong>asdasd</strong>', NULL, '2018-12-26 13:27:45', '2018-12-26 13:27:45'),
(112, 10, 1, 20, 'trash', 'bg-maroon', 'trans(\"history.backend.tasks.deleted\") <strong>asdasd</strong>', NULL, '2018-12-26 13:27:59', '2018-12-26 13:27:59'),
(113, 10, 1, 19, 'trash', 'bg-maroon', 'trans(\"history.backend.tasks.deleted\") <strong>aaTest</strong>', NULL, '2018-12-26 13:44:16', '2018-12-26 13:44:16'),
(114, 1, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.users.updated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"User Test\",3]}', '2018-12-28 07:44:38', '2018-12-28 07:44:38'),
(115, 1, 1, 3, 'save', 'bg-aqua', 'trans(\"history.backend.users.updated\") <strong>{user}</strong>', '{\"user_link\":[\"admin.access.user.show\",\"User Test\",3]}', '2018-12-28 07:45:51', '2018-12-28 07:45:51'),
(116, 8, 1, 2, 'save', 'bg-aqua', 'trans(\"history.backend.companies.updated\") <strong>Christiansen Ltd</strong>', NULL, '2018-12-28 09:25:51', '2018-12-28 09:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `history_types`
--

CREATE TABLE `history_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_types`
--

INSERT INTO `history_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'User', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(2, 'Role', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(3, 'Permission', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(4, 'Page', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(5, 'BlogTag', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(6, 'BlogCategory', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(7, 'Blog', '2018-12-12 09:05:49', '2018-12-12 09:05:49'),
(8, 'Company', '2018-12-19 15:50:00', '2018-12-19 15:50:00'),
(9, 'Project', '2018-12-24 14:52:34', '2018-12-24 14:52:34'),
(10, 'Task', '2018-12-26 13:30:25', '2018-12-26 13:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('backend','frontend') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `type`, `name`, `items`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'backend', 'Backend Sidebar Menu', '[{\"id\":11,\"name\":\"Access Management\",\"url\":\"\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-users\",\"view_permission_id\":\"view-access-management\",\"content\":\"Access Management\",\"children\":[{\"id\":12,\"name\":\"User Management\",\"url\":\"admin.access.user.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-user-management\",\"content\":\"User Management\"},{\"id\":13,\"name\":\"Role Management\",\"url\":\"admin.access.role.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-role-management\",\"content\":\"Role Management\"},{\"id\":14,\"name\":\"Permission Management\",\"url\":\"admin.access.permission.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-permission-management\",\"content\":\"Permission Management\"}]},{\"id\":1,\"name\":\"Module\",\"url\":\"admin.modules.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-wrench\",\"view_permission_id\":\"view-module\",\"content\":\"Module\"},{\"id\":3,\"name\":\"Menus\",\"url\":\"admin.menus.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-bars\",\"view_permission_id\":\"view-menu\",\"content\":\"Menus\"},{\"id\":2,\"name\":\"Pages\",\"url\":\"admin.pages.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-file-text\",\"view_permission_id\":\"view-page\",\"content\":\"Pages\"},{\"id\":9,\"name\":\"Settings\",\"url\":\"admin.settings.edit?id=1\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-gear\",\"view_permission_id\":\"edit-settings\",\"content\":\"Settings\"},{\"id\":15,\"name\":\"Blog Management\",\"url\":\"\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-commenting\",\"view_permission_id\":\"view-blog\",\"content\":\"Blog Management\",\"children\":[{\"id\":16,\"name\":\"Blog Category Management\",\"url\":\"admin.blogCategories.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-blog-category\",\"content\":\"Blog Category Management\"},{\"id\":17,\"name\":\"Blog Tag Management\",\"url\":\"admin.blogTags.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-blog-tag\",\"content\":\"Blog Tag Management\"},{\"id\":18,\"name\":\"Blog Management\",\"url\":\"admin.blogs.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"view_permission_id\":\"view-blog\",\"content\":\"Blog Management\"}]},{\"id\":19,\"name\":\"Faq Management\",\"url\":\"admin.faqs.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-question-circle\",\"view_permission_id\":\"view-faq\",\"content\":\"Faq Management\"},{\"id\":20,\"name\":\"Companies\",\"url\":\"admin.companies.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-building\",\"view_permission_id\":\"view-company\",\"content\":\"Companies\"},{\"id\":21,\"name\":\"Projects\",\"url\":\"admin.projects.index\",\"url_type\":\"route\",\"open_in_new_tab\":0,\"icon\":\"fa-briefcase\",\"view_permission_id\":\"view-project\",\"content\":\"Projects\"},{\"view_permission_id\":\"view-task\",\"icon\":\"fa-tasks\",\"open_in_new_tab\":0,\"url_type\":\"route\",\"url\":\"admin.tasks.index\",\"name\":\"Tasks\",\"id\":22,\"content\":\"Tasks\"}]', 1, NULL, '2018-12-12 09:05:49', '2018-12-26 11:29:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_11_02_060149_create_blog_categories_table', 1),
(2, '2017_11_02_060149_create_blog_map_categories_table', 1),
(3, '2017_11_02_060149_create_blog_map_tags_table', 1),
(4, '2017_11_02_060149_create_blog_tags_table', 1),
(5, '2017_11_02_060149_create_blogs_table', 1),
(6, '2017_11_02_060149_create_faqs_table', 1),
(7, '2017_11_02_060149_create_history_table', 1),
(8, '2017_11_02_060149_create_history_types_table', 1),
(9, '2017_11_02_060149_create_modules_table', 1),
(10, '2017_11_02_060149_create_notifications_table', 1),
(11, '2017_11_02_060149_create_pages_table', 1),
(12, '2017_11_02_060149_create_password_resets_table', 1),
(13, '2017_11_02_060149_create_permission_role_table', 1),
(14, '2017_11_02_060149_create_permission_user_table', 1),
(15, '2017_11_02_060149_create_permissions_table', 1),
(16, '2017_11_02_060149_create_role_user_table', 1),
(17, '2017_11_02_060149_create_roles_table', 1),
(18, '2017_11_02_060149_create_sessions_table', 1),
(19, '2017_11_02_060149_create_settings_table', 1),
(20, '2017_11_02_060149_create_social_logins_table', 1),
(21, '2017_11_02_060149_create_users_table', 1),
(22, '2017_11_02_060152_add_foreign_keys_to_history_table', 1),
(23, '2017_11_02_060152_add_foreign_keys_to_notifications_table', 1),
(24, '2017_11_02_060152_add_foreign_keys_to_permission_role_table', 1),
(25, '2017_11_02_060152_add_foreign_keys_to_permission_user_table', 1),
(26, '2017_11_02_060152_add_foreign_keys_to_role_user_table', 1),
(27, '2017_11_02_060152_add_foreign_keys_to_social_logins_table', 1),
(28, '2017_12_10_122555_create_menus_table', 1),
(29, '2017_12_24_042039_add_null_constraint_on_created_by_on_user_table', 1),
(30, '2017_12_28_005822_add_null_constraint_on_created_by_on_role_table', 1),
(31, '2017_12_28_010952_add_null_constraint_on_created_by_on_permission_table', 1),
(33, '2018_12_17_090923_create_companies_table', 2),
(34, '2018_12_24_084744_create_projects_table', 3),
(35, '2018_12_24_090615_add_foreign_keys_to_projects_table', 3),
(36, '2018_12_24_091033_add_foreign_keys_to_companies_table', 3),
(37, '2018_12_26_100917_create_tasks_table', 4),
(38, '2018_12_26_101242_add_foreign_keys_to_tasks_table', 4),
(39, '2018_12_27_094028_create_comments_table', 5),
(40, '2018_12_27_094908_add_foreign_keys_to_comments_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `view_permission_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'view_route',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `view_permission_id`, `name`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'view-access-management', 'Access Management', NULL, 1, NULL, '2018-12-12 09:05:49', NULL),
(2, 'view-user-management', 'User Management', 'admin.access.user.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(3, 'view-role-management', 'Role Management', 'admin.access.role.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(4, 'view-permission-management', 'Permission Management', 'admin.access.permission.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(5, 'view-menu', 'Menus', 'admin.menus.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(6, 'view-module', 'Module', 'admin.modules.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(7, 'view-page', 'Pages', 'admin.pages.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(8, 'edit-settings', 'Settings', 'admin.settings.edit', 1, NULL, '2018-12-12 09:05:49', NULL),
(9, 'view-blog', 'Blog Management', NULL, 1, NULL, '2018-12-12 09:05:49', NULL),
(10, 'view-blog-category', 'Blog Category Management', 'admin.blogcategories.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(11, 'view-blog-tag', 'Blog Tag Management', 'admin.blogtags.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(12, 'view-blog', 'Blog Management', 'admin.blogs.index', 1, NULL, '2018-12-12 09:05:49', NULL),
(13, 'view-faq', 'Faq Management', 'admin.faqs.index', 1, NULL, '2018-12-12 09:05:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - Dashboard , 2 - Email , 3 - Both',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `user_id`, `type`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 09:04:57', '2018-12-12 09:20:18'),
(2, 'User Logged In: Vipul', 1, 1, 1, '2018-12-12 09:17:19', '2018-12-12 09:20:18'),
(3, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 09:17:47', '2018-12-12 09:40:53'),
(4, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 09:20:02', '2018-12-12 09:40:53'),
(5, 'User Logged In: User', 1, 1, 1, '2018-12-12 09:35:56', '2018-12-12 11:43:41'),
(6, 'User Logged In: User', 1, 1, 1, '2018-12-12 09:36:20', '2018-12-12 12:23:37'),
(7, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 09:38:51', '2018-12-12 13:32:43'),
(8, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 11:05:19', '2018-12-12 13:58:52'),
(9, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 11:41:24', '2018-12-14 12:56:34'),
(10, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 12:13:20', '2018-12-14 13:27:32'),
(11, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 13:29:56', '2018-12-14 13:27:32'),
(12, 'User Logged In: Viral', 1, 1, 1, '2018-12-12 13:47:57', '2018-12-14 14:46:27'),
(13, 'User Logged In: Viral', 1, 1, 1, '2018-12-14 12:47:42', '2018-12-14 14:46:27'),
(14, 'User Logged In: Viral', 1, 1, 1, '2018-12-14 13:18:01', '2018-12-17 07:33:21'),
(15, 'User Logged In: Viral', 1, 1, 1, '2018-12-14 14:14:26', '2018-12-17 08:00:53'),
(16, 'User Logged In: Viral', 1, 1, 1, '2018-12-14 14:44:52', '2018-12-17 09:27:35'),
(17, 'User Logged In: Viral', 1, 1, 1, '2018-12-14 14:57:58', '2018-12-17 09:27:35'),
(18, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 07:33:10', '2018-12-17 11:16:53'),
(19, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 07:59:45', '2018-12-17 11:16:53'),
(20, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 09:03:53', '2018-12-17 12:36:30'),
(21, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 09:53:57', '2018-12-17 12:36:30'),
(22, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 11:12:10', '2018-12-17 13:54:47'),
(23, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 12:22:32', '2018-12-17 15:31:28'),
(24, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 12:35:26', '2018-12-17 15:58:38'),
(25, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 13:37:33', '2018-12-17 15:58:38'),
(26, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 13:52:38', '2018-12-19 08:07:37'),
(27, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 15:26:59', '2018-12-19 08:23:39'),
(28, 'User Logged In: Viral', 1, 1, 1, '2018-12-17 15:58:30', '2018-12-19 08:39:09'),
(29, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 07:40:38', '2018-12-19 09:37:46'),
(30, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 08:06:16', '2018-12-19 09:58:03'),
(31, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 08:23:31', '2018-12-19 09:58:03'),
(32, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 08:37:09', '2018-12-19 11:52:47'),
(33, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 08:50:11', '2018-12-19 12:19:23'),
(34, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 09:55:47', '2018-12-19 13:27:03'),
(35, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 11:10:23', '2018-12-19 14:04:06'),
(36, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 11:36:12', '2018-12-19 14:52:21'),
(37, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 12:14:04', '2018-12-20 07:36:16'),
(38, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 13:21:55', '2018-12-20 09:22:49'),
(39, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 13:43:41', '2018-12-20 09:48:18'),
(40, 'User Logged In: Viral', 1, 1, 1, '2018-12-19 14:51:12', '2018-12-20 09:48:18'),
(41, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 07:35:44', '2018-12-20 12:11:05'),
(42, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 08:45:48', '2018-12-20 12:34:08'),
(43, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 09:47:47', '2018-12-20 13:22:13'),
(44, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 11:05:51', '2018-12-20 13:46:25'),
(45, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 11:21:39', '2018-12-20 13:46:25'),
(46, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 12:33:00', '2018-12-20 14:45:51'),
(47, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 13:17:56', '2018-12-20 14:45:51'),
(48, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 13:44:55', '2018-12-20 14:45:51'),
(49, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 14:08:11', '2018-12-21 07:58:43'),
(50, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 14:45:15', '2018-12-21 07:58:43'),
(51, 'User Logged In: Viral', 1, 1, 1, '2018-12-20 15:49:11', '2018-12-21 07:58:43'),
(52, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 07:40:58', '2018-12-21 09:22:49'),
(53, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 07:58:34', '2018-12-21 09:22:49'),
(54, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 08:30:27', '2018-12-21 09:22:49'),
(55, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 09:01:08', '2018-12-21 11:24:24'),
(56, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 09:22:40', '2018-12-21 11:24:24'),
(57, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 09:36:04', '2018-12-21 12:10:14'),
(58, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 11:08:59', '2018-12-21 13:06:11'),
(59, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 11:24:10', '2018-12-21 13:06:11'),
(60, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 11:50:13', '2018-12-21 15:15:34'),
(61, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 12:09:39', '2018-12-21 15:15:34'),
(62, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 13:04:40', '2018-12-21 15:15:34'),
(63, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 13:51:15', '2018-12-24 07:26:06'),
(64, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 15:13:33', '2018-12-24 07:43:31'),
(65, 'User Logged In: User', 1, 1, 1, '2018-12-21 15:18:22', '2018-12-24 07:43:31'),
(66, 'User Logged In: Viral', 1, 1, 1, '2018-12-21 15:36:07', '2018-12-24 07:43:31'),
(67, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 07:25:42', '2018-12-24 07:43:31'),
(68, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 07:41:40', '2018-12-24 07:43:31'),
(69, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 08:42:06', '2018-12-24 08:54:09'),
(70, 'User Logged In: Vipul', 1, 1, 1, '2018-12-24 08:46:21', '2018-12-24 09:55:32'),
(71, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 08:46:54', '2018-12-24 15:58:19'),
(72, 'User Logged In: Vipul', 1, 1, 1, '2018-12-24 08:47:55', '2018-12-26 07:42:04'),
(73, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 08:49:27', '2018-12-26 13:45:27'),
(74, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 09:38:16', '2018-12-26 13:45:27'),
(75, 'User Logged In: Viral', 1, 1, 1, '2018-12-24 11:08:58', '2018-12-27 14:08:08'),
(76, 'User Logged In: Viral', 1, 1, 1, '2018-12-26 07:41:57', '2018-12-27 14:08:08'),
(77, 'User Logged In: Viral', 1, 1, 1, '2018-12-26 11:24:41', '2018-12-27 14:08:08'),
(78, 'User Logged In: Viral', 1, 1, 1, '2018-12-27 08:22:48', '2018-12-27 14:08:08'),
(79, 'User Logged In: Viral', 1, 1, 1, '2018-12-27 10:55:38', '2018-12-27 14:08:08'),
(80, 'User Logged In: Viral', 1, 1, 1, '2018-12-28 07:36:46', '2018-12-28 07:46:01'),
(81, 'User Logged In: User', 1, 1, 1, '2018-12-28 07:39:40', '2018-12-28 07:46:01'),
(82, 'User Logged In: User', 1, 1, 1, '2018-12-28 07:40:10', '2018-12-28 07:43:58'),
(83, 'User Logged In: Viral', 1, 1, 1, '2018-12-28 07:40:57', '2018-12-28 07:43:58'),
(84, 'User Logged In: Viral', 1, 1, 1, '2018-12-28 07:42:01', '2018-12-28 07:43:58'),
(85, 'User Logged In: User', 1, 1, 1, '2018-12-28 07:42:45', '2018-12-28 08:15:05'),
(86, 'User Logged In: Viral', 1, 1, 1, '2018-12-28 07:43:25', '2018-12-28 08:15:05'),
(87, 'User Logged In: User', 1, 1, 1, '2018-12-28 07:44:57', '2018-12-28 08:15:05'),
(88, 'User Logged In: Vipul', 1, 1, 1, '2018-12-28 07:51:37', '2018-12-28 08:15:05'),
(89, 'User Logged In: Viral', 1, 1, 1, '2018-12-28 08:14:57', '2018-12-28 08:15:05'),
(90, 'User Logged In: Viral', 1, 1, 0, '2018-12-31 07:32:38', NULL),
(91, 'User Logged In: Viral', 1, 1, 0, '2019-01-03 09:47:54', NULL),
(92, 'User Logged In: Viral', 1, 1, 0, '2019-01-03 11:28:57', NULL),
(93, 'User Logged In: Viral', 1, 1, 0, '2019-01-14 07:39:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cannonical_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `page_slug`, `description`, `cannonical_link`, `seo_title`, `seo_keyword`, `seo_description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms and conditions', 'terms-and-conditions', '<p>terms and conditions</p>', NULL, NULL, NULL, NULL, 1, 1, 1, '2018-12-12 09:05:49', '2018-12-19 14:17:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'view-backend', 'View Backend', 1, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(2, 'view-frontend', 'View Frontend', 2, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(3, 'view-access-management', 'View Access Management', 3, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(4, 'view-user-management', 'View User Management', 4, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(5, 'view-active-user', 'View Active User', 5, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(6, 'view-deactive-user', 'View Deactive User', 6, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(7, 'view-deleted-user', 'View Deleted User', 7, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(8, 'show-user', 'Show User Details', 8, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(9, 'create-user', 'Create User', 9, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(10, 'edit-user', 'Edit User', 9, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(11, 'delete-user', 'Delete User', 10, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(12, 'activate-user', 'Activate User', 11, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(13, 'deactivate-user', 'Deactivate User', 12, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(14, 'login-as-user', 'Login As User', 13, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(15, 'clear-user-session', 'Clear User Session', 14, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(16, 'view-role-management', 'View Role Management', 15, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(17, 'create-role', 'Create Role', 16, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(18, 'edit-role', 'Edit Role', 17, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(19, 'delete-role', 'Delete Role', 18, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(20, 'view-permission-management', 'View Permission Management', 19, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(21, 'create-permission', 'Create Permission', 20, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(22, 'edit-permission', 'Edit Permission', 21, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(23, 'delete-permission', 'Delete Permission', 22, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(24, 'view-page', 'View Page', 23, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(25, 'create-page', 'Create Page', 24, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(26, 'edit-page', 'Edit Page', 25, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(27, 'delete-page', 'Delete Page', 26, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(28, 'view-email-template', 'View Email Templates', 27, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(29, 'create-email-template', 'Create Email Templates', 28, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(30, 'edit-email-template', 'Edit Email Templates', 29, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(31, 'delete-email-template', 'Delete Email Templates', 30, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(32, 'edit-settings', 'Edit Settings', 31, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(33, 'view-blog-category', 'View Blog Categories Management', 32, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(34, 'create-blog-category', 'Create Blog Category', 33, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(35, 'edit-blog-category', 'Edit Blog Category', 34, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(36, 'delete-blog-category', 'Delete Blog Category', 35, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(37, 'view-blog-tag', 'View Blog Tags Management', 36, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(38, 'create-blog-tag', 'Create Blog Tag', 37, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(39, 'edit-blog-tag', 'Edit Blog Tag', 38, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(40, 'delete-blog-tag', 'Delete Blog Tag', 39, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(41, 'view-blog', 'View Blogs Management', 40, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(42, 'create-blog', 'Create Blog', 41, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(43, 'edit-blog', 'Edit Blog', 42, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(44, 'delete-blog', 'Delete Blog', 43, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(45, 'view-faq', 'View FAQ Management', 44, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(46, 'create-faq', 'Create FAQ', 45, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(47, 'edit-faq', 'Edit FAQ', 46, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(48, 'delete-faq', 'Delete FAQ', 47, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(49, 'test-test', 'Test Test', 48, 1, 1, 1, '2018-12-12 13:32:09', '2018-12-17 12:38:49', '2018-12-17 12:38:49'),
(50, 'view-company', 'View Company', 48, 1, 1, 1, '2018-12-17 12:38:35', '2018-12-17 12:39:04', NULL),
(51, 'create-company', 'Create Company', 49, 1, 1, NULL, '2018-12-17 12:40:03', '2018-12-17 12:40:03', NULL),
(52, 'edit-company', 'Edit Company', 50, 1, 1, NULL, '2018-12-17 12:40:49', '2018-12-17 12:40:49', NULL),
(53, 'delete-company', 'Delete Company', 51, 1, 1, NULL, '2018-12-17 12:41:20', '2018-12-17 12:41:20', NULL),
(54, 'view-project', 'View Project', 52, 1, 1, NULL, '2018-12-24 09:39:33', '2018-12-24 09:39:33', NULL),
(55, 'create-project', 'Create Project', 53, 1, 1, NULL, '2018-12-24 09:42:52', '2018-12-24 09:42:52', NULL),
(56, 'edit-project', 'Edit Project', 54, 1, 1, NULL, '2018-12-24 09:43:28', '2018-12-24 09:43:28', NULL),
(57, 'delete-project', 'Delete Project', 55, 1, 1, NULL, '2018-12-24 09:44:06', '2018-12-24 09:44:06', NULL),
(58, 'view-task', 'View Task', 56, 1, 1, NULL, '2018-12-26 11:25:12', '2018-12-26 11:25:12', NULL),
(59, 'create-task', 'Create Task', 57, 1, 1, NULL, '2018-12-26 11:26:02', '2018-12-26 11:26:02', NULL),
(60, 'edit-task', 'Edit Task', 58, 1, 1, NULL, '2018-12-26 11:26:30', '2018-12-26 11:26:30', NULL),
(61, 'delete-task', 'Delete Task', 59, 1, 1, NULL, '2018-12-26 11:27:00', '2018-12-26 11:27:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 2),
(2, 3, 2),
(3, 4, 2),
(4, 5, 2),
(5, 6, 2),
(6, 7, 2),
(7, 8, 2),
(8, 16, 2),
(9, 20, 2),
(10, 24, 2),
(11, 25, 2),
(12, 26, 2),
(13, 27, 2),
(14, 28, 2),
(15, 29, 2),
(16, 30, 2),
(17, 31, 2),
(18, 33, 2),
(19, 34, 2),
(20, 35, 2),
(21, 36, 2),
(22, 37, 2),
(23, 38, 2),
(24, 39, 2),
(25, 40, 2),
(26, 41, 2),
(27, 42, 2),
(28, 43, 2),
(29, 44, 2),
(30, 45, 2),
(31, 46, 2),
(32, 47, 2),
(33, 48, 2),
(34, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`id`, `permission_id`, `user_id`) VALUES
(35, 2, 9),
(36, 1, 2),
(37, 3, 2),
(38, 4, 2),
(39, 5, 2),
(40, 6, 2),
(41, 7, 2),
(42, 8, 2),
(43, 16, 2),
(44, 20, 2),
(45, 24, 2),
(46, 25, 2),
(47, 26, 2),
(48, 27, 2),
(49, 28, 2),
(50, 29, 2),
(51, 30, 2),
(52, 31, 2),
(53, 33, 2),
(54, 34, 2),
(55, 35, 2),
(56, 36, 2),
(57, 37, 2),
(58, 38, 2),
(59, 39, 2),
(60, 40, 2),
(61, 41, 2),
(62, 42, 2),
(63, 43, 2),
(64, 44, 2),
(65, 45, 2),
(66, 46, 2),
(67, 47, 2),
(68, 48, 2),
(69, 50, 2),
(70, 51, 2),
(71, 52, 2),
(72, 53, 2),
(75, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeframe` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `project_slug`, `timeframe`, `description`, `status`, `created_by`, `updated_by`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Exercitationem quasi velit ut', 'exercitationem-quasi-velit-ut', 7, '<p>Excepturi expedita dolorem cum culpa aliquid optio dolor consequatur. Tenetur amet mollitia nobis harum vero iusto praesentium. Quod illum modi qui unde soluta nisi voluptate. Et quos laborum eum sit quis.</p>', 1, 5, 1, 6, '2018-12-24 11:30:54', '2018-12-26 12:11:08', NULL),
(2, 'Repudiandae voluptatem non et', 'repudiandae-voluptatem-non-et', 23, '<p>Sed et necessitatibus nostrum quo et. Eos consequatur eum error occaecati laborum.</p>', 1, 5, 1, 1, '2018-12-24 11:30:54', '2018-12-26 12:12:26', NULL),
(3, 'Magni unde', 'magni-unde', 1, '<p>Sunt et commodi dolores voluptas et quia dicta. Dolorem accusamus laborum iste qui voluptatem consequuntur aut. Cupiditate nihil ut ab expedita et quia fuga et.</p>', 1, 3, 1, 2, '2018-12-24 11:30:54', '2018-12-26 12:10:48', NULL),
(4, 'Praesentium quo voluptas sed', 'praesentium-quo-voluptas-sed', 24, '<p>Dolorem beatae rem dolorem odio dolore. Autem et ducimus mollitia qui fuga maxime nihil. Molestiae totam quidem numquam omnis et soluta esse.</p>', 1, 6, 1, 4, '2018-12-24 11:30:54', '2018-12-26 12:12:33', NULL),
(5, 'Voluptatum aliquam ut quam', 'voluptatum-aliquam-ut-quam', 14, '<p>Illo ut dolorem ut enim impedit aut vel. Aliquid et soluta voluptates iure eum sed sunt unde. Velit qui dolorem nesciunt. Velit fugit modi dicta voluptas sed et.</p>', 1, 3, 1, 11, '2018-12-24 11:30:54', '2018-12-26 12:11:41', NULL),
(6, 'Ea repellendus hic', 'ea-repellendus-hic', 13, '<p>Ex dolor id officia molestiae expedita. Ea id aliquam voluptas non. Quisquam ut est hic dolores optio. Et repudiandae porro sint temporibus. Distinctio minima fuga voluptas magnam alias quae ducimus.</p>', 1, 5, 1, 10, '2018-12-24 11:30:54', '2018-12-26 12:11:26', NULL),
(7, 'Et omnis fuga', 'et-omnis-fuga', 23, '<p>Est dolore harum nulla voluptas vero iste saepe ea. Consequuntur perferendis repudiandae in vel laudantium a. Tenetur harum itaque reiciendis.</p>', 1, 1, 1, 1, '2018-12-24 11:30:54', '2018-12-26 12:12:28', NULL),
(8, 'Quos vitae dolor', 'quos-vitae-dolor', 37, '<p>Eum harum est quas et. Ratione cum fuga cum id vel sit et. Omnis nulla sit est hic. Dolorem est magni illum sint rerum nostrum.</p>', 1, 9, 1, 10, '2018-12-24 11:30:54', '2018-12-26 12:12:38', NULL),
(9, 'Animi minima a et', 'animi-minima-a-et', 47, '<p>Ea quia doloribus debitis itaque ea eveniet. Omnis nihil sed pariatur necessitatibus veritatis cupiditate et. Deleniti non perspiciatis itaque. Porro et labore laboriosam deserunt.</p>', 1, 2, 1, 6, '2018-12-24 11:30:54', '2018-12-26 12:12:41', NULL),
(10, 'Consectetur tenetur dolorem', 'consectetur-tenetur-dolorem', 12, '<p>Porro voluptatum repudiandae ab pariatur aliquid consectetur dolore. Ut veniam in deserunt molestiae et odio. Qui consequatur ipsum maiores id non quis.</p>', 1, 1, 1, 10, '2018-12-24 11:30:54', '2018-12-26 12:11:23', NULL),
(11, 'Beatae eligendi et nemo', 'beatae-eligendi-et-nemo', 15, '<p>Dolores adipisci illum quasi amet at velit sit. Qui voluptate sed omnis aliquam et. Voluptatem est magnam natus expedita vero accusantium mollitia.</p>', 1, 5, 1, 12, '2018-12-24 11:30:54', '2018-12-26 12:11:44', NULL),
(12, 'Omnis laboriosam', 'omnis-laboriosam', 33, '<p>Doloremque excepturi tempore et nostrum sed in quisquam. Laboriosam ea omnis pariatur quaerat expedita.</p>', 1, 5, 1, 7, '2018-12-24 11:30:54', '2018-12-26 12:12:36', NULL),
(13, 'Similique deleniti', 'similique-deleniti', 21, '<p>Repellat quia ea ut atque. Rerum aliquam odio dolor tenetur velit debitis sunt. Harum in alias et quam quia qui eum culpa. Sint eum assumenda repellat non autem itaque quas. Non cum corporis autem velit velit ab.</p>', 1, 4, 1, 5, '2018-12-24 11:30:54', '2018-12-26 12:11:47', NULL),
(14, 'Rerum occaecati sit', 'rerum-occaecati-sit', 6, '<p>Ducimus cupiditate ut aut animi molestiae ut. Est expedita ea quia tempora. Doloremque doloribus totam dicta delectus sapiente maxime unde.</p>', 1, 1, 1, 7, '2018-12-24 11:30:54', '2018-12-26 12:11:01', NULL),
(15, 'Aut cumque magnam illo', 'aut-cumque-magnam-illo', 10, '<p>Est est aliquam voluptas est modi. Quo sunt odio dolor porro culpa debitis et. Harum iste nisi iusto quas nisi est atque sed.</p>', 1, 8, 1, 10, '2018-12-24 11:30:54', '2018-12-26 12:11:15', NULL),
(16, 'Update2', 'update2', 1, '<p>12321</p>', 1, 1, NULL, 1, '2018-12-26 08:07:06', '2018-12-26 08:35:23', '2018-12-26 08:35:23'),
(17, 'Update23', 'update23', 1, '<p>1234</p>', 1, 1, NULL, 2, '2018-12-26 08:35:00', '2018-12-26 08:35:34', '2018-12-26 08:35:34'),
(18, 'Project test', 'project-test', 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel dolor turpis. In maximus placerat ipsum eget ullamcorper. Morbi sed pellentesque est. Duis ipsum nunc, facilisis vestibulum pellentesque at, malesuada nec libero. Integer finibus ligula ut purus sagittis gravida.&nbsp;</p>', 1, 1, 1, 9, '2018-12-26 08:36:40', '2018-12-26 12:10:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `all`, `sort`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', 1, 1, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(2, 'Executive', 0, 2, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(3, 'User', 0, 3, 1, 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(4, 9, 3),
(5, 2, 2),
(7, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keyword` text COLLATE utf8mb4_unicode_ci,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `company_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci,
  `disclaimer` text COLLATE utf8mb4_unicode_ci,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `home_video1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_video2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_video3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_video4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `seo_title`, `seo_keyword`, `seo_description`, `company_contact`, `company_address`, `from_name`, `from_email`, `facebook`, `linkedin`, `twitter`, `google`, `copyright_text`, `footer_text`, `terms`, `disclaimer`, `google_analytics`, `home_video1`, `home_video2`, `home_video3`, `home_video4`, `explanation1`, `explanation2`, `explanation3`, `explanation4`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Laravel Admin Panel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-12 11:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeframe` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `task_slug`, `timeframe`, `description`, `status`, `created_by`, `updated_by`, `project_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Laborum eius vero tempora', 'laborum-eius-vero-tempora', 31, '<p>Voluptate aut voluptas nulla similique veniam fuga recusandae. Neque non et consequatur aliquam. Omnis ut vitae itaque suscipit eos aperiam.</p>', 1, 9, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:32:04', NULL),
(2, 'Laboriosam maxime enim', 'laboriosam-maxime-enim', 10, '<p>Et sit et veniam necessitatibus veritatis rerum. Autem et aut et ut veniam voluptatem. Voluptate nihil itaque excepturi sed quas et sint. Voluptatem debitis alias reiciendis dolores. Esse architecto adipisci suscipit dolore magnam id et.</p>', 1, 2, 1, 13, '2018-12-26 09:49:33', '2018-12-26 12:31:34', NULL),
(3, 'Quod id perferendis', 'quod-id-perferendis', 45, '<p>Architecto nulla eligendi inventore dolor cupiditate. Ipsam quia esse totam quia officia rerum explicabo.</p>', 1, 5, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:32:56', NULL),
(4, 'Porro sint reprehenderit', 'porro-sint-reprehenderit', 45, '<p>Ipsum voluptatem consequatur aut mollitia et. Adipisci quia sit officia dolorem magni id doloribus dolorum. Iste expedita et veritatis sint quod accusantium est. Enim dolor modi saepe et perferendis.</p>', 1, 6, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:33:04', NULL),
(5, 'Eos pariatur reprehenderit', 'eos-pariatur-reprehenderit', 17, '<p>Quis perspiciatis numquam laborum. Accusamus modi provident ducimus aut fugit. Sapiente et sint praesentium ut incidunt adipisci ullam. Temporibus vel et aut sit.</p>', 1, 3, 1, 14, '2018-12-26 09:49:33', '2018-12-26 12:31:47', NULL),
(6, 'Harum et labore omnis iusto', 'harum-et-labore-omnis-iusto', 3, '<p>Necessitatibus vero rerum sequi itaque a id aut. Sit odio aut assumenda non molestiae. Quidem magni aut doloremque repellat molestias.</p>', 1, 1, 1, 15, '2018-12-26 09:49:33', '2018-12-26 12:29:39', NULL),
(7, 'Vel aut ab alias', 'vel-aut-ab-alias', 6, '<p>Fugit et quos minima. Quo qui quia incidunt consequuntur doloremque et. Ut ea cumque sit provident ut vero adipisci ut.</p>', 1, 2, 1, 11, '2018-12-26 09:49:33', '2018-12-26 12:34:22', NULL),
(8, 'Enim nihil blanditiis in', 'enim-nihil-blanditiis-in', 10, '<p>Nam et ratione aut dolore. Nemo dolores sed numquam inventore et sit. Quod quae autem odit ullam. Voluptas vitae nam eos et.</p>', 1, 9, 1, 15, '2018-12-26 09:49:33', '2018-12-26 12:31:41', NULL),
(9, 'Sit autem aut debitis', 'sit-autem-aut-debitis', 23, '<p>Et nihil dolores et earum reiciendis porro. Aliquam omnis dolore nesciunt occaecati optio dolorum. Odio debitis voluptas et earum est. Ratione atque qui voluptatem veniam et reiciendis dolores.</p>', 1, 7, 1, 6, '2018-12-26 09:49:33', '2018-12-26 12:31:53', NULL),
(10, 'Nesciunt voluptatibus et', 'nesciunt-voluptatibus-et', 39, '<p>Totam adipisci omnis possimus optio sit sequi asperiores sit. Commodi accusantium et nesciunt laudantium. Similique soluta iusto sint molestiae eligendi. Accusantium ut vel sit vero.</p>', 1, 5, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:32:45', NULL),
(11, 'Illum iusto architecto', 'illum-iusto-architecto', 49, '<p>Atque quae eos sint libero aut quae rerum accusamus. Ex voluptatem tenetur omnis aut dolores saepe et. Voluptate nulla dolores facere quod dolorem.</p>', 1, 4, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:33:12', NULL),
(12, 'Non voluptates', 'non-voluptates', 6, '<p>Ipsa rerum sunt quidem optio eveniet quos voluptates. Tempora ut tenetur nihil est et. Quia et id vero velit. Sint aliquam ea aliquam eum voluptas.</p>', 1, 7, 1, 13, '2018-12-26 09:49:33', '2018-12-26 12:31:29', NULL),
(13, 'Animi ex tempora a', 'animi-ex-tempora-a', 39, '<p>Optio nobis sit nobis fugiat et qui eaque. Cum libero consequatur nihil in dolorem est ex velit. Ab quam ipsa accusamus a magnam recusandae. Optio architecto veritatis consequatur cumque ullam accusantium.</p>', 1, 1, 1, 7, '2018-12-26 09:49:33', '2018-12-26 12:32:51', NULL),
(14, 'Cumque quis aut iusto', 'cumque-quis-aut-iusto', 36, '<p>Et ex sequi omnis saepe. Quas non quis consequatur sint harum. Enim maiores voluptatum quos quis rem odit. Atque totam dolor porro expedita omnis.</p>', 1, 2, 1, 12, '2018-12-26 09:49:33', '2018-12-26 12:32:09', NULL),
(15, 'Voluptatum odit dignissimos qui dolor', 'voluptatum-odit-dignissimos-qui-dolor', 23, '<p>Repudiandae et quos perferendis itaque et voluptates. Doloribus qui et recusandae. Praesentium quae odio quia laborum. Voluptatibus sunt reiciendis minus id ut explicabo provident cum.</p>', 1, 7, 1, 3, '2018-12-26 09:49:33', '2018-12-26 12:32:00', NULL),
(19, 'aaTest', 'aatest', 1, '<p>qwe</p>', 1, 1, NULL, 7, '2018-12-26 12:56:34', '2018-12-26 13:44:16', '2018-12-26 13:44:16'),
(20, 'asdasd', 'asdasd', 1, '<p>asdasdasdasdasdasd</p>', 1, 1, NULL, 15, '2018-12-26 13:27:45', '2018-12-26 13:27:59', '2018-12-26 13:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_term_accept` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0 = not accepted,1 = accepted',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `status`, `confirmation_code`, `confirmed`, `is_term_accept`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Viral', 'Solani', 'admin@admin.com', '$2y$10$Ua8aTBgpuT/TMO2rmmTsI.NvUBbxbawUF9/6IRL2iwKPUHppWjYsO', 1, '1643463e3ade2f7537b2c0ae5e52e44b', 1, 0, 'kknLsYsxttYYEAPXd81S5yZ815jtOSazrDOrXbJDeej4cdbZCsEtydh0pJ6T', 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(2, 'Vipul', 'Basapati', 'executive@executive.com', '$2y$10$GpvMT2v21UZPMLGOOgpNu.ktOr5458mLS6Wev/RptmlQGDJYNtbQi', 1, 'a78bd155e1fa9771ab4150ff52a6f38f', 1, 0, 'KOrpBbYslVT1setG6nhzIf2CZoQcPBYnJNYJxNnh8rL2H3GF7z4ZvK42Ua0m', 1, NULL, '2018-12-12 09:05:48', '2018-12-12 09:05:48', NULL),
(3, 'User', 'Test', 'user@user.com', '$2y$10$/2kNfHoQR1LIq.5o2fa0O.ENdzDbgDyB8Qiw/.oaEgJmeE4.GVrza', 1, 'e84a04c67bff49bd4dbbd897fb18a71d', 1, 0, 'pB0i99VRuXqsC1dNbJaraOr0rNKG2yYxcryQCtN1pIjAXSpceALP5RsqJzRO', 1, NULL, '2018-12-12 09:05:48', '2018-12-14 12:59:56', NULL),
(4, 'Jan Botsford', 'Halle Marquardt', 'stefan.heaney@example.net', '$2y$10$5/8dBfi7uilxcCP93ebdguKOzJdERBq2fJro/1p7eMUp9GSgMWxRm', 1, '1875d3f614270ea0938788713a5f44d4', 0, 0, 'pKa6OBYqsu', NULL, NULL, '2018-12-17 08:58:39', '2018-12-17 08:58:39', NULL),
(5, 'Noelia Zulauf', 'Zena Gutkowski', 'maude58@example.org', '$2y$10$5/8dBfi7uilxcCP93ebdguKOzJdERBq2fJro/1p7eMUp9GSgMWxRm', 1, '3055a8d46811b66a4c92753dcf567c9f', 0, 0, 'HROgJ0sXVr', NULL, NULL, '2018-12-17 08:58:39', '2018-12-17 08:58:39', NULL),
(6, 'Maddison Conroy', 'Marie Wisoky', 'chaya33@example.net', '$2y$10$5/8dBfi7uilxcCP93ebdguKOzJdERBq2fJro/1p7eMUp9GSgMWxRm', 1, '438d04497fc974706e689cf5a4795fae', 0, 0, 'Azdbai4BGR', NULL, NULL, '2018-12-17 08:58:39', '2018-12-17 08:58:39', NULL),
(7, 'Prof. Wilson Price', 'Savanah Howell', 'jewell33@example.net', '$2y$10$5/8dBfi7uilxcCP93ebdguKOzJdERBq2fJro/1p7eMUp9GSgMWxRm', 1, '317702a1fa489d211eac4912da09ec0b', 0, 0, 'sk7Vju0Wah', NULL, NULL, '2018-12-17 08:58:39', '2018-12-17 08:58:39', NULL),
(8, 'Wilson Collier PhD', 'Mr. Jamaal Lakin', 'martina64@example.net', '$2y$10$5/8dBfi7uilxcCP93ebdguKOzJdERBq2fJro/1p7eMUp9GSgMWxRm', 1, '762f6460b0bb4fd4e124346f4a82fd6e', 0, 0, 'mIunKeP1yG', NULL, NULL, '2018-12-17 08:58:39', '2018-12-17 08:58:39', NULL),
(9, 'Cecile Metz PhD', 'Santina Huel', 'ndonnelly@example.com', '$2y$10$Iybl80HNpkodt29MfCFB0ufKR80SB2G1DMwIgylBfGN8vGIbtXXbS', 1, '459f401f59bbcce1b3ab5ec45d88bdb2', 1, 0, 'hN94HLcWIh', NULL, NULL, '2018-12-17 09:02:01', '2018-12-20 12:36:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_map_categories`
--
ALTER TABLE `blog_map_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_map_categories_blog_id_index` (`blog_id`),
  ADD KEY `blog_map_categories_category_id_index` (`category_id`);

--
-- Indexes for table `blog_map_tags`
--
ALTER TABLE `blog_map_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_map_tags_blog_id_index` (`blog_id`),
  ADD KEY `blog_map_tags_tag_id_index` (`tag_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_user_id_foreign` (`created_by`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_company_slug_unique` (`company_slug`),
  ADD KEY `companies_created_by_foreign` (`created_by`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_type_id_foreign` (`type_id`),
  ADD KEY `history_user_id_foreign` (`user_id`);

--
-- Indexes for table `history_types`
--
ALTER TABLE `history_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_page_slug_unique` (`page_slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_title_slug_unique` (`project_slug`),
  ADD KEY `project_user_id_foreign` (`created_by`),
  ADD KEY `project_company_id_foreign` (`company_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_logins_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tasks_task_slug_unique` (`task_slug`),
  ADD KEY `task_user_id_foreign` (`created_by`),
  ADD KEY `task_project_id_foreign` (`project_id`) USING BTREE;

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_map_categories`
--
ALTER TABLE `blog_map_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_map_tags`
--
ALTER TABLE `blog_map_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `history_types`
--
ALTER TABLE `history_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `history_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
