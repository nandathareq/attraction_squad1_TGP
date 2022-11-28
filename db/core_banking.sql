-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 03:19 PM
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
(1, 0, 1, 1),
(2, 0, 2, 1),
(3, 0, 3, 1),
(4, 0, 1, 2),
(5, 0, 2, 2),
(6, 0, 3, 2),
(7, 0, 1, 3),
(8, 0, 2, 3),
(9, 0, 3, 3),
(10, 0, 1, 4),
(11, 0, 2, 4),
(12, 0, 3, 4),
(13, 0, 1, 5),
(14, 0, 2, 5),
(15, 0, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `cif` bigint(20) NOT NULL,
  `nama_nasabah` varchar(255) DEFAULT NULL,
  `no_telpon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`cif`, `nama_nasabah`, `no_telpon`) VALUES
(1, 'Nanda Thareq', '081533465435'),
(2, 'Faishal Fachtur', '0856454327854'),
(3, 'Fachry Firdaus', '0811176546787'),
(4, 'Sonya Barista', '0878263746534'),
(5, 'Dhimas Putranto', '085676545879');

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
(1, 'Giro Perusahaan'),
(2, 'Xtra Savers'),
(3, 'Payroll'),
(4, 'Rekening Ponsel');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_nasabah`
--

CREATE TABLE `rekening_nasabah` (
  `account_id` bigint(20) NOT NULL,
  `balance` double NOT NULL,
  `cif` bigint(20) NOT NULL,
  `rekening_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening_nasabah`
--

INSERT INTO `rekening_nasabah` (`account_id`, `balance`, `cif`, `rekening_id`) VALUES
(1, 10000000, 1, 1),
(2, 10000000, 1, 2),
(3, 10000000, 1, 3),
(4, 10000000, 1, 4),
(5, 10000000, 2, 1),
(6, 10000000, 2, 2),
(7, 10000000, 2, 3),
(8, 10000000, 2, 4),
(9, 10000000, 3, 1),
(10, 10000000, 3, 2),
(11, 10000000, 3, 3),
(12, 10000000, 3, 4),
(13, 10000000, 4, 1),
(14, 10000000, 4, 2),
(15, 10000000, 4, 3),
(16, 10000000, 4, 4),
(17, 10000000, 5, 1),
(18, 10000000, 5, 2),
(19, 10000000, 5, 3),
(20, 10000000, 5, 4);

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
  ADD PRIMARY KEY (`cif`);

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
  ADD KEY `FK8qtk7v349f2uh2k8us3uo7vdk` (`cif`),
  ADD KEY `FK7r0p7cnykgtp0rw8qjpwv24px` (`rekening_id`);

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
  MODIFY `credit_account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `cif` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `rekening_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rekening_nasabah`
--
ALTER TABLE `rekening_nasabah`
  MODIFY `account_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kredit_nasabah`
--
ALTER TABLE `kredit_nasabah`
  ADD CONSTRAINT `FKgj9lusubcfl6q42psl2nycq1s` FOREIGN KEY (`kredit_id`) REFERENCES `kredit` (`kredit_id`),
  ADD CONSTRAINT `FKndakh4ycka5qm40l1fhkf9pw0` FOREIGN KEY (`cif`) REFERENCES `nasabah` (`cif`);

--
-- Constraints for table `rekening_nasabah`
--
ALTER TABLE `rekening_nasabah`
  ADD CONSTRAINT `FK7r0p7cnykgtp0rw8qjpwv24px` FOREIGN KEY (`rekening_id`) REFERENCES `rekening` (`rekening_id`),
  ADD CONSTRAINT `FK8qtk7v349f2uh2k8us3uo7vdk` FOREIGN KEY (`cif`) REFERENCES `nasabah` (`cif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
