-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 26, 2020 at 12:06 PM
-- Server version: 5.7.31-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `accesZone`
--

DROP TABLE IF EXISTS `accesZone`;
CREATE TABLE `accesZone` (
  `idPersonnel` int(11) NOT NULL,
  `idZone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accesZone`
--

INSERT INTO `accesZone` (`idPersonnel`, `idZone`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `accesZoneTemp`
--

DROP TABLE IF EXISTS `accesZoneTemp`;
CREATE TABLE `accesZoneTemp` (
  `idAccesZT` int(11) NOT NULL,
  `raisonAccesZT` text COLLATE utf8_unicode_ci NOT NULL,
  `dateD_AccesZT` datetime NOT NULL,
  `dateF_AccesZT` datetime NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idZone` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accesZoneTemp`
--

INSERT INTO `accesZoneTemp` (`idAccesZT`, `raisonAccesZT`, `dateD_AccesZT`, `dateF_AccesZT`, `idPersonnel`, `idZone`, `idUtilisateur`) VALUES
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
(44, '2020-12-12 07:07:07', 0.5, 5, 1, 3),
(45, '2020-12-12 07:07:07', 1, 5, 1, 2);

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
(12, 'déconnecté', '2020-10-23 18:42:03', 1),
(13, 'déconnecté', '2020-10-23 22:39:01', 1),
(14, 'déconnecté', '2020-10-23 22:42:34', 1),
(15, 'déconnecté', '2020-10-23 22:44:33', 1),
(16, 'déconnecté', '2020-10-23 22:46:41', 1),
(17, 'déconnecté', '2020-10-23 22:50:35', 1),
(18, 'déconnecté', '2020-10-23 22:52:03', 1),
(19, 'déconnecté', '2020-10-23 22:55:05', 1),
(20, 'déconnecté', '2020-10-23 22:55:38', 1);

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
  `contentMessage` text COLLATE utf8_unicode_ci,
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
(3, NULL, '2020-10-22 15:53:26', 3, NULL);

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
(12, 'db_e_f_rank', '2020-10-23 22:50:35', 1, 1);

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
(2, '2020-10-18 19:21:00', NULL, NULL, -1, 5, 2),
(5, '2020-10-25 22:01:19', NULL, NULL, 1, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `queueRoom`
--

DROP TABLE IF EXISTS `queueRoom`;
CREATE TABLE `queueRoom` (
  `idQueueRoom` int(11) NOT NULL,
  `dateQueueRoom` datetime NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idBroker` int(11) NOT NULL,
  `idQueue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queueRoom`
--

INSERT INTO `queueRoom` (`idQueueRoom`, `dateQueueRoom`, `idPersonnel`, `idBroker`, `idQueue`) VALUES
(1, '2020-10-25 00:00:00', 1, 7, NULL),
(2, '2020-10-25 00:00:02', 1, 7, NULL),
(3, '2020-10-25 00:00:03', 1, 8, NULL),
(4, '2020-10-25 00:00:05', 1, 7, NULL),
(5, '2020-10-25 00:00:00', 2, 7, NULL),
(6, '2020-10-25 00:00:01', 2, 8, NULL),
(9, '2020-10-25 22:01:24', 3, 7, 5);

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
(43, 60, 36, 20, '2020-12-12 04:23:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `recordPoints`
--

DROP TABLE IF EXISTS `recordPoints`;
CREATE TABLE `recordPoints` (
  `idRecordPoints` int(11) NOT NULL,
  `raisonRecordPoints` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dateRecordPoints` datetime NOT NULL,
  `nbPoints` int(11) NOT NULL,
  `idBroker` int(11) DEFAULT NULL,
  `idPersonnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recordPoints`
--

INSERT INTO `recordPoints` (`idRecordPoints`, `raisonRecordPoints`, `dateRecordPoints`, `nbPoints`, `idBroker`, `idPersonnel`) VALUES
(97, 'Ne pas maintenir la distance sociale', '2020-10-23 22:55:38', -15, 5, 1),
(98, 'Ne pas maintenir la distance sociale', '2020-10-23 22:55:38', -15, 5, 3),
(100, 'Ne pas maintenir la distance sociale', '2020-10-23 22:55:38', -5, 5, 1),
(101, 'Ne pas maintenir la distance sociale', '2020-10-23 22:55:38', -5, 5, 2);

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
-- Table structure for table `zoneLog`
--

DROP TABLE IF EXISTS `zoneLog`;
CREATE TABLE `zoneLog` (
  `idZoneLog` int(11) NOT NULL,
  `dateZoneLog` datetime NOT NULL,
  `compteurZoneLog` int(11) NOT NULL,
  `idPersonnel` int(11) NOT NULL,
  `idBroker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesZone`
--
ALTER TABLE `accesZone`
  ADD KEY `fk_accesZone_zone` (`idZone`),
  ADD KEY `fk_accesZone_personnel` (`idPersonnel`);

--
-- Indexes for table `accesZoneTemp`
--
ALTER TABLE `accesZoneTemp`
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
-- Indexes for table `queueRoom`
--
ALTER TABLE `queueRoom`
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
-- Indexes for table `recordPoints`
--
ALTER TABLE `recordPoints`
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
-- Indexes for table `zoneLog`
--
ALTER TABLE `zoneLog`
  ADD PRIMARY KEY (`idZoneLog`),
  ADD KEY `fk_zoneLog_personnel` (`idPersonnel`),
  ADD KEY `fk_zoneLog_broker` (`idBroker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesZoneTemp`
--
ALTER TABLE `accesZoneTemp`
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
  MODIFY `idConvergence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `idHistorique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `idPersonnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `idQueue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `queueRoom`
--
ALTER TABLE `queueRoom`
  MODIFY `idQueueRoom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `idRecord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `recordPoints`
--
ALTER TABLE `recordPoints`
  MODIFY `idRecordPoints` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
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
-- AUTO_INCREMENT for table `zoneLog`
--
ALTER TABLE `zoneLog`
  MODIFY `idZoneLog` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesZone`
--
ALTER TABLE `accesZone`
  ADD CONSTRAINT `fk_accesZone_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`),
  ADD CONSTRAINT `fk_accesZone_zone` FOREIGN KEY (`idZone`) REFERENCES `zone` (`idZone`);

--
-- Constraints for table `accesZoneTemp`
--
ALTER TABLE `accesZoneTemp`
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
-- Constraints for table `queueRoom`
--
ALTER TABLE `queueRoom`
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
-- Constraints for table `recordPoints`
--
ALTER TABLE `recordPoints`
  ADD CONSTRAINT `fk_recordPoints_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_recordPoints_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `zoneLog`
--
ALTER TABLE `zoneLog`
  ADD CONSTRAINT `fk_zoneLog_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_zoneLog_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
