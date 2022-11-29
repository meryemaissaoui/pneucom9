-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 09:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pneuscom9`
--

-- --------------------------------------------------------

--
-- Table structure for table `carrosserie`
--

CREATE TABLE `carrosserie` (
  `idcarrosserie` int(11) NOT NULL,
  `typecarrosserie` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `idmarque` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marque_carosserie`
--

CREATE TABLE `marque_carosserie` (
  `id_marque` int(11) NOT NULL,
  `id_carosserie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marque_motorisation`
--

CREATE TABLE `marque_motorisation` (
  `id_marque` int(11) NOT NULL,
  `id_motorisation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marque_pneu`
--

CREATE TABLE `marque_pneu` (
  `id_marquepneu` int(11) NOT NULL,
  `nom_marque_pneu` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `motorisation`
--

CREATE TABLE `motorisation` (
  `idmotorisation` int(11) NOT NULL,
  `nom_motorisation` varchar(60) NOT NULL,
  `annee` date NOT NULL,
  `cv` varchar(60) NOT NULL,
  `cylindre` int(11) NOT NULL,
  `carburant` varchar(100) NOT NULL,
  `roues_motrices` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `motorisation_pneu`
--

CREATE TABLE `motorisation_pneu` (
  `id_motorisation` int(11) NOT NULL,
  `id_pneu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pneu`
--

CREATE TABLE `pneu` (
  `idpneu` int(11) NOT NULL,
  `prix` float NOT NULL,
  `charge` varchar(60) NOT NULL,
  `vitesse` int(11) NOT NULL,
  `saison` varchar(60) NOT NULL,
  `largeur` int(11) NOT NULL,
  `hateur` int(11) NOT NULL,
  `diametre` int(11) NOT NULL,
  `imagepneu` varchar(250) NOT NULL,
  `etat` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pneu_marquepneu`
--

CREATE TABLE `pneu_marquepneu` (
  `id_pneu` int(11) NOT NULL,
  `id_marquepneu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `idtype` int(11) NOT NULL,
  `nom_type` varchar(60) NOT NULL,
  `puissence` varchar(100) NOT NULL,
  `date_d` date NOT NULL,
  `date_f` date NOT NULL,
  `id_carosserie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `datecreation` date NOT NULL,
  `password` text NOT NULL,
  `email` varchar(60) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrosserie`
--
ALTER TABLE `carrosserie`
  ADD PRIMARY KEY (`idcarrosserie`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`idmarque`);

--
-- Indexes for table `marque_carosserie`
--
ALTER TABLE `marque_carosserie`
  ADD KEY `FK_cm` (`id_marque`),
  ADD KEY `FK_car` (`id_carosserie`);

--
-- Indexes for table `marque_motorisation`
--
ALTER TABLE `marque_motorisation`
  ADD KEY `Fk_mm` (`id_marque`),
  ADD KEY `FK_m` (`id_motorisation`);

--
-- Indexes for table `marque_pneu`
--
ALTER TABLE `marque_pneu`
  ADD PRIMARY KEY (`id_marquepneu`);

--
-- Indexes for table `motorisation`
--
ALTER TABLE `motorisation`
  ADD PRIMARY KEY (`idmotorisation`);

--
-- Indexes for table `motorisation_pneu`
--
ALTER TABLE `motorisation_pneu`
  ADD KEY `id_motorisation` (`id_motorisation`),
  ADD KEY `id_pneu` (`id_pneu`);

--
-- Indexes for table `pneu`
--
ALTER TABLE `pneu`
  ADD PRIMARY KEY (`idpneu`);

--
-- Indexes for table `pneu_marquepneu`
--
ALTER TABLE `pneu_marquepneu`
  ADD KEY `id_pneu` (`id_pneu`),
  ADD KEY `id_marquepneu` (`id_marquepneu`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idtype`),
  ADD KEY `FK_type` (`id_carosserie`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrosserie`
--
ALTER TABLE `carrosserie`
  MODIFY `idcarrosserie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `idmarque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marque_pneu`
--
ALTER TABLE `marque_pneu`
  MODIFY `id_marquepneu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motorisation`
--
ALTER TABLE `motorisation`
  MODIFY `idmotorisation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pneu`
--
ALTER TABLE `pneu`
  MODIFY `idpneu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `idtype` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marque_carosserie`
--
ALTER TABLE `marque_carosserie`
  ADD CONSTRAINT `FK_car` FOREIGN KEY (`id_carosserie`) REFERENCES `carrosserie` (`idcarrosserie`),
  ADD CONSTRAINT `FK_cm` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`idmarque`);

--
-- Constraints for table `marque_motorisation`
--
ALTER TABLE `marque_motorisation`
  ADD CONSTRAINT `FK_m` FOREIGN KEY (`id_motorisation`) REFERENCES `motorisation` (`idmotorisation`),
  ADD CONSTRAINT `Fk_mm` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`idmarque`);

--
-- Constraints for table `motorisation_pneu`
--
ALTER TABLE `motorisation_pneu`
  ADD CONSTRAINT `motorisation_pneu_ibfk_1` FOREIGN KEY (`id_motorisation`) REFERENCES `motorisation` (`idmotorisation`),
  ADD CONSTRAINT `motorisation_pneu_ibfk_2` FOREIGN KEY (`id_pneu`) REFERENCES `pneu` (`idpneu`);

--
-- Constraints for table `pneu_marquepneu`
--
ALTER TABLE `pneu_marquepneu`
  ADD CONSTRAINT `pneu_marquepneu_ibfk_1` FOREIGN KEY (`id_pneu`) REFERENCES `pneu` (`idpneu`),
  ADD CONSTRAINT `pneu_marquepneu_ibfk_2` FOREIGN KEY (`id_marquepneu`) REFERENCES `marque_pneu` (`id_marquepneu`);

--
-- Constraints for table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `FK_type` FOREIGN KEY (`id_carosserie`) REFERENCES `carrosserie` (`idcarrosserie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
