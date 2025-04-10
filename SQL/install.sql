-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 11:07 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p2p_trade`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admin_access` longtext DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `fcm_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `image`, `phone`, `address`, `admin_access`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`, `last_seen`, `fcm_token`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '$2y$10$.sO9kLAurqjCYnUatIQeDuwxOqPC7KWPKEIOy5rYf8sGMm0zkLdZm', '627a4928ec4a51652181288.jpg', '+5641 455646', 'TX, USA', '[\"admin.dashboard\",\"admin.staff\",\"admin.storeStaff\",\"admin.updateStaff\",\"admin.identify-form\",\"admin.identify-form.store\",\"admin.identify-form.store\",\"admin.scheduleManage\",\"admin.planList\",\"admin.store.schedule\",\"admin.update.schedule\",\"admin.planCreate\",\"admin.planEdit\",\"admin.plans-active\",\"admin.plans-inactive\",\"admin.referral-commission\",\"admin.referral-commission.store\",\"admin.transaction\",\"admin.transaction.search\",\"admin.investments\",\"admin.investments.search\",\"admin.commissions\",\"admin.commissions.search\",\"admin.users\",\"admin.users.search\",\"admin.email-send\",\"admin.user.transaction\",\"admin.user.fundLog\",\"admin.user.withdrawal\",\"admin.user.commissionLog\",\"admin.user.referralMember\",\"admin.user.plan-purchaseLog\",\"admin.user.userKycHistory\",\"admin.kyc.users.pending\",\"admin.kyc.users\",\"admin.user-edit\",\"admin.user-multiple-active\",\"admin.user-multiple-inactive\",\"admin.send-email\",\"admin.user.userKycHistory\",\"admin.user-balance-update\",\"admin.payment.methods\",\"admin.deposit.manual.index\",\"admin.deposit.manual.create\",\"admin.edit.payment.methods\",\"admin.deposit.manual.edit\",\"admin.payment.pending\",\"admin.payment.log\",\"admin.payment.search\",\"admin.payment.action\",\"admin.payout-method\",\"admin.payout-log\",\"admin.payout-request\",\"admin.payout-log.search\",\"admin.payout-method.create\",\"admin.payout-method.edit\",\"admin.payout-action\",\"admin.ticket\",\"admin.ticket.view\",\"admin.ticket.reply\",\"admin.ticket.delete\",\"admin.subscriber.index\",\"admin.subscriber.sendEmail\",\"admin.subscriber.remove\",\"admin.basic-controls\",\"admin.email-controls\",\"admin.email-template.show\",\"admin.sms.config\",\"admin.sms-template\",\"admin.notify-config\",\"admin.notify-template.show\",\"admin.notify-template.edit\",\"admin.basic-controls.update\",\"admin.email-controls.update\",\"admin.email-template.edit\",\"admin.sms-template.edit\",\"admin.notify-config.update\",\"admin.notify-template.update\",\"admin.language.index\",\"admin.language.create\",\"admin.language.edit\",\"admin.language.keywordEdit\",\"admin.language.delete\",\"admin.manage.theme\",\"admin.logo-seo\",\"admin.breadcrumb\",\"admin.template.show\",\"admin.content.index\",\"admin.content.create\",\"admin.logoUpdate\",\"admin.seoUpdate\",\"admin.breadcrumbUpdate\",\"admin.content.show\",\"admin.content.delete\"]', '2023-02-22 09:20:26', 1, 'xfcaWLAF0q0TPm1PibBRzaLXbCmEJLhapGcymccvvG9pMBqcZo9sHdppy838', '2021-12-17 10:00:01', '2023-02-22 04:07:26', '2023-02-22 04:07:26', 'dE4qUr5X8pJWjOwV3NOlZX:APA91bHSppRURvC8SHSPrmWgcwWZevJxV8q_9SpX7t5jb6V1evOzJ_Me8dM67G_aGyrsepnxhg2qdUYyiNu0fi8S7RerYOG7Vmpp0P27F0g6Iv-GALJ0CMmJzMIfUXWxt7IHTiJXHbKZ');

-- --------------------------------------------------------

--
-- Table structure for table `advertisments`
--

CREATE TABLE `advertisments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('buy','sell') DEFAULT NULL,
  `crypto_id` int(11) DEFAULT NULL,
  `fiat_id` int(11) DEFAULT NULL,
  `gateway_id` text DEFAULT NULL,
  `crypto_rate` decimal(18,8) DEFAULT NULL,
  `fiat_rate` decimal(18,8) DEFAULT NULL,
  `price_type` enum('margin','fixed') NOT NULL DEFAULT 'margin',
  `price` double NOT NULL DEFAULT 0,
  `rate` double NOT NULL DEFAULT 0,
  `payment_window_id` int(11) DEFAULT NULL,
  `minimum_limit` double DEFAULT NULL,
  `maximum_limit` double DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL,
  `terms_of_trade` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>disable, 1=>enable',
  `completed_trade` int(11) DEFAULT 0,
  `total_min` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configures`
--

CREATE TABLE `configures` (
  `id` int(11) UNSIGNED NOT NULL,
  `site_title` varchar(20) DEFAULT NULL,
  `base_color` varchar(10) NOT NULL DEFAULT '',
  `secondary_color` varchar(60) DEFAULT NULL,
  `time_zone` varchar(30) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `base_currency_rate` varchar(50) DEFAULT NULL,
  `theme` varchar(60) DEFAULT NULL,
  `fraction_number` int(11) DEFAULT NULL,
  `paginate` int(11) DEFAULT NULL,
  `tradeCharge` double DEFAULT NULL,
  `trade_extra_time` int(11) NOT NULL DEFAULT 60 COMMENT 'trade reported extra time after complete window time',
  `incomplete_limit` int(11) DEFAULT NULL COMMENT 'incomplete trade for new add',
  `ad_rate_update` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>on,1=>off advertise rate update with currency rate update ',
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sender_email` varchar(60) DEFAULT NULL,
  `sender_email_name` varchar(91) DEFAULT NULL,
  `email_description` longtext DEFAULT NULL,
  `email_configuration` text DEFAULT NULL,
  `push_notification` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `error_log` tinyint(1) NOT NULL,
  `strong_password` tinyint(1) NOT NULL,
  `registration` tinyint(1) NOT NULL,
  `address_verification` tinyint(1) NOT NULL,
  `identity_verification` tinyint(1) NOT NULL,
  `maintenance` tinyint(1) NOT NULL,
  `is_active_cron_notification` tinyint(1) NOT NULL DEFAULT 0,
  `public_key` varchar(255) DEFAULT NULL COMMENT 'coinPayment',
  `private_key` varchar(255) DEFAULT NULL COMMENT 'coinPayment',
  `merchant_id` varchar(255) DEFAULT NULL COMMENT 'coinPayment',
  `fiat_currency_api` text NOT NULL,
  `fiat_currency_status` tinyint(1) NOT NULL DEFAULT 0,
  `crypto_currency_api` text NOT NULL,
  `crypto_currency_status` tinyint(1) NOT NULL DEFAULT 0,
  `force_ssl` tinyint(4) NOT NULL DEFAULT 1,
  `tawk_id` varchar(91) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(61) DEFAULT NULL,
  `fb_page_id` varchar(61) DEFAULT NULL,
  `reCaptcha_status_login` tinyint(1) NOT NULL DEFAULT 0,
  `reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0,
  `MEASUREMENT_ID` varchar(191) DEFAULT NULL,
  `analytic_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configures`
--

INSERT INTO `configures` (`id`, `site_title`, `base_color`, `secondary_color`, `time_zone`, `currency`, `currency_symbol`, `base_currency_rate`, `theme`, `fraction_number`, `paginate`, `tradeCharge`, `trade_extra_time`, `incomplete_limit`, `ad_rate_update`, `email_verification`, `email_notification`, `sms_verification`, `sms_notification`, `sender_email`, `sender_email_name`, `email_description`, `email_configuration`, `push_notification`, `created_at`, `updated_at`, `error_log`, `strong_password`, `registration`, `address_verification`, `identity_verification`, `maintenance`, `is_active_cron_notification`, `public_key`, `private_key`, `merchant_id`, `fiat_currency_api`, `fiat_currency_status`, `crypto_currency_api`, `crypto_currency_status`, `force_ssl`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `reCaptcha_status_login`, `reCaptcha_status_registration`, `MEASUREMENT_ID`, `analytic_status`) VALUES
(1, 'Bug Finder', '#d09f06', '#f0b90b', 'UTC', 'TAKA', '৳', NULL, 'deepblue', 0, 20, 5, 10, 5, 1, 0, 0, 0, 0, 'support@mail.com', 'Bug Finder', '<p>Hello [[name]],\r\n</p><p>\r\n[[message]]</p>', '{\"name\":\"smtp\",\"smtp_host\":\"smtp.mailtrap.io\",\"smtp_port\":\"2525\",\"smtp_encryption\":\"tls\",\"smtp_username\":\"asdadas\",\"smtp_password\":\"asdadas\"}', 0, NULL, '2023-02-22 04:06:50', 0, 0, 1, 0, 0, 0, 0, 'XXXXXXXXX', 'XXXXXXXXX', 'XXXXXXXXXXX', 'Your Access Key', 0, 'YOUR API KEY', 0, 0, NULL, 0, 0, NULL, NULL, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `created_at`, `updated_at`) VALUES
(67, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(68, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(69, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(70, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(71, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(72, 'why-chose-us', '2021-12-17 09:59:33', '2021-12-17 09:59:33'),
(83, 'about-us', '2022-11-15 23:17:29', '2022-11-15 23:17:29'),
(84, 'about-us', '2022-11-15 23:17:41', '2022-11-15 23:17:41'),
(85, 'about-us', '2022-11-15 23:17:51', '2022-11-15 23:17:51'),
(86, 'how-it-work', '2022-11-15 23:18:49', '2022-11-15 23:18:49'),
(87, 'how-it-work', '2022-11-15 23:19:13', '2022-11-15 23:19:13'),
(88, 'how-it-work', '2022-11-15 23:19:37', '2022-11-15 23:19:37'),
(89, 'feature', '2022-11-15 23:20:30', '2022-11-15 23:20:30'),
(90, 'feature', '2022-11-15 23:20:50', '2022-11-15 23:20:50'),
(91, 'feature', '2022-11-15 23:21:14', '2022-11-15 23:21:14'),
(92, 'feature', '2022-11-15 23:21:38', '2022-11-15 23:21:38'),
(93, 'feature', '2022-11-15 23:22:02', '2022-11-15 23:22:02'),
(94, 'feature', '2022-11-15 23:22:26', '2022-11-15 23:22:26'),
(95, 'faq', '2022-11-15 23:23:14', '2022-11-15 23:23:14'),
(96, 'faq', '2022-11-15 23:23:46', '2022-11-15 23:23:46'),
(97, 'faq', '2022-11-15 23:24:22', '2022-11-15 23:24:22'),
(98, 'faq', '2022-11-15 23:24:55', '2022-11-15 23:24:55'),
(99, 'faq', '2022-11-15 23:25:28', '2022-11-15 23:25:28'),
(100, 'testimonial', '2022-11-15 23:28:19', '2022-11-15 23:28:19'),
(101, 'testimonial', '2022-11-15 23:29:08', '2022-11-15 23:29:08'),
(102, 'testimonial', '2022-11-15 23:29:33', '2022-11-15 23:29:33'),
(103, 'blog', '2022-11-15 23:41:34', '2022-11-15 23:41:34'),
(104, 'blog', '2022-11-15 23:42:04', '2022-11-15 23:42:04'),
(105, 'blog', '2022-11-15 23:42:43', '2022-11-15 23:42:43'),
(106, 'social', '2022-11-15 23:44:35', '2022-11-15 23:44:35'),
(107, 'social', '2022-11-15 23:45:01', '2022-11-15 23:45:01'),
(108, 'social', '2022-11-15 23:45:19', '2022-11-15 23:45:19'),
(109, 'social', '2022-11-15 23:45:46', '2022-11-15 23:45:46'),
(110, 'support', '2022-11-15 23:50:12', '2022-11-15 23:50:12'),
(111, 'support', '2022-11-15 23:50:42', '2022-11-15 23:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(225, 83, 1, '{\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit.\"}', '2022-11-15 23:17:29', '2022-11-15 23:17:29'),
(226, 84, 1, '{\"short_description\":\"Lorem ipsum dolor sit amet adipisicing elit.\"}', '2022-11-15 23:17:41', '2022-11-15 23:17:41'),
(227, 85, 1, '{\"short_description\":\"Lorem ipsum dolor consectetur adipisicing elit.\"}', '2022-11-15 23:17:51', '2022-11-15 23:17:51'),
(228, 86, 1, '{\"title\":\"Join P2P\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-15 23:18:49', '2022-11-15 23:18:49'),
(229, 87, 1, '{\"title\":\"Collect Bitcoin\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-15 23:19:13', '2022-11-15 23:19:13'),
(230, 88, 1, '{\"title\":\"Start Selling\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-15 23:19:37', '2022-11-15 23:19:37'),
(231, 89, 1, '{\"title\":\"Decentralized System\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-15 23:20:30', '2022-11-15 23:20:30'),
(232, 90, 1, '{\"title\":\"Banks Payment\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-15 23:20:50', '2022-11-15 23:20:50'),
(233, 91, 1, '{\"title\":\"High Reliability\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et. Ipsum dolor sit amet\"}', '2022-11-15 23:21:14', '2022-11-15 23:21:14'),
(234, 92, 1, '{\"title\":\"Earn Extra\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-15 23:21:38', '2022-11-15 23:21:38'),
(235, 93, 1, '{\"title\":\"Buy &amp; Sell\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-15 23:22:02', '2022-11-15 23:22:02'),
(236, 94, 1, '{\"title\":\"No Middleman\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et. Ipsum dolor sit amet\"}', '2022-11-15 23:22:26', '2022-11-15 23:22:26'),
(237, 95, 1, '{\"title\":\"How do I benefit from the ICO Token?\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit similique nam ullam fugiat, eligendi molestias tenetur accusantium laborum aliquam ut dolore possimus dolorum fugit! Modi similique labore repellat molestias fugiat.\"}', '2022-11-15 23:23:14', '2022-11-15 23:23:14'),
(238, 96, 1, '{\"title\":\"What cryptocurrencies can I use to purchase?\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet voluptatum minima nam quia qui expedita enim aut temporibus, non in provident dolores nisi praesentium cupiditate, numquam, ratione exercitationem at doloribus.\"}', '2022-11-15 23:23:46', '2022-11-15 23:23:46'),
(239, 97, 1, '{\"title\":\"How can I participate in the ICO Token sale?\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem in tenetur repellendus nam quasi amet quae rem voluptatum dolor incidunt nemo ipsa, impedit provident, officiis doloremque rerum necessitatibus beatae nobis?\"}', '2022-11-15 23:24:22', '2022-11-15 23:24:22'),
(240, 98, 1, '{\"title\":\"What is \'Instagram Saves\', and what does it do?\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi labore, minus a voluptatum sint accusamus fuga illum dicta ipsam. Ad voluptate quo laborum doloremque expedita aliquam minus. Ipsum, aperiam commodi.\"}', '2022-11-15 23:24:55', '2022-11-15 23:24:55'),
(241, 99, 1, '{\"title\":\"What is \'Instagram Saves\', and what does it do?\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi labore, minus a voluptatum sint accusamus fuga illum dicta ipsam. Ad voluptate quo laborum doloremque expedita aliquam minus. Ipsum, aperiam commodi.\"}', '2022-11-15 23:25:28', '2022-11-15 23:25:28'),
(242, 100, 1, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Crypto Miner\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-15 23:28:19', '2022-11-15 23:28:19'),
(243, 101, 1, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Crypto Miner\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-15 23:29:08', '2022-11-15 23:29:08'),
(244, 102, 1, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Crypto Miner\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-15 23:29:33', '2022-11-15 23:29:33'),
(245, 103, 1, '{\"title\":\"Blockchain\\u200b.com closes crypto custody for Russians amid EU sanctions\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-15 23:41:34', '2022-11-15 23:41:34'),
(246, 104, 1, '{\"title\":\"Blockchain\\u200b.com closes crypto custody for Russians amid EU sanctions\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-15 23:42:04', '2022-11-15 23:42:04'),
(247, 105, 1, '{\"title\":\"Blockchain\\u200b.com closes crypto custody for Russians amid EU sanctions\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-15 23:42:43', '2022-11-15 23:42:43'),
(248, 106, 1, '{\"name\":\"facebook\"}', '2022-11-15 23:44:35', '2022-11-15 23:44:35'),
(249, 107, 1, '{\"name\":\"linkedin\"}', '2022-11-15 23:45:01', '2022-11-15 23:45:01'),
(250, 108, 1, '{\"name\":\"twitter\"}', '2022-11-15 23:45:19', '2022-11-15 23:45:19'),
(251, 109, 1, '{\"name\":\"instagram\"}', '2022-11-15 23:45:46', '2022-11-15 23:45:46'),
(252, 110, 1, '{\"title\":\"Terms &amp; Conditions\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\\r\\n\\r\\n\\r\\n\\r\\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/p><p> Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-11-15 23:50:12', '2022-11-15 23:50:12'),
(253, 111, 1, '{\"title\":\"Privacy Policy\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\\r\\n<\\/p><p>\\r\\n\\r\\n\\r\\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-11-15 23:50:42', '2022-11-15 23:50:42'),
(254, 85, 18, '{\"short_description\":\"Lorem ipsum dolor consectetur adipisicing elit.\"}', '2022-11-30 09:49:13', '2022-11-30 09:49:13'),
(255, 84, 18, '{\"short_description\":\"Lorem ipsum dolor sit amet adipisicing elit.\"}', '2022-11-30 09:49:22', '2022-11-30 09:49:22'),
(256, 83, 18, '{\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit.\"}', '2022-11-30 09:49:29', '2022-11-30 09:49:29'),
(257, 88, 18, '{\"title\":\"Empieza a vender\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-30 09:50:00', '2022-11-30 09:50:00'),
(258, 87, 18, '{\"title\":\"recoger bitcoins\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-30 09:50:23', '2022-11-30 09:50:23'),
(259, 86, 18, '{\"title\":\"\\u00danase a P2P\",\"short_description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit.\"}', '2022-11-30 09:50:54', '2022-11-30 09:50:54'),
(260, 94, 18, '{\"title\":\"sin intermediarios\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et. Ipsum dolor sit amet\"}', '2022-11-30 09:55:07', '2022-11-30 09:55:07'),
(261, 93, 18, '{\"title\":\"Compra venta\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-30 09:55:39', '2022-11-30 09:55:39'),
(262, 92, 18, '{\"title\":\"gana extra\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-30 09:56:07', '2022-11-30 09:56:07'),
(263, 91, 18, '{\"title\":\"Alta fiabilidad\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et. Ipsum dolor sit amet\"}', '2022-11-30 09:56:31', '2022-11-30 09:56:31'),
(264, 90, 18, '{\"title\":\"Pago de bancos\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-30 09:57:09', '2022-11-30 09:57:09'),
(265, 89, 18, '{\"title\":\"Sistema Descentralizado\",\"information\":\"Lorem ipsum consectetur adipi-sicing elit, sed do eiusmod tempor incididunt ut labore et.L Ipsum dolor sit amet\"}', '2022-11-30 09:57:38', '2022-11-30 09:57:38'),
(266, 99, 18, '{\"title\":\"Qu\\u00e9 es \'Instagram Saves\' y qu\\u00e9 hace?\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi labore, minus a voluptatum sint accusamus fuga illum dicta ipsam. Ad voluptate quo laborum doloremque expedita aliquam minus. Ipsum, aperiam commodi.\"}', '2022-11-30 09:58:12', '2022-11-30 09:58:12'),
(267, 98, 18, '{\"title\":\"Qu\\u00e9 es \'Instagram Saves\' y qu\\u00e9 hace?\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi labore, minus a voluptatum sint accusamus fuga illum dicta ipsam. Ad voluptate quo laborum doloremque expedita aliquam minus. Ipsum, aperiam commodi.\"}', '2022-11-30 09:58:32', '2022-11-30 09:58:32'),
(268, 97, 18, '{\"title\":\"C\\u00f3mo puedo participar en la venta de tokens de ICO?\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatem in tenetur repellendus nam quasi amet quae rem voluptatum dolor incidunt nemo ipsa, impedit provident, officiis doloremque rerum necessitatibus beatae nobis?\"}', '2022-11-30 09:58:57', '2022-11-30 09:58:57'),
(269, 96, 18, '{\"title\":\"Qu\\u00e9 criptomonedas puedo usar para comprar?\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet voluptatum minima nam quia qui expedita enim aut temporibus, non in provident dolores nisi praesentium cupiditate, numquam, ratione exercitationem at doloribus.\"}', '2022-11-30 09:59:18', '2022-11-30 09:59:18'),
(270, 95, 18, '{\"title\":\"C\\u00f3mo me beneficio del token ICO?\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit similique nam ullam fugiat, eligendi molestias tenetur accusantium laborum aliquam ut dolore possimus dolorum fugit! Modi similique labore repellat molestias fugiat.\"}', '2022-11-30 09:59:39', '2022-11-30 09:59:39'),
(271, 102, 18, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Cripto minero\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-30 10:01:25', '2022-11-30 10:01:25'),
(272, 101, 18, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Crypto Miner\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-30 10:01:49', '2022-11-30 10:01:49'),
(273, 100, 18, '{\"name\":\"Alex Hales\",\"rating\":\"5\",\"designation\":\"Crypto Miner\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nobis eum architecto animi rerum,deleniti ad inventore atque cumque assumenda sed! Corrupti officiis rem debitis necessitatibus in ipsam delectus! Laboriosam, ipsam?\"}', '2022-11-30 10:02:13', '2022-11-30 10:02:13'),
(274, 105, 18, '{\"title\":\"Blockchain.com cierra la criptocustodia para los rusos en medio de las sanciones de la UE\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-30 10:02:44', '2022-11-30 10:02:44'),
(275, 104, 18, '{\"title\":\"Blockchain.com cierra la criptocustodia para los rusos en medio de las sanciones de la UE\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-30 10:03:08', '2022-11-30 10:03:08'),
(276, 103, 18, '{\"title\":\"Blockchain.com cierra la criptocustodia para los rusos en medio de las sanciones de la UE\",\"description\":\"There are many variations of passages of Lorem Ipsum available, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et corrupti quas, ipsa a voluptatem debitis amet accusamus nesciunt ut impedit eos velit vel ea ex iure expedita odit illum incidunt. Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis, quia cum atque impedit doloribus officia nesciunt temporibus odit adipisci, dignissimos itaque ipsa fuga ipsam maxime quaerat amet? Earum deleniti voluptate maxime corporis fuga ipsam iste est, illo suscipit, dignissimos autem consequuntur distinctio odio iure! Doloremque expedita delectus voluptatem vero quam ab reiciendis quaerat facere sequi, dignissimos pariatur enim rerum aliquam repellendus illum molestias minima perspiciatis explicabo tenetur possimus nam sapiente. Necessitatibus, sed voluptas fugiat sit quo minus accusamus qui expedita laboriosam. Fuga, voluptas. Cumque accusantium, sunt officia quod delectus, fuga doloremque omnis atque quam ullam praesentium odio deleniti culpa est.\"}', '2022-11-30 10:03:31', '2022-11-30 10:03:31'),
(277, 109, 18, '{\"name\":\"instagram\"}', '2022-11-30 10:04:06', '2022-11-30 10:04:06'),
(278, 108, 18, '{\"name\":\"gorjeo\"}', '2022-11-30 10:04:28', '2022-11-30 10:04:28'),
(279, 107, 18, '{\"name\":\"linkedin\"}', '2022-11-30 10:04:40', '2022-11-30 10:04:40'),
(280, 106, 18, '{\"name\":\"facebook\"}', '2022-11-30 10:04:56', '2022-11-30 10:04:56'),
(281, 110, 18, '{\"title\":\"T\\u00e9rminos y condiciones\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,<\\/p><p> and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\\r\\n\\r\\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-11-30 10:05:43', '2022-11-30 10:05:43'),
(282, 111, 18, '{\"title\":\"Pol\\u00edtica de privacidad\",\"description\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\\r\\n\\r\\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, <\\/p><p>as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like.<\\/p>\"}', '2022-11-30 10:06:11', '2022-11-30 10:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `content_media`
--

CREATE TABLE `content_media` (
  `id` int(11) UNSIGNED NOT NULL,
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_media`
--

INSERT INTO `content_media` (`id`, `content_id`, `description`, `created_at`, `updated_at`) VALUES
(60, 86, '{\"image\":\"637472b93f02f1668575929.png\"}', '2022-11-15 23:18:49', '2022-11-15 23:18:49'),
(61, 87, '{\"image\":\"637472d1c07e01668575953.png\"}', '2022-11-15 23:19:13', '2022-11-15 23:19:13'),
(62, 88, '{\"image\":\"637472e9616671668575977.png\"}', '2022-11-15 23:19:37', '2022-11-15 23:19:37'),
(63, 89, '{\"image\":\"6374731e5e9ff1668576030.png\"}', '2022-11-15 23:20:30', '2022-11-15 23:20:30'),
(64, 90, '{\"image\":\"63747332c4fc91668576050.png\"}', '2022-11-15 23:20:50', '2022-11-15 23:20:50'),
(65, 91, '{\"image\":\"6374734a538b81668576074.png\"}', '2022-11-15 23:21:14', '2022-11-15 23:21:14'),
(66, 92, '{\"image\":\"637473621620c1668576098.png\"}', '2022-11-15 23:21:38', '2022-11-15 23:21:38'),
(67, 93, '{\"image\":\"6374737a35d721668576122.png\"}', '2022-11-15 23:22:02', '2022-11-15 23:22:02'),
(68, 94, '{\"image\":\"63747392a44af1668576146.png\"}', '2022-11-15 23:22:26', '2022-11-15 23:22:26'),
(69, 100, '{\"image\":\"637474f39a4dc1668576499.jpg\"}', '2022-11-15 23:28:19', '2022-11-15 23:28:19'),
(70, 101, '{\"image\":\"6374752447d091668576548.jpg\"}', '2022-11-15 23:29:08', '2022-11-15 23:29:08'),
(71, 102, '{\"image\":\"6374753d3ca611668576573.jpg\"}', '2022-11-15 23:29:33', '2022-11-15 23:29:33'),
(72, 103, '{\"image\":\"6374780e259c31668577294.jpg\"}', '2022-11-15 23:41:34', '2022-11-15 23:41:34'),
(73, 104, '{\"image\":\"6374782c1b8901668577324.jpg\"}', '2022-11-15 23:42:04', '2022-11-15 23:42:04'),
(74, 105, '{\"image\":\"63747853a9f8a1668577363.jpg\"}', '2022-11-15 23:42:44', '2022-11-15 23:42:44'),
(75, 106, '{\"link\":\"https:\\/\\/www.facebook.com\\/\",\"icon\":\"fab fa-facebook\"}', '2022-11-15 23:44:35', '2022-11-15 23:44:35'),
(76, 107, '{\"link\":\"https:\\/\\/www.linkedin.com\\/\",\"icon\":\"fab fa-linkedin-in\"}', '2022-11-15 23:45:01', '2022-11-15 23:45:01'),
(77, 108, '{\"link\":\"https:\\/\\/twitter.com\\/\",\"icon\":\"fab fa-twitter\"}', '2022-11-15 23:45:19', '2022-11-15 23:45:19'),
(78, 109, '{\"link\":\"https:\\/\\/www.instagram.com\\/\",\"icon\":\"fab fa-instagram\"}', '2022-11-15 23:45:46', '2022-11-15 23:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_wallets`
--

CREATE TABLE `crypto_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `crypto_currency_id` int(10) UNSIGNED NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `rate` varchar(61) DEFAULT NULL,
  `deposit_charge` double NOT NULL DEFAULT 0,
  `deposit_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>fixed, 0=>percent',
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `withdraw_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>fixed, 0=>percent',
  `image` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>crypto 0=> fiat\r\n',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active 0=>deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `template_key` varchar(120) DEFAULT NULL,
  `email_from` varchar(191) DEFAULT 'support@exampl.com',
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `template` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `mail_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_status` tinyint(1) NOT NULL DEFAULT 0,
  `lang_code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `language_id`, `template_key`, `email_from`, `name`, `subject`, `template`, `sms_body`, `short_keys`, `mail_status`, `sms_status`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'PROFILE_UPDATE', 'support@mail.com', 'Profile has been updated', 'Profile has been updated', 'Your first name [[firstname]]\r\n\r\nlast name [[lastname]]\r\n\r\nemail [[email]]\r\n\r\nphone number [[phone]]\r\n', 'Your first name [[firstname]]\r\n\r\nlast name [[lastname]]\r\n\r\nemail [[email]]\r\n\r\nphone number [[phone]]\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(2, 1, 'ADMIN_SUPPORT_REPLY', 'support@mail.com', 'Support Ticket Reply ', 'Support Ticket Reply', '<p>Ticket ID [[ticket_id]]\r\n</p><p><span><br /></span></p><p><span>Subject [[ticket_subject]]\r\n</span></p><p><span>-----Replied------</span></p><p><span>\r\n[[reply]]</span><br /></p>', 'Ticket ID [[ticket_id]]\r\n\r\n\r\n\r\nSubject [[ticket_subject]]\r\n\r\n-----Replied------\r\n\r\n[[reply]]', '{\"ticket_id\":\"Support Ticket ID\",\"ticket_subject\":\"Subject Of Support Ticket\",\"reply\":\"Reply from Staff\\/Admin\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(3, 1, 'PASSWORD_CHANGED', 'support@mail.com', 'PASSWORD CHANGED ', 'Your password changed ', 'Your password changed \r\n\r\nNew password [[password]]\r\n\r\n', 'Your password changed\r\n\r\nNew password [[password]]\r\n\r\n\r\nNews [[test]]', '{\"password\":\"password\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(4, 1, 'ADD_BALANCE', 'support@mail.com', 'Balance Add by Admin', 'Your Account has been credited', '[[amount]] [[currency]] credited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 0, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(6, 1, 'DEDUCTED_BALANCE', 'support@mail.com', 'Balance deducted by Admin', 'Your Account has been debited', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(9, 1, 'PAYMENT_COMPLETE', 'support@mail.com', 'Payment Completed', 'Your Payment Has Been Completed', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\r\n\r\nCharge[[charge]] [[currency]]\r\n\r\nTranaction [[transaction]]\r\n\r\nYour Main Balance [[remaining_balance]] [[currency]]\r\n\r\n', '[[amount]] [[currency]] Payment Has Been successful via [[gateway_name]]\n\nCharge[[charge]] [[currency]]\n\nTranaction [[transaction]]\n\nYour Main Balance [[remaining_balance]] [[currency]]\n\n', '{\"gateway_name\":\"gateway name\",\"amount\":\"amount\",\"charge\":\"charge\", \"currency\":\"currency\",\"transaction\":\"transaction\",\"remaining_balance\":\"remaining balance\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(11, 1, 'PASSWORD_RESET', 'support@mail.com', 'Reset Password Notification', 'Reset Password Notification', 'You are receiving this email because we received a password reset request for your account.[[message]]\r\n\r\n\r\nThis password reset link will expire in 60 minutes.\r\n\r\nIf you did not request a password reset, no further action is required.', 'You are receiving this email because we received a password reset request for your account. [[message]]', '{\"message\":\"message\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(12, 1, 'VERIFICATION_CODE', 'support@mail.com', 'Verification Code', 'Verify Your Email ', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', '{\"code\":\"code\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(21, 1, 'TWO_STEP_ENABLED', 'support@mail.com', 'TWO STEP ENABLED', 'TWO STEP ENABLED', 'Your verification code is: [[code]]', 'Your verification code is: [[code]]', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\",\"code\":\"code\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(22, 1, 'TWO_STEP_DISABLED', 'support@mail.com', 'TWO STEP DISABLED', 'TWO STEP DISABLED', 'Google two factor verification is disabled', 'Google two factor verification is disabled', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"browser\":\"browser and Operating System \",\"time\":\"Time\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(24, 1, 'PAYOUT_REQUEST', 'support@mail.com', 'Withdraw request has been sent', 'Withdraw request has been sent', '[[amount]] [[currency]] withdraw requested \r\n\r\n\r\nCharge [[charge]] [[currency]]\r\n\r\nTransaction [[trx]]\r\n', '[[amount]] [[currency]] withdraw requested \r\n\r\n\r\nCharge [[charge]] [[currency]]\r\n\r\nTransaction [[trx]]\r\n', '{\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"trx\":\"transaction\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(27, 1, 'PAYOUT_REJECTED', 'support@mail.com', 'Withdraw request has been rejected', 'Withdraw request has been rejected', '[[amount]] [[currency]] withdraw has been rejeced\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '[[amount]] [[currency]] withdraw has been rejeced\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '{\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(28, 1, 'PAYOUT_APPROVE ', 'support@mail.com', 'Withdraw request has been approved', 'Withdraw request has been approved', '[[amount]] [[currency]] withdraw has been approved\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '[[amount]] [[currency]] withdraw has been approved\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '{\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(40, 1, 'KYC_APPROVED', 'support@mail.com', 'KYC has been approved', 'KYC has been approved', '[[kyc_type]] has been approved\r\n\r\n', '[[kyc_type]] has been approved\r\n', '{\"kyc_type\":\"kyc type\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(41, 1, 'KYC_REJECTED', 'support@mail.com', 'KYC has been rejected', 'KYC has been rejected', '[[kyc_type]] has been rejected\r\n\r\n', '[[kyc_type]] has been rejected\r\n', '{\"kyc_type\":\"kyc type\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(42, 1, 'BUYER_PAID', 'support@mail.com', 'Buyer Paid', 'Buyer Paid', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been paid by [[username]] \r\n', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been paid by [[username]] \r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-06-17 21:59:36'),
(43, 1, 'TRADE_COMPLETED', 'support@mail.com', 'Trade Completed', 'Trade Completed', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been released by [[username]]\r\n\r\n', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been released by [[username]]\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(44, 1, 'CANCEL_TRADE', 'support@mail.com', 'Cancel Trade', 'Cancel Trade', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been canceled by [[username]]\r\n', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been canceled by [[username]]\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(45, 1, 'TRADE_DISPUTE', 'support@mail.com', 'Trade Disputed', 'Trade Disputed', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been reported by [[username]]\r\n\r\n', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been reported by [[username]]\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(46, 1, 'TRADE_SETTLED', 'support@mail.com', 'Trade Settled', 'Trade Settled', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been return [[username]]\r\nby system\r\n', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been return [[username]]\r\nby system\r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(47, 1, 'SYSTEM_TRADE_COMPLETED', 'support@mail.com', 'Trade Completed By System', 'Trade Completed By System', 'Trade [[tardeNumber]] with [[username]] amount [[amount]] [[currency]] has been completed by system\r\n\r\n', 'Trade [[tardeNumber]] with [[username]] amount [[amount]] [[currency]] has been completed by system\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(48, 1, 'PAYOUT_FAIL', 'support@mail.com', 'Withdraw request has been failed', 'Withdraw request has been failed', '[[amount]] [[currency]] withdraw has been failed\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '[[amount]] [[currency]] withdraw has been failed\r\n\r\nCharge [[charge]] [[currency]]\r\nTransaction [[transaction]]\r\n\r\n\r\nAdmin feedback [[feedback]]\r\n\r\n', '{\"amount\":\"amount\",\"charge\":\"charge\",\"currency\":\"currency\",\"transaction\":\"transaction\",\"feedback\":\"Admin feedback\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2023-02-21 05:06:55'),
(49, 1, 'SEND_TRADE', 'support@mail.com', 'Start Trade', 'Send Trade', 'Trade [[tardeNumber]] [[username]] has been started trade with you amount  [[amount]] [[currency]]  \r\n', 'Trade [[tardeNumber]] [[username]] has been started trade with you amount  [[amount]] [[currency]] ', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 'en', '2021-12-17 10:00:26', '2022-06-17 21:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `advertisement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Ad Creator',
  `reviewer_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Who gives review',
  `feedback` longtext DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL COMMENT '''like'',''dislike',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `firebase_notifies`
--

CREATE TABLE `firebase_notifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `server_key` varchar(255) DEFAULT NULL,
  `vapid_key` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `auth_domain` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `storage_bucket` varchar(255) DEFAULT NULL,
  `messaging_sender_id` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `measurement_id` varchar(255) DEFAULT NULL,
  `user_foreground` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `user_background` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `admin_foreground` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `admin_background` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> off, 1=> on',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `crypto_currency_id` int(11) UNSIGNED DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `final_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `btc_wallet` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Complete, 2=> Pending, 3 => Cancel',
  `cp_trx` varchar(255) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `image` varchar(191) DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identify_forms`
--

CREATE TABLE `identify_forms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `services_form` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `identify_forms`
--

INSERT INTO `identify_forms` (`id`, `name`, `slug`, `services_form`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Driving License', 'driving-license', '{\"FrontPage\":{\"field_name\":\"FrontPage\",\"field_level\":\"Front Page\",\"type\":\"file\",\"field_length\":\"2500\",\"length_type\":\"max\",\"validation\":\"required\"},\"RearPage\":{\"field_name\":\"RearPage\",\"field_level\":\"Rear Page\",\"type\":\"file\",\"field_length\":\"2500\",\"length_type\":\"max\",\"validation\":\"required\"},\"PassportNumber\":{\"field_name\":\"PassportNumber\",\"field_level\":\"Passport Number\",\"type\":\"text\",\"field_length\":\"20\",\"length_type\":\"max\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_level\":\"Address\",\"type\":\"textarea\",\"field_length\":\"300\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-09-30 22:07:40', '2022-05-17 06:29:36'),
(2, 'Passport', 'passport', '{\"PassportNumber\":{\"field_name\":\"PassportNumber\",\"field_level\":\"Passport Number\",\"type\":\"text\",\"field_length\":\"25\",\"length_type\":\"max\",\"validation\":\"required\"},\"PassportImage\":{\"field_name\":\"PassportImage\",\"field_level\":\"Passport Image\",\"type\":\"file\",\"field_length\":\"1040\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-09-30 22:16:23', '2022-05-17 06:29:40'),
(4, 'National ID', 'national-id', '{\"FrontPage\":{\"field_name\":\"FrontPage\",\"field_level\":\"Front Page\",\"type\":\"file\",\"field_length\":\"500\",\"length_type\":\"max\",\"validation\":\"required\"},\"RearPage\":{\"field_name\":\"RearPage\",\"field_level\":\"Rear Page\",\"type\":\"file\",\"field_length\":\"500\",\"length_type\":\"max\",\"validation\":\"required\"},\"NidNumber\":{\"field_name\":\"NidNumber\",\"field_level\":\"Nid Number\",\"type\":\"text\",\"field_length\":\"10\",\"length_type\":\"digits\",\"validation\":\"required\"},\"Address\":{\"field_name\":\"Address\",\"field_level\":\"Address\",\"type\":\"textarea\",\"field_length\":\"300\",\"length_type\":\"max\",\"validation\":\"required\"}}', 1, '2021-10-01 07:58:40', '2022-05-17 06:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `kyc_type` varchar(20) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Approved, 2 => Reject',
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `is_active`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'US', NULL, 1, 0, '2021-12-17 10:00:55', '2021-12-17 10:00:55'),
(18, 'Spanish', 'ES', NULL, 1, 0, '2021-12-17 10:00:55', '2021-12-17 10:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_09_29_074810_create_jobs_table', 1),
(32, '2020_11_12_075639_create_transactions_table', 6),
(36, '2020_10_14_113046_create_admins_table', 9),
(42, '2020_11_24_064711_create_email_templates_table', 11),
(48, '2014_10_12_000000_create_users_table', 13),
(51, '2020_09_16_103709_create_controls_table', 15),
(59, '2021_01_03_061604_create_tickets_table', 17),
(60, '2021_01_03_061834_create_ticket_messages_table', 18),
(61, '2021_01_03_065607_create_ticket_attachments_table', 18),
(62, '2021_01_07_095019_create_funds_table', 19),
(66, '2021_01_21_050226_create_languages_table', 21),
(69, '2020_12_17_075238_create_sms_controls_table', 23),
(70, '2021_01_26_051716_create_site_notifications_table', 24),
(72, '2021_01_26_075451_create_notify_templates_table', 25),
(73, '2021_01_28_074544_create_contents_table', 26),
(74, '2021_01_28_074705_create_content_details_table', 26),
(75, '2021_01_28_074829_create_content_media_table', 26),
(76, '2021_01_28_074847_create_templates_table', 26),
(77, '2021_01_28_074905_create_template_media_table', 26),
(83, '2021_02_03_100945_create_subscribers_table', 27),
(86, '2021_01_21_101641_add_language_to_email_templates_table', 28),
(87, '2021_02_14_064722_create_manage_plans_table', 28),
(88, '2021_02_14_072251_create_manage_times_table', 29),
(89, '2021_03_09_100340_create_investments_table', 30),
(90, '2021_03_13_132414_create_payout_methods_table', 31),
(91, '2021_03_13_133534_create_payout_logs_table', 32),
(93, '2021_03_18_091710_create_referral_bonuses_table', 33),
(94, '2021_10_25_060950_create_money_transfers_table', 34),
(96, '2021_03_18_091710_create_users_table', 35),
(97, '2022_11_16_090556_create_advertisments_table', 36),
(98, '2022_11_16_110618_create_payment_windows_table', 37),
(99, '2022_11_19_095308_create_trades_table', 38),
(100, '2022_11_20_060430_create_trade_chats_table', 39),
(101, '2022_11_24_125749_create_wallets_table', 40),
(102, '2022_12_01_164538_create_feedback_table', 41),
(103, '2023_02_16_153703_create_firebase_notifies_table', 42),
(104, '2023_02_21_123823_create_user_payment_infos_table', 43);

-- --------------------------------------------------------

--
-- Table structure for table `notify_templates`
--

CREATE TABLE `notify_templates` (
  `id` int(11) NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `template_key` varchar(191) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `firebase_notify_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive, 1=>active',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=> Admin, 0=> User',
  `lang_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notify_templates`
--

INSERT INTO `notify_templates` (`id`, `language_id`, `name`, `template_key`, `body`, `short_keys`, `status`, `firebase_notify_status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'SUPPORT TICKET CREATE', 'SUPPORT_TICKET_CREATE', '[[username]] create a ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(2, 1, 'SUPPORT TICKET REPLIED', 'SUPPORT_TICKET_REPLIED', '[[username]] replied  ticket\r\nTicket : [[ticket_id]]\r\n\r\n', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(3, 1, 'ADMIN REPLIED SUPPORT TICKET ', 'ADMIN_REPLIED_TICKET', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"ticket_id\":\"Support Ticket ID\"}', 1, 1, 0, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(4, 1, 'ADMIN DEPOSIT NOTIFICATION', 'PAYMENT_COMPLETE', '[[username]] deposited [[amount]] [[currency]] via [[gateway]]\r\n', '{\"gateway\":\"gateway\",\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(5, 1, 'ADD BALANCE', 'ADD_BALANCE', '[[amount]] [[currency]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 1, 0, 'en', '2021-12-17 10:01:53', '2023-02-20 12:05:16'),
(6, 1, 'DEDUCTED BALANCE', 'DEDUCTED_BALANCE', '[[amount]] [[currency]] debited in your account.\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"main_balance\":\"Users Balance After this operation\"}', 1, 1, 0, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(7, 1, 'NEW USER ADDED', 'ADDED_USER', '[[username]] has been joined\r\n\r\n', '{\"username\":\"username\"}', 1, 1, 1, 'en', '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(8, 1, 'WITHDRAW REQUEST NOTIFICATION TO ADMIN', 'PAYOUT_REQUEST', '[[username]] withdraw requested by [[amount]] [[currency]] \r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(9, 1, 'PAYOUT REJECTED ', 'PAYOUT_REJECTED', '[[amount]] [[currency]]  withdraw requested has been rejected\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(10, 1, 'PAYOUT APPROVE ', 'PAYOUT_APPROVE ', '[[amount]] [[currency]]  withdraw requested has been approved\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(11, 1, 'ADMIN DEPOSIT REQUEST NOTIFICATION', 'PAYMENT_REQUEST', '[[username]] deposit request [[amount]] [[currency]] via [[gateway]]\r\n', '{\"gateway\":\"gateway\",\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\"}', 1, 1, 1, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(12, 1, 'PAYMENT REJECTED', 'PAYMENT_REJECTED', '[[amount]] [[currency]] payment has been requested \r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\",\"feedback\":\"Admin feedback\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(13, 1, 'KYC APPROVED', 'KYC_APPROVED', '[[kyc_type]] has been approved\r\n', '{\"kyc_type\":\"kyc type\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(14, 1, 'KYC REJECTED', 'KYC_REJECTED', '[[kyc_type]] has been rejected\r\n\r\n', '{\"kyc_type\":\"kyc type\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(15, 1, 'BUYER PAID', 'BUYER_PAID', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been paid by [[username]] \r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(16, 1, 'TRADE COMPLETED', 'TRADE_COMPLETED', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been released by [[username]] \r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(17, 1, 'CANCEL TRADE', 'CANCEL_TRADE', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been cancel by [[username]] \r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(18, 1, 'TRADE DISPUTE', 'TRADE_DISPUTE', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has been reported by [[username]] \r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(19, 1, 'TRADE SETTLED', 'TRADE_SETTLED', 'Trade [[tardeNumber]] amount [[amount]] [[currency]] has return  [[username]] by system\r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(20, 1, 'SYSTEM TRADE COMPLETED', 'SYSTEM_TRADE_COMPLETED', 'Trade [[tardeNumber]] with [[username]]  amount [[amount]] [[currency]] has been completed by system\r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(21, 1, 'DEPOSIT COMPLETE', 'DEPOSIT_COMPLETE', '[[username]] deposit [[amount]] [[currency]] final balance [[post_balance]]\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"currency\":\"currency\",\"payable\":\"payable\",\"trx\":\"trx\",\"post_balance\":\"post_balance\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(22, 1, 'PAYOUT Fail', 'PAYOUT_FAIL ', '[[amount]] [[currency]]  withdraw requested has been failed\r\n\r\n', '{\"amount\":\"amount\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(23, 1, 'Start Trade', 'SEND_TRADE', 'Trade [[tardeNumber]] [[username]] has been started trade with you amount  [[amount]] [[currency]]   \r\n\r\n', '{\"username\":\"username\",\"amount\":\"amount\",\"tardeNumber\":\"tardeNumber\",\"currency\":\"currency\"}', 1, 1, 0, NULL, '2021-12-17 10:01:53', '2021-12-17 10:01:53'),
(24, 18, 'ADD BALANCE', 'ADD_BALANCE', '[[amount]] [[currency]] credited in your account. \r\n\r\n\r\nYour Current Balance [[main_balance]][[currency]]\r\n\r\nTransaction: #[[transaction]]', '{\"transaction\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\",\"main_balance\":\"Users Balance After this operation\"}', 1, 1, 0, 'ES', '2023-02-16 08:55:24', '2023-02-20 12:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_windows`
--

CREATE TABLE `payment_windows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_windows`
--

INSERT INTO `payment_windows` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 15, '2022-11-16 05:33:58', '2022-11-16 06:03:01', '2022-11-16 06:03:01'),
(2, 15, '2022-11-16 06:03:19', '2022-12-26 06:02:45', NULL),
(3, 30, '2022-11-16 06:03:24', '2022-11-16 06:03:24', NULL),
(4, 45, '2022-11-16 06:03:29', '2022-11-16 06:03:29', NULL),
(5, 60, '2022-11-16 06:03:35', '2022-12-25 10:18:13', NULL),
(6, 2, '2023-02-18 06:24:30', '2023-02-18 06:38:08', '2023-02-18 06:38:08'),
(7, 0, '2023-02-18 06:34:50', '2023-02-18 06:35:38', '2023-02-18 06:35:38'),
(8, 2, '2023-02-18 06:38:14', '2023-02-18 06:38:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payout_logs`
--

CREATE TABLE `payout_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `method_id` int(11) DEFAULT NULL,
  `network` varchar(191) DEFAULT NULL,
  `wallet_address` varchar(191) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `amount` decimal(10,8) DEFAULT NULL,
  `charge` decimal(10,8) DEFAULT NULL,
  `net_amount` decimal(10,8) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `trx_id` varchar(50) DEFAULT NULL,
  `response_id` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1=> pending, 2=> success, 3=> cancel,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=> live, 1=> test',
  `is_automatic` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `name`, `code`, `parameters`, `is_sandbox`, `environment`, `is_automatic`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Binance', 'binance', '{\"API_Key\":\"\",\"KEY_Secret\":\"\"}', 1, 1, 1, 'binance.png', 0, NULL, '2023-02-05 05:26:13'),
(5, 'Coinbase', 'coinbase', '{\"API_Key\":\"\",\"API_Secret\":\"\",\"Api_Passphrase\":\"\"}', 1, 0, 1, 'coinbase.jpg', 1, NULL, '2023-02-05 05:26:13'),
(6, 'Manual', 'manual', '', 0, 0, 0, 'manual.png', 0, NULL, '2023-02-04 10:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `site_notifications`
--

CREATE TABLE `site_notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `site_notificational_id` int(11) NOT NULL,
  `site_notificational_type` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_controls`
--

CREATE TABLE `sms_controls` (
  `id` int(11) UNSIGNED NOT NULL,
  `actionMethod` varchar(191) DEFAULT NULL,
  `actionUrl` varchar(191) DEFAULT NULL,
  `headerData` text DEFAULT NULL,
  `paramData` text DEFAULT NULL,
  `formData` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_controls`
--

INSERT INTO `sms_controls` (`id`, `actionMethod`, `actionUrl`, `headerData`, `paramData`, `formData`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"YOURAPIKEY\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', '2021-12-17 10:02:43', '2023-02-22 04:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(60) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `language_id` int(11) UNSIGNED DEFAULT NULL,
  `section_name` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `language_id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(81, 1, 'hero', '{\"heading\":\"No Trading Commission\",\"sub_heading\":\"Peer To Peer\",\"title\":\"Crypto Trading Marketplace.\",\"short_description\":\"Cryptography, encryption process of transforming information referred to as plaintext using done\",\"button_name\":\"START TRADING\"}', '2022-11-15 23:09:34', '2023-02-20 14:09:44'),
(82, 1, 'about-us', '{\"title\":\"About Us\",\"sub_title\":\"Short Story About Us\",\"short_description\":\"A cryptocurrency, crypto-currency, or crypto is a collection of binary data which is designed to work as a medium of exchange. Individual coin ownership records are stored in a ledger, which is a computerized database using strong cryptography to secure transaction records, to control the creation of additional coins, and to verify the transfer of coin ownership. Try to save\",\"button_name\":\"KNOW MORE\"}', '2022-11-15 23:11:45', '2022-11-15 23:11:45'),
(83, 1, 'how-it-work', '{\"title\":\"How To Start\",\"sub_title\":\"How It Works\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:12:10', '2022-11-15 23:12:10'),
(84, 1, 'buy-sell', '{\"title\":\"Crypto Exchange\",\"sub_title\":\"Buy And Sell Crypto Currency\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:13:01', '2022-11-15 23:13:01'),
(85, 1, 'feature', '{\"title\":\"Featuers\",\"sub_title\":\"Our Best Features\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:13:23', '2022-11-15 23:13:23'),
(86, 1, 'faq', '{\"title\":\"Faqs\",\"sub_title\":\"Frequently Asked Questions\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:14:02', '2022-11-15 23:14:02'),
(87, 1, 'testimonial', '{\"title\":\"What Clients Say\",\"sub_title\":\"Clients Feedback\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:14:34', '2022-11-15 23:14:34'),
(88, 1, 'blog', '{\"title\":\"Our Blogs\",\"sub_title\":\"Our Blogs Latest News &amp; Articles\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-15 23:14:59', '2022-11-15 23:14:59'),
(89, 1, 'call', '{\"title\":\"Lets get your project started!\",\"button_name\":\"CONTACT US\"}', '2022-11-15 23:15:42', '2022-11-15 23:15:42'),
(90, 1, 'contact-us', '{\"heading\":\"Contact Us\",\"sub_heading\":\"Just Drop Us A Line.\",\"short_description\":\"Give us a call or drop by anytime, we endeavour to answer all enquiries within 24 hours on business days. We will be happy to answer your questions.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus pariatur aliquid, quis dolore odio impedit explicabo dignissimos, quibusdam excepturi laudantium error aliquam et doloremque! Et mollitia perspiciatis ut veritatis nisi.\",\"address\":\"22 Baker Street, London\",\"email\":\"hello@website.com\",\"phone\":\"+44-20-4526-2356\",\"footer_short_details\":\"We are a award winning mulitnational company. We believe quality and standard worldwide consider.\"}', '2022-11-15 23:16:56', '2022-11-15 23:16:56'),
(91, 18, 'hero', '{\"heading\":\"Sin comisi\\u00f3n comercial\",\"sub_heading\":\"Punto a punto m\\u00e1s popular\",\"title\":\"Mercado de comercio de criptomonedas\",\"short_description\":\"Criptograf\\u00eda, proceso de encriptaci\\u00f3n de la transformaci\\u00f3n de la informaci\\u00f3n a que se refiere como texto sin formato usando hecho\",\"button_name\":\"COMIENZA A NEGOCIAR\"}', '2022-11-30 09:29:42', '2022-11-30 09:29:42'),
(92, 18, 'about-us', '{\"title\":\"Sobre nosotras\",\"sub_title\":\"Breve historia sobre nosotros\",\"short_description\":\"Una criptomoneda, criptomoneda o criptomoneda es una colecci\\u00f3n de datos binarios que est\\u00e1 dise\\u00f1ada para funcionar como un medio de intercambio. Los registros de propiedad de monedas individuales se almacenan en un libro mayor, que es una base de datos computarizada que utiliza criptograf\\u00eda fuerte para proteger los registros de transacciones, controlar la creaci\\u00f3n de monedas adicionales y verificar la transferencia de la propiedad de monedas. Intenta guardar\",\"button_name\":\"SABER M\\u00c1S\"}', '2022-11-30 09:30:46', '2022-11-30 09:30:46'),
(93, 18, 'how-it-work', '{\"title\":\"C\\u00f3mo empezar\",\"sub_title\":\"C\\u00f3mo funciona\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:31:26', '2022-11-30 09:31:26'),
(94, 18, 'buy-sell', '{\"title\":\"Intercambio criptogr\\u00e1fico\",\"sub_title\":\"Compra y vende criptomonedas\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:32:06', '2022-11-30 09:32:06'),
(95, 18, 'feature', '{\"title\":\"Caracter\\u00edsticas\",\"sub_title\":\"Nuestras mejores caracter\\u00edsticas\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:39:02', '2022-11-30 09:39:02'),
(96, 18, 'faq', '{\"title\":\"Preguntas frecuentes\",\"sub_title\":\"Preguntas frecuentes\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:39:39', '2022-11-30 09:39:39'),
(97, 18, 'testimonial', '{\"title\":\"Lo que dicen las clientes\",\"sub_title\":\"Comentarios de las clientas\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:40:11', '2022-11-30 09:40:11'),
(98, 18, 'blog', '{\"title\":\"Nuestras Blogs\",\"sub_title\":\"Nuestros blogs \\u00daltimas noticias &amp; Art\\u00edculos\",\"short_description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore atque facere repellat sint placeat qui recusandae!\"}', '2022-11-30 09:40:44', '2022-11-30 09:40:44'),
(99, 18, 'call', '{\"title\":\"Empecemos tu proyecto!\",\"button_name\":\"CONT\\u00c1CTENOS\"}', '2022-11-30 09:41:11', '2022-11-30 09:41:11'),
(100, 18, 'contact-us', '{\"heading\":\"Contacta con nosotras\",\"sub_heading\":\"Simplemente env\\u00edenos una l\\u00ednea.\",\"short_description\":\"Ll\\u00e1menos o vis\\u00edtenos en cualquier momento, nos esforzamos por responder todas las consultas dentro de las 24 horas en d\\u00edas h\\u00e1biles. Estaremos encantados de responder a sus preguntas. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus pariatur aliquid, quis dolore odio impedit explicabo dignissimos, quibusdam excepturi laudantium error aliquam et doloremque! Et mollitia perspiciatis ut veritatis nisi.\",\"address\":\"22 Baker Street, Londres\",\"email\":\"hello@website.com\",\"phone\":\"+44-20-4526-2356\",\"footer_short_details\":\"Somos una empresa multinacional galardonada. Creemos que la calidad y el est\\u00e1ndar en todo el mundo tienen en cuenta.\"}', '2022-11-30 09:42:55', '2022-11-30 09:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `template_media`
--

CREATE TABLE `template_media` (
  `id` int(11) UNSIGNED NOT NULL,
  `section_name` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_media`
--

INSERT INTO `template_media` (`id`, `section_name`, `description`, `created_at`, `updated_at`) VALUES
(6, 'hero', '{\"image\":\"6374708e6cb1e1668575374.jpg\",\"button_link\":\"https:\\/\\/www.bugfinder.net\\/\"}', '2022-11-15 23:09:34', '2022-11-15 23:09:34'),
(7, 'about-us', '{\"image\":\"63747111411791668575505.jpg\",\"button_link\":\"https:\\/\\/www.bugfinder.net\\/\",\"video_link\":\"https:\\/\\/youtu.be\\/vdFsuXP8QkQ\"}', '2022-11-15 23:11:45', '2022-11-15 23:11:45'),
(8, 'faq', '{\"image\":\"6374719aa060c1668575642.jpg\"}', '2022-11-15 23:14:02', '2022-11-15 23:14:02'),
(9, 'call', '{\"button_link\":\"http:\\/\\/localhost\\/peerToPeer\\/contact\"}', '2022-11-15 23:15:42', '2022-11-15 23:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(91) DEFAULT NULL,
  `ticket` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed	',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_message_id` int(11) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) UNSIGNED DEFAULT NULL,
  `admin_id` int(11) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `advertise_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `trade_number` varchar(50) DEFAULT NULL,
  `type` enum('buy','sell') NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `receiver_currency_id` int(11) DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `payment_window` int(11) DEFAULT NULL,
  `time_remaining` datetime DEFAULT NULL COMMENT 'mintues',
  `rate` double DEFAULT NULL,
  `pay_amount` double DEFAULT NULL,
  `receive_amount` double DEFAULT NULL,
  `hash_slug` text DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0=>default, 1=>buyer paid, 3=>cancel, 4=>complete, 5=>dispute, 6=>owner refunded, 7=> sender refunded , 8=> admin force complete',
  `payment_method_id` int(11) DEFAULT NULL,
  `payment_info_id` int(11) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `cancel_at` timestamp NULL DEFAULT NULL,
  `dispute_at` timestamp NULL DEFAULT NULL,
  `complete_at` timestamp NULL DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `dispute_by` int(11) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `terms_of_trade` text DEFAULT NULL,
  `processing_minutes` double DEFAULT NULL COMMENT 'trade complete in minutes',
  `admin_charge` double(10,8) DEFAULT NULL COMMENT 'crypto admin charge',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade_chats`
--

CREATE TABLE `trade_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trades_id` int(11) DEFAULT NULL,
  `chatable_type` varchar(255) NOT NULL,
  `chatable_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(11,8) DEFAULT NULL,
  `charge` decimal(11,8) NOT NULL DEFAULT 0.00000000,
  `final_balance` varchar(30) DEFAULT NULL,
  `trx_type` varchar(10) DEFAULT NULL,
  `remarks` varchar(191) NOT NULL,
  `trx_id` varchar(50) NOT NULL,
  `code` varchar(20) DEFAULT NULL COMMENT 'crypto currency code',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone_code` varchar(20) DEFAULT NULL,
  `phone` varchar(91) DEFAULT NULL,
  `balance` decimal(11,2) NOT NULL DEFAULT 0.00,
  `image` varchar(191) DEFAULT NULL,
  `cover_image` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `identity_verify` tinyint(4) NOT NULL COMMENT '	0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `address_verify` tinyint(4) NOT NULL COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: two-FA off, 1: two-FA on',
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: two-FA unverified, 1: two-FA verified',
  `two_fa_code` varchar(50) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 1,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 1,
  `verify_code` varchar(50) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed_trade` int(11) NOT NULL DEFAULT 0,
  `total_min` double NOT NULL DEFAULT 0,
  `trade_limit` int(11) DEFAULT NULL COMMENT 'incomplete trade limit for ad',
  `last_seen` timestamp NULL DEFAULT NULL,
  `fcm_token` text DEFAULT NULL,
  `notify_active_template` text DEFAULT NULL COMMENT 'notification enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payment_infos`
--

CREATE TABLE `user_payment_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `information` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `crypto_currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `balance` varchar(40) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `advertisments`
--
ALTER TABLE `advertisments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisments_user_id_index` (`user_id`),
  ADD KEY `advertisments_crypto_id_index` (`crypto_id`),
  ADD KEY `advertisments_fiat_id_index` (`fiat_id`);

--
-- Indexes for table `configures`
--
ALTER TABLE `configures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_name_index` (`name`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_details_content_id_foreign` (`content_id`),
  ADD KEY `content_details_language_id_foreign` (`language_id`);

--
-- Indexes for table `content_media`
--
ALTER TABLE `content_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_media_content_id_foreign` (`content_id`);

--
-- Indexes for table `crypto_wallets`
--
ALTER TABLE `crypto_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_advertisement_id_index` (`advertisement_id`),
  ADD KEY `feedback_creator_id_index` (`creator_id`),
  ADD KEY `feedback_reviewer_id_index` (`reviewer_id`);

--
-- Indexes for table `firebase_notifies`
--
ALTER TABLE `firebase_notifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funds_user_id_foreign` (`user_id`),
  ADD KEY `funds_gateway_id_foreign` (`crypto_currency_id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identify_forms`
--
ALTER TABLE `identify_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notify_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_windows`
--
ALTER TABLE `payment_windows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_logs`
--
ALTER TABLE `payout_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_notifications`
--
ALTER TABLE `site_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_controls`
--
ALTER TABLE `sms_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_media`
--
ALTER TABLE `template_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_media_section_name_index` (`section_name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_attachments_ticket_message_id_foreign` (`ticket_message_id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_messages_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_messages_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trades_advertise_id_index` (`advertise_id`),
  ADD KEY `trades_sender_id_index` (`sender_id`),
  ADD KEY `trades_owner_id_index` (`owner_id`),
  ADD KEY `trades_currency_index` (`currency_id`);

--
-- Indexes for table `trade_chats`
--
ALTER TABLE `trade_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trade_chats_chatable_type_chatable_id_index` (`chatable_type`,`chatable_id`),
  ADD KEY `trade_chats_trades_id_index` (`trades_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_payment_infos`
--
ALTER TABLE `user_payment_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_payment_infos_user_id_index` (`user_id`),
  ADD KEY `user_payment_infos_gateway_id_index` (`gateway_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_index` (`user_id`),
  ADD KEY `wallets_crypto_currency_id_index` (`crypto_currency_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisments`
--
ALTER TABLE `advertisments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configures`
--
ALTER TABLE `configures`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `content_media`
--
ALTER TABLE `content_media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `crypto_wallets`
--
ALTER TABLE `crypto_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `firebase_notifies`
--
ALTER TABLE `firebase_notifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identify_forms`
--
ALTER TABLE `identify_forms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `notify_templates`
--
ALTER TABLE `notify_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment_windows`
--
ALTER TABLE `payment_windows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payout_logs`
--
ALTER TABLE `payout_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `site_notifications`
--
ALTER TABLE `site_notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_controls`
--
ALTER TABLE `sms_controls`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `template_media`
--
ALTER TABLE `template_media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_chats`
--
ALTER TABLE `trade_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payment_infos`
--
ALTER TABLE `user_payment_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_details`
--
ALTER TABLE `content_details`
  ADD CONSTRAINT `content_details_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`),
  ADD CONSTRAINT `content_details_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `content_media`
--
ALTER TABLE `content_media`
  ADD CONSTRAINT `content_media_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `notify_templates`
--
ALTER TABLE `notify_templates`
  ADD CONSTRAINT `notify_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
