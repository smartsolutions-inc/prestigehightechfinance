-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 10, 2018 at 10:44 p.m.
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prestigedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication_account`
--

CREATE TABLE `authentication_account` (
  `private_key` int(21) NOT NULL,
  `id_photo1` varchar(256) NOT NULL,
  `id_photo2` varchar(256) NOT NULL,
  `passport_photo` varchar(256) DEFAULT NULL,
  `auth_key` int(21) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_track`
--

CREATE TABLE `log_track` (
  `log_in` int(21) UNSIGNED ZEROFILL NOT NULL,
  `ip_address` varchar(256) NOT NULL,
  `user_name` varchar(48) NOT NULL,
  `public_key` varchar(256) NOT NULL,
  `log_date` date DEFAULT NULL,
  `browser` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_data`
--

CREATE TABLE `personal_data` (
  `personal_id` int(21) UNSIGNED ZEROFILL NOT NULL,
  `fnames` varchar(48) NOT NULL,
  `lnames` varchar(48) NOT NULL,
  `phone_num` varchar(12) NOT NULL,
  `tel_num` varchar(12) NOT NULL,
  `address` varchar(48) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `zip` int(7) DEFAULT NULL,
  `signup_id` int(21) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `signup_id` int(21) UNSIGNED ZEROFILL NOT NULL,
  `country` varchar(48) NOT NULL,
  `email` varchar(48) NOT NULL,
  `user_name` varchar(36) NOT NULL,
  `password` varchar(256) NOT NULL,
  `signup_date` date NOT NULL,
  `public_key` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication_account`
--
ALTER TABLE `authentication_account`
  ADD PRIMARY KEY (`auth_key`);

--
-- Indexes for table `log_track`
--
ALTER TABLE `log_track`
  ADD PRIMARY KEY (`log_in`);

--
-- Indexes for table `personal_data`
--
ALTER TABLE `personal_data`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `signup_id` (`signup_id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`signup_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authentication_account`
--
ALTER TABLE `authentication_account`
  MODIFY `auth_key` int(21) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_track`
--
ALTER TABLE `log_track`
  MODIFY `log_in` int(21) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personal_data`
--
ALTER TABLE `personal_data`
  MODIFY `personal_id` int(21) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `signup_id` int(21) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `personal_data`
--
ALTER TABLE `personal_data`
  ADD CONSTRAINT `personal_data_ibfk_1` FOREIGN KEY (`signup_id`) REFERENCES `signup` (`signup_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
