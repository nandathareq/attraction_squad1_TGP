-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 11:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `core_banking`
--

-- --------------------------------------------------------

--
-- Table structure for table `kredit`
--

CREATE TABLE `kredit` (
  `kredit_id` bigint(20) NOT NULL,
  `kuota` double NOT NULL,
  `nama_kredit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kredit`
--

INSERT INTO `kredit` (`kredit_id`, `kuota`, `nama_kredit`) VALUES
(1, 5000000, 'Visa Platinum Reguler'),
(2, 10000000, 'Mastercard Platinum'),
(3, 20000000, 'JCB platinum');

-- --------------------------------------------------------

--
-- Table structure for table `kredit_nasabah`
--

CREATE TABLE `kredit_nasabah` (
  `credit_account_id` bigint(20) NOT NULL,
  `outstanding` double NOT NULL,
  `kredit_id` bigint(20) NOT NULL,
  `cif` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kredit_nasabah`
--

INSERT INTO `kredit_nasabah` (`credit_account_id`, `outstanding`, `kredit_id`, `cif`) VALUES
(1, 0, 1, 2),
(2, 0, 2, 2),
(3, 0, 3, 2),
(4, 0, 1, 3),
(5, 0, 2, 3),
(6, 0, 3, 3),
(7, 0, 1, 4),
(8, 0, 2, 4),
(9, 0, 3, 4),
(10, 0, 1, 5),
(11, 0, 2, 5),
(12, 0, 3, 5),
(13, 0, 1, 6),
(14, 0, 2, 6),
(15, 0, 3, 6),
(16, 0, 1, 7),
(17, 0, 2, 7),
(18, 0, 3, 7),
(19, 0, 1, 3),
(20, 0, 2, 3),
(21, 0, 3, 3),
(22, 0, 1, 4),
(23, 0, 2, 4),
(24, 0, 3, 4),
(25, 0, 1, 5),
(26, 0, 2, 5),
(27, 0, 3, 5),
(28, 0, 1, 6),
(29, 0, 2, 6),
(30, 0, 3, 6),
(31, 0, 1, 8),
(32, 0, 2, 8),
(33, 0, 3, 8),
(34, 0, 1, 3),
(35, 0, 2, 3),
(36, 0, 3, 3),
(37, 0, 1, 4),
(38, 0, 2, 4),
(39, 0, 3, 4),
(40, 0, 1, 5),
(41, 0, 2, 5),
(42, 0, 3, 5),
(43, 0, 1, 6),
(44, 0, 2, 6),
(45, 0, 3, 6),
(46, 0, 1, 9),
(47, 0, 2, 9),
(48, 0, 3, 9),
(49, 0, 1, 3),
(50, 0, 2, 3),
(51, 0, 3, 3),
(52, 0, 1, 4),
(53, 0, 2, 4),
(54, 0, 3, 4),
(55, 0, 1, 5),
(56, 0, 2, 5),
(57, 0, 3, 5),
(58, 0, 1, 6),
(59, 0, 2, 6),
(60, 0, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `nasabah_id` bigint(20) NOT NULL,
  `nama_nasabah` varchar(255) DEFAULT NULL,
  `no_telpon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`nasabah_id`, `nama_nasabah`, `no_telpon`) VALUES
(1, 'CIMB NIAGA', '081533465435'),
(2, 'Faishal Fachtur', '0856454327854'),
(3, 'Fachry Firdaus', '0811176546787'),
(4, 'Sonya Barista', '0878263746534'),
(5, 'Dhimas Putranto', '085676545879'),
(6, 'Nanda Thareq', '085837575964'),
(7, 'Faishal Fachtur', '0856454327854'),
(8, 'Faishal Fachtur', '0856454327854'),
(9, 'Faishal Fachtur', '0856454327854');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `rekening_id` bigint(20) NOT NULL,
  `nama_rekening` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`rekening_id`, `nama_rekening`) VALUES
(1, 'Giro Escrow'),
(2, 'Xtra Savers'),
(3, 'Payroll'),
(4, 'Giro Perusahaan'),
(5, 'Rekening Ponsel');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_nasabah`
--

CREATE TABLE `rekening_nasabah` (
  `account_id` bigint(20) NOT NULL,
  `balance` double NOT NULL,
  `nomor_rekening` varchar(255) DEFAULT NULL,
  `nasabah` bigint(20) NOT NULL,
  `rekening` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening_nasabah`
--

INSERT INTO `rekening_nasabah` (`account_id`, `balance`, `nomor_rekening`, `nasabah`, `rekening`) VALUES
(1, 0, NULL, 1, 1),
(2, 10000000, '961505927902', 2, 2),
(3, 10000000, '290238491992', 2, 3),
(4, 10000000, '155130038166', 2, 4),
(5, 10000000, '629636584636', 2, 5),
(6, 10000000, '757325814620', 3, 2),
(7, 10000000, '920347646927', 3, 3),
(8, 10000000, '489261745762', 3, 4),
(9, 10000000, '016411693544', 3, 5),
(10, 10000000, '634213827993', 4, 2),
(11, 10000000, '788923124836', 4, 3),
(12, 10000000, '523524481392', 4, 4),
(13, 10000000, '644161836402', 4, 5),
(14, 10000000, '748337914504', 5, 2),
(15, 10000000, '447955480740', 5, 3),
(16, 10000000, '798705676129', 5, 4),
(17, 10000000, '323106405385', 5, 5),
(18, 10000000, '270646913519', 6, 2),
(19, 10000000, '037500883085', 6, 3),
(20, 10000000, '951740817608', 6, 4),
(21, 10000000, '537645587764', 6, 5),
(23, 10000000, '674285881873', 7, 2),
(24, 10000000, '146988979608', 7, 3),
(25, 10000000, '147420108730', 7, 4),
(26, 10000000, '421819461353', 7, 5),
(27, 10000000, '582933279869', 3, 2),
(28, 10000000, '325469984959', 3, 3),
(29, 10000000, '707323843189', 3, 4),
(30, 10000000, '726544581982', 3, 5),
(31, 10000000, '899602800651', 4, 2),
(32, 10000000, '302475588780', 4, 3),
(33, 10000000, '582093787828', 4, 4),
(34, 10000000, '188710120169', 4, 5),
(35, 10000000, '681168622183', 5, 2),
(36, 10000000, '731771516026', 5, 3),
(37, 10000000, '637918033393', 5, 4),
(38, 10000000, '387658255863', 5, 5),
(39, 10000000, '228792814345', 6, 2),
(40, 10000000, '048859288179', 6, 3),
(41, 10000000, '812710406343', 6, 4),
(42, 10000000, '800022024227', 6, 5),
(43, 0, NULL, 1, 1),
(44, 10000000, '382871948897', 8, 2),
(45, 10000000, '236280349447', 8, 3),
(46, 10000000, '890010618147', 8, 4),
(47, 10000000, '180534012627', 8, 5),
(48, 10000000, '730900464158', 3, 2),
(49, 10000000, '363114479028', 3, 3),
(50, 10000000, '857440498580', 3, 4),
(51, 10000000, '895614772147', 3, 5),
(52, 10000000, '771453489991', 4, 2),
(53, 10000000, '207207416533', 4, 3),
(54, 10000000, '868054713017', 4, 4),
(55, 10000000, '321403053854', 4, 5),
(56, 10000000, '501320355343', 5, 2),
(57, 10000000, '458810577366', 5, 3),
(58, 10000000, '476795730849', 5, 4),
(59, 10000000, '803209090111', 5, 5),
(60, 10000000, '071989090992', 6, 2),
(61, 10000000, '246544236299', 6, 3),
(62, 10000000, '365614977153', 6, 4),
(63, 10000000, '586093781347', 6, 5),
(64, 0, NULL, 1, 1),
(65, 10000000, '319810059231', 9, 2),
(66, 10000000, '029455692907', 9, 3),
(67, 10000000, '093950203720', 9, 4),
(68, 10000000, '559316558887', 9, 5),
(69, 10000000, '358823976779', 3, 2),
(70, 10000000, '588770339981', 3, 3),
(71, 10000000, '570775033573', 3, 4),
(72, 10000000, '861756260533', 3, 5),
(73, 10000000, '395730061047', 4, 2),
(74, 10000000, '012975564244', 4, 3),
(75, 10000000, '766059210788', 4, 4),
(76, 10000000, '836523776716', 4, 5),
(77, 10000000, '943477190145', 5, 2),
(78, 10000000, '620315868256', 5, 3),
(79, 10000000, '507753458244', 5, 4),
(80, 10000000, '184218449241', 5, 5),
(81, 10000000, '485103291552', 6, 2),
(82, 10000000, '790104868566', 6, 3),
(83, 10000000, '203997557945', 6, 4),
(84, 10000000, '256754261251', 6, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kredit`
--
ALTER TABLE `kredit`
  ADD PRIMARY KEY (`kredit_id`);

--
-- Indexes for table `kredit_nasabah`
--
ALTER TABLE `kredit_nasabah`
  ADD PRIMARY KEY (`credit_account_id`),
  ADD KEY `FKgj9lusubcfl6q42psl2nycq1s` (`kredit_id`),
  ADD KEY `FKndakh4ycka5qm40l1fhkf9pw0` (`cif`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`nasabah_id`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`rekening_id`);

--
-- Indexes for table `rekening_nasabah`
--
ALTER TABLE `rekening_nasabah`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `FKjpusuu910lveyc98xumnog2tf` (`nasabah`),
  ADD KEY `FK987jdv8u2frfjs773en9il38o` (`rekening`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kredit`
--
ALTER TABLE `kredit`
  MODIFY `kredit_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kredit_nasabah`
--
ALTER TABLE `kredit_nasabah`
  MODIFY `credit_account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `nasabah_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `rekening_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rekening_nasabah`
--
ALTER TABLE `rekening_nasabah`
  MODIFY `account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kredit_nasabah`
--
ALTER TABLE `kredit_nasabah`
  ADD CONSTRAINT `FKgj9lusubcfl6q42psl2nycq1s` FOREIGN KEY (`kredit_id`) REFERENCES `kredit` (`kredit_id`),
  ADD CONSTRAINT `FKndakh4ycka5qm40l1fhkf9pw0` FOREIGN KEY (`cif`) REFERENCES `nasabah` (`nasabah_id`);

--
-- Constraints for table `rekening_nasabah`
--
ALTER TABLE `rekening_nasabah`
  ADD CONSTRAINT `FK987jdv8u2frfjs773en9il38o` FOREIGN KEY (`rekening`) REFERENCES `rekening` (`rekening_id`),
  ADD CONSTRAINT `FKjpusuu910lveyc98xumnog2tf` FOREIGN KEY (`nasabah`) REFERENCES `nasabah` (`nasabah_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
