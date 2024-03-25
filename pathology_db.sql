-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 04:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

--
-- B556 - Pathology Database
--
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pathology_db`
--
CREATE DATABASE IF NOT EXISTS `pathology_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pathology_db`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_group`:
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_group_permissions`:
--   `permission_id`
--       `auth_permission` -> `id`
--   `group_id`
--       `auth_group` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--
-- Creation: Mar 25, 2024 at 01:50 PM
-- Last update: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_permission`:
--   `content_type_id`
--       `django_content_type` -> `id`
--

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_user`:
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_user_groups`:
--   `group_id`
--       `auth_group` -> `id`
--   `user_id`
--       `auth_user` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `auth_user_user_permissions`:
--   `permission_id`
--       `auth_permission` -> `id`
--   `user_id`
--       `auth_user` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--
-- Creation: Mar 25, 2024 at 01:34 PM
-- Last update: Mar 25, 2024 at 01:34 PM
--

DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `Disease_ID` int(11) NOT NULL,
  `Disease_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `disease`:
--

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`Disease_ID`, `Disease_name`) VALUES
(2, 'Huntington disease'),
(1, 'multiple sclerosis');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `django_admin_log`:
--   `content_type_id`
--       `django_content_type` -> `id`
--   `user_id`
--       `auth_user` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--
-- Creation: Mar 25, 2024 at 01:50 PM
-- Last update: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `django_content_type`:
--

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--
-- Creation: Mar 25, 2024 at 01:50 PM
-- Last update: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `django_migrations`:
--

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-25 13:50:05.134528'),
(2, 'auth', '0001_initial', '2024-03-25 13:50:05.353676'),
(3, 'admin', '0001_initial', '2024-03-25 13:50:05.416547'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-25 13:50:05.421543'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-25 13:50:05.426099'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-25 13:50:05.459655'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-25 13:50:05.489079'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-25 13:50:05.507690'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-25 13:50:05.511690'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-25 13:50:05.536869'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-25 13:50:05.537869'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-25 13:50:05.541904'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-25 13:50:05.551419'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-25 13:50:05.559981'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-25 13:50:05.568552'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-25 13:50:05.573557'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-25 13:50:05.582648'),
(18, 'sessions', '0001_initial', '2024-03-25 13:50:05.597774');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--
-- Creation: Mar 25, 2024 at 01:50 PM
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `django_session`:
--

-- --------------------------------------------------------

--
-- Table structure for table `enviromental_factor`
--
-- Creation: Mar 25, 2024 at 01:34 PM
-- Last update: Mar 25, 2024 at 01:34 PM
--

DROP TABLE IF EXISTS `enviromental_factor`;
CREATE TABLE `enviromental_factor` (
  `Enviromental_ID` int(11) NOT NULL,
  `Enviromental_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `enviromental_factor`:
--

--
-- Dumping data for table `enviromental_factor`
--

INSERT INTO `enviromental_factor` (`Enviromental_ID`, `Enviromental_name`) VALUES
(2001, 'Epstein–Barr virus (EBV) Infectiom'),
(2002, 'Stress');

-- --------------------------------------------------------

--
-- Table structure for table `enviromental_risk`
--
-- Creation: Mar 25, 2024 at 01:34 PM
-- Last update: Mar 25, 2024 at 01:34 PM
--

DROP TABLE IF EXISTS `enviromental_risk`;
CREATE TABLE `enviromental_risk` (
  `Enviromental_ID` int(11) NOT NULL,
  `Disease_ID` int(11) NOT NULL,
  `doi_source` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `enviromental_risk`:
--   `Enviromental_ID`
--       `enviromental_factor` -> `Enviromental_ID`
--

--
-- Dumping data for table `enviromental_risk`
--

INSERT INTO `enviromental_risk` (`Enviromental_ID`, `Disease_ID`, `doi_source`) VALUES
(2001, 1, 'doi.org/10.1038/s41586-022-04432-7'),
(2002, 2, 'doi.org/10.1016/j.neubiorev.2015.03.003');

-- --------------------------------------------------------

--
-- Table structure for table `genetic_factor`
--
-- Creation: Mar 25, 2024 at 01:34 PM
-- Last update: Mar 25, 2024 at 01:34 PM
--

DROP TABLE IF EXISTS `genetic_factor`;
CREATE TABLE `genetic_factor` (
  `Genetic_ID` int(11) NOT NULL,
  `SNP_name` varchar(50) NOT NULL,
  `Mapped_gene` varchar(50) NOT NULL,
  `Reported_Trait` varchar(100) DEFAULT NULL,
  `P_Value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `genetic_factor`:
--

--
-- Dumping data for table `genetic_factor`
--

INSERT INTO `genetic_factor` (`Genetic_ID`, `SNP_name`, `Mapped_gene`, `Reported_Trait`, `P_Value`) VALUES
(1001, 'rs150393409-A', 'FAN1', 'Huntington\'s disease (age at onset)', 2e-20),
(1002, 'rs1232027-?', 'LINC01337', 'Huntington\'s disease progression', 0.0000000001),
(1003, 'rs12668183-C', 'CRPPA', 'Huntington\'s disease (age at onset)', 0.00000002),
(1004, 'rs73786719-?', 'ADGB', 'Huntington\'s disease progression', 0.0000009),
(1005, 'rs114688092-?', 'KIF9', 'Huntington\'s disease progression', 0.000002),
(1006, 'rs3104373-T', 'HLA-DQA1', 'Multiple sclerosis', 1e-234),
(1007, 'rs3135388-A', 'HLA-DRB9,HLA-DRA', 'Multiple sclerosis', 1e-225),
(1008, 'rs3129889-G', 'HLA-DRB9, HLA-DRA', 'Multiple sclerosis', 1e-206),
(1009, 'rs9271366-G', 'HLA-DQA1, HLA-DRB1', 'Multiple sclerosis', 1e-184),
(1010, 'rs10801908-C', 'CD58', 'Multiple sclerosis', 5e-70);

-- --------------------------------------------------------

--
-- Table structure for table `genetic_risk`
--
-- Creation: Mar 25, 2024 at 01:34 PM
-- Last update: Mar 25, 2024 at 01:34 PM
--

DROP TABLE IF EXISTS `genetic_risk`;
CREATE TABLE `genetic_risk` (
  `Genetic_ID` int(11) NOT NULL,
  `Disease_ID` int(11) NOT NULL,
  `accession_source` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `genetic_risk`:
--   `Genetic_ID`
--       `genetic_factor` -> `Genetic_ID`
--

--
-- Dumping data for table `genetic_risk`
--

INSERT INTO `genetic_risk` (`Genetic_ID`, `Disease_ID`, `accession_source`) VALUES
(1001, 2, 'GCST004691'),
(1002, 2, 'GCST004691'),
(1003, 2, 'GCST004691'),
(1004, 2, 'GCST004691'),
(1005, 2, 'GCST004691'),
(1006, 1, 'GCST003566'),
(1007, 1, 'GCST000424'),
(1008, 1, 'GCST001341'),
(1009, 1, 'GCST000425'),
(1010, 1, 'GCST009597');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`Disease_ID`),
  ADD UNIQUE KEY `Disease_name` (`Disease_name`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `enviromental_factor`
--
ALTER TABLE `enviromental_factor`
  ADD PRIMARY KEY (`Enviromental_ID`),
  ADD UNIQUE KEY `Enviromental_name` (`Enviromental_name`);

--
-- Indexes for table `enviromental_risk`
--
ALTER TABLE `enviromental_risk`
  ADD PRIMARY KEY (`Enviromental_ID`,`Disease_ID`);

--
-- Indexes for table `genetic_factor`
--
ALTER TABLE `genetic_factor`
  ADD PRIMARY KEY (`Genetic_ID`),
  ADD UNIQUE KEY `SNP_name` (`SNP_name`);

--
-- Indexes for table `genetic_risk`
--
ALTER TABLE `genetic_risk`
  ADD PRIMARY KEY (`Genetic_ID`,`Disease_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `enviromental_risk`
--
ALTER TABLE `enviromental_risk`
  ADD CONSTRAINT `enviromental_risk_ibfk_1` FOREIGN KEY (`Enviromental_ID`) REFERENCES `enviromental_factor` (`Enviromental_ID`) ON DELETE CASCADE;

--
-- Constraints for table `genetic_risk`
--
ALTER TABLE `genetic_risk`
  ADD CONSTRAINT `genetic_risk_ibfk_1` FOREIGN KEY (`Genetic_ID`) REFERENCES `genetic_factor` (`Genetic_ID`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
