-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2023 at 12:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pi3a35`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `time_slot_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `booking_state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctor_id`, `patient_id`, `time_slot_id`, `date`, `reason`, `hour`, `booking_state`) VALUES
(19, 4, 29, 179, '2023-03-20', 'appointment', '09:00:00', 'confirmed'),
(20, 4, 29, 173, '2023-03-06', 'check-up', '11:00:00', 'not-confirmed'),
(23, 11, 29, 149, '2023-03-06', 'check-up', '15:00:00', 'not-confirmed'),
(24, 11, 29, 152, '2023-03-07', 'appointment', '10:30:00', 'confirmed'),
(25, 11, 29, 161, '2023-03-20', 'appointment', '16:00:00', 'not-confirmed'),
(26, 11, 29, 166, '2023-03-15', 'check-up', '11:00:00', 'confirmed'),
(27, 4, 2, 174, '2023-03-06', 'appointment', '11:40:00', 'confirmed'),
(28, 4, 2, 182, '2023-03-20', 'appointment', '12:00:00', 'confirmed'),
(31, 11, 2, 143, '2023-03-06', 'appointment', '09:00:00', 'confirmed'),
(32, 11, 2, 156, '2023-03-07', 'appointment', '16:00:00', 'confirmed'),
(33, 11, 2, 169, '2023-03-15', 'appointment', '12:30:00', 'confirmed'),
(35, 11, 1, 150, '2023-03-06', 'check-up', '16:00:00', 'confirmed'),
(36, 11, 1, 198, '2023-03-14', 'check-up', '11:30:00', 'confirmed'),
(37, 11, 2, 209, '2023-04-08', 'appointment', '16:45:00', 'not-confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `contenu` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calandar_day`
--

CREATE TABLE `calandar_day` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `day_start` time NOT NULL,
  `day_end` time NOT NULL,
  `session_duration` int(11) NOT NULL,
  `lunch_break_start` time DEFAULT NULL,
  `lunch_break_end` time DEFAULT NULL,
  `total_time_slots` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calandar_day`
--

INSERT INTO `calandar_day` (`id`, `doctor_id`, `date`, `day_start`, `day_end`, `session_duration`, `lunch_break_start`, `lunch_break_end`, `total_time_slots`) VALUES
(50, 11, '2023-03-06', '09:00:00', '17:00:00', 60, '13:00:00', '14:00:00', NULL),
(51, 11, '2023-03-07', '09:00:00', '17:00:00', 90, '13:00:00', '14:00:00', NULL),
(52, 11, '2023-03-20', '09:00:00', '17:00:00', 120, '13:00:00', '14:00:00', NULL),
(53, 11, '2023-03-15', '09:00:00', '13:00:00', 30, '13:00:00', '14:00:00', NULL),
(54, 4, '2023-03-06', '09:00:00', '17:00:00', 40, '13:00:00', '16:00:00', NULL),
(55, 4, '2023-03-20', '09:00:00', '15:00:00', 60, '13:00:00', '14:00:00', NULL),
(60, 11, '2023-03-14', '10:00:00', '12:00:00', 30, '13:00:00', '14:00:00', NULL),
(61, 11, '2023-04-08', '09:00:00', '17:00:00', 45, '13:00:00', '14:00:00', NULL),
(63, 11, '2023-03-08', '15:00:00', '17:00:00', 120, '13:00:00', '14:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `contenu` longtext NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230218195356', '2023-02-18 19:54:11', 2608),
('DoctrineMigrations\\Version20230221114035', '2023-02-21 11:40:50', 1320),
('DoctrineMigrations\\Version20230308001155', '2023-03-08 00:12:00', 106),
('DoctrineMigrations\\Version20230308132822', '2023-03-08 13:29:04', 234),
('DoctrineMigrations\\Version20230308161020', '2023-03-08 16:12:07', 1873),
('DoctrineMigrations\\Version20230308180617', '2023-03-08 18:08:47', 2631),
('DoctrineMigrations\\Version20230308212502', '2023-03-08 21:26:33', 72);

-- --------------------------------------------------------

--
-- Table structure for table `dossier_medical`
--

CREATE TABLE `dossier_medical` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `vaccins` varchar(255) NOT NULL,
  `maladies` varchar(255) NOT NULL,
  `allergies` varchar(255) NOT NULL,
  `analyses` varchar(255) NOT NULL,
  `intervention_chirurgicale` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `nom_event` varchar(30) NOT NULL,
  `discription_event` varchar(255) NOT NULL,
  `image_event` varchar(255) NOT NULL,
  `date_debut_event` date NOT NULL,
  `date_fin_event` date NOT NULL,
  `adresse_event` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reserve` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `nom_event`, `discription_event`, `image_event`, `date_debut_event`, `date_fin_event`, `adresse_event`, `status`, `reserve`) VALUES
(7, 'help', 'aide lrd hens', 'https://www.kamilgrzybek.com/images/blog/posts/handling-domain-event-missing-part/events_bricks-825x510.jpg', '2022-01-01', '2023-01-08', 'tunisie', 'Confirmé', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_ticket`
--

CREATE TABLE `event_ticket` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `event_id_id` int(11) DEFAULT NULL,
  `matricule_event` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_ticket` date NOT NULL,
  `valide_ticket` varchar(255) NOT NULL,
  `prix_ticket` varchar(255) NOT NULL,
  `description_ticket` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `reserve` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_ticket`
--

INSERT INTO `event_ticket` (`id`, `user_id_id`, `event_id_id`, `matricule_event`, `image`, `date_ticket`, `valide_ticket`, `prix_ticket`, `description_ticket`, `adresse`, `reserve`) VALUES
(5, 13, 7, '344', 'https://www.kamilgrzybek.com/images/blog/posts/handling-domain-event-missing-part/events_bricks-825x510.jpg', '2018-01-01', 'Valide', 'Normal: 2 DT', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ficheconsultation`
--

CREATE TABLE `ficheconsultation` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `dossier_medical_id` int(11) DEFAULT NULL,
  `date_consultation` date NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `specialite` varchar(255) NOT NULL,
  `traitement` varchar(255) NOT NULL,
  `reccomendation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `categorie_produit_id` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantite_produit` int(11) NOT NULL,
  `prix` double NOT NULL,
  `image_produit` varchar(255) NOT NULL,
  `marque` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `type_service_id` int(11) DEFAULT NULL,
  `nom_service` varchar(255) NOT NULL,
  `proprietaire` varchar(255) NOT NULL,
  `id_type` varchar(255) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `type_service_id`, `nom_service`, `proprietaire`, `id_type`, `prix`, `date_debut`, `date_fin`) VALUES
(1, 1, 'service_1', 'doc_1', '235', '0', '2023-05-01', '2023-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `id` int(11) NOT NULL,
  `calandar_day_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `index_slot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`id`, `calandar_day_id`, `start_time`, `end_time`, `status`, `reason`, `note`, `index_slot`) VALUES
(143, 50, '09:00:00', '10:00:00', 'not-available', 'booked', NULL, NULL),
(144, 50, '10:00:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(145, 50, '11:00:00', '12:00:00', 'available', 'unbooked', NULL, NULL),
(146, 50, '12:00:00', '13:00:00', 'available', 'unbooked', NULL, NULL),
(147, 50, '13:00:00', '14:00:00', 'not-available', 'lunch-time', NULL, NULL),
(148, 50, '14:00:00', '15:00:00', 'available', 'unbooked', NULL, NULL),
(149, 50, '15:00:00', '16:00:00', 'not-available', 'booked', NULL, NULL),
(150, 50, '16:00:00', '17:00:00', 'not-available', 'booked', NULL, NULL),
(151, 51, '09:00:00', '10:30:00', 'available', 'unbooked', NULL, NULL),
(152, 51, '10:30:00', '12:00:00', 'not-available', 'booked', NULL, NULL),
(153, 51, '12:00:00', '13:30:00', 'available', 'unbooked', NULL, NULL),
(154, 51, '13:30:00', '14:30:00', 'not-available', 'lunch-time', NULL, NULL),
(155, 51, '14:30:00', '16:00:00', 'available', 'unbooked', NULL, NULL),
(156, 51, '16:00:00', '17:30:00', 'not-available', 'booked', NULL, NULL),
(157, 52, '09:00:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(158, 52, '11:00:00', '13:00:00', 'not-available', 'booked', 'Ms alia  has booked', NULL),
(159, 52, '13:00:00', '14:00:00', 'not-available', 'lunch-time', NULL, NULL),
(160, 52, '14:00:00', '16:00:00', 'available', 'unbooked', NULL, NULL),
(161, 52, '16:00:00', '18:00:00', 'not-available', 'booked', NULL, NULL),
(162, 53, '09:00:00', '09:30:00', 'available', 'unbooked', NULL, NULL),
(163, 53, '09:30:00', '10:00:00', 'available', 'unbooked', NULL, NULL),
(164, 53, '10:00:00', '10:30:00', 'available', 'unbooked', NULL, NULL),
(165, 53, '10:30:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(166, 53, '11:00:00', '11:30:00', 'not-available', 'booked', NULL, NULL),
(167, 53, '11:30:00', '12:00:00', 'available', 'unbooked', NULL, NULL),
(168, 53, '12:00:00', '12:30:00', 'available', 'unbooked', NULL, NULL),
(169, 53, '12:30:00', '13:00:00', 'not-available', 'booked', NULL, NULL),
(170, 54, '09:00:00', '09:40:00', 'available', 'unbooked', NULL, NULL),
(171, 54, '09:40:00', '10:20:00', 'available', 'unbooked', NULL, NULL),
(172, 54, '10:20:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(173, 54, '11:00:00', '11:40:00', 'not-available', 'booked', NULL, NULL),
(174, 54, '11:40:00', '12:20:00', 'not-available', 'booked', NULL, NULL),
(175, 54, '12:20:00', '13:00:00', 'available', 'unbooked', NULL, NULL),
(176, 54, '13:00:00', '16:00:00', 'not-available', 'lunch-time', NULL, NULL),
(177, 54, '16:00:00', '16:40:00', 'available', 'unbooked', NULL, NULL),
(178, 54, '16:40:00', '17:20:00', 'available', 'unbooked', NULL, NULL),
(179, 55, '09:00:00', '10:00:00', 'not-available', 'booked', NULL, NULL),
(180, 55, '10:00:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(181, 55, '11:00:00', '12:00:00', 'available', 'unbooked', NULL, NULL),
(182, 55, '12:00:00', '13:00:00', 'not-available', 'booked', NULL, NULL),
(183, 55, '13:00:00', '14:00:00', 'not-available', 'lunch-time', NULL, NULL),
(184, 55, '14:00:00', '15:00:00', 'available', 'unbooked', NULL, NULL),
(195, 60, '10:00:00', '10:30:00', 'available', 'unbooked', 'hello', NULL),
(196, 60, '10:30:00', '11:00:00', 'available', 'unbooked', NULL, NULL),
(197, 60, '11:00:00', '11:30:00', 'available', 'unbooked', NULL, NULL),
(198, 60, '11:30:00', '12:00:00', 'not-available', 'booked', NULL, NULL),
(199, 61, '09:00:00', '09:45:00', 'available', 'unbooked', NULL, NULL),
(200, 61, '09:45:00', '10:30:00', 'available', 'unbooked', NULL, NULL),
(201, 61, '10:30:00', '11:15:00', 'available', 'unbooked', NULL, NULL),
(202, 61, '11:15:00', '12:00:00', 'available', 'unbooked', NULL, NULL),
(203, 61, '12:00:00', '12:45:00', 'available', 'unbooked', NULL, NULL),
(204, 61, '12:45:00', '13:30:00', 'available', 'unbooked', NULL, NULL),
(205, 61, '13:30:00', '14:30:00', 'not-available', 'lunch-time', NULL, NULL),
(206, 61, '14:30:00', '15:15:00', 'available', 'unbooked', NULL, NULL),
(207, 61, '15:15:00', '16:00:00', 'available', 'unbooked', NULL, NULL),
(208, 61, '16:00:00', '16:45:00', 'available', 'unbooked', NULL, NULL),
(209, 61, '16:45:00', '17:30:00', 'not-available', 'booked', NULL, NULL),
(215, 63, '15:00:00', '17:00:00', 'available', 'unbooked', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_service`
--

CREATE TABLE `type_service` (
  `id` int(11) NOT NULL,
  `nom_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_service`
--

INSERT INTO `type_service` (`id`, `nom_type`, `description`) VALUES
(1, 'type_service_1', ';fmdzkjczf'),
(2, 'type_service_2', 'kdfgvhlfjkjer');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `extra1_rdv` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `banned` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `image`, `first_name`, `last_name`, `speciality`, `licence`, `location`, `phone_number`, `date_of_birth`, `status`, `created_at`, `gender`, `last_login`, `updated_at`, `extra1_rdv`, `age`, `reset_token`, `banned`, `is_verified`) VALUES
(1, 'rabbehs@gmail.com', '[\"ROLE_USER\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'thePatient', 'user', NULL, NULL, NULL, '22222222', '0000-00-00', NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'seifallah.rbaihi@esprit.tn', '[\"ROLE_USER\"]', '$2y$13$X3bnSvxEGo70g.8JU00EjeZUhQ8GV0Ra6W.TXUJe0oMcI9Hf9wXke', NULL, 'validEmail', 'hehasValidEmail', NULL, NULL, 'SONDESSv', '22222222', '0000-00-00', 'online', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'd1@g.c', '[\"ROLE_DOCTOR\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'heisadoctor', 'whateverLastName', NULL, NULL, NULL, '22222222', '0000-00-00', 'offline', NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'u4@g.c', '[\"ROLE_USER\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'u4', 'u4', NULL, NULL, NULL, '111111', '0000-00-00', NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'n1@g.c', '[\"ROLE_NURSE\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'n1', 'n1', NULL, NULL, NULL, '111111', '0000-00-00', NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'd4@g.c', '[\"ROLE_DOCTOR\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'doctorwithid11', 'the11D', NULL, NULL, NULL, '111111', '0000-00-00', 'online', NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'd6@g.c', '[\"ROLE_DOCTOR\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'good', 'docgood', NULL, NULL, NULL, '111111', '0000-00-00', NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'rbaihiseif@gmail.com', '[\"ROLE_USER\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'u5', 'u', NULL, NULL, NULL, '123456', '0000-00-00', NULL, NULL, 'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'u6@g.c', '[\"ROLE_USER\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'u6', 'u', NULL, NULL, NULL, '123456', '0000-00-00', NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'n4@g.c', '[\"ROLE_NURSE\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'n4', 'n', NULL, NULL, NULL, '699696', '0000-00-00', NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'nurse@g.c', '[\"ROLE_NURSE\"]', '$2y$13$SH/l6mZUqPzV/2GSRlqnnuZpSZ5soHSB44DJVFKEw5PZ.re6nWhL2', NULL, 'nurse', 'sheisthenurse', 'justanurse', NULL, NULL, '666666', '2018-01-01', NULL, NULL, 'female', NULL, NULL, NULL, '3', NULL, NULL, NULL),
(27, 'admin@g.c', '[\"ROLE_ADMIN\"]', '$2y$13$ZoMTRTXMbG/X12QwlOcQ4eDFqrIp2Qdg1IxDQC6NjZINa4GjCLLXW', NULL, 'admin', 'ad', 'admin_seuper_user', NULL, NULL, '125451', '2019-01-05', NULL, NULL, 'male', NULL, NULL, NULL, '5', NULL, NULL, NULL),
(29, 'rabbehseif@gmail.com', '[\"ROLE_USER\"]', '$2y$13$MAmarZ0CtPip3ZWgSoP4N.3hjBEC1tONfVL807gHBoWniB9PhmoEq', NULL, 'seif', 'rh', '......', NULL, NULL, '123456', '2018-01-01', NULL, NULL, 'male', NULL, NULL, NULL, '3', NULL, NULL, NULL),
(30, 'fberrzig@gmaill.com', '[\"ROLE_USER\"]', '$2y$13$F1jWLc/rPIExq/yrHPhkaOeb9mSxCa4UAaAtVnAX8nVIb3/1jU7Oi', 'C:\\Users\\rbaih\\AppData\\Local\\Temp\\phpADF2.tmp', 'radhouene', 'madame souad', NULL, NULL, 'sondess', '01478523', '1910-01-01', 'offline', '2023-03-08', 'Homme', NULL, NULL, NULL, '113', NULL, NULL, NULL),
(31, 'ziedghanem30@gmail.com', '[\"ROLE_DOCTOR\"]', '$2y$13$uZPcxodbHWekTA2v6VHBpuGyvaLWp.WzLwbUkNBqCBng03XD7Csc.', 'C:\\Users\\rbaih\\AppData\\Local\\Temp\\php2EE3.tmp', 'zied', 'ghanem', 'moudir', 'moudir', 'moudir', '12345678', '1910-01-01', 'offline', '2023-03-08', 'Homme', NULL, NULL, NULL, '113', '86TFJCrSmAE6FzUOdoZIK3lsm6D5ENPxdz_iPEj6qUw', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FE38F844D62B0FA` (`time_slot_id`),
  ADD KEY `IDX_FE38F84487F4FB17` (`doctor_id`),
  ADD KEY `IDX_FE38F8446B899279` (`patient_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E669D86650F` (`user_id_id`);

--
-- Indexes for table `calandar_day`
--
ALTER TABLE `calandar_day`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor_date_idx` (`doctor_id`,`date`),
  ADD KEY `IDX_462D1A2F87F4FB17` (`doctor_id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BC7294869C` (`article_id`),
  ADD KEY `IDX_67F068BC9D86650F` (`user_id_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3581EE629D86650F` (`user_id_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_ticket`
--
ALTER TABLE `event_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A539DAF19D86650F` (`user_id_id`),
  ADD KEY `IDX_A539DAF13E5F2F7B` (`event_id_id`);

--
-- Indexes for table `ficheconsultation`
--
ALTER TABLE `ficheconsultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EB8C06E387F4FB17` (`doctor_id`),
  ADD KEY `IDX_EB8C06E37750B79F` (`dossier_medical_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC2791FDB457` (`categorie_produit_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E19D9AD2F05F7FC3` (`type_service_id`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1B3294AA0A26205` (`calandar_day_id`);

--
-- Indexes for table `type_service`
--
ALTER TABLE `type_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `calandar_day`
--
ALTER TABLE `calandar_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_ticket`
--
ALTER TABLE `event_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ficheconsultation`
--
ALTER TABLE `ficheconsultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_slot`
--
ALTER TABLE `time_slot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `type_service`
--
ALTER TABLE `type_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_FE38F8446B899279` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FE38F84487F4FB17` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FE38F844D62B0FA` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E669D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `calandar_day`
--
ALTER TABLE `calandar_day`
  ADD CONSTRAINT `FK_462D1A2F87F4FB17` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_67F068BC9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `dossier_medical`
--
ALTER TABLE `dossier_medical`
  ADD CONSTRAINT `FK_3581EE629D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `event_ticket`
--
ALTER TABLE `event_ticket`
  ADD CONSTRAINT `FK_A539DAF13E5F2F7B` FOREIGN KEY (`event_id_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `FK_A539DAF19D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `ficheconsultation`
--
ALTER TABLE `ficheconsultation`
  ADD CONSTRAINT `FK_EB8C06E37750B79F` FOREIGN KEY (`dossier_medical_id`) REFERENCES `dossier_medical` (`id`),
  ADD CONSTRAINT `FK_EB8C06E387F4FB17` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC2791FDB457` FOREIGN KEY (`categorie_produit_id`) REFERENCES `categorie` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_E19D9AD2F05F7FC3` FOREIGN KEY (`type_service_id`) REFERENCES `type_service` (`id`);

--
-- Constraints for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD CONSTRAINT `FK_1B3294AA0A26205` FOREIGN KEY (`calandar_day_id`) REFERENCES `calandar_day` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
