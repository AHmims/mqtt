-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 11:59 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projet001`
--
CREATE DATABASE IF NOT EXISTS `projet001` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `projet001`;

-- --------------------------------------------------------

--
-- Table structure for table `acceszone`
--

DROP TABLE IF EXISTS `acceszone`;
CREATE TABLE `acceszone` (
  `idPersonnel` int(11) NOT NULL,
  `idZone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acceszone`
--

INSERT INTO `acceszone` (`idPersonnel`, `idZone`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `acceszonetemp`
--

DROP TABLE IF EXISTS `acceszonetemp`;
CREATE TABLE `acceszonetemp` (
  `idAccesZT` int(11) NOT NULL,
  `raisonAccesZT` text COLLATE utf8_unicode_ci NOT NULL,
  `dateD_AccesZT` datetime NOT NULL,
  `dateF_AccesZT` datetime NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idZone` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acceszonetemp`
--

INSERT INTO `acceszonetemp` (`idAccesZT`, `raisonAccesZT`, `dateD_AccesZT`, `dateF_AccesZT`, `idPersonnel`, `idZone`, `idUtilisateur`) VALUES
(1, 'raison', '2020-10-13 20:00:00', '2020-10-13 22:00:00', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `broker`
--

DROP TABLE IF EXISTS `broker`;
CREATE TABLE `broker` (
  `idBroker` int(11) NOT NULL,
  `macBroker` char(17) COLLATE utf8_unicode_ci NOT NULL,
  `typeBroker` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `idZone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `broker`
--

INSERT INTO `broker` (`idBroker`, `macBroker`, `typeBroker`, `idZone`) VALUES
(1, '95-43-C8-3B-C0-0A', 'pointage', 1),
(2, '8C-5D-24-D4-A8-BF', 'zone', 3),
(3, 'FE-36-54-95-BD-74', 'zone', 2),
(5, '0B-88-A4-66-0E-A0', 'zone', 3),
(6, 'C8-5B-47-4A-75-61', 'queue', 1),
(7, 'FF-CC-67-DE-1E-A0', 'q-r1_b1', 1),
(8, 'A9-D3-D9-DB-BA-47', 'q-r1_b2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `convergence`
--

DROP TABLE IF EXISTS `convergence`;
CREATE TABLE `convergence` (
  `idConvergence` int(11) NOT NULL,
  `dateConvergence` datetime NOT NULL,
  `distanceConvergence` float NOT NULL,
  `idBroker` int(11) DEFAULT NULL,
  `idPersonnel` int(11) DEFAULT NULL,
  `idPersonnel_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `convergence`
--

INSERT INTO `convergence` (`idConvergence`, `dateConvergence`, `distanceConvergence`, `idBroker`, `idPersonnel`, `idPersonnel_2`) VALUES
(57, '2020-12-12 07:07:07', 10, 5, 1, 2),
(58, '2020-12-12 07:07:07', 0.5, 5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE `historique` (
  `idHistorique` int(11) NOT NULL,
  `actionHistorique` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `dateHistorique` datetime DEFAULT NULL,
  `idPersonnel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `historique`
--

INSERT INTO `historique` (`idHistorique`, `actionHistorique`, `dateHistorique`, `idPersonnel`) VALUES
(21, 'connecté', '2020-10-28 17:20:17', 3),
(22, 'connecté', '2020-10-28 19:43:37', 2),
(23, 'connecté', '2020-10-28 19:44:23', 2),
(24, 'connecté', '2020-10-28 19:44:48', 2),
(25, 'connecté', '2020-10-28 19:46:28', 2),
(26, 'connecté', '2020-10-28 20:32:06', 2),
(27, 'connecté', '2020-10-28 20:42:02', 2),
(28, 'connecté', '2020-10-28 20:49:12', 2),
(29, 'connecté', '2020-10-28 20:49:36', 2),
(30, 'déconnecté', '2020-10-28 21:06:43', 1),
(31, 'déconnecté', '2020-10-28 21:19:44', 1),
(32, 'déconnecté', '2020-10-28 21:20:05', 1),
(33, 'déconnecté', '2020-10-28 21:20:16', 1),
(34, 'déconnecté', '2020-10-28 21:21:10', 1),
(35, 'déconnecté', '2020-10-28 21:22:13', 1),
(36, 'déconnecté', '2020-10-28 21:24:02', 1),
(37, 'déconnecté', '2020-10-28 21:39:54', 1),
(38, 'déconnecté', '2020-10-28 21:40:01', 1),
(39, 'déconnecté', '2020-10-28 21:40:49', 1),
(40, 'déconnecté', '2020-10-28 21:41:12', 1),
(41, 'déconnecté', '2020-10-28 21:42:16', 1),
(42, 'déconnecté', '2020-10-28 21:43:29', 1),
(43, 'déconnecté', '2020-10-28 21:46:07', 1),
(44, 'déconnecté', '2020-10-28 21:46:37', 1),
(45, 'connecté', '2020-10-28 22:06:12', 2),
(46, 'déconnecté', '2020-10-28 22:13:17', 1),
(47, 'déconnecté', '2020-10-28 22:13:32', 1),
(48, 'déconnecté', '2020-10-28 22:13:36', 1),
(49, 'déconnecté', '2020-10-28 22:37:13', 1),
(50, 'déconnecté', '2020-10-28 22:37:17', 1),
(51, 'déconnecté', '2020-10-28 22:37:18', 1),
(52, 'déconnecté', '2020-10-28 22:37:19', 1),
(53, 'déconnecté', '2020-10-28 22:37:21', 1),
(54, 'déconnecté', '2020-10-28 23:08:42', 1),
(55, 'déconnecté', '2020-10-28 23:10:04', 1);

--
-- Triggers `historique`
--
DROP TRIGGER IF EXISTS `historique_defaultDateTime`;
DELIMITER $$
CREATE TRIGGER `historique_defaultDateTime` BEFORE INSERT ON `historique` FOR EACH ROW SET NEW.dateHistorique = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `contentMessage` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateMessage` datetime NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idUtilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`idMessage`, `contentMessage`, `dateMessage`, `idPersonnel`, `idUtilisateur`) VALUES
(1, 'msg', '2020-10-22 06:00:00', 1, 1),
(2, 'msg 2', '2020-10-22 16:00:00', 2, 1),
(3, 'msg_3', '2020-10-22 15:53:26', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `idNotification` int(11) NOT NULL,
  `sujetNotification` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dateNotification` datetime NOT NULL,
  `idBroker` int(11) DEFAULT NULL,
  `idPersonnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`idNotification`, `sujetNotification`, `dateNotification`, `idBroker`, `idPersonnel`) VALUES
(12, 'db_e_f_rank', '2020-10-23 22:50:35', 1, 1),
(13, 'db_e_f_timeTaken', '2020-10-28 15:14:06', 6, 3),
(14, 'db_e_f_timeTaken', '2020-10-28 15:15:34', 6, 3),
(15, 'db_e_f_timeTaken', '2020-10-28 15:21:42', 6, 3),
(16, 'db_e_f_timeTaken', '2020-10-28 16:52:07', 6, 3),
(17, 'db_e_f_timeTaken', '2020-10-28 16:52:16', 6, 3),
(18, 'db_e_f_timeTaken', '2020-10-28 16:52:24', 6, 3),
(19, 'db_e_f_timeTaken', '2020-10-28 16:59:27', 6, 3),
(20, 'db_e_f_timeTaken', '2020-10-28 16:59:36', 6, 3),
(21, 'db_e_f_timeTaken', '2020-10-28 16:59:43', 6, 3),
(22, 'db_e_f_timeTaken', '2020-10-28 17:19:27', 6, 3),
(23, 'db_e_f_timeTaken', '2020-10-28 17:23:01', 6, 3),
(24, 'db_e_f_timeTaken', '2020-10-28 17:23:08', 6, 3),
(25, 'db_e_f_timeTaken', '2020-10-28 17:27:32', 6, 3),
(26, 'db_e_f_timeTaken', '2020-10-28 17:41:17', 6, 3),
(27, 'br_na_brace', '2020-10-28 21:01:49', 5, NULL),
(28, 'br_na_z', '2020-10-29 01:25:03', 5, 2),
(29, 'br_na_z', '2020-10-29 01:27:06', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `idPersonnel` int(11) NOT NULL,
  `cinPersonnel` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `nomPersonnel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prenomPersonnel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telPersonnel` int(11) NOT NULL,
  `dateNaisPersonnel` date NOT NULL,
  `departementPersonnel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `macBracelet` char(17) COLLATE utf8_unicode_ci NOT NULL,
  `pointsPersonnel` int(11) NOT NULL,
  `onlinePersonnel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`idPersonnel`, `cinPersonnel`, `nomPersonnel`, `prenomPersonnel`, `telPersonnel`, `dateNaisPersonnel`, `departementPersonnel`, `macBracelet`, `pointsPersonnel`, `onlinePersonnel`) VALUES
(1, 'FF953785', 'EL MERNISSI', 'Anouar', 663865410, '1982-02-04', 'dep_1', '66-68-7C-6B-58-8F', 1000, 0),
(2, 'FK7433', 'AATIF', 'Brahim', 664780922, '1976-10-10', 'dep_1', '6E-0E-95-27-13-3E', 1000, 1),
(3, 'H426165', 'MAROUANE', 'Abdelmotalib', 653325549, '1982-11-06', 'dep_1', '17-DE-36-70-58-A9', 1000, 0);

--
-- Triggers `personnel`
--
DROP TRIGGER IF EXISTS `addMessage`;
DELIMITER $$
CREATE TRIGGER `addMessage` AFTER INSERT ON `personnel` FOR EACH ROW BEGIN
  INSERT INTO message (`idMessage`, `contentMessage`, `dateMessage`, `idPersonnel`, `idUtilisateur`) VALUES (null, null, now(), new.`idPersonnel`, null);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `idQueue` int(11) NOT NULL,
  `date_TQueue` datetime NOT NULL,
  `date_DQueue` datetime DEFAULT NULL,
  `date_FQueue` datetime DEFAULT NULL,
  `stateQueue` tinyint(4) NOT NULL,
  `idBroker` int(11) NOT NULL,
  `idPersonnel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`idQueue`, `date_TQueue`, `date_DQueue`, `date_FQueue`, `stateQueue`, `idBroker`, `idPersonnel`) VALUES
(81, '2020-10-30 00:07:59', '2020-10-30 00:07:59', NULL, 0, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `queueroom`
--

DROP TABLE IF EXISTS `queueroom`;
CREATE TABLE `queueroom` (
  `idQueueRoom` int(11) NOT NULL,
  `dateQueueRoom` datetime NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idBroker` int(11) NOT NULL,
  `idQueue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queueroom`
--

INSERT INTO `queueroom` (`idQueueRoom`, `dateQueueRoom`, `idPersonnel`, `idBroker`, `idQueue`) VALUES
(299, '2020-10-30 00:07:59', 3, 8, 81),
(300, '2020-10-30 00:08:01', 3, 8, 81),
(301, '2020-10-30 00:08:02', 3, 8, 81),
(302, '2020-10-30 00:08:03', 3, 7, 81);

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `idRecord` int(11) NOT NULL,
  `battementCoeur` int(11) NOT NULL,
  `temperature` int(11) NOT NULL,
  `oxygene` float NOT NULL,
  `dateRecord` datetime NOT NULL,
  `idBroker` int(11) DEFAULT NULL,
  `idPersonnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`idRecord`, `battementCoeur`, `temperature`, `oxygene`, `dateRecord`, `idBroker`, `idPersonnel`) VALUES
(26, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(27, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(28, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(29, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(30, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(31, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(32, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(33, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(34, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(35, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(36, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(37, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(38, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(39, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(40, 60, 36, 20, '2020-12-12 04:23:00', 1, 2),
(41, 60, 36, 20, '2020-12-12 04:23:00', 1, 2),
(42, 60, 36, 20, '2020-12-12 04:23:00', 1, 2),
(43, 60, 36, 20, '2020-12-12 04:23:00', 1, 2),
(44, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(45, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(46, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(47, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(48, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(49, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(50, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(51, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(52, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(53, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(54, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(55, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(56, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(57, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(58, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(59, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(60, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(61, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(62, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(63, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(64, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(65, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(66, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(67, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(68, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(69, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(70, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(71, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(72, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(73, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(74, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(75, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(76, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(77, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(78, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(79, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(80, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(81, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(82, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(83, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(84, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(85, 10, 10, 10, '2020-12-12 12:12:12', 5, 1),
(86, 10, 10, 10, '2020-10-10 10:10:10', 5, 1),
(87, 10, 10, 10, '2020-12-12 12:12:12', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recordpoints`
--

DROP TABLE IF EXISTS `recordpoints`;
CREATE TABLE `recordpoints` (
  `idRecordPoints` int(11) NOT NULL,
  `raisonRecordPoints` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dateRecordPoints` datetime NOT NULL,
  `nbPoints` int(11) NOT NULL,
  `idBroker` int(11) DEFAULT NULL,
  `idPersonnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recordpoints`
--

INSERT INTO `recordpoints` (`idRecordPoints`, `raisonRecordPoints`, `dateRecordPoints`, `nbPoints`, `idBroker`, `idPersonnel`) VALUES
(251, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:42:59', -5, 8, 3),
(252, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:42:59', -5, 8, 3),
(253, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:42:59', -5, 8, 3),
(254, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:42:59', -5, 8, 3),
(255, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:42:59', -5, 8, 3),
(256, 'File d\'attente non respectée', '2020-10-29 20:44:22', -50, 7, 3),
(257, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:44:00', -5, 7, 3),
(258, 'Le temps de lavage des mains a été dépassé', '2020-10-29 20:44:00', -5, 7, 3),
(259, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:44:44', -8175, 8, 3),
(260, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:45:55', -8180, 8, 3),
(261, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:45:57', -8180, 8, 3),
(262, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:45:58', -8180, 8, 3),
(263, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:50:03', -8200, 7, 3),
(264, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:53:12', -8215, 8, 3),
(265, 'La durée pour aller se laver les mains est très longue', '2020-10-29 20:57:52', -8240, 8, 3),
(266, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:53:16', -5, 8, 3),
(267, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(268, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(269, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(270, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(271, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(272, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(273, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(274, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(275, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(276, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(277, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(278, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(279, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(280, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:54:15', -5, 8, 3),
(281, 'File d\'attente non respectée', '2020-10-29 23:56:03', -50, 8, 3),
(282, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(283, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(284, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(285, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(286, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(287, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(288, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(289, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(290, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(291, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(292, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(293, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(294, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(295, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(296, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(297, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(298, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(299, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(300, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(301, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(302, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(303, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(304, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(305, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(306, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(307, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(308, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(309, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(310, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(311, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(312, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(313, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(314, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(315, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(316, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(317, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(318, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(319, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(320, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(321, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(322, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(323, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(324, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(325, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(326, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(327, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(328, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(329, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(330, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(331, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(332, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(333, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(334, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(335, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(336, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(337, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(338, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(339, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(340, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(341, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(342, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(343, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(344, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(345, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(346, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(347, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(348, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(349, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(350, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(351, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(352, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(353, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(354, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(355, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(356, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(357, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(358, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(359, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(360, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(361, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(362, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(363, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(364, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(365, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(366, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(367, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(368, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(369, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(370, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(371, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(372, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(373, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(374, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(375, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(376, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(377, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(378, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(379, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(380, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(381, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(382, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(383, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(384, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(385, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(386, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(387, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(388, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(389, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(390, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(391, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(392, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(393, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(394, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(395, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(396, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(397, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(398, 'Le temps de lavage des mains a été dépassé', '2020-10-29 23:56:01', -5, 7, 3),
(399, 'File d\'attente non respectée', '2020-10-30 00:08:03', -50, 7, 3),
(400, 'Le temps de lavage des mains a été dépassé', '2020-10-30 00:07:59', -5, 8, 3),
(401, 'Le temps de lavage des mains a été dépassé', '2020-10-30 00:07:59', -5, 8, 3),
(402, 'Le temps de lavage des mains a été dépassé', '2020-10-30 00:07:59', -5, 8, 3),
(403, 'Le temps de lavage des mains a été dépassé', '2020-10-30 00:07:59', -5, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `emailUtilisateur` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `roleUtilisateur` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `passUtilisateur` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `idPersonnel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `emailUtilisateur`, `roleUtilisateur`, `passUtilisateur`, `idPersonnel`) VALUES
(1, 'test@gmail.com', 'admin', 'azerty', 3);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `idZone` int(11) NOT NULL,
  `labelZone` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`idZone`, `labelZone`) VALUES
(1, 'zone_1'),
(2, 'zone_2'),
(3, 'zone_3'),
(4, 'zone_4'),
(12, 'AZ');

-- --------------------------------------------------------

--
-- Table structure for table `zonelog`
--

DROP TABLE IF EXISTS `zonelog`;
CREATE TABLE `zonelog` (
  `idZoneLog` int(11) NOT NULL,
  `dateZoneLog` datetime NOT NULL,
  `compteurZoneLog` int(11) NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idBroker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zonelog`
--

INSERT INTO `zonelog` (`idZoneLog`, `dateZoneLog`, `compteurZoneLog`, `idPersonnel`, `idBroker`) VALUES
(11, '2020-10-29 01:20:02', 580, 2, 5),
(12, '2020-10-29 00:57:37', 0, 2, 1),
(14, '2020-10-29 01:26:36', 24, 2, 5),
(15, '2020-10-29 01:40:26', 0, 2, 1),
(16, '2020-10-29 01:40:31', -1, 2, 5),
(17, '2020-10-29 01:40:34', 0, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acceszone`
--
ALTER TABLE `acceszone`
  ADD KEY `fk_accesZone_zone` (`idZone`),
  ADD KEY `fk_accesZone_personnel` (`idPersonnel`);

--
-- Indexes for table `acceszonetemp`
--
ALTER TABLE `acceszonetemp`
  ADD PRIMARY KEY (`idAccesZT`),
  ADD KEY `fk_accesZoneTemp_personnel` (`idPersonnel`),
  ADD KEY `fk_accesZoneTemp_zone` (`idZone`),
  ADD KEY `fk_accesZoneTemp_utilisateur` (`idUtilisateur`);

--
-- Indexes for table `broker`
--
ALTER TABLE `broker`
  ADD PRIMARY KEY (`idBroker`),
  ADD UNIQUE KEY `macBroker` (`macBroker`),
  ADD KEY `fk_broker_zone` (`idZone`);

--
-- Indexes for table `convergence`
--
ALTER TABLE `convergence`
  ADD PRIMARY KEY (`idConvergence`),
  ADD KEY `fk_convergence_broker` (`idBroker`),
  ADD KEY `fk_convergence_personnel` (`idPersonnel`),
  ADD KEY `fk_convergence_idPersonnel2` (`idPersonnel_2`);

--
-- Indexes for table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`idHistorique`),
  ADD KEY `fk_historique_personnel` (`idPersonnel`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `fk_message_personnel` (`idPersonnel`),
  ADD KEY `fk_message_user` (`idUtilisateur`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`idNotification`),
  ADD KEY `fk_notification_broker` (`idBroker`),
  ADD KEY `fk_notification_personnel` (`idPersonnel`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`idPersonnel`),
  ADD UNIQUE KEY `cinPersonnel` (`cinPersonnel`),
  ADD UNIQUE KEY `macBracelet` (`macBracelet`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`idQueue`),
  ADD KEY `fk_queue_broker` (`idBroker`),
  ADD KEY `fk_queue_personnel` (`idPersonnel`);

--
-- Indexes for table `queueroom`
--
ALTER TABLE `queueroom`
  ADD PRIMARY KEY (`idQueueRoom`),
  ADD KEY `fk_queueRoom_personnel` (`idPersonnel`),
  ADD KEY `fk_queueRoom_broker` (`idBroker`),
  ADD KEY `fk_queueRoom_queue` (`idQueue`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`idRecord`),
  ADD KEY `fk_record_broer` (`idBroker`),
  ADD KEY `fk_record_personnel` (`idPersonnel`);

--
-- Indexes for table `recordpoints`
--
ALTER TABLE `recordpoints`
  ADD PRIMARY KEY (`idRecordPoints`),
  ADD KEY `fk_recordPoints_broker` (`idBroker`),
  ADD KEY `fk_recordPoints_personnel` (`idPersonnel`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `fk_utilisateur_personnel` (`idPersonnel`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`idZone`);

--
-- Indexes for table `zonelog`
--
ALTER TABLE `zonelog`
  ADD PRIMARY KEY (`idZoneLog`),
  ADD KEY `fk_zoneLog_personnel` (`idPersonnel`),
  ADD KEY `fk_zoneLog_broker` (`idBroker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acceszonetemp`
--
ALTER TABLE `acceszonetemp`
  MODIFY `idAccesZT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `broker`
--
ALTER TABLE `broker`
  MODIFY `idBroker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `convergence`
--
ALTER TABLE `convergence`
  MODIFY `idConvergence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `idHistorique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `idPersonnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `idQueue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `queueroom`
--
ALTER TABLE `queueroom`
  MODIFY `idQueueRoom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `idRecord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `recordpoints`
--
ALTER TABLE `recordpoints`
  MODIFY `idRecordPoints` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `idZone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `zonelog`
--
ALTER TABLE `zonelog`
  MODIFY `idZoneLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acceszone`
--
ALTER TABLE `acceszone`
  ADD CONSTRAINT `fk_accesZone_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_accesZone_zone` FOREIGN KEY (`idZone`) REFERENCES `zone` (`idZone`);

--
-- Constraints for table `acceszonetemp`
--
ALTER TABLE `acceszonetemp`
  ADD CONSTRAINT `fk_accesZoneTemp_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_accesZoneTemp_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`),
  ADD CONSTRAINT `fk_accesZoneTemp_zone` FOREIGN KEY (`idZone`) REFERENCES `zone` (`idZone`);

--
-- Constraints for table `broker`
--
ALTER TABLE `broker`
  ADD CONSTRAINT `fk_broker_zone` FOREIGN KEY (`idZone`) REFERENCES `zone` (`idZone`);

--
-- Constraints for table `convergence`
--
ALTER TABLE `convergence`
  ADD CONSTRAINT `fk_convergence_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_convergence_idPersonnel2` FOREIGN KEY (`idPersonnel_2`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_convergence_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `fk_historique_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_message_user` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_notification_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `fk_queue_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_queue_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `queueroom`
--
ALTER TABLE `queueroom`
  ADD CONSTRAINT `fk_queueRoom_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_queueRoom_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_queueRoom_queue` FOREIGN KEY (`idQueue`) REFERENCES `queue` (`idQueue`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `fk_record_broer` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_record_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `recordpoints`
--
ALTER TABLE `recordpoints`
  ADD CONSTRAINT `fk_recordPoints_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_recordPoints_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `zonelog`
--
ALTER TABLE `zonelog`
  ADD CONSTRAINT `fk_zoneLog_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_zoneLog_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
