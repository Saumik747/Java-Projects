-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 02:42 PM
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
-- Database: `onlresult`
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
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(20) NOT NULL,
  `c_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `c_name`) VALUES
(1, 'Mca'),
(2, 'mba');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `rollno` int(11) NOT NULL,
  `s1` int(11) NOT NULL,
  `s2` int(11) NOT NULL,
  `s3` int(11) NOT NULL,
  `s4` int(11) NOT NULL,
  `s5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `email`, `c_id`, `sem_id`, `rollno`, `s1`, `s2`, `s3`, `s4`, `s5`) VALUES
(1, 'saumikdutta203@gmail.com', 1, 1, 40, 74, 75, 76, 77, 78);

-- --------------------------------------------------------

--
-- Table structure for table `result1`
--

CREATE TABLE `result1` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `c_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `subject` int(20) NOT NULL,
  `rollno` int(11) NOT NULL,
  `marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `course` int(20) DEFAULT NULL,
  `semester` int(20) DEFAULT NULL,
  `rollno` int(10) DEFAULT NULL,
  `mobno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `password`, `address`, `dob`, `gender`, `course`, `semester`, `rollno`, `mobno`) VALUES
(1, 'saumik d1', 'saumikdutta203@gmail.com', 'saumik1', 'palm beach residency', '2022-01-06', 'male', 1, 1, 40, 996701264);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `s_id` int(20) NOT NULL,
  `c_id` int(20) NOT NULL,
  `sem_id` int(20) NOT NULL,
  `sname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`s_id`, `c_id`, `sem_id`, `sname`) VALUES
(1, 1, 1, 'advanced java'),
(2, 1, 1, 'Business Statistics'),
(3, 1, 1, 'web technology'),
(4, 1, 1, 'Database Applications'),
(5, 1, 1, 'Design and Analysis of Algorithm'),
(6, 1, 2, 'cloud computing'),
(7, 1, 2, 'Software Engineering and Quality Assurance'),
(8, 1, 2, 'Foundation of Data Science'),
(9, 1, 2, 'python'),
(10, 1, 2, 'Advanced Communication Technologies');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result1`
--
ALTER TABLE `result1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `result1`
--
ALTER TABLE `result1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `s_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
