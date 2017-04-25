-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 25, 2017 at 07:51 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lll`
--

-- --------------------------------------------------------

--
-- Table structure for table `article_details`
--

CREATE TABLE `article_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `sub-category` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `dimensions` varchar(80) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `pattern` varchar(30) DEFAULT NULL,
  `discount` varchar(15) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `uploaded_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `otp_no` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `is_otp_verified` varchar(5) DEFAULT NULL,
  `other_details` varchar(50) DEFAULT NULL,
  `vendor_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_details`
--

CREATE TABLE `vendor_details` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `other_details` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_details`
--

INSERT INTO `vendor_details` (`id`, `name`, `type`, `location`, `logo`, `other_details`) VALUES
(100000, 'SHOPPER STOP', 'E-COMMERSE', NULL, '/vendorLogos/1492744427993.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_request`
--

CREATE TABLE `vendor_request` (
  `id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `contact_person_name` varchar(30) DEFAULT NULL,
  `tot_models` int(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `is_Ack_sent` int(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_details`
--
ALTER TABLE `article_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`),
  ADD KEY `vendorId` (`vendor_id`);

--
-- Indexes for table `vendor_details`
--
ALTER TABLE `vendor_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_request`
--
ALTER TABLE `vendor_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_details`
--
ALTER TABLE `article_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `vendor_request`
--
ALTER TABLE `vendor_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
