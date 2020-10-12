-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2020 at 12:33 AM
-- Server version: 5.7.31-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.15

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

INSERT INTO `accesZone` VALUES(1, 1);
INSERT INTO `accesZone` VALUES(1, 2);
INSERT INTO `accesZone` VALUES(1, 3);
INSERT INTO `accesZone` VALUES(2, 1);
INSERT INTO `accesZone` VALUES(3, 1);
INSERT INTO `accesZone` VALUES(3, 4);

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

INSERT INTO `broker` VALUES(1, '95-43-C8-3B-C0-0A', 'pointage', 1);
INSERT INTO `broker` VALUES(2, '8C-5D-24-D4-A8-BF', 'pointage', 1);

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
  `idPersonnel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Triggers `historique`
--
DROP TRIGGER IF EXISTS `historique_defaultDateTime`;
DELIMITER $$
CREATE TRIGGER `historique_defaultDateTime` BEFORE INSERT ON `historique` FOR EACH ROW SET NEW.dateHistorique = now()
$$
DELIMITER ;

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

INSERT INTO `personnel` VALUES(1, 'FF953785', 'EL MERNISSI', 'Anouar', 663865410, '1982-02-04', 'dep_1', '66-68-7C-6B-58-8F', 1000, 0);
INSERT INTO `personnel` VALUES(2, 'FK7433', 'AATIF', 'Brahim', 664780922, '1976-10-10', 'dep_1', '6E-0E-95-27-13-3E', 1000, 0);
INSERT INTO `personnel` VALUES(3, 'H426165', 'MAROUANE', 'Abdelmotalib', 653325549, '1982-11-06', 'dep_1', '17-DE-36-70-58-A9', 1000, 0);

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

INSERT INTO `zone` VALUES(1, 'zone_1');
INSERT INTO `zone` VALUES(2, 'zone_2');
INSERT INTO `zone` VALUES(3, 'zone_3');
INSERT INTO `zone` VALUES(4, 'zone_4');

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
  ADD KEY `fk_convergence_personnel` (`idPersonnel`);

--
-- Indexes for table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`idHistorique`),
  ADD KEY `fk_historique_personnel` (`idPersonnel`);

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
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`idZone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broker`
--
ALTER TABLE `broker`
  MODIFY `idBroker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `convergence`
--
ALTER TABLE `convergence`
  MODIFY `idConvergence` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `idHistorique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `idNotification` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `idPersonnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `idRecord` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recordPoints`
--
ALTER TABLE `recordPoints`
  MODIFY `idRecordPoints` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `idZone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
-- Constraints for table `broker`
--
ALTER TABLE `broker`
  ADD CONSTRAINT `fk_broker_zone` FOREIGN KEY (`idZone`) REFERENCES `zone` (`idZone`);

--
-- Constraints for table `convergence`
--
ALTER TABLE `convergence`
  ADD CONSTRAINT `fk_convergence_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_convergence_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `fk_historique_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_broker` FOREIGN KEY (`idBroker`) REFERENCES `broker` (`idBroker`),
  ADD CONSTRAINT `fk_notification_personnel` FOREIGN KEY (`idPersonnel`) REFERENCES `personnel` (`idPersonnel`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
