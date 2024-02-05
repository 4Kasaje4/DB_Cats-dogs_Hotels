-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 02:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c&d_hotels`
--
CREATE DATABASE IF NOT EXISTS `c&d_hotels` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `c&d_hotels`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL,
  `activity_name` varchar(100) DEFAULT NULL,
  `activity_description` varchar(800) DEFAULT NULL,
  `activity_price` int(11) DEFAULT NULL,
  `other` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `admin_pic` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_text` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `foodallergies` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `checkin` varchar(500) DEFAULT NULL,
  `time_in` varchar(10) DEFAULT NULL,
  `pickup` varchar(50) DEFAULT NULL,	
  `checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_activity`
--

CREATE TABLE `pet_activity` (
  `pet_activity_id` int(11) NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_sitter`
--

CREATE TABLE `pet_sitter` (
  `ps_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `pet_sitter_pic` varchar(500) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `user_pic` varchar(500) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `pet_activity`
--
ALTER TABLE `pet_activity`
  ADD PRIMARY KEY (`pet_activity_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `pet_sitter`
--
ALTER TABLE `pet_sitter`
  ADD PRIMARY KEY (`ps_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_activity`
--
ALTER TABLE `pet_activity`
  MODIFY `pet_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_sitter`
--
ALTER TABLE `pet_sitter`
  MODIFY `ps_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `pet_sitter` (`ps_id`),
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `pet_sitter` (`ps_id`);

--
-- Constraints for table `pet_activity`
--
ALTER TABLE `pet_activity`
  ADD CONSTRAINT `pet_activity_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  ADD CONSTRAINT `pet_activity_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `pet_sitter` (`ps_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
