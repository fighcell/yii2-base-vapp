-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2020 at 07:59 AM
-- Server version: 10.1.41-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.30-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2-app-base`
--

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1590715488);

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'administrator', NULL, NULL, 1590715466, 1590715466);

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1590799569),
('m140209_132017_init', 1590799918),
('m140403_174025_create_account_table', 1590799919),
('m140504_113157_update_tables', 1590799921),
('m140504_130429_create_token_table', 1590799921),
('m140506_102106_rbac_init', 1590799678),
('m140830_171933_fix_ip_field', 1590799921),
('m140830_172703_change_account_table_name', 1590799921),
('m141022_115922_create_session_table', 1590799619),
('m141222_110026_update_ip_field', 1590799921),
('m141222_135246_alter_username_length', 1590799922),
('m150104_153617_create_article_table', 1590799946),
('m150614_103145_update_social_account_table', 1590799922),
('m150623_212711_fix_username_notnull', 1590799922),
('m151218_234654_add_timezone_to_profile', 1590799922),
('m160929_103127_add_last_login_at_to_user_table', 1590799922),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1590799678),
('m180523_151638_rbac_updates_indexes_without_prefix', 1590799678),
('m200409_110543_rbac_update_mssql_trigger', 1590799678);

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, 'Ahmed Faisal', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', NULL);

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `expire`, `data`) VALUES
('0q4l7k2qrnv3is0qi7b4pqvplk', 1590806536, 0x5f5f666c6173687c613a303a7b7d),
('voof8i7ih7jsm493v3r2r0ov0p', 1590806528, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a33353a22687474703a2f2f6c6f63616c686f73742f796969322d626173652f6261636b656e642f223b);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'fighcell', 'ah.faisal@gmail.com', '$2y$10$l7RhAMT5vNHKImLDt7n8DeJYE6JnnvRG4gCtCok3sT9PMPXsWmfwS', 'NM0ug3lfJqbhsdtHyhu3ZF_g0ZRZi-9B', 1590715181, NULL, NULL, '::1', 1590715152, 1590715152, 0, 1590802637);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
