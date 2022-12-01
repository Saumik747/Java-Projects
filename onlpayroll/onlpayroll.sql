-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2022 at 08:20 AM
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
-- Database: `onlpayroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'Saumik', 'saumik@gmail.com', 'saumik123');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobno` int(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `joindate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`ID`, `name`, `password`, `email`, `dept`, `dob`, `gender`, `mobno`, `address`, `joindate`) VALUES
(1, 'Pratik', '123', 'p@gmail.com', 'IT', '2022-01-12', 'Male', 2009, 'Bombay', '2022-01-18'),
(4, 'Deven', 'kode', 'k@gmail.com', 'IT', '2022-01-10', 'Male', 9090909, 'Mumbai', '2022-01-19'),
(5, 'dharmesh', '1234', 'd@gmail.com', 'IT', '2022-01-04', 'Male', 0, 'Mumbai', '2022-01-06'),
(6, 'Saumik Dutta', 'saumik', 'saumik@gmail.com', 'IT', '2000-01-03', 'male', 932344, 'satyam towers', '2022-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `empsal`
--

CREATE TABLE `empsal` (
  `id` int(11) NOT NULL,
  `name` varchar(56) NOT NULL,
  `email` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `mnth` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `ts` int(11) NOT NULL,
  `asal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empsal`
--

INSERT INTO `empsal` (`id`, `name`, `email`, `salary`, `mnth`, `year`, `bonus`, `ts`, `asal`) VALUES
(1, 'Pratik', 'p@gmail.com', 25000, 'january', 2021, 0, 0, 0),
(2, 'Pratik', 'p@gmail.com', 100000, '0', 0, 10000, 110000, 1200000),
(3, 'Dkode', 'd@gmail.com', 50000, '0', 0, 10000, 60000, 600000),
(4, 'Dkode', 'd@gmail.com', 80000, '0', 0, 10000, 90000, 960000),
(6, 'Pratik', 'p@gmail.com', 25000, 'january', 2021, 0, 0, 0),
(7, 'Saumik Dutta', 'saumik@gmail.com', 25000, 'january', 2000, 0, 0, 0),
(8, 'Saumik Dutta', 'saumik@gmail.com', 45000, 'february', 2000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `empsal2`
--

CREATE TABLE `empsal2` (
  `id` int(11) NOT NULL,
  `name` varchar(56) NOT NULL,
  `email` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `asal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empsal2`
--

INSERT INTO `empsal2` (`id`, `name`, `email`, `year`, `asal`) VALUES
(0, 'Saumik Dutta', 'saumik@gmail.com', 2000, 90000),
(1, 'Pratik', 'p@gmail.com', 2021, 1775000),
(4, 'Dkode', 'd@gmail.com', 0, 600000),
(5, 'Dkode', 'd@gmail.com', 0, 960000);

-- --------------------------------------------------------

--
-- Table structure for table `emp_dt`
--

CREATE TABLE `emp_dt` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Dept` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_dt`
--

INSERT INTO `emp_dt` (`ID`, `Name`, `Password`, `Email`, `Dept`, `Date`, `Gender`, `Phone`, `City`) VALUES
(1, 'Pratik', '123', 'p@gmail.com', 'IT', '2022-01-12', 'Male', '0000', 'Bombay'),
(4, 'Dkode', 'kode', 'k@gmail.com', 'IT', '2022-01-10', 'Male', '9090909', 'Mumbai'),
(5, 'Dkode', '1234', 'd@gmail.com', 'IT', '2022-01-04', 'Male', '0000', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `strt_dt` date NOT NULL,
  `end_dt` varchar(255) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `n_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_leave`
--

INSERT INTO `emp_leave` (`id`, `name`, `email`, `strt_dt`, `end_dt`, `reason`, `n_days`) VALUES
(1, 'Pratik\r\n', 'p@gmail.com', '2022-01-14', '2022-01-15', '', 1),
(2, 'Pratik\r\n', 'p@gmail.com', '2022-01-17', '2022-01-18', '', 1),
(3, 'Pratik\r\n', 'p@gmail.com', '2022-01-19', '2022-01-20', '', 1),
(4, 'saumik', 'saumik@gmail.com', '2022-01-16', '2022-01-28', 'bvbvbvb', 12),
(5, 'saumik', 'saumik@gmail.com', '2022-01-17', '2022-01-28', 'bvbvbvb', 11),
(6, 'saumik', 'saumik@gmail.com', '2022-01-12', '2022-01-20', 'hjhjhj', 8),
(7, '', 'saumik@gmail.com', '2022-01-21', '2022-01-21', 'body checkup', 0),
(8, '', 'saumik@gmail.com', '2022-01-23', '2022-01-24', 'body checkup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `ID` int(3) NOT NULL,
  `UName` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone_No` varchar(15) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `cpassword` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`ID`, `UName`, `Password`, `Email`, `Gender`, `Phone_No`, `Country`, `cpassword`) VALUES
(1, 'Pratik', '123', 'p@gmail.com', 'Male', '12345', 'India', '123'),
(2, 'Skye', '123', 'skye@gmail.com', 'Male', '12345', 'India', '123'),
(3, 'kode', 'kode', 'k@gmail.com', 'Male', '00000', 'India', 'kode'),
(4, 'Bunny', '123', 'b@gmail.com', 'Male', '0000', 'India', '123');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `name` varchar(56) NOT NULL,
  `email` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `ts` int(11) NOT NULL,
  `asal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `name`, `email`, `salary`, `bonus`, `ts`, `asal`) VALUES
(1, 'Pratik', 'p@gmail.com', 100000, 10000, 110000, 1200000),
(4, 'Dkode', 'd@gmail.com', 50000, 10000, 60000, 600000),
(5, 'Dkode', 'd@gmail.com', 80000, 10000, 90000, 960000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `empsal`
--
ALTER TABLE `empsal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empsal2`
--
ALTER TABLE `empsal2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_dt`
--
ALTER TABLE `emp_dt`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `empsal`
--
ALTER TABLE `empsal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `emp_dt`
--
ALTER TABLE `emp_dt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
