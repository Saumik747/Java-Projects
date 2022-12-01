-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 02:41 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `cust`
--

CREATE TABLE `cust` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `uname` varchar(255) NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `balance` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cust`
--

INSERT INTO `cust` (`id`, `pin`, `account_no`, `uname`, `account_type`, `balance`) VALUES
(1, 8804, '5040935981828327', 'salman', 'savings', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `custacc`
--

CREATE TABLE `custacc` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `uname` varchar(255) NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `balance` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custacc`
--

INSERT INTO `custacc` (`id`, `pin`, `account_no`, `uname`, `account_type`, `balance`) VALUES
(0, 9833, NULL, '', NULL, NULL),
(1, 4872, '5040935965596875', '', 'Saving', 110713),
(2, 9833, '5040935978134246', 'samay', 'savings', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `account_no` varchar(500) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobno` int(20) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `pin`, `account_no`, `uname`, `name`, `fname`, `address`, `zip`, `email`, `password`, `mobno`, `gender`, `dob`, `religion`, `category`, `qualification`) VALUES
(1, 8804, '5040935981828327', 'salman', 'Samlan chaudhary', 'sagar', 'palm beach residency', '400705', 'sanjay@gmail.com', 'salman', 987432228, 'male', '2022-01-05', 'hindu', 'general', 'Graduate');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `account_no` mediumtext NOT NULL,
  `operation` varchar(45) NOT NULL,
  `amt` bigint(20) NOT NULL,
  `final_bal` bigint(20) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `pin`, `account_no`, `operation`, `amt`, `final_bal`, `date`) VALUES
(1, 4872, '5040935965596875', 'Deposit', 1500, 112000, 'Thu Jan 13 13:10:04 IST 2022'),
(2, 4872, '5040935965596875', 'Deposit', 1, 112001, 'Thu Jan 13 13:17:04 IST 2022'),
(3, 4872, '5040935965596875', 'Withdraw', 1200, 110801, 'Thu Jan 13 13:42:12 IST 2022'),
(4, 4872, '5040935965596875', 'Deposit', 12, 110813, 'Thu Jan 13 13:43:04 IST 2022'),
(5, 4872, '5040935965596875', 'Deposit', 100, 110913, 'Thu Jan 13 13:43:18 IST 2022'),
(6, 4872, '5040935965596875', 'Withdraw', 1200, 109713, 'Thu Jan 13 13:45:22 IST 2022'),
(7, 4872, '5040935965596875', 'Deposit', 1000, 110713, 'Thu Jan 13 15:09:10 IST 2022'),
(8, 8804, '5040935981828327', 'deposit', 1000, 7000, 'Sun Jan 16 19:45:39 IST 2022'),
(9, 8804, '5040935981828327', 'deposit', 1000, 8000, 'Sun Jan 16 19:45:39 IST 2022'),
(10, 8804, '5040935981828327', 'withdraw', 500, 7500, 'Sun Jan 16 20:00:01 IST 2022'),
(11, 8804, '5040935981828327', 'withdraw', 500, 7000, 'Sun Jan 16 20:00:01 IST 2022'),
(12, 8804, '5040935981828327', 'fund transfer', 1000, 6000, 'Sun Jan 16 20:50:48 IST 2022'),
(13, 8804, '5040935981828327', 'fund transfer', 1000, 5000, 'Sun Jan 16 20:50:48 IST 2022'),
(14, 8804, '5040935981828327', 'fund transfer', 1000, 4000, 'Sun Jan 16 20:50:48 IST 2022'),
(15, 8804, '5040935981828327', 'fund transfer', 1000, 3000, 'Sun Jan 16 20:50:48 IST 2022'),
(16, 8804, '5040935981828327', 'fund transfer', 1000, 2000, 'Sun Jan 16 20:50:48 IST 2022'),
(17, 8804, '5040935981828327', 'deposit', 10000, 12000, 'Sun Jan 16 21:29:19 IST 2022'),
(18, 8804, '5040935981828327', 'deposit', 10000, 22000, 'Sun Jan 16 21:29:19 IST 2022'),
(19, 8804, '5040935981828327', 'deposit', 10000, 32000, 'Sun Jan 16 22:09:12 IST 2022');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `account_no` mediumtext NOT NULL,
  `operation` varchar(45) NOT NULL,
  `amt` bigint(20) NOT NULL,
  `final_bal` bigint(20) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `pin`, `account_no`, `operation`, `amt`, `final_bal`, `date`) VALUES
(1, 4872, '5040935965596875', 'Deposit', 1500, 112000, 'Thu Jan 13 13:10:04 IST 2022'),
(2, 4872, '5040935965596875', 'Deposit', 1, 112001, 'Thu Jan 13 13:17:04 IST 2022'),
(3, 4872, '5040935965596875', 'Withdraw', 1200, 110801, 'Thu Jan 13 13:42:12 IST 2022'),
(4, 4872, '5040935965596875', 'Deposit', 12, 110813, 'Thu Jan 13 13:43:04 IST 2022'),
(5, 4872, '5040935965596875', 'Deposit', 100, 110913, 'Thu Jan 13 13:43:18 IST 2022'),
(6, 4872, '5040935965596875', 'Withdraw', 1200, 109713, 'Thu Jan 13 13:45:22 IST 2022'),
(7, 4872, '5040935965596875', 'Deposit', 1000, 110713, 'Thu Jan 13 15:09:10 IST 2022'),
(8, 8804, '5040935981828327', 'deposit', 1000, 7000, 'Sun Jan 16 19:45:39 IST 2022'),
(9, 8804, '5040935981828327', 'deposit', 1000, 8000, 'Sun Jan 16 19:45:39 IST 2022'),
(10, 8804, '5040935981828327', 'withdraw', 500, 7500, 'Sun Jan 16 20:00:01 IST 2022'),
(11, 8804, '5040935981828327', 'withdraw', 500, 7000, 'Sun Jan 16 20:00:01 IST 2022'),
(12, 8804, '5040935981828327', 'fund transfer', 1000, 6000, 'Sun Jan 16 20:50:48 IST 2022'),
(13, 8804, '5040935981828327', 'fund transfer', 1000, 5000, 'Sun Jan 16 20:50:48 IST 2022'),
(14, 8804, '5040935981828327', 'fund transfer', 1000, 4000, 'Sun Jan 16 20:50:48 IST 2022'),
(15, 8804, '5040935981828327', 'fund transfer', 1000, 3000, 'Sun Jan 16 20:50:48 IST 2022'),
(16, 8804, '5040935981828327', 'fund transfer', 1000, 2000, 'Sun Jan 16 20:50:48 IST 2022'),
(17, 8804, '5040935981828327', 'deposit', 10000, 12000, 'Sun Jan 16 21:29:19 IST 2022'),
(18, 8804, '5040935981828327', 'deposit', 10000, 22000, 'Sun Jan 16 21:29:19 IST 2022'),
(19, 8804, '5040935981828327', 'deposit', 10000, 32000, 'Sun Jan 16 22:09:12 IST 2022'),
(20, 8804, '5040935981828327', 'fund transfer', 1000, 31000, 'Mon Jan 17 17:00:15 IST 2022'),
(21, 8804, '5040935981828327', 'fund transfer', 1000, 30000, 'Tue Jan 18 00:36:17 IST 2022');

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `id` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_acc` varchar(255) NOT NULL,
  `r_name` varchar(255) NOT NULL,
  `r_acc` varchar(255) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `fin_bal` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`id`, `pin`, `s_name`, `s_acc`, `r_name`, `r_acc`, `amount`, `fin_bal`, `operation`, `date`) VALUES
(1, 4872, 'Pratik', '5040935965596875', 'Dkode', '1230123012301230', 1000, 0, 'Deposit', 'Thu Jan 13 15:09:10 IST 2022'),
(2, 8804, 'salman', '5040935981828327', 'salman', '5040935981828327', 1000, 0, 'fund transfer', 'Sun Jan 16 20:50:48 IST 2022'),
(3, 8804, 'salman', '5040935981828327', 'sanjay', '5472432929164104', 1000, 0, 'fund transfer', 'Sun Jan 16 20:50:48 IST 2022'),
(4, 8804, 'salman', '5040935981828327', 'sanjay', '5472432929164104', 1000, 0, 'fund transfer', 'Sun Jan 16 20:50:48 IST 2022'),
(5, 8804, 'salman', '5040935981828327', 'sanjay', '5472432929164104', 1000, 0, 'fund transfer', 'Sun Jan 16 20:50:48 IST 2022'),
(6, 8804, 'salman', '5040935981828327', 'sanjay', '5472456781921236', 1000, 31000, 'fund transfer', 'Mon Jan 17 17:00:15 IST 2022'),
(7, 8804, 'salman', '5040935981828327', 'sanjay sharma', '5472432943745499', 1000, 30000, 'fund transfer', 'Tue Jan 18 00:36:17 IST 2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cust`
--
ALTER TABLE `cust`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custacc`
--
ALTER TABLE `custacc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cust`
--
ALTER TABLE `cust`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `trans`
--
ALTER TABLE `trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
