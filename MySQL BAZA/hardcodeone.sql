-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2018 at 11:11 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hardcodeone`
--

-- --------------------------------------------------------

--
-- Table structure for table `auxiliary`
--

CREATE TABLE `auxiliary` (
  `id_del` int(30) NOT NULL,
  `id_product` int(20) NOT NULL,
  `amoutn_product` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id_brand` int(30) NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliverys`
--

CREATE TABLE `deliverys` (
  `id_del` int(30) NOT NULL,
  `id_product` int(30) NOT NULL,
  `id_user` int(30) NOT NULL,
  `time_delivery` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `city_delivery` varchar(255) NOT NULL,
  `address_delivery` varchar(255) NOT NULL,
  `email_delivery` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id_occ` int(11) NOT NULL,
  `occasion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id_occ`, `occasion`) VALUES
(1, 'Sport Wear'),
(2, 'Casual Wear'),
(3, 'Formal Wear');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `in_stock` int(200) NOT NULL,
  `full_price` int(30) NOT NULL,
  `discount_price` int(30) DEFAULT NULL,
  `occasion` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `stars_count` int(10) NOT NULL DEFAULT '1',
  `short_description` text NOT NULL,
  `long_description` text NOT NULL,
  `product_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `id_s` int(11) NOT NULL,
  `sex_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`id_s`, `sex_type`) VALUES
(1, 'Man\'s '),
(2, 'Women\'s '),
(3, 'Unisex');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Johny', 'Bolean', 'bojo@mail.com', '123'),
(2, 'Test', 'Test', 'mail@test.com', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auxiliary`
--
ALTER TABLE `auxiliary`
  ADD KEY `id_del` (`id_del`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_name`),
  ADD UNIQUE KEY `id_brand` (`id_brand`);

--
-- Indexes for table `deliverys`
--
ALTER TABLE `deliverys`
  ADD PRIMARY KEY (`id_del`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `occasions`
--
ALTER TABLE `occasions`
  ADD PRIMARY KEY (`occasion`),
  ADD UNIQUE KEY `id_occ` (`id_occ`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `brand_name` (`brand_name`),
  ADD KEY `sex` (`sex`),
  ADD KEY `occasion` (`occasion`),
  ADD KEY `brand_name_2` (`brand_name`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_type`),
  ADD UNIQUE KEY `id_s` (`id_s`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id_brand` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverys`
--
ALTER TABLE `deliverys`
  MODIFY `id_del` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id_occ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `id_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auxiliary`
--
ALTER TABLE `auxiliary`
  ADD CONSTRAINT `auxiliary_ibfk_1` FOREIGN KEY (`id_del`) REFERENCES `deliverys` (`id_del`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auxiliary_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliverys`
--
ALTER TABLE `deliverys`
  ADD CONSTRAINT `deliverys_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_name`) REFERENCES `brands` (`brand_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`occasion`) REFERENCES `occasions` (`occasion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`sex`) REFERENCES `sex` (`sex_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
