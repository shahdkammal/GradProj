-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 10:27 AM
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
(9, 361, 'shahd', 'ahmed', 'shahd@gmail.com', '123456', 'shahd', 16),
(10, 363, 'abeer', 'ahmed', 'abeer@gmail.com', '+201063363362', 'suez', 16),
(11, 364, 'khalid', 'kamal', 'khalid@gmail.com', '1234', 'ss', 16),
(13, 366, 'amira', 'kammal', 'am@gmail.com', '123456', 'gggg', 45),
(16, 369, 'shahd', 'kamal', 'shahd.a.kamal.9@gmail.com', '+201025066554', 'حوض الدرس', 16),
(19, 405, 'tasnem', 'tasnem', 'tasnem@gmail.com', '32444444', 'zzzzzzz', 40),
(20, 407, 'mayada', 'hossam', 'mayada@gmail.com', '0103336654', 'new cairo', 1),
(21, 408, 'somaya', 'zidan', 'somaya@gmail.com', '0101010222', 'new valley', 45),
(22, 412, 'soha', 'soha', 'soha@gmail.com', '2222', 'ss', 40),
(23, 413, 'menna', 'selim', 'menna@gmail.com', '12345678', 'street', 29),
(24, 415, 'esraa', 'salah', 'esraa@gmail.com', '012341245', 'street22', 46),
(25, 418, 'amira', 'kamal', 'amira@gmail.com', '11222', 'aaa', 43),
(26, 421, 'toot', 'tt', 'to@gmail.com', '33', 'dd', 41),
(28, 423, 'shahd', 'kamal', 'shahd.a.kassmal.9@gmail.com', '01025066554', 'حوض الدرس', 16),
(29, 424, 'shahd', 'ahmed', 'shahdakammal1@gmail.com', '01025066554', 'حوض الدرس', 41),
(30, 426, 'heba', 'rawash', 'heba@gmail.com', '011111', 'ss', 41),
(31, 427, 'abeer', 'ahmed', 'abeer11@gmail.com', '01025066554', 'suez', 16),
(32, 428, 'amira', 'ahmed', 'amiraa@gmail.com', '+201033797553', 'حوض الدرس', 16),
(36, 434, 'kok', 'kok', 'kok@gmail.com', '01025066554', 'nasser st', 16),
(37, 436, 'amna', 'mohamed', 'amna@gmail.com', '112255', 'sss', 45),
(38, 437, 'Sarah', 'Mohamed', 'sarah@gmail.com', '+201033797553', 'suez', 16),
(39, 442, 'shah', 'a', 'shah@gmail.com', '22', '2d', 2),
(40, 444, 'Shahd ', 'Ahmed', 'shahdahmedd@gmail.com', '01025066554', 'شارع ناصر ', 16);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `priority` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `body`, `priority`, `type`) VALUES
(1, 'shahd', 'best service ever', 2, 2),
(10, 'amira', 'احسن شغل', 2, 1),
(23, 'amna', 'احسن موقع لخدمات المنزل', 2, 1),
(24, 'shah', 'shah', 2, 1),
(25, 'j', 'h', 2, 1),
(26, 'maram', 's', 2, 1),
(27, 'maram', 's', 2, 1),
(28, 'tara', 's', 2, 1),
(29, '', '', 2, 1),
(30, 'farahh', 'v', 2, 1),
(31, 'vr', 'sd', 2, 1),
(32, 'sos', 's', 2, 1),
(33, 'saah', 's', 2, 1),
(34, 'g', 's', 2, 1),
(35, 'g', 's', 2, 1),
(36, 'Shahd Ahmed Kamal', 's', 2, 1),
(37, 'saraa', 'a', 2, 1),
(38, 'hh', 'hh', 2, 1);

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
(335, 1, 'admin', '$2y$10$cN3ZSgu544VbF0U/Xk/96eEHlf.txlokPij7Qn5oe/dBAh2DrUwvO'),
(360, 3, 'shahdd123', '$2y$10$rX3QqlaPc1v0YD6ud0ygD.t/SYDlhr4tWEx8VcfMhuK62RtsJrG6C'),
(361, 3, 'shahd', '$2y$10$1u0FV4PAUGkN/UpDXB7sre5WZc5tpeaa0l8IFj9GeA8QvlfC3ZM5q'),
(362, 2, 'omar', '$2y$10$/1ti.EluXnp..pUUJAJ1weexK8Cy9dXuYHFQrxsVtvCCQkMFrEyGm'),
(363, 3, 'abeer', '$2y$10$TrOVxWTppbp6aZYNDlYAueU1JBigd.ihSoLyJOBSYU7XDM80vYXJW'),
(364, 3, 'khalid', '$2y$10$YyBko8BAF46eciX1JjlPw.1vcmvfVfSxA6iEWd4PFwicTE5/WcD4q'),
(366, 3, 'amira', '$2y$10$HjkHVmKoAMozHGKobK62weaEty2B9kJKVrJeObHp.0EWsMNyjtrEa'),
(367, 3, 'shahd_kammal', '$2y$10$mvzcU.MbET.lIeW/Uwp//OXg8w7xaXZR9W3C.wsOls7rornFp9bVe'),
(368, 3, 'shahd_kamall', '$2y$10$ldx4Wayo3XU.mJAimvjCweNQi/GdFsfsheUePTNtSC0IaSTLz3/I.'),
(369, 3, 'shahd_kammall', '$2y$10$nFtucm.7FbaQtbZT8Xz.K.gtwjQTC8I/KvtCFEn7rIYDwaUpRPer.'),
(370, 2, 'nada', '$2y$10$GDclsFbaOQYa8YU5XS6fPu..GQPAsEp4O5f4FhbPc9L/nvUrfLAXS'),
(376, 2, 'ibrahim_marzouk', '$2y$10$J5kbnrPNwbnQPOGBgQv2aOw1wETfhCSTAfmDbJ7V1O/fU8OMBQHva'),
(378, 2, 'Maged', '$2y$10$QuL3a3ik9Ya5a94NcSrLBefvRU9DcJQUw1Pv07LSLJkOb0WGaZDHK'),
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
(393, 2, 'mohamed_salem', '$2y$10$eWmnRURsLgQ1Reolsfnsu.wl6MshB0SWyoEEHGWiDVMft3H0N3IL.'),
(394, 2, 'ahmed_ibrahim', '$2y$10$lulBkwyYwzRHkzKv6ELWnum6E2IZF/o4EXd/MzMmauZptUGsZ.phK'),
(395, 2, 'ehab_samirr', '$2y$10$.J8ByCJZIj868gK4HzdIbuK2THxhzBVfnms6079CClV3aJoOAV4e6'),
(396, 2, 'saamia', '$2y$10$hiYUQdztiUp.iLni7Hzhruub0L5D5KM96nMMXMuadXv2ODLvYZqkC'),
(397, 2, 'zaghlolll', '$2y$10$yvsTvPLFjiR/6KYKEZvEu.2FoyJh00skOaWLMWcbSPICzD5xuhSUG'),
(398, 2, 'ali_saad', '$2y$10$LLZANGH1f7/nYVbtvI1hkuUuBlwLDddryVUAYe97SzlQPdOG9QG4.'),
(399, 3, 'shahdkamal', '$2y$10$RzQwwgh09.EJ/xLUAThaAOZr.1BqC2jggBuF11rr4kOgBeRMuo3L2'),
(400, 3, 'shahd_kamal1', '$2y$10$IeBlDVXBNnSV6CPrCVPuTOjLdOqOWlxpT1mohBdpERgMZDgT7tA4.'),
(401, 3, 'shahd11', '$2y$10$psF4lvOMpBCRybaaEb6Dd.ef8GOymzIvqKXBPM5cO8qI2ts85WgkS'),
(402, 3, 'aa12', '$2y$10$JSrBCKMP2lFeyDS3td2dKuiGow99B4WPyLb0Aj8SAjP3pecrTdfp.'),
(403, 3, 'shahd1234', '$2y$10$/MzdT.aXcIgFB7dcKOzR3O0lB8zE8qxaxkgAi4UZFqz7pv82L707.'),
(404, 3, 'maramm', '$2y$10$qSr61T6SEGKYwONxfrEW6eH7zN1xODDwimoN6tR/xKUpGhB1btmnW'),
(405, 3, 'tasnem', '$2y$10$LrzlMWGyzTUOEh/7ab7.i.Hqn4wHdJpGaosphiGdnpXmL1154QNSO'),
(407, 3, 'mayada1', '$2y$10$1Y94vQ5Wm3RrQiX93qC7AO/D3eeymo/Wqdyc5crNwVxjFwKFxCXUa'),
(408, 3, 'somaya@gmail.com', '$2y$10$pB3SkIXrlqq/BYvaUK1eq.DH6EB4zDgaoD7ycSKZ6p2cCMq/4stwS'),
(409, 2, 'ahmedawad', '$2y$10$O5Qngz0gRBj05PZG3.kLp.5QRFlsc17jyZ60v.48/5IHhyK1GPvNa'),
(412, 3, 'soha', '$2y$10$8rGD.OYjhan/8ceADJhceeFt6BWlvILC9T5dyWHHbQErhXxsTS6kS'),
(413, 3, 'menna', '$2y$10$rlEcYbf8i7pgBYdgolYMVO0MleeYKNs0dgnfkSk.LNm3pliBzuvBi'),
(415, 3, 'esraa', '$2y$10$J1eE3kmMPoXH9lxJsVXiEuUs1kkuVgOaHuhHZy8Naic0qo7KFP/7a'),
(418, 3, 'amirakamal', '$2y$10$RY4dCPdWSBdprtfgcBn/O.fERq64BS3LtQsyZJdeVusqOvNTMSyoS'),
(421, 3, 'toto', '$2y$10$YIgYS3uJmUDZI6n4E8pNjOS8e1zTVpHndruTKM8YCk4EZQLub7NI2'),
(422, 3, 'shahdahmed', '$2y$10$TU.auCdwX9cjpi5h1PR.fejPtRJ1Zth0GhyShpH/50NXQKtnwlXte'),
(423, 3, 'sssssss', '$2y$10$9AjkwabZKTRmo9ljfvctQOa6IImZm003uJ7IfeAHZpUvgz0ITwChG'),
(424, 3, 'shahdahmed11', '$2y$10$y5oAGGKqCp5Zy/E2aeq0t.hLYVYJyiywbKWu5Il9hF45s.EsT4EX6'),
(426, 3, 'hebarawash', '$2y$10$KjsL4wMglvg.IRZiOM6GC.vY2mQqIEeOU7NtkCvrnUjQomzE0UEPm'),
(427, 3, 'abeer123', '$2y$10$Csf7fXM/tC/DPEj0n0ZkKe.i7XvKVV.NH3vR6lHqg0SugPEt.hBG2'),
(428, 3, 'amiraa1', '$2y$10$/lyMxZvu1fA/j/l/p4O4meWqSYZaNkEQgAskx33vQzR6ScY0xGQdW'),
(430, 3, 'karma', '$2y$10$sx5/78RPGmnYALW2ASes1O/I61ijNvSfI/ya1s.KIM4PdMLsVcUG.'),
(432, 3, 'sosy', '$2y$10$sx5/78RPGmnYALW2ASes1O/I61ijNvSfI/ya1s.KIM4PdMLsVcUG.'),
(433, 3, 'shoshy', '$2y$10$MDj.a7ve9kMJy2zc93CDqO/AT7Q49nvndUb0aQxkL3PbyOfmB3JrK'),
(434, 3, 'kok12', '$2y$10$x3FACLZa4pSPfJ7vCEwcL.Ywbz4K4B2oyILfM3OfYh9pfm16KagAW'),
(436, 3, 'amnaa', '$2y$10$T.wZs6XepIZCjnOr1fWj/usVD..zazd7zSCbDMmvsYz7or1STXgM.'),
(437, 3, 'sarahh', '$2y$10$/lyMxZvu1fA/j/l/p4O4meWqSYZaNkEQgAskx33vQzR6ScY0xGQdW'),
(442, 3, 'shahh', '$2y$10$es8PuPHa39jD7j1U5TeH0eZmBZjAvizDMeAEyVxCM5tVJbWN2VW82'),
(443, 2, 'Ahmed', '$2y$10$ZPx20Pld.X2QVXqoAUiW1eltoJvo4e5iYg3RjCIwlGI6tYXbacJma'),
(444, 3, 'shahd_ahmed', '$2y$10$QsBs266dr9NgQEGTT2qoh.kChRA8yekIRyPM3NTE5ieIyHCO004ia'),
(445, 2, 'ad12', '$2y$10$ZZg3G8/o88/6NoGnMyK.S.Q9qrDHnDpdNBfJjSsRgmXXzBne.DxIW');

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
  `pay_mode` varchar(20) NOT NULL,
  `total` int(20) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`order_id`, `customer_id`, `full_name`, `phone`, `address`, `pay_mode`, `total`, `order_date`, `due_date`) VALUES
(29, 9, 'shahd', '123', 'shahd', 'COD', 856, '2024-11-25 12:02:21', '2024-11-27 22:32:00'),
(30, 10, 'abeer', '1234', 'suez', 'COD', 712, '2024-11-26 11:09:59', '2024-11-28 21:39:00'),
(31, 11, 'khalid', '122', 'sss', 'COD', 150, '2024-11-26 02:29:32', '2024-11-28 00:59:00'),
(33, 13, 'amira kammal', '123456', 'gggg', 'COD', 356, '2024-11-27 07:33:28', '2024-11-29 18:03:00'),
(34, 13, 'shahd ahmed', '123456', 'شبين ', 'COD', 150, '2024-11-27 08:31:18', '2024-11-28 19:01:00'),
(35, 16, 'shahd shahd', '123456', 'shahd', 'COD', 150, '2024-11-27 02:51:50', '2024-11-29 01:21:00'),
(36, 16, 'shahd ahmed', '01231125412', 'شبين', 'COD', 1155, '2024-11-28 12:03:50', '2024-11-29 22:33:00'),
(37, 16, 'shahd ahmed', '12345678', 'nas', 'COD', 350, '2024-12-01 10:38:56', '2024-12-04 21:08:00'),
(38, 16, 'shahd ahmed', '12345678', 'nas', 'COD', 350, '2024-12-01 10:39:01', '2024-12-04 21:08:00'),
(39, 16, 'shahd ahmed', '123456789', 'street 1', 'COD', 450, '2024-12-01 10:46:31', '2024-12-06 21:16:00'),
(40, 16, 'shahd kammall', '1234', 'asa', 'COD', 350, '2024-12-01 12:15:37', '2024-12-05 22:45:00'),
(41, 20, 'mayada', '0123545811', 'new cairo', 'COD', 950, '2024-12-05 04:27:12', '2024-12-26 12:57:00'),
(42, 16, 'shahd shahd', '123456', 'shahd', 'COD', 5950, '2024-12-05 04:43:48', '2025-01-03 03:13:00'),
(43, 21, 'somaya', '12333', 'ss', 'COD', 300, '2024-12-05 04:47:37', '2025-01-10 03:17:00'),
(44, 22, 'soha', '2222222', 'dddd', 'COD', 550, '2024-12-05 05:06:10', '2024-12-25 15:39:00'),
(45, 23, 'menna', '123456', 'street', 'COD', 300, '2024-12-05 05:09:38', '2024-12-30 03:39:00'),
(46, 24, 'esraa', '123444', 'street22', 'COD', 5250, '2024-12-05 05:16:25', '2024-12-18 15:46:00'),
(47, 25, 'amira', '1233', 'sss', 'COD', 900, '2024-12-08 01:44:41', '2024-12-16 16:14:00'),
(48, 16, 'shahd kamal', '01025066554', 'حوض الدرس', 'COD', 1550, '2024-12-11 01:16:43', '2025-01-08 11:46:00'),
(49, 16, 'shahd kamal', '01025066554', 'suez', 'COD', 5000, '2024-12-11 01:17:14', '2024-12-31 11:47:00'),
(50, 37, 'amna', '444', 'aaa', 'COD', 450, '2024-12-12 09:25:48', '2024-12-12 19:55:00'),
(51, 38, 'sarah', '+201033797553', 'حوض الدرس', 'COD', 650, '2024-12-15 03:05:33', '2024-12-26 13:34:00'),
(52, 38, 'sarah', '+201033797553', 'nasser st', 'COD', 250, '2024-12-15 03:06:19', '2024-12-31 13:36:00'),
(53, 38, 'sosy', '01033797553', 'ss', 'COD', 30, '2024-12-15 03:22:21', '2024-12-30 13:52:00'),
(54, 16, 'shahd kamal', '01025066554', 'حوض الدرس', 'COD', 2500, '2024-12-17 12:50:10', '2024-12-24 23:20:00'),
(55, 38, 'amira kamal', '01025066554', 'حوض الدرس', 'COD', 2500, '2024-12-17 12:50:57', '2024-12-24 23:20:00'),
(56, 16, 'shahd ahmed', '01025066554', 'suez egy', 'COD', 250, '2024-12-17 02:50:49', '2024-12-31 01:20:00'),
(57, 16, 'shahd kamallll', '01025066554', 'حوض الدرس', 'COD', 600, '2024-12-18 02:45:09', '2024-12-31 13:15:00'),
(58, 16, 'Shahd Ahmed', '01025066554', 'Suez, Egypt', 'COD', 250, '2024-12-18 04:11:38', '2024-12-23 14:41:00'),
(59, 16, 'shahd kamal', '01025066554', 'حوض الدرس', 'COD', 5000, '2024-12-18 04:14:23', '2024-12-26 14:44:00'),
(60, 40, 'Shahd Ahmed Kamal', '01025066554', 'شارع ناصر- السويس', 'COD', 1800, '2024-12-18 04:30:07', '2024-12-18 15:00:00'),
(61, 40, 'Maram Mohamed', '01023456789', 'شبين - الاسماعيلية', 'COD', 1800, '2024-12-18 04:31:14', '2024-12-24 18:15:00'),
(62, 40, 'محمد فتحي', '01010101011', 'مدينة نصر', 'COD', 1800, '2024-12-18 04:31:54', '2024-12-25 15:01:00'),
(63, 40, 'Ibrahim Saad', '01124444444', '5th Settlement- Cairo', 'COD', 1800, '2024-12-18 04:32:55', '2024-12-22 15:02:00'),
(64, 40, 'Mohamed Kamel', '01122334455', 'Sheikh Zayed City- Giza', 'COD', 1800, '2024-12-18 04:48:03', '2024-12-25 17:20:00'),
(65, 40, 'Khalid Mohsen', '01233333333', 'فاقوس - الشرقية', 'COD', 7200, '2024-12-18 04:50:28', '2024-12-24 16:20:00'),
(66, 16, 'shahd kamal', '01025066554', 'حوض الدرس', 'COD', 350, '2024-12-18 10:14:24', '2024-12-23 20:44:00');

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
(58, 104, 'Individual Room Painting', 1),
(59, 89, 'Furniture', 1);

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
(89, 397, 'Zaghlol Fathy', 'zaghlol@gmail.com', '01002222222', 48, 'active'),
(90, 398, 'Ali Saad', 'ali@gmail.com', '01022222222', 43, 'active'),
(108, 443, 'Ahmed Salama', 'ahmedsalama@gmail.com', '01035412345', 41, 'active'),
(109, 445, 'adad', 'ad@gmail.com', '22', 41, 'deactive');

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
(87, 57, 88, 'Expert Water Heater Services', '500', 'Offering top-tier water heater installations, repairs, and maintenance. Experience peace of mind knowing your hot water needs are in expert hands, ensuring a seamless and reliable experience every time.', 1),
(88, 12, 84, 'Complete Home Cleaning Services', '400', 'Experience impeccable cleanliness with my thorough home cleaning services. Every nook and cranny receives my expert attention, ensuring a refreshed and spotless living environment that sparkles with cleanliness and care.', 1),
(89, 13, 84, 'Fresh & Flawless: Sofa & Carpet Care', '250', 'Ensuring your sofas and carpets look and feel brand new. We prioritize your health and comfort by using non-toxic, pet-friendly products. Revel in the freshness of a perfectly clean home.', 1),
(90, 49, 89, 'Professional Table & Chairs Design', '2500', 'I create and repair tables and chairs of all styles and sizes, offering quality craftsmanship to deliver durable and aesthetically pleasing results for your dining or workspaces.', 1),
(108, 49, 89, 'Best Table & Chairs Design', '1800', 'I specialize in crafting professional and meticulously designed tables and chairs to elevate any space.', 1);

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
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `service_id`, `sp_id`, `service_title`, `price`, `qty`, `status`) VALUES
(37, 25, 76, 'AC & Fan Repairing', '350', 1, 'pending'),
(39, 58, 84, 'Individual Rooms', '450', 1, 'pending'),
(40, 47, 72, 'Professional Kitchen Cleaning', '350', 1, 'pending'),
(41, 46, 73, 'Sparkling Bathroom Cleaning', '250', 1, 'pending'),
(41, 47, 72, 'Professional Kitchen Cleaning', '350', 2, 'pending'),
(42, 31, 75, 'Drainage Pipes', '300', 1, 'completed'),
(42, 42, 68, 'Professional Painter', '5000', 1, 'completed'),
(42, 51, 79, 'Sink and Toilet', '250', 1, 'pending'),
(42, 54, 81, 'Door Painting', '400', 1, 'pending'),
(43, 31, 75, 'Drainage Pipes', '300', 1, 'pending'),
(44, 23, 77, 'Switch and Socket Installations', '250', 1, 'rejected'),
(44, 31, 75, 'Drainage Pipes', '300', 1, 'pending'),
(45, 31, 75, 'Drainage Pipes', '300', 1, 'rejected'),
(46, 23, 77, 'Switch and Socket Installations', '250', 1, 'completed'),
(46, 42, 68, 'Professional Painter', '5000', 1, 'rejected'),
(47, 25, 76, 'AC & Fan Repairing', '350', 1, 'pending'),
(47, 31, 75, 'Drainage Pipes', '300', 1, 'uncompleted'),
(47, 51, 79, 'Sink and Toilet', '250', 1, 'pending'),
(48, 25, 76, 'AC & Fan Repairing', '350', 1, 'pending'),
(48, 48, 70, 'Glass installation', '250', 4, 'pending'),
(48, 50, 71, 'Bed Repair & Assembly', '200', 1, 'pending'),
(49, 49, 90, 'Professional Table & Chairs Design', '2500', 2, 'inprogress'),
(50, 48, 70, 'Glass installation', '250', 1, 'pending'),
(50, 50, 71, 'Bed Repair & Assembly', '200', 1, 'pending'),
(51, 25, 76, 'AC & Fan Repairing', '350', 1, 'completed'),
(51, 31, 75, 'Drainage Pipes', '300', 1, 'pending'),
(52, 23, 77, 'Switch and Socket Installations', '250', 1, 'pending'),
(54, 49, 90, 'Professional Table & Chairs Design', '2500', 1, 'pending'),
(55, 49, 90, 'Professional Table & Chairs Design', '2500', 1, 'pending'),
(56, 48, 70, 'Glass installation', '250', 1, 'completed'),
(57, 23, 77, 'Switch and Socket Installations', '250', 1, 'pending'),
(57, 25, 76, 'AC & Fan Repairing', '350', 1, 'pending'),
(58, 51, 79, 'Sink and Toilet', '250', 1, 'pending'),
(59, 42, 68, 'Professional Painter', '5000', 1, 'pending'),
(60, 49, 108, 'Best Table & Chairs Design', '1800', 1, 'completed'),
(61, 49, 108, 'Best Table & Chairs Design', '1800', 1, 'pending'),
(62, 49, 108, 'Best Table & Chairs Design', '1800', 1, 'completed'),
(63, 49, 108, 'Best Table & Chairs Design', '1800', 1, 'rejected'),
(64, 49, 108, 'Best Table & Chairs Design', '1800', 1, 'uncompleted'),
(65, 49, 108, 'Best Table & Chairs Design', '1800', 4, 'completed'),
(66, 47, 72, 'Professional Kitchen Cleaning', '350', 1, 'pending');

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
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
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
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `sp`
--
ALTER TABLE `sp`
  MODIFY `sp_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

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
