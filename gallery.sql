-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2019 at 02:30 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `exhibitiondetail` ()  SELECT * FROM exhibition$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `artist_address` varchar(255) NOT NULL,
  `artist_phone` int(10) NOT NULL,
  `painting_style` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `artist_address`, `artist_phone`, `painting_style`, `id`) VALUES
(4, 'Raj', 'hubli', 896543256, 'painting', 3),
(5, 'Jhon', 'Mangalore', 56987632, 'sculpture', 6),
(6, 'shekar', 'bellary', 876543434, 'painting', 1),
(7, 'sree', 'tumkur', 87654345, 'painting', 2),
(8, 'manju', 'anekal', 65434567, 'painting', 4),
(9, 'kjhgfds', 'poiuytre', 2147483647, 'painting', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

CREATE TABLE `exhibition` (
  `ex_name` varchar(255) NOT NULL,
  `ex_place` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `organiser` varchar(255) NOT NULL,
  `org_contact` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exhibition`
--

INSERT INTO `exhibition` (`ex_name`, `ex_place`, `start_date`, `end_date`, `organiser`, `org_contact`) VALUES
('Arts Show', 'bangalore', '2019-11-23', '2019-11-24', 'Karntaka Arts Ins', 897654321),
('KalaPradarshana', 'Mysore', '2019-11-27', '2019-11-29', 'IAM', 987645432);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `email`, `password`, `address`, `phone`) VALUES
('qwer', 'abc@gmail.com', '9876', 'ASA', 123),
('ksvmohankumar', 'ksvmohankumar@gmail.', '12345', 'banglore', 2147483647),
('navi', 'navi@gmail.com', '12345', 'bangalore', 123456789),
('niki', 'niki@gmaiil.com', '12345', 'Tiptur', 345678987),
('sree', 'sree@gmail.com', '12345', 'bellary', 123456789);

--
-- Triggers `login`
--
DELIMITER $$
CREATE TRIGGER `toLower` BEFORE INSERT ON `login` FOR EACH ROW SET NEW.email=LOWER(NEW.email)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `final_price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `email`, `id`, `final_price`) VALUES
(23, 'navi@gmail.com', 3, 125.00),
(24, 'navi@gmail.com', 1, 500.00),
(25, 'sree@gmail.com', 1, 500.00),
(26, 'sree@gmail.com', 2, 299.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `image`, `price`, `style`) VALUES
(1, 'Mona_Lisa', 'mona_lisa.jpg', 500.00, 'painting'),
(2, 'Taj', 'taj.jpg', 299.00, 'painting'),
(3, 'Village', 'vt.jpg', 125.00, 'painting'),
(4, 'Bullock Cart', 'prd.jpeg', 75.00, 'painting'),
(5, 'Buddha', 'buddha.jpg', 1000.00, 'sculpture'),
(6, 'Jesus', 'jesus.jpg', 950.00, 'sculpture'),
(7, 'White Little Angel', 'angel.jpg', 500.00, 'sculpture'),
(8, 'Brown Man Face', 'brownface.jpg', 750.00, 'sculpture'),
(12, 'Butterfly', 'butterfly.jpg', 99.00, 'Photography');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `fk3` (`id`);

--
-- Indexes for table `exhibition`
--
ALTER TABLE `exhibition`
  ADD UNIQUE KEY `ex_name` (`ex_name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk1` (`email`),
  ADD KEY `foreign` (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `foreign` FOREIGN KEY (`id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
