-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 10:58 AM
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
-- Database: `hs`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(5) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(84, 'Cleaning'),
(87, 'Electricians'),
(88, 'Plumbers'),
(89, 'Carpenters'),
(104, 'Painters');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(5) NOT NULL,
  `city_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Cairo'),
(2, 'Alexandria'),
(9, 'Asuit'),
(10, 'Beny-suif'),
(11, 'Al-menya'),
(16, 'Suez'),
(20, 'Matrouh'),
(21, 'South sinai'),
(22, 'North sinai'),
(23, 'Dumiete'),
(24, 'Red Sea'),
(29, 'Al-menofeya'),
(30, 'Kafr al sheikh'),
(37, 'suhag'),
(38, 'al-sharkeya'),
(39, 'al-gharbeya'),
(40, 'al-beheira'),
(41, 'ismailia'),
(42, 'Porsaid'),
(43, 'Giza'),
(45, 'New Valley'),
(46, 'Aswan'),
(47, 'Dakahleya'),
(48, 'Mansoura'),
(49, 'Fayoum'),
(50, 'Qena');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(5) NOT NULL,
  `login_id` int(5) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `city_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `login_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city_id`) VALUES
(8, 360, 'shahd', 'aaa', 'sssss@gmail.com', '12345', 'shhhahd', 10),
(9, 361, 'shahd', 'shahd', 'shahd@gmail.com', '123456', 'shahd', 16),
(10, 363, 'abeer', 'ahmed', 'abeer@gmail.com', '1234', 'suez', 16),
(11, 364, 'khalid', 'kamal', 'khalid@gmail.com', '1234', 'ss', 16),
(12, 365, 'ola', 'ahmed', 'ola@gmail.com', '1233', '3ss', 39),
(13, 366, 'amira', 'kammal', 'am@gmail.com', '123456', 'gggg', 45),
(14, 367, 'shahd', 'kamal', 'shahdakammal1@gmail.com', '01025066554', 'حوض الدرس', 41),
(16, 369, 'shahd', 'kamal', 'shahd.a.kamal.9@gmail.com', '01025066554', 'حوض الدرس', 16);

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `name`, `date`) VALUES
(1, 'deep', '0000-00-00 00:00:00'),
(2, 'deep', '2023-02-26 03:33:40'),
(3, 'deep', '2023-02-26 03:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(5) NOT NULL,
  `role_id` int(5) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `role_id`, `username`, `password`) VALUES
(333, 3, 'sahil', '$2y$10$hZDAvmYRcGnL48FWoHH37O0Ey99EnX..Ce9ETd2yWxAum30Knb9o.'),
(335, 1, 'admin', '$2y$10$cN3ZSgu544VbF0U/Xk/96eEHlf.txlokPij7Qn5oe/dBAh2DrUwvO'),
(344, 2, 'smit', '$2y$10$KDhIPRf5qIYTmFJY2pVfYe/XF.DX8Cypctp4Q.qJeXgNwiamfaNAm'),
(345, 2, 'karan', '$2y$10$V7DsxOd9.mDjp9AEkGEtteL3QLojStmFFwmqo.l1RmSDbRuph8Amq'),
(347, 2, 'nayan', '$2y$10$Mu7fItaeU.Q1aMWek1LvjOEEL1Q/rFXnjkTL//uXMoreKFXJoExSi'),
(351, 2, 'jay gabani', '$2y$10$Se74K2TO57ZGEN79HFNy4e7qUJ/v1ePImeRLj9/E5sgPSQs7uwG6m'),
(352, 3, 'amit', '$2y$10$LImF6t3d5pQMRTE8a3kyX.0XPqTK9L.8FTDIS4Z9BUwX75Hzss0DW'),
(354, 2, 'deep', '$2y$10$nQCTknPw7Y0ViSMNuWdwHORpdNcm5a9iLsIUyHDwGofxUG2p6.8mG'),
(355, 3, 'jay_gabani', '$2y$10$wXEeA6MNy13EsgQlF8G3w.fhZC4NCH2kEi0amMj9CdtTvU.ZiUsMO'),
(358, 2, 'jeel', '$2y$10$40EBg/w9DlFItbzn9X5a3uj44gZg8Xf2BTSeZD2YENvdRkeHzGxMO'),
(359, 3, 'harsh', '$2y$10$DWwYtA3iYk.aOGW2z9oVEOp6XNJXWLWQ2fUvHKYtfAwKzWmzAVkJO'),
(360, 3, 'shahdd123', '$2y$10$rX3QqlaPc1v0YD6ud0ygD.t/SYDlhr4tWEx8VcfMhuK62RtsJrG6C'),
(361, 3, 'shahd', '$2y$10$1u0FV4PAUGkN/UpDXB7sre5WZc5tpeaa0l8IFj9GeA8QvlfC3ZM5q'),
(362, 2, 'omar', '$2y$10$/1ti.EluXnp..pUUJAJ1weexK8Cy9dXuYHFQrxsVtvCCQkMFrEyGm'),
(363, 3, 'abeer', '$2y$10$mG/dx2Zwww5GiEBMezg8E.bnUN6gmRINXqIgW439LNYrt1U7D9gRm'),
(364, 3, 'khalid', '$2y$10$YyBko8BAF46eciX1JjlPw.1vcmvfVfSxA6iEWd4PFwicTE5/WcD4q'),
(365, 3, 'olaa', '$2y$10$imwkJXccbrfMnTqwCkVAZeDGDyEleQus9qMWa6xhp/rfdIO04juKq'),
(366, 3, 'amira', '$2y$10$HjkHVmKoAMozHGKobK62weaEty2B9kJKVrJeObHp.0EWsMNyjtrEa'),
(367, 3, 'shahd_kammal', '$2y$10$mvzcU.MbET.lIeW/Uwp//OXg8w7xaXZR9W3C.wsOls7rornFp9bVe'),
(368, 3, 'shahd_kamall', '$2y$10$ldx4Wayo3XU.mJAimvjCweNQi/GdFsfsheUePTNtSC0IaSTLz3/I.'),
(369, 3, 'shahd_kammall', '$2y$10$hJy87/WbAcptsUholKgqE.Ttzl1wkQbO91ZHmw5lMFlqz.sPzeZF2'),
(370, 2, 'nada', '$2y$10$GDclsFbaOQYa8YU5XS6fPu..GQPAsEp4O5f4FhbPc9L/nvUrfLAXS'),
(376, 2, 'ibrahim_marzouk', '$2y$10$J5kbnrPNwbnQPOGBgQv2aOw1wETfhCSTAfmDbJ7V1O/fU8OMBQHva'),
(377, 2, 'ali@gmail.com', '$2y$10$cKLLF.piYbdNTqpkwwbGzOhfvEw9OxRdrOmUmJWC7y6QvABkfQg2S'),
(378, 2, 'maged1', '$2y$10$QuL3a3ik9Ya5a94NcSrLBefvRU9DcJQUw1Pv07LSLJkOb0WGaZDHK'),
(379, 2, 'abdo', '$2y$10$wp9cfOyzh0/YGCQGg8UXBeWiCaozKiBcNF2tamVL.yuSpbcbllRPy'),
(380, 2, 'ghalyaa', '$2y$10$gyso3tkll7YnYFApmkXn9.PedPn0QhIbcvG3sa0Jx0ghzNNVCuGCu'),
(381, 2, 'sabreen123', '$2y$10$oCXz2NqxPPnUsiI62t9xk.0JD.IsTcPcZNdYcWIeHbQpQf0M6hyMa'),
(382, 2, 'rahma', '$2y$10$RbdpPsHpN1p4Z2bMCwosSu9bWRxOPTLLh4nABbzD2obD0BFAaNph6'),
(383, 2, 'moamenn', '$2y$10$uMxWyumxyZk25sYB5g6zL.SjkK9Ko8OOGt.N09kfUMa5T3TNrB5d.'),
(384, 2, 'youssef22', '$2y$10$LhW0uVMl6Yip8SvlHD61quLsI0a3I0NFRCq3hFBtDIykAIn8aXNoK'),
(385, 2, 'mohamedzidaan', '$2y$10$zeqCQ0jUY11mBoQ9fR.F9u5PlEaJUKW7TNvZxA8Wc74CADU0wqjLC'),
(386, 2, 'abdelazizsaber15', '$2y$10$zyK0MzZuS3RN/O3rs0wcX.holXXH1pwNAMt8sOiHwXTvacsAyZgTG'),
(387, 2, 'nasser@gmail.com', '$2y$10$WJj7Uxcxcv044f8XtXpdju7XPvq51q3jR/GC7NKUadElW5fEdK0R2'),
(388, 2, 'khaliil_mansour', '$2y$10$HVoWlSHdAGjDhmsFTBwofuXZlsXNwnaXJhMQMm8TecEwhlSNUVCNC'),
(389, 2, 'tahasedki_', '$2y$10$pAg.yjwNeIYgttjC8xT9l.xTe48w5sNaCJEsktAKmPafSih23PCaO'),
(390, 2, 'abdulazimm12', '$2y$10$sZx3DoVEhnYT2J56uUP4cOprAY/kmOCxQCQftIgC3nu/ESn9rlApm'),
(391, 2, 'mohsen', '$2y$10$tq/UQxbIUT3eNHYlOxxQf.MzVBI0ekclwCjw91Wy0/y6l32En28p6'),
(392, 2, 'omarezz', '$2y$10$j4jWFtI4FXWI8qNWajLfnuCWAltulZd3tE3Bqg7NzivnB6DaPNKMm'),
(393, 2, 'mohamed_salem1', '$2y$10$eWmnRURsLgQ1Reolsfnsu.wl6MshB0SWyoEEHGWiDVMft3H0N3IL.'),
(394, 2, 'ahmed_ibrahim', '$2y$10$lulBkwyYwzRHkzKv6ELWnum6E2IZF/o4EXd/MzMmauZptUGsZ.phK'),
(395, 2, 'ehab_samirr', '$2y$10$.J8ByCJZIj868gK4HzdIbuK2THxhzBVfnms6079CClV3aJoOAV4e6'),
(396, 2, 'saamia', '$2y$10$hiYUQdztiUp.iLni7Hzhruub0L5D5KM96nMMXMuadXv2ODLvYZqkC'),
(397, 2, 'zaghlolll', '$2y$10$yvsTvPLFjiR/6KYKEZvEu.2FoyJh00skOaWLMWcbSPICzD5xuhSUG');

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `order_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(300) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `pay_mode` varchar(20) NOT NULL,
  `total` int(20) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`order_id`, `customer_id`, `full_name`, `phone`, `address`, `pincode`, `pay_mode`, `total`, `order_date`, `due_date`) VALUES
(29, 9, 'shahd', '123', 'shahd', '123456', 'COD', 856, '2024-11-25 12:02:21', '2024-11-27 22:32:00'),
(30, 10, 'abeer', '1234', 'suez', '123456', 'COD', 712, '2024-11-26 11:09:59', '2024-11-28 21:39:00'),
(31, 11, 'khalid', '122', 'sss', '123456', 'COD', 150, '2024-11-26 02:29:32', '2024-11-28 00:59:00'),
(32, 12, 'ola', '12222', 'wsa', '123456', 'COD', 10000, '2024-11-26 02:32:53', '2024-11-29 01:02:00'),
(33, 13, 'amira kammal', '123456', 'gggg', '123456', 'COD', 356, '2024-11-27 07:33:28', '2024-11-29 18:03:00'),
(34, 13, 'shahd shahd', '123456', 'shahd', '123456', 'COD', 150, '2024-11-27 08:31:18', '2024-11-28 19:01:00'),
(35, 16, 'shahd shahd', '123456', 'shahd', '123456', 'COD', 150, '2024-11-27 02:51:50', '2024-11-29 01:21:00'),
(36, 16, 'shahd shahd', '123456', 'shahd', '123456', 'COD', 1155, '2024-11-28 12:03:50', '2024-11-29 22:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(5) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'serviceprovider'),
(3, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(5) NOT NULL,
  `category_id` int(5) DEFAULT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `service_availibility` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `category_id`, `service_name`, `service_availibility`) VALUES
(12, 84, 'Full Home Cleaning', 1),
(13, 84, 'Sofa & Carpet Cleaning', 1),
(23, 87, 'Switch & Socket', 0),
(25, 87, 'Fan repairing', 1),
(26, 89, 'Furniture', 1),
(31, 88, 'Drainage pipes', 1),
(39, 84, 'Room cleaning', 1),
(42, 104, 'Full Home Painting', 1),
(46, 84, 'Bathroom Cleaning', 1),
(47, 84, 'Kitchen Cleaning', 1),
(48, 89, 'Window installations', 1),
(49, 89, 'Table & Chairs Design', 1),
(50, 89, 'Beds Design', 1),
(51, 88, 'Sink And Toilet Repairs', 1),
(53, 104, 'Interior & Exterior Wood Staining', 1),
(54, 104, 'Door Painting', 1),
(57, 88, 'Water Heater Services', 1),
(58, 104, 'Individual Room Painting', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp`
--

CREATE TABLE `sp` (
  `sp_id` int(5) NOT NULL,
  `login_id` int(5) NOT NULL,
  `sp_name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `city_id` int(5) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sp`
--

INSERT INTO `sp` (`sp_id`, `login_id`, `sp_name`, `email`, `phone`, `city_id`, `status`) VALUES
(68, 376, 'Ibrahim Marzouk', 'ibrahim@gmail.com', '01022558888', 16, 'active'),
(69, 377, 'Ali Saad', 'ali@gmail.com', '01088992211', 1, 'active'),
(70, 378, 'Maged Abdullah', 'maged@gmail.com', '01155225522', 42, 'active'),
(71, 379, 'Abdullrahman Mohamed', 'abdo@gmail.com', '01234567899', 43, 'active'),
(72, 380, 'Ghalya Ibrahim', 'ghalya@gmail.com', '01023456788', 16, 'active'),
(73, 381, 'Sabreen Hamdallah', 'sabreen@gmail.com', '01122334455', 1, 'active'),
(74, 382, 'Rahma Mohamed', 'rahma@gmail.com', '01055667788', 41, 'active'),
(75, 383, 'Moamen Hisham', 'moamen@gmail.com', '010022333445', 1, 'active'),
(76, 384, 'Youssef Salah', 'youssef@gmail.com', '01258585858', 30, 'active'),
(77, 385, 'Mohamed Zidan', 'mohamedzidan@gmail.com', '010009988777', 41, 'active'),
(78, 386, 'Abdelaziz Saber', 'abdelaziz@gmail.com', '01010222222', 23, 'active'),
(79, 387, 'Nasser Mahmoud', 'nasser@gmail.com', '01222332233', 38, 'active'),
(80, 388, 'Khalil Mansour', 'khalil@gmail.com', '01122332323', 1, 'active'),
(81, 389, 'Taha Sedki', 'taha@gmail.com', '01222221111', 42, 'active'),
(82, 390, 'Abdelazim Shoukry', 'abdelazim@gmail.com', '01122334555', 41, 'active'),
(83, 391, 'Mohsen Sabry', 'mohsen@gmail.com', '01010101111', 24, 'active'),
(84, 392, 'Omar Ezz', 'omar@gmail.com', '01234666666', 1, 'active'),
(85, 393, 'Mohamed Salem', 'mohamed@gmail.com', '01215111111', 41, 'active'),
(86, 394, 'Ahmed Ibrahim', 'ahmed@gmail.com', '01212121212', 20, 'active'),
(87, 395, 'Ehab Samir', 'ehabsaamir@gmail.com', '01122334444', 10, 'active'),
(88, 396, 'Samia Nasser', 'samia@gmail.com', '01245787878', 42, 'active'),
(89, 397, 'Zaghlol Fathy', 'zaghlol@gmail.com', '01002222222', 48, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sp_service`
--

CREATE TABLE `sp_service` (
  `sp_id` int(5) NOT NULL,
  `service_id` int(5) NOT NULL,
  `category_id` int(5) NOT NULL,
  `service_title` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  `description` varchar(500) NOT NULL,
  `availability` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sp_service`
--

INSERT INTO `sp_service` (`sp_id`, `service_id`, `category_id`, `service_title`, `price`, `description`, `availability`) VALUES
(68, 42, 104, 'Professional Painter', '5000', 'I provide full home painting in effective way with my team and in the most affordable prices.', 1),
(69, 49, 89, 'Customization & Repair for Tables and Chairs', '2500', 'I create and repair tables and chairs of all styles and sizes, offering quality craftsmanship to deliver durable and aesthetically pleasing results for your dining or workspaces.', 1),
(70, 48, 89, 'Glass installation', '250', 'I offer precise and durable window installation services, ensuring a perfect fit, enhanced security, and improved energy efficiency for your home or office.', 1),
(71, 50, 89, 'Bed Repair & Assembly', '200', 'I provide expert bed assembly and repair services, ensuring sturdy and comfortable setups tailored to your specific needs and preferences.', 1),
(72, 47, 84, 'Professional Kitchen Cleaning', '350', 'I specialize in deep kitchen cleaning, tackling grease, grime, and clutter on countertops, appliances, and floors to maintain a hygienic and sparkling cooking area.', 1),
(73, 46, 84, 'Sparkling Bathroom Cleaning', '250', 'I provide comprehensive bathroom cleaning services, including scrubbing tiles, disinfecting fixtures, and removing stains and soap scum to ensure a clean and germ-free environment.', 1),
(74, 39, 84, 'Rooms Cleaning', '280', 'I offer detailed room cleaning services, including dusting, vacuuming, mopping, and organizing to create a tidy, comfortable, and healthy living space.', 1),
(75, 31, 88, 'Drainage Pipes', '300', 'I offer professional drainage pipe services, including cleaning, unclogging, and repairs, to ensure proper water flow and prevent blockages or leaks.', 1),
(76, 25, 87, 'AC & Fan Repairing', '350', 'Expert AC and Fan Repair and Maintenance Solutions', 1),
(77, 23, 87, 'Switch and Socket Installations', '250', 'Reliable Switch and Socket Installation & Repairs.', 1),
(79, 51, 88, 'Sink and Toilet', '250', 'I provide expert sink and toilet repair and installation services, addressing leaks, clogs, and replacements to keep your bathroom and kitchen functioning smoothly.', 1),
(81, 54, 104, 'Door Painting', '400', 'I provide expert door painting services, ensuring a smooth, vibrant, and durable finish that complements your home’s aesthetic while protecting the surface.', 1),
(82, 53, 104, 'Interior & Exterior Wood Staining', '580', 'I offer professional wood staining services for both interior and exterior surfaces, enhancing the natural beauty and durability of wood with a flawless, long-lasting finish.', 1),
(84, 58, 104, 'Individual Rooms', '450', 'Specializing in individual room painting, bringing a touch of expertise and care to every corner, enhancing your space with vibrant colors and immaculate finishes.', 1),
(86, 26, 89, 'Crafting, Renovating, and Assembling Furniture', '4000', 'From renovating and assembling furniture to crafting brand-new pieces, our carpentry services blend creativity and precision to rejuvenate your space with custom-made furniture that reflects your style and functionality, transforming every corner into a statement of craftsmanship and comfort.', 1),
(87, 57, 88, 'Expert Water Heater Services', '500', 'Offering top-tier water heater installations, repairs, and maintenance. Experience peace of mind knowing your hot water needs are in expert hands, ensuring a seamless and reliable experience every time.', 1),
(88, 12, 84, 'Complete Home Cleaning Services', '400', 'Experience impeccable cleanliness with my thorough home cleaning services. Every nook and cranny receives my expert attention, ensuring a refreshed and spotless living environment that sparkles with cleanliness and care.', 1),
(89, 13, 84, 'Fresh & Flawless: Sofa & Carpet Care', '250', 'Ensuring your sofas and carpets look and feel brand new. We prioritize your health and comfort by using non-toxic, pet-friendly products. Revel in the freshness of a perfectly clean home.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `updatetry`
--

CREATE TABLE `updatetry` (
  `id` int(5) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `updatetry`
--

INSERT INTO `updatetry` (`id`, `fname`, `lname`, `email`) VALUES
(1, 'Deep', 'Korat', 'deepkorat13@gmail.com'),
(2, 'jay', 'gabani', 'jaygabani@gmail.com'),
(3, 'sahil', 'patoliya', 'sahil@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(5) NOT NULL,
  `service_id` int(5) NOT NULL,
  `sp_id` int(5) NOT NULL,
  `service_title` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  `qty` int(3) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `login_id` (`login_id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sp`
--
ALTER TABLE `sp`
  ADD PRIMARY KEY (`sp_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `login_id` (`login_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `sp_service`
--
ALTER TABLE `sp_service`
  ADD PRIMARY KEY (`sp_id`,`service_id`),
  ADD KEY `sevice_id` (`service_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `updatetry`
--
ALTER TABLE `updatetry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD UNIQUE KEY `order_id` (`order_id`,`service_id`,`sp_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sp`
--
ALTER TABLE `sp`
  MODIFY `sp_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `updatetry`
--
ALTER TABLE `updatetry`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `order_master`
--
ALTER TABLE `order_master`
  ADD CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `sp_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`),
  ADD CONSTRAINT `sp_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `sp_service`
--
ALTER TABLE `sp_service`
  ADD CONSTRAINT `sp_service_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  ADD CONSTRAINT `sp_service_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`),
  ADD CONSTRAINT `sp_service_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_master` (`order_id`),
  ADD CONSTRAINT `user_order_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  ADD CONSTRAINT `user_order_ibfk_3` FOREIGN KEY (`sp_id`) REFERENCES `sp` (`sp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
