-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2018 at 10:44 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(4, 'Men\'s'),
(5, 'Women\'s '),
(6, 'Unisex \r\n');

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
  `subcategory_id` int(11) NOT NULL,
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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `subcategory_id`, `in_stock`, `full_price`, `discount_price`, `occasion`, `sex`, `stars_count`, `short_description`, `long_description`, `product_img`) VALUES
(3, 'Casio', 20, 50, 250, 150, 'Sport Wear', 'Man\'s', 5, 'Men\'s watch', 'Men\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watchMen\'s watch', 'https://cdn.eglobalcentral.eu/images/magictoolbox_cache/8c95d73fec130487c102a73bf1ab42ce/2/1/21162/thumb360x360/3247376951/casio-g-shock-200m-water-resistance-tough-solar-watch-vl1a5x.jpg'),
(4, 'Festina', 20, 200, 400, 250, 'Casual Wear', 'Man\'s', 3, '$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId', '$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId$productsBySubId', 'https://prodaja-satova.rs/331-large_default/festina-f16489-5.jpg'),
(5, 'Fossil', 20, 30, 350, 200, 'Sport Wear', 'Man\'s', 2, 'https://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpg', 'https://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpghttps://prodaja-satova.rs/331-large_default/festina-f16489-5.jpg', 'https://www.jomashop.com/media/catalog/product/f/o/fossil-nate-chronograph-black-dial-black-ion-plated-men_s-watch-jr1401.jpg'),
(6, 'Swatch', 20, 20, 250, 100, 'Casual Wear', 'Man\'s', 4, 'SwatchSwatch', 'SwatchSwatchSwatchSwatchSwatchvvv', 'https://static.swatch.com/images/product/GN718/sa360/GN718_4.jpg'),
(7, 'Rolex', 20, 30, 600, 450, 'Casual Wear', 'Man\'s', 4, 'RolexRolexRolexRolex', 'RolexRolexRolexRolexRolexRolexRolexv', 'http://www.thejewelleryeditor.com/media/images_thumbnails/filer_public_thumbnails/filer_public/72/dd/72ddeb0a-237c-4990-bad9-d177f5cb5e92/rolex-cosmograph-daytona-yellow-gold.jpg__1536x0_q75_crop-scale_subsampling-2_upscale-false.jpg'),
(8, 'Armani', 20, 50, 450, 300, 'Casual Wear', 'Man\'s', 3, 'ArmaniArmaniArmani', 'ArmaniArmaniArmaniArmaniArmaniArmaniv', 'https://4.imimg.com/data4/LF/PB/ANDROID-36272727/product-500x500.jpeg'),
(9, 'Seiko', 20, 50, 400, 250, 'Casual Wear', 'Man\'s', 4, 'SeikoSeikoSeikoSeikoSeiko', 'SeikoSeikoSeikoSeikoSeikovvvSeikov', 'https://production-fratellowatches.netdna-ssl.com/wp-content/uploads/2016/12/IMG_0418.jpg'),
(10, 'Guess', 20, 50, 450, 250, 'Formal Wear', 'Man\'s', 3, 'GuessGuessGuess', 'GuessGuessGuess', 'http://fe1299bd296a03009be3-3739e7c3010127be61fd7a8237f120ed.r81.cf5.rackcdn.com/img/watches/W0366G4-53075.png'),
(11, 'Q&Q', 20, 50, 250, 100, 'Sport Wear', 'Man\'s', 1, 'Q&QQ&QQ&QQ&QQ&QQ&Q', 'Q&QQ&QQ&QQ&QvQ&Qvv', 'http://watchcentre.pk/wp-content/uploads/2017/03/qq-m144j005y-military-watch-pakistan.jpg');

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
(1, 'Man\'s'),
(2, 'Women\'s'),
(3, 'Unisex');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id_sub_category` int(11) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id_sub_category`, `subcategory_name`, `category_id`) VALUES
(17, 'Men\'s Clothing', 4),
(18, 'Men\'s Wallets', 4),
(19, 'Men\'s Shoes', 4),
(20, 'Men\'s Watches', 4),
(21, 'Men\'s Accessories', 4),
(22, 'Women\'s Clothing', 5),
(23, 'Women\'s Wallets,Bags', 5),
(24, 'Women\'s Footwear', 5),
(25, 'Women\'s Accessories', 5),
(26, 'Women\'s Jewellery', 5),
(27, 'Unisex Home Fashion', 6),
(28, 'Unisex Shoes', 6),
(29, 'Unisex Brand Stores', 6);

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
(1, 'Zivan', 'Kuzminac', 'kuzminac.zile8@gmail.com', 'ZileKuzminac022');

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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `sex` (`sex`),
  ADD KEY `occasion` (`occasion`),
  ADD KEY `sub_brand_id` (`subcategory_id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_type`),
  ADD UNIQUE KEY `id_s` (`id_s`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id_sub_category`),
  ADD KEY `brands_id` (`category_id`);

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id_product` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `id_s` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id_sub_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`occasion`) REFERENCES `occasions` (`occasion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`sex`) REFERENCES `sex` (`sex_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id_sub_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
