-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2025 at 04:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `umtc_announcement_system`
--

-- --------------------------------------------------------
--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `actor_user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (
    `id`,
    `actor_user_id`,
    `action`,
    `details`,
    `target_user_id`,
    `ip_address`,
    `user_agent`,
    `created_at`
  )
VALUES (
    1,
    1,
    'user_create',
    '{\"username\":\"mark\",\"email\":\"mark@umindanao.edu.ph\",\"role\":\"super_admin\",\"department_id\":null}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 09:38:40'
  ),
  (
    2,
    1,
    'user_create',
    '{\"username\":\"kurt\",\"email\":\"kurt@umindanao.edu.ph\",\"role\":\"admin\",\"department_id\":\"1\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 09:39:02'
  ),
  (
    3,
    1,
    'user_create',
    '{\"username\":\"james\",\"email\":\"james@umindanao.edu.ph\",\"role\":\"admin\",\"department_id\":\"2\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 09:39:25'
  ),
  (
    4,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 09:55:32'
  ),
  (
    5,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 09:57:15'
  ),
  (
    6,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:06:18'
  ),
  (
    7,
    2,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:06:35'
  ),
  (
    8,
    3,
    'announcement_create',
    '{\"title\":\"awda\",\"category\":\"general\",\"department_id\":1,\"program_id\":\"1\",\"event_date\":\"2025-12-12\",\"event_time\":\"20:09\",\"is_published\":0,\"is_approved\":null}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:07:15'
  ),
  (
    9,
    3,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:07:26'
  ),
  (
    10,
    1,
    'announcement_update',
    '{\"announcement_id\":1,\"title\":\"awdawda\",\"is_published\":0,\"is_approved\":null}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:08:08'
  ),
  (
    11,
    1,
    'announcement_approve',
    '{\"announcement_id\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:08:08'
  ),
  (
    12,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:08:44'
  ),
  (
    13,
    3,
    'announcement_delete_request',
    '{\"announcement_id\":1,\"reason\":\"haha\"}',
    1,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:08:57'
  ),
  (
    14,
    3,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:09:02'
  ),
  (
    15,
    3,
    'profile_update',
    '{\"username\":\"kurt\",\"full_name\":\"kurt limos\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:10:18'
  ),
  (
    16,
    3,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:10:35'
  ),
  (
    17,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:16:10'
  ),
  (
    18,
    4,
    'announcement_create',
    '{\"title\":\"awdfawf\",\"category\":\"general\",\"department_id\":2,\"program_id\":\"3\",\"event_date\":\"2025-12-19\",\"event_time\":\"08:18\",\"is_published\":0,\"is_approved\":null}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:16:36'
  ),
  (
    19,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:16:53'
  ),
  (
    20,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:17:14'
  ),
  (
    21,
    1,
    'announcement_delete_approved',
    '{\"announcement_id\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:17:46'
  ),
  (
    22,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:17:49'
  ),
  (
    23,
    1,
    'announcement_approve',
    '{\"announcement_id\":2}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:17:55'
  ),
  (
    24,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 10:17:59'
  ),
  (
    25,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:02:56'
  ),
  (
    26,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:06:46'
  ),
  (
    27,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:08:34'
  ),
  (
    28,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:10:19'
  ),
  (
    29,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:10:34'
  ),
  (
    30,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:10:53'
  ),
  (
    31,
    1,
    'announcement_create',
    '{\"announcement_id\":\"3\",\"title\":\"awddawd\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:17:25'
  ),
  (
    32,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:17:29'
  ),
  (
    33,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:22:59'
  ),
  (
    34,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:23:35'
  ),
  (
    35,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:24:09'
  ),
  (
    36,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:31:52'
  ),
  (
    37,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:42:52'
  ),
  (
    38,
    1,
    'announcement_create',
    '{\"announcement_id\":\"4\",\"title\":\"hehehe\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:58:00'
  ),
  (
    39,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 11:58:17'
  ),
  (
    40,
    3,
    'announcement_create',
    '{\"title\":\"awfwad\",\"department_id\":1,\"program_id\":null}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:15:28'
  ),
  (
    41,
    3,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:17:42'
  ),
  (
    42,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:22:45'
  ),
  (
    43,
    4,
    'profile_update',
    '{\"username\":\"james\",\"full_name\":\"james sandayan\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:58:57'
  ),
  (
    44,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:59:03'
  ),
  (
    45,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 12:59:13'
  ),
  (
    46,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 13:01:21'
  ),
  (
    47,
    1,
    'announcement_create',
    '{\"announcement_id\":\"6\",\"title\":\"fawfa\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 13:02:00'
  ),
  (
    48,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 13:02:18'
  ),
  (
    49,
    1,
    'announcement_approve',
    '{\"announcement_id\":5}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:04:44'
  ),
  (
    50,
    1,
    'announcement_create',
    '{\"announcement_id\":\"7\",\"title\":\"try\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:05:07'
  ),
  (
    51,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:05:12'
  ),
  (
    52,
    1,
    'profile_update',
    '{\"username\":\"superadmin\",\"full_name\":\"GAlendar SuperAdmin\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:21:23'
  ),
  (
    53,
    1,
    'profile_update',
    '{\"username\":\"superadmin\",\"full_name\":\"GAlendar SuperAdmin\"}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:21:24'
  ),
  (
    54,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:40:52'
  ),
  (
    55,
    2,
    'announcement_create',
    '{\"announcement_id\":\"8\",\"title\":\"this is for testing awfkawbdajnwflak\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:42:14'
  ),
  (
    56,
    2,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:42:17'
  ),
  (
    57,
    2,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:43:10'
  ),
  (
    58,
    1,
    'announcement_create',
    '{\"announcement_id\":\"9\",\"title\":\"duplicate\",\"is_published\":1}',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:53:37'
  ),
  (
    59,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 14:53:41'
  ),
  (
    60,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 15:20:31'
  ),
  (
    61,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 15:25:26'
  ),
  (
    62,
    1,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 15:28:28'
  ),
  (
    63,
    4,
    'logout',
    'User logged out',
    NULL,
    '::1',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0',
    '2025-12-10 15:30:57'
  );
-- --------------------------------------------------------
--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` enum('general', 'academic', 'event', 'emergency') DEFAULT 'general',
  `author_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `event_location` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 0,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `archived_at` datetime DEFAULT NULL,
  `pending_delete_status` tinyint(1) DEFAULT 0,
  `pending_delete_reason` text DEFAULT NULL,
  `pending_delete_by` int(11) DEFAULT NULL,
  `pending_delete_at` datetime DEFAULT NULL,
  `pending_delete_decided_by` int(11) DEFAULT NULL,
  `pending_delete_decided_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (
    `id`,
    `title`,
    `content`,
    `category`,
    `author_id`,
    `department_id`,
    `program_id`,
    `event_date`,
    `event_time`,
    `event_location`,
    `is_published`,
    `created_at`,
    `updated_at`,
    `is_approved`,
    `approved_by`,
    `approved_at`,
    `is_archived`,
    `archived_at`,
    `pending_delete_status`,
    `pending_delete_reason`,
    `pending_delete_by`,
    `pending_delete_at`,
    `pending_delete_decided_by`,
    `pending_delete_decided_at`
  )
VALUES (
    2,
    'awdfawf',
    'afagassawf',
    'general',
    4,
    2,
    3,
    '2025-12-19',
    '08:18:00',
    'afw',
    1,
    '2025-12-10 10:16:36',
    '2025-12-10 10:17:55',
    1,
    1,
    '2025-12-10 18:17:55',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    3,
    'awddawd',
    'awgaw',
    'general',
    1,
    2,
    NULL,
    '2025-12-25',
    '09:17:00',
    'UMV New building',
    1,
    '2025-12-10 11:17:25',
    '2025-12-10 11:17:25',
    1,
    1,
    '2025-12-10 19:17:25',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    4,
    'hehehe',
    'fawd',
    'general',
    1,
    1,
    2,
    '2025-12-12',
    '22:58:00',
    'Gmall',
    1,
    '2025-12-10 11:58:00',
    '2025-12-10 11:58:00',
    1,
    1,
    '2025-12-10 19:58:00',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    5,
    'awfwad',
    'cwc',
    'general',
    3,
    1,
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    '2025-12-10 12:15:28',
    '2025-12-10 14:04:44',
    1,
    1,
    '2025-12-10 22:04:44',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    6,
    'fawfa',
    'awfasd',
    'general',
    1,
    NULL,
    NULL,
    '2025-12-13',
    '23:01:00',
    'UMV New building - Room 100',
    1,
    '2025-12-10 13:02:00',
    '2025-12-10 13:02:00',
    1,
    1,
    '2025-12-10 21:02:00',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    7,
    'try',
    'test',
    'general',
    1,
    NULL,
    NULL,
    '2026-01-08',
    '22:07:00',
    'UMTC Arellano Gymnasium',
    1,
    '2025-12-10 14:05:07',
    '2025-12-10 14:05:07',
    1,
    1,
    '2025-12-10 22:05:07',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    8,
    'this is for testing awfkawbdajnwflak',
    'gawgawdawfaw',
    'general',
    2,
    NULL,
    NULL,
    '2025-12-11',
    '22:44:00',
    'Gmall',
    1,
    '2025-12-10 14:42:14',
    '2025-12-10 14:42:14',
    1,
    2,
    '2025-12-10 22:42:14',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  (
    9,
    'duplicate',
    'dup',
    'general',
    1,
    2,
    2,
    '2025-12-11',
    '00:53:00',
    'UMTC Arellano Gymnasium',
    1,
    '2025-12-10 14:53:37',
    '2025-12-10 14:53:37',
    1,
    1,
    '2025-12-10 22:53:37',
    0,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
-- --------------------------------------------------------
--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `description`)
VALUES (
    1,
    'DCE',
    'Department of Computing Education',
    'Computing and IT'
  ),
  (
    2,
    'DEE',
    'Department of Electronics Engineering',
    'Electronics and related programs'
  );
-- --------------------------------------------------------
--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`)
VALUES (
    1,
    'UMTC Arellano Gymnasium',
    '2025-12-10 19:11:38'
  ),
  (4, 'UMV New building', '2025-12-10 19:31:26');
-- --------------------------------------------------------
--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (
    `id`,
    `department_id`,
    `code`,
    `name`,
    `description`
  )
VALUES (
    1,
    1,
    'BSIT',
    'Bachelor of Science in Information Technology',
    NULL
  ),
  (
    2,
    1,
    'BSCS',
    'Bachelor of Science in Computer Science',
    NULL
  ),
  (
    3,
    2,
    'BSECE',
    'Bachelor of Science in Electronics and Communication Engineering',
    NULL
  ),
  (
    4,
    2,
    'BSCoE',
    'Bachelor of Science in Computer Engineering',
    NULL
  ),
  (
    5,
    2,
    'BSEE',
    'Bachelor of Science in Electrical Engineering',
    NULL
  );
-- --------------------------------------------------------
--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `location_id`, `name`, `created_at`)
VALUES (5, 4, 'Room 200', '2025-12-10 19:31:36'),
  (6, 4, 'Room 100', '2025-12-10 19:31:44');
-- --------------------------------------------------------
--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('super_admin', 'admin') NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `require_password_change` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `archived_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `role`,
    `full_name`,
    `department_id`,
    `require_password_change`,
    `created_at`,
    `reset_token`,
    `reset_token_expiry`,
    `is_archived`,
    `archived_at`,
    `last_login_at`,
    `last_login_ip`,
    `profile_picture`
  )
VALUES (
    1,
    'superadmin',
    '$2y$10$z.oMgM1FsphBD3.TvQrsauVuwRHaNoGLSrLDJG.hnYJXSyQQ5/LMW',
    'superadmin@example.com',
    'super_admin',
    'GAlendar SuperAdmin',
    NULL,
    0,
    '2025-12-10 07:55:06',
    NULL,
    NULL,
    0,
    NULL,
    '2025-12-10 23:27:32',
    '::1',
    'uploads/profile_1_1765376483.jpeg'
  ),
  (
    2,
    'mark',
    '$2y$10$d4CHQdd5SVQcbuA9UQUUMe0Qq450zAxNJNFDPdGiW510Kk0oxNG/u',
    'mark@umindanao.edu.ph',
    'super_admin',
    'mark kian dollente',
    NULL,
    1,
    '2025-12-10 09:38:40',
    NULL,
    NULL,
    0,
    NULL,
    '2025-12-10 22:42:55',
    '::1',
    NULL
  ),
  (
    3,
    'kurt',
    '$2y$10$7ygkg2NoH30YlY.9prhtJ.WbZzwbarWUUz.1a3tdp8BiQxzCUX6Iu',
    'kurt@umindanao.edu.ph',
    'admin',
    'kurt limos',
    1,
    1,
    '2025-12-10 09:39:02',
    NULL,
    NULL,
    0,
    NULL,
    '2025-12-10 19:58:21',
    '::1',
    'uploads/profile_3_1765361418.jpg'
  ),
  (
    4,
    'james',
    '$2y$10$xvSMtP4K9pSS98ovK6ONAurFPjtVvAdmrXg0IwtaosvXX08BtHp.u',
    'james@umindanao.edu.ph',
    'admin',
    'james sandayan',
    2,
    1,
    '2025-12-10 09:39:25',
    NULL,
    NULL,
    0,
    NULL,
    '2025-12-10 23:34:02',
    '::1',
    'uploads/profile_4_1765371537.jpg'
  );
--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
ADD PRIMARY KEY (`id`),
  ADD KEY `actor_user_id` (`actor_user_id`),
  ADD KEY `target_user_id` (`target_user_id`),
  ADD KEY `action` (`action`);
--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `program_id` (`program_id`);
--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);
--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);
--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);
--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_location_room` (`location_id`, `name`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 64;
--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;
--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
ADD CONSTRAINT `fk_rooms_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;
--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE
SET NULL;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;