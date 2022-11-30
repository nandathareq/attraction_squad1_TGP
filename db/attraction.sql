-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 11:21 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attraction`
--

-- --------------------------------------------------------

--
-- Table structure for table `attraction_facility`
--

CREATE TABLE `attraction_facility` (
  `attraction_place_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attraction_place`
--

CREATE TABLE `attraction_place` (
  `attraction_place_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `close_hour` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lattitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `open_hour` varchar(255) DEFAULT NULL,
  `place_name` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attraction_review`
--

CREATE TABLE `attraction_review` (
  `attraction_review_id` int(11) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `place_rating` int(11) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `attraction_schedule`
--

CREATE TABLE `attraction_schedule` (
  `attraction_schedule_id` int(11) NOT NULL,
  `attraction_date` varchar(255) DEFAULT NULL,
  `available_ticket` int(11) DEFAULT NULL,
  `attraction_place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grand_invoice`
--

CREATE TABLE `grand_invoice` (
  `grand_invoice__id` int(11) NOT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `raised_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grand_invoice`
--

INSERT INTO `grand_invoice` (`grand_invoice__id`, `due_date`, `grand_total`, `raised_date`, `status`, `user_id`) VALUES
(1, '2022-11-29T18:56Z', 12000000, '2022-11-29T17:56Z', 'UNPAID', 1),
(2, '2022-11-29T18:57Z', 12000000, '2022-11-29T17:57Z', 'UNPAID', 1),
(3, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(4, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(5, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(6, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(7, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(8, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(9, '2022-11-29T18:58Z', 12000000, '2022-11-29T17:58Z', 'UNPAID', 1),
(10, '2022-11-29T18:59Z', 12000000, '2022-11-29T17:59Z', 'UNPAID', 1),
(11, '2022-11-29T18:59Z', 12000000, '2022-11-29T17:59Z', 'UNPAID', 1),
(12, '2022-11-29T19:01Z', 12000000, '2022-11-29T18:01Z', 'UNPAID', 1),
(13, '2022-11-29T19:02Z', 12000000, '2022-11-29T18:02Z', 'UNPAID', 1),
(14, '2022-11-29T19:03Z', 12000000, '2022-11-29T18:03Z', 'UNPAID', 1),
(15, '2022-11-29T19:04Z', 12000000, '2022-11-29T18:04Z', 'UNPAID', 1),
(16, '2022-11-29T19:07Z', 12000000, '2022-11-29T18:07Z', 'UNPAID', 1),
(17, '2022-11-29T19:08Z', 12000000, '2022-11-29T18:08Z', 'UNPAID', 1),
(18, '2022-11-29T19:12Z', 12000000, '2022-11-29T18:12Z', 'UNPAID', 1),
(19, '2022-11-30T00:08Z', 12000000, '2022-11-29T23:08Z', 'UNPAID', 1),
(20, '2022-11-30T00:10Z', 12000000, '2022-11-29T23:10Z', 'UNPAID', 1),
(21, '2022-11-30T00:15Z', 12000000, '2022-11-29T23:15Z', 'UNPAID', 1),
(22, '2022-11-30T00:15Z', 12000000, '2022-11-29T23:15Z', 'UNPAID', 1),
(23, '2022-11-30T00:15Z', 12000000, '2022-11-29T23:15Z', 'UNPAID', 1),
(24, '2022-11-30T00:16Z', 12000000, '2022-11-29T23:16Z', 'UNPAID', 1),
(25, '2022-11-30T00:16Z', 12000000, '2022-11-29T23:16Z', 'UNPAID', 1),
(26, '2022-11-30T00:17Z', 12000000, '2022-11-29T23:17Z', 'UNPAID', 1),
(27, '2022-11-30T00:18Z', 12000000, '2022-11-29T23:18Z', 'UNPAID', 1),
(28, '2022-11-30T00:25Z', 12000000, '2022-11-29T23:25Z', 'UNPAID', 1),
(29, '2022-11-30T00:25Z', 12000000, '2022-11-29T23:25Z', 'UNPAID', 1),
(30, '2022-11-30T00:25Z', 12000000, '2022-11-29T23:25Z', 'UNPAID', 1),
(31, '2022-11-30T00:25Z', 12000000, '2022-11-29T23:25Z', 'UNPAID', 1),
(32, '2022-11-30T09:40Z', 12000000, '2022-11-30T08:40Z', 'UNPAID', 1),
(33, '2022-11-30T09:40Z', 12000000, '2022-11-30T08:40Z', 'UNPAID', 1),
(34, '2022-11-30T15:44Z', 12000000, '2022-11-30T14:44Z', 'UNPAID', 1),
(35, '2022-11-30T15:44Z', 12000000, '2022-11-30T14:44Z', 'UNPAID', 1),
(36, '2022-11-30T15:51Z', 12000000, '2022-11-30T14:51Z', 'UNPAID', 1);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary`
--

CREATE TABLE `itinerary` (
  `itinerary_id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `itinerary_name` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_items`
--

CREATE TABLE `itinerary_items` (
  `itinerary_items_id` int(11) NOT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `itinerary_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_invoice`
--

CREATE TABLE `sub_invoice` (
  `sub_invoice_id` int(11) NOT NULL,
  `booking_code` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `raised_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `grand_invoice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paid_date` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `id_transaction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_invoice`
--

INSERT INTO `sub_invoice` (`sub_invoice_id`, `booking_code`, `due_date`, `raised_date`, `status`, `total`, `grand_invoice_id`, `user_id`, `paid_date`, `account_number`, `id_transaction`) VALUES
(1, 'gb14lo', '2022-11-30T15:44Z', '2022-11-30T14:44Z', 'UNPAID', 12000000, 35, 1, '2022-11-30T14:44Z', '874425363', '278364872'),
(2, '5uhbb1', '2022-11-30T15:51Z', '2022-11-30T14:51Z', 'UNPAID', 12000000, 36, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_invoice_items`
--

CREATE TABLE `sub_invoice_items` (
  `sub_invoice_item_id` int(11) NOT NULL,
  `attraction_place_id` int(11) DEFAULT NULL,
  `place_name` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `sub_invoice_id` int(11) NOT NULL,
  `attraction_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_invoice_items`
--

INSERT INTO `sub_invoice_items` (`sub_invoice_item_id`, `attraction_place_id`, `place_name`, `qty`, `sub_total`, `sub_invoice_id`, `attraction_date`) VALUES
(1, 1, 'dufan', 4, 600000, 1, '2022-11-28T10:46Z'),
(2, 2, 'tmii', 4, 600000, 1, '2022-11-28T10:46Z'),
(3, 1, 'dufan', 4, 600000, 2, '2022-11-28T10:46Z'),
(4, 2, 'tmii', 4, 600000, 2, '2022-11-28T10:46Z');

-- --------------------------------------------------------

--
-- Table structure for table `sub_invoice_item_ticket`
--

CREATE TABLE `sub_invoice_item_ticket` (
  `sub_invoice_item_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `attraction_place_id` int(11) NOT NULL,
  `place_name` varchar(255) NOT NULL,
  `attraction_date` varchar(255) DEFAULT NULL,
  `booking_code` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `attraction_place_id`, `place_name`, `attraction_date`, `booking_code`, `user_id`, `ticket_code`) VALUES
(1, 1, 'dufan', '2022-11-28', 'gb14lo', 1, '00000001');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `first_name`, `last_name`, `mobile_number`, `password`) VALUES
(1, 'qj32@mail.com', '123456', 'qj', '32', '94713336919\r'),
(2, 'ax59@mail.com', '123456', 'ax', '59', '91762198005\r'),
(3, 'pv15@mail.com', '123456', 'pv', '15', '77201414989\r'),
(4, 'vd42@mail.com', '123456', 'vd', '42', '95453961475\r'),
(5, 'qi54@mail.com', '123456', 'qi', '54', '10953650214\r'),
(6, 'ki42@mail.com', '123456', 'ki', '42', '74165114374\r'),
(7, 'ri17@mail.com', '123456', 'ri', '17', '15883550680\r'),
(8, 'mk12@mail.com', '123456', 'mk', '12', '46907404691\r'),
(9, 'po17@mail.com', '123456', 'po', '17', '71306685259\r'),
(10, 'mx64@mail.com', '123456', 'mx', '64', '56249976769\r'),
(11, 'pm30@mail.com', '123456', 'pm', '30', '54909163781\r'),
(12, 'ol20@mail.com', '123456', 'ol', '20', '58778390396\r'),
(13, 'mc56@mail.com', '123456', 'mc', '56', '13473876340\r'),
(14, 'tn23@mail.com', '123456', 'tn', '23', '56829991301\r'),
(15, 'yp31@mail.com', '123456', 'yp', '31', '98097419380\r'),
(16, 'ee41@mail.com', '123456', 'ee', '41', '32776205072\r'),
(17, 'hb63@mail.com', '123456', 'hb', '63', '54139872600\r'),
(18, 'ia34@mail.com', '123456', 'ia', '34', '71672420753\r'),
(19, 'rp50@mail.com', '123456', 'rp', '50', '90118667787\r'),
(20, 'we55@mail.com', '123456', 'we', '55', '74094615231\r'),
(21, 'cw58@mail.com', '123456', 'cw', '58', '80435308362\r'),
(22, 'md34@mail.com', '123456', 'md', '34', '78662845008\r'),
(23, 'ed17@mail.com', '123456', 'ed', '17', '23900256713\r'),
(24, 'st54@mail.com', '123456', 'st', '54', '42908498083\r'),
(25, 'tr60@mail.com', '123456', 'tr', '60', '63805705322\r'),
(26, 'fm10@mail.com', '123456', 'fm', '10', '71915755397\r'),
(27, 'ov36@mail.com', '123456', 'ov', '36', '95540387246\r'),
(28, 'fy60@mail.com', '123456', 'fy', '60', '76461558649\r'),
(29, 'rs15@mail.com', '123456', 'rs', '15', '24605761684\r'),
(30, 'xi43@mail.com', '123456', 'xi', '43', '56275719299\r'),
(31, 'xk15@mail.com', '123456', 'xk', '15', '21293631165\r'),
(32, 'pn60@mail.com', '123456', 'pn', '60', '89462932170\r'),
(33, 'sh51@mail.com', '123456', 'sh', '51', '58252908314\r'),
(34, 'pw62@mail.com', '123456', 'pw', '62', '46151976307\r'),
(35, 'll53@mail.com', '123456', 'll', '53', '63715252209\r'),
(36, 'os27@mail.com', '123456', 'os', '27', '62972395617\r'),
(37, 'av13@mail.com', '123456', 'av', '13', '56246837008\r'),
(38, 'es51@mail.com', '123456', 'es', '51', '45129652295\r'),
(39, 'is48@mail.com', '123456', 'is', '48', '36519298850\r'),
(40, 'cn46@mail.com', '123456', 'cn', '46', '74476637151\r'),
(41, 'uj35@mail.com', '123456', 'uj', '35', '37884930920\r'),
(42, 'qy30@mail.com', '123456', 'qy', '30', '95308802720\r'),
(43, 'kd38@mail.com', '123456', 'kd', '38', '50222861162\r'),
(44, 'ew11@mail.com', '123456', 'ew', '11', '34347357345\r'),
(45, 'uv17@mail.com', '123456', 'uv', '17', '50983752263\r'),
(46, 'sg55@mail.com', '123456', 'sg', '55', '57813221481\r'),
(47, 'qq65@mail.com', '123456', 'qq', '65', '33153709363\r'),
(48, 'gt11@mail.com', '123456', 'gt', '11', '16389201009\r'),
(49, 'xa11@mail.com', '123456', 'xa', '11', '62436567339\r'),
(50, 'wl12@mail.com', '123456', 'wl', '12', '68412176659\r'),
(51, 'ao29@mail.com', '123456', 'ao', '29', '34889456603\r'),
(52, 'vo57@mail.com', '123456', 'vo', '57', '22650143434\r'),
(53, 'um30@mail.com', '123456', 'um', '30', '11924413980\r'),
(54, 'ou17@mail.com', '123456', 'ou', '17', '24704259477\r'),
(55, 'ap52@mail.com', '123456', 'ap', '52', '11689713582\r'),
(56, 'tr13@mail.com', '123456', 'tr', '13', '25211879894\r'),
(57, 'hu57@mail.com', '123456', 'hu', '57', '44594441484\r'),
(58, 'vp36@mail.com', '123456', 'vp', '36', '83810157800\r'),
(59, 'bp11@mail.com', '123456', 'bp', '11', '66008427573\r'),
(60, 'ku12@mail.com', '123456', 'ku', '12', '70142292228\r'),
(61, 'eo27@mail.com', '123456', 'eo', '27', '61037178121\r'),
(62, 'mg21@mail.com', '123456', 'mg', '21', '32011790503\r'),
(63, 'ot45@mail.com', '123456', 'ot', '45', '64639823425\r'),
(64, 'tx20@mail.com', '123456', 'tx', '20', '71313591328\r'),
(65, 'vy63@mail.com', '123456', 'vy', '63', '85377906284\r'),
(66, 'ob23@mail.com', '123456', 'ob', '23', '90288264040\r'),
(67, 'tn20@mail.com', '123456', 'tn', '20', '12574789137\r'),
(68, 'if58@mail.com', '123456', 'if', '58', '24271559371\r'),
(69, 'xc19@mail.com', '123456', 'xc', '19', '94789250367\r'),
(70, 'ty65@mail.com', '123456', 'ty', '65', '72201137542\r'),
(71, 'fc49@mail.com', '123456', 'fc', '49', '62143373559\r'),
(72, 'da41@mail.com', '123456', 'da', '41', '42859640610\r'),
(73, 'sj14@mail.com', '123456', 'sj', '14', '46280707447\r'),
(74, 'mm50@mail.com', '123456', 'mm', '50', '43056807762\r'),
(75, 'ey61@mail.com', '123456', 'ey', '61', '49509488822\r'),
(76, 'vl11@mail.com', '123456', 'vl', '11', '93791254565\r'),
(77, 'so12@mail.com', '123456', 'so', '12', '49036975851\r'),
(78, 'tn28@mail.com', '123456', 'tn', '28', '71805150215\r'),
(79, 'bd35@mail.com', '123456', 'bd', '35', '93080635061\r'),
(80, 'hu26@mail.com', '123456', 'hu', '26', '46864230428\r'),
(81, 'au62@mail.com', '123456', 'au', '62', '23169361674\r'),
(82, 'tn59@mail.com', '123456', 'tn', '59', '19626777815\r'),
(83, 'gx14@mail.com', '123456', 'gx', '14', '30915290006\r'),
(84, 'dw10@mail.com', '123456', 'dw', '10', '51013986528\r'),
(85, 'qb37@mail.com', '123456', 'qb', '37', '98178868349\r'),
(86, 'gk23@mail.com', '123456', 'gk', '23', '61618903360\r'),
(87, 'gd24@mail.com', '123456', 'gd', '24', '86694831037\r'),
(88, 'll10@mail.com', '123456', 'll', '10', '98891803668\r'),
(89, 'vg34@mail.com', '123456', 'vg', '34', '56941799323\r'),
(90, 'fo20@mail.com', '123456', 'fo', '20', '50574717185\r'),
(91, 'yw11@mail.com', '123456', 'yw', '11', '46320582259\r'),
(92, 'jo37@mail.com', '123456', 'jo', '37', '95191566166\r'),
(93, 'je28@mail.com', '123456', 'je', '28', '23568928928\r'),
(94, 'jf26@mail.com', '123456', 'jf', '26', '84265616302\r'),
(95, 'fo31@mail.com', '123456', 'fo', '31', '99723104190\r'),
(96, 'ka36@mail.com', '123456', 'ka', '36', '56376869437\r'),
(97, 'af47@mail.com', '123456', 'af', '47', '25931421531\r'),
(98, 'eu46@mail.com', '123456', 'eu', '46', '70177246377\r'),
(99, 'xs31@mail.com', '123456', 'xs', '31', '44940868639\r'),
(100, 'bi29@mail.com', '123456', 'bi', '29', '92042117933\r'),
(101, 'ao44@mail.com', '123456', 'ao', '44', '46181404032\r'),
(102, 'rd17@mail.com', '123456', 'rd', '17', '64163342840\r'),
(103, 'je57@mail.com', '123456', 'je', '57', '54036486341\r'),
(104, 'yr41@mail.com', '123456', 'yr', '41', '20586662276\r'),
(105, 'xc59@mail.com', '123456', 'xc', '59', '35091921787\r'),
(106, 'ng39@mail.com', '123456', 'ng', '39', '31936582497\r'),
(107, 'og50@mail.com', '123456', 'og', '50', '12945479943\r'),
(108, 'lp63@mail.com', '123456', 'lp', '63', '24393549408\r'),
(109, 'si22@mail.com', '123456', 'si', '22', '18534633044\r'),
(110, 'ig65@mail.com', '123456', 'ig', '65', '44862381928\r'),
(111, 'gx46@mail.com', '123456', 'gx', '46', '49783519906\r'),
(112, 'fn10@mail.com', '123456', 'fn', '10', '82216884587\r'),
(113, 'ty56@mail.com', '123456', 'ty', '56', '86913721957\r'),
(114, 'xl40@mail.com', '123456', 'xl', '40', '53988804039\r'),
(115, 'we41@mail.com', '123456', 'we', '41', '28734965906\r'),
(116, 'ag57@mail.com', '123456', 'ag', '57', '78969529063\r'),
(117, 'ea28@mail.com', '123456', 'ea', '28', '80876335276\r'),
(118, 'rq51@mail.com', '123456', 'rq', '51', '28765559065\r'),
(119, 'kp39@mail.com', '123456', 'kp', '39', '39044681321\r'),
(120, 'au31@mail.com', '123456', 'au', '31', '85608482253\r'),
(121, 'jr15@mail.com', '123456', 'jr', '15', '69121772763\r'),
(122, 'ei17@mail.com', '123456', 'ei', '17', '99392911372\r'),
(123, 'jl14@mail.com', '123456', 'jl', '14', '61219713357\r'),
(124, 'bp13@mail.com', '123456', 'bp', '13', '54306922247\r'),
(125, 'nb57@mail.com', '123456', 'nb', '57', '36625786437\r'),
(126, 'ya50@mail.com', '123456', 'ya', '50', '94239328381\r'),
(127, 'la55@mail.com', '123456', 'la', '55', '74992356427\r'),
(128, 'bn17@mail.com', '123456', 'bn', '17', '86614203474\r'),
(129, 'ex29@mail.com', '123456', 'ex', '29', '14111668715\r'),
(130, 'hs30@mail.com', '123456', 'hs', '30', '46300432934\r'),
(131, 'pm10@mail.com', '123456', 'pm', '10', '96115241326\r'),
(132, 'sn31@mail.com', '123456', 'sn', '31', '24804835361\r'),
(133, 'vh40@mail.com', '123456', 'vh', '40', '12068634530\r'),
(134, 'fx40@mail.com', '123456', 'fx', '40', '25098945439\r'),
(135, 'cu23@mail.com', '123456', 'cu', '23', '11566317805\r'),
(136, 'ay19@mail.com', '123456', 'ay', '19', '19086690795\r'),
(137, 'rk49@mail.com', '123456', 'rk', '49', '45159827499\r'),
(138, 'ap40@mail.com', '123456', 'ap', '40', '13016227124\r'),
(139, 'lk22@mail.com', '123456', 'lk', '22', '95235623107\r'),
(140, 'xu37@mail.com', '123456', 'xu', '37', '55906118243\r'),
(141, 'sh33@mail.com', '123456', 'sh', '33', '15318605224\r'),
(142, 'ku39@mail.com', '123456', 'ku', '39', '27478260720\r'),
(143, 'jr62@mail.com', '123456', 'jr', '62', '48645354059\r'),
(144, 'iq60@mail.com', '123456', 'iq', '60', '54997956338\r'),
(145, 'jf37@mail.com', '123456', 'jf', '37', '54377383811\r'),
(146, 'wa47@mail.com', '123456', 'wa', '47', '82932729904\r'),
(147, 'dy43@mail.com', '123456', 'dy', '43', '13803885272\r'),
(148, 'mx10@mail.com', '123456', 'mx', '10', '95413674758\r'),
(149, 'ms44@mail.com', '123456', 'ms', '44', '59525546663\r'),
(150, 'db39@mail.com', '123456', 'db', '39', '59091383834\r'),
(151, 'cl45@mail.com', '123456', 'cl', '45', '97733601061\r'),
(152, 'bd44@mail.com', '123456', 'bd', '44', '83199390246\r'),
(153, 'fr17@mail.com', '123456', 'fr', '17', '57433247653\r'),
(154, 'ow14@mail.com', '123456', 'ow', '14', '14350698098\r'),
(155, 'hq17@mail.com', '123456', 'hq', '17', '10763233635\r'),
(156, 'ui37@mail.com', '123456', 'ui', '37', '85935731580\r'),
(157, 'vt57@mail.com', '123456', 'vt', '57', '85354963735\r'),
(158, 'rj15@mail.com', '123456', 'rj', '15', '65863768415\r'),
(159, 'bk15@mail.com', '123456', 'bk', '15', '83152725146\r'),
(160, 'wh15@mail.com', '123456', 'wh', '15', '61813252323\r'),
(161, 'xh23@mail.com', '123456', 'xh', '23', '10029977076\r'),
(162, 'hv18@mail.com', '123456', 'hv', '18', '60183498399\r'),
(163, 'au49@mail.com', '123456', 'au', '49', '87101156179\r'),
(164, 'lx64@mail.com', '123456', 'lx', '64', '73469515193\r'),
(165, 'kl13@mail.com', '123456', 'kl', '13', '87711491796\r'),
(166, 'lm42@mail.com', '123456', 'lm', '42', '90952567732\r'),
(167, 'xq18@mail.com', '123456', 'xq', '18', '53746108254\r'),
(168, 'ca32@mail.com', '123456', 'ca', '32', '29250596872\r'),
(169, 'tj41@mail.com', '123456', 'tj', '41', '31132415377\r'),
(170, 'hp49@mail.com', '123456', 'hp', '49', '62545492071\r'),
(171, 'nv44@mail.com', '123456', 'nv', '44', '97178552923\r'),
(172, 'su65@mail.com', '123456', 'su', '65', '87113887080\r'),
(173, 'gk22@mail.com', '123456', 'gk', '22', '41732559841\r'),
(174, 'ed32@mail.com', '123456', 'ed', '32', '31153810996\r'),
(175, 'ar59@mail.com', '123456', 'ar', '59', '60084385035\r'),
(176, 'qu30@mail.com', '123456', 'qu', '30', '88865280752\r'),
(177, 'kb56@mail.com', '123456', 'kb', '56', '87967542751\r'),
(178, 'oj47@mail.com', '123456', 'oj', '47', '17217365367\r'),
(179, 'xm10@mail.com', '123456', 'xm', '10', '88062242753\r'),
(180, 'tu49@mail.com', '123456', 'tu', '49', '14912787129\r'),
(181, 'ob58@mail.com', '123456', 'ob', '58', '33027593134\r'),
(182, 'ch33@mail.com', '123456', 'ch', '33', '75683550372\r'),
(183, 'of59@mail.com', '123456', 'of', '59', '22183881899\r'),
(184, 'nd28@mail.com', '123456', 'nd', '28', '52247504621\r'),
(185, 'rb43@mail.com', '123456', 'rb', '43', '87766592394\r'),
(186, 'tb18@mail.com', '123456', 'tb', '18', '83003755638\r'),
(187, 'vp55@mail.com', '123456', 'vp', '55', '21880497200\r'),
(188, 'ya49@mail.com', '123456', 'ya', '49', '60838235229\r'),
(189, 'xb12@mail.com', '123456', 'xb', '12', '97187405288\r'),
(190, 'ik48@mail.com', '123456', 'ik', '48', '72348928695\r'),
(191, 'sy35@mail.com', '123456', 'sy', '35', '82726908025\r'),
(192, 'ph12@mail.com', '123456', 'ph', '12', '46139637395\r'),
(193, 'hu31@mail.com', '123456', 'hu', '31', '61277281062\r'),
(194, 'mu44@mail.com', '123456', 'mu', '44', '80959423152\r'),
(195, 'nv43@mail.com', '123456', 'nv', '43', '96167351175\r'),
(196, 'os51@mail.com', '123456', 'os', '51', '27901341078\r'),
(197, 'ip18@mail.com', '123456', 'ip', '18', '83542329799\r'),
(198, 'ii37@mail.com', '123456', 'ii', '37', '26097517890\r'),
(199, 'uq39@mail.com', '123456', 'uq', '39', '50796348320\r'),
(200, 'dl58@mail.com', '123456', 'dl', '58', '57989273902\r'),
(201, 'sf65@mail.com', '123456', 'sf', '65', '33028104081\r'),
(202, 'gu25@mail.com', '123456', 'gu', '25', '58519218615\r'),
(203, 'fc53@mail.com', '123456', 'fc', '53', '87224340651\r'),
(204, 'if33@mail.com', '123456', 'if', '33', '82394772192\r'),
(205, 'qg20@mail.com', '123456', 'qg', '20', '38183441031\r'),
(206, 'au35@mail.com', '123456', 'au', '35', '64954378091\r'),
(207, 'ou27@mail.com', '123456', 'ou', '27', '51119808330\r'),
(208, 'jk36@mail.com', '123456', 'jk', '36', '85138775741\r'),
(209, 'jv44@mail.com', '123456', 'jv', '44', '73350944811\r'),
(210, 'xc54@mail.com', '123456', 'xc', '54', '73488796389\r'),
(211, 'ys60@mail.com', '123456', 'ys', '60', '11495717309\r'),
(212, 'ik41@mail.com', '123456', 'ik', '41', '74269530115\r'),
(213, 'wa48@mail.com', '123456', 'wa', '48', '71236214660\r'),
(214, 'gx49@mail.com', '123456', 'gx', '49', '98337387468\r'),
(215, 'mn16@mail.com', '123456', 'mn', '16', '83808561108\r'),
(216, 'gy63@mail.com', '123456', 'gy', '63', '32638445348\r'),
(217, 'un19@mail.com', '123456', 'un', '19', '37157748557\r'),
(218, 'da45@mail.com', '123456', 'da', '45', '52929823428\r'),
(219, 'tf52@mail.com', '123456', 'tf', '52', '79936890122\r'),
(220, 'hy39@mail.com', '123456', 'hy', '39', '68652684834\r'),
(221, 'yq44@mail.com', '123456', 'yq', '44', '23397877564\r'),
(222, 'it46@mail.com', '123456', 'it', '46', '22755792755\r'),
(223, 'id56@mail.com', '123456', 'id', '56', '69618846033\r'),
(224, 'sa62@mail.com', '123456', 'sa', '62', '34706883261\r'),
(225, 'tv64@mail.com', '123456', 'tv', '64', '24487410950\r'),
(226, 'jj57@mail.com', '123456', 'jj', '57', '41928633896\r'),
(227, 'je12@mail.com', '123456', 'je', '12', '80403543910\r'),
(228, 'ln27@mail.com', '123456', 'ln', '27', '63480517400\r'),
(229, 'we39@mail.com', '123456', 'we', '39', '56729997168\r'),
(230, 'cl22@mail.com', '123456', 'cl', '22', '69893430478\r'),
(231, 'kk65@mail.com', '123456', 'kk', '65', '65712569579\r'),
(232, 'gp15@mail.com', '123456', 'gp', '15', '74804678590\r'),
(233, 'ds50@mail.com', '123456', 'ds', '50', '77796430758\r'),
(234, 'ia25@mail.com', '123456', 'ia', '25', '77244979509\r'),
(235, 'pa31@mail.com', '123456', 'pa', '31', '33043184829\r'),
(236, 'fh47@mail.com', '123456', 'fh', '47', '18281120742\r'),
(237, 'qj12@mail.com', '123456', 'qj', '12', '54706160250\r'),
(238, 'ox53@mail.com', '123456', 'ox', '53', '82077168893\r'),
(239, 'dv38@mail.com', '123456', 'dv', '38', '66931558044\r'),
(240, 'tk12@mail.com', '123456', 'tk', '12', '29363282686\r'),
(241, 'et33@mail.com', '123456', 'et', '33', '61015477169\r'),
(242, 'da20@mail.com', '123456', 'da', '20', '90841925568\r'),
(243, 'hh64@mail.com', '123456', 'hh', '64', '93695662830\r'),
(244, 'cx44@mail.com', '123456', 'cx', '44', '59082908698\r'),
(245, 'ht38@mail.com', '123456', 'ht', '38', '36526391185\r'),
(246, 'le48@mail.com', '123456', 'le', '48', '10120320622\r'),
(247, 'be28@mail.com', '123456', 'be', '28', '67572712226\r'),
(248, 'dq52@mail.com', '123456', 'dq', '52', '90125516023\r'),
(249, 'ku44@mail.com', '123456', 'ku', '44', '35357521519\r'),
(250, 'bo62@mail.com', '123456', 'bo', '62', '68299742694\r'),
(251, 'yt39@mail.com', '123456', 'yt', '39', '20294321062\r'),
(252, 'gg38@mail.com', '123456', 'gg', '38', '94449883238\r'),
(253, 'sa14@mail.com', '123456', 'sa', '14', '10672359658\r'),
(254, 'wm34@mail.com', '123456', 'wm', '34', '58556575993\r'),
(255, 'dp53@mail.com', '123456', 'dp', '53', '68676414057\r'),
(256, 'qy55@mail.com', '123456', 'qy', '55', '80133558270\r'),
(257, 'rn64@mail.com', '123456', 'rn', '64', '96894383475\r'),
(258, 'jm24@mail.com', '123456', 'jm', '24', '57119344275\r'),
(259, 'tx55@mail.com', '123456', 'tx', '55', '47294122227\r'),
(260, 'cg11@mail.com', '123456', 'cg', '11', '57663409898\r'),
(261, 'qc65@mail.com', '123456', 'qc', '65', '32742827818\r'),
(262, 'ty57@mail.com', '123456', 'ty', '57', '73253207084\r'),
(263, 'aw15@mail.com', '123456', 'aw', '15', '75820835183\r'),
(264, 'vv16@mail.com', '123456', 'vv', '16', '48343371578\r'),
(265, 'jt42@mail.com', '123456', 'jt', '42', '80880841664\r'),
(266, 'em18@mail.com', '123456', 'em', '18', '69895919609\r'),
(267, 'cw24@mail.com', '123456', 'cw', '24', '63084101895\r'),
(268, 'rd63@mail.com', '123456', 'rd', '63', '10028951408\r'),
(269, 'dq33@mail.com', '123456', 'dq', '33', '62527186892\r'),
(270, 'hm46@mail.com', '123456', 'hm', '46', '16408792468\r'),
(271, 'kb53@mail.com', '123456', 'kb', '53', '42424597506\r'),
(272, 'at14@mail.com', '123456', 'at', '14', '27875807062\r'),
(273, 'df56@mail.com', '123456', 'df', '56', '77835458773\r'),
(274, 'xb39@mail.com', '123456', 'xb', '39', '17381312754\r'),
(275, 'tj25@mail.com', '123456', 'tj', '25', '15422198767\r'),
(276, 'pr50@mail.com', '123456', 'pr', '50', '60308809533\r'),
(277, 'xc30@mail.com', '123456', 'xc', '30', '25350333249\r'),
(278, 'vw41@mail.com', '123456', 'vw', '41', '43928212668\r'),
(279, 'hh37@mail.com', '123456', 'hh', '37', '73557535675\r'),
(280, 'jh11@mail.com', '123456', 'jh', '11', '82891944491\r'),
(281, 'ip17@mail.com', '123456', 'ip', '17', '96393271079\r'),
(282, 'ca10@mail.com', '123456', 'ca', '10', '76437597075\r'),
(283, 'tt31@mail.com', '123456', 'tt', '31', '59877511892\r'),
(284, 'yb12@mail.com', '123456', 'yb', '12', '55303925111\r'),
(285, 'yk40@mail.com', '123456', 'yk', '40', '32665833922\r'),
(286, 'xs40@mail.com', '123456', 'xs', '40', '50194866301\r'),
(287, 'nr41@mail.com', '123456', 'nr', '41', '35254911526\r'),
(288, 'pv53@mail.com', '123456', 'pv', '53', '59112315177\r'),
(289, 'tl65@mail.com', '123456', 'tl', '65', '87902592452\r'),
(290, 'ye48@mail.com', '123456', 'ye', '48', '97857395504\r'),
(291, 'bn22@mail.com', '123456', 'bn', '22', '46271534838\r'),
(292, 'gb57@mail.com', '123456', 'gb', '57', '76550486298\r'),
(293, 'em58@mail.com', '123456', 'em', '58', '86909731571\r'),
(294, 'bs10@mail.com', '123456', 'bs', '10', '75200156945\r'),
(295, 'il51@mail.com', '123456', 'il', '51', '54346530481\r'),
(296, 'cl30@mail.com', '123456', 'cl', '30', '72966158071\r'),
(297, 'hb47@mail.com', '123456', 'hb', '47', '17779282798\r'),
(298, 'hi48@mail.com', '123456', 'hi', '48', '79081296494\r'),
(299, 'qo10@mail.com', '123456', 'qo', '10', '98135516815\r'),
(300, 'sx46@mail.com', '123456', 'sx', '46', '78170795008');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attraction_facility`
--
ALTER TABLE `attraction_facility`
  ADD PRIMARY KEY (`attraction_place_id`,`facility_id`),
  ADD KEY `FK7ju5n4gl6gjqxrw352gn8jd08` (`facility_id`);

--
-- Indexes for table `attraction_place`
--
ALTER TABLE `attraction_place`
  ADD PRIMARY KEY (`attraction_place_id`);

--
-- Indexes for table `attraction_review`
--
ALTER TABLE `attraction_review`
  ADD PRIMARY KEY (`attraction_review_id`),
  ADD KEY `FKnpmc4j77yxlir67r9jpcprngs` (`place_id`),
  ADD KEY `FKtdbpjje7umx2navqr6sg4880l` (`user_id`);

--
-- Indexes for table `attraction_schedule`
--
ALTER TABLE `attraction_schedule`
  ADD PRIMARY KEY (`attraction_schedule_id`),
  ADD KEY `FKtfwd534cqt30v1m8qme6mg3as` (`attraction_place_id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `grand_invoice`
--
ALTER TABLE `grand_invoice`
  ADD PRIMARY KEY (`grand_invoice__id`),
  ADD KEY `FKdvc25k6mw7mtboxuii6onqp5n` (`user_id`);

--
-- Indexes for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`itinerary_id`);

--
-- Indexes for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  ADD PRIMARY KEY (`itinerary_items_id`);

--
-- Indexes for table `sub_invoice`
--
ALTER TABLE `sub_invoice`
  ADD PRIMARY KEY (`sub_invoice_id`),
  ADD KEY `FKc4ysoq4gkqg0aif0cptx0itmt` (`grand_invoice_id`),
  ADD KEY `FKfis8069rn9k20546pkwrju5n5` (`user_id`);

--
-- Indexes for table `sub_invoice_items`
--
ALTER TABLE `sub_invoice_items`
  ADD PRIMARY KEY (`sub_invoice_item_id`),
  ADD KEY `FKu7ko1pcerp62t5ki5lj4h0dc` (`sub_invoice_id`);

--
-- Indexes for table `sub_invoice_item_ticket`
--
ALTER TABLE `sub_invoice_item_ticket`
  ADD PRIMARY KEY (`sub_invoice_item_id`,`ticket_id`),
  ADD KEY `FKmec3p1e0xd531v719xdcsi9fd` (`ticket_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `FKmvugyjf7b45u0juyue7k3pct0` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attraction_place`
--
ALTER TABLE `attraction_place`
  MODIFY `attraction_place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attraction_review`
--
ALTER TABLE `attraction_review`
  MODIFY `attraction_review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attraction_schedule`
--
ALTER TABLE `attraction_schedule`
  MODIFY `attraction_schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grand_invoice`
--
ALTER TABLE `grand_invoice`
  MODIFY `grand_invoice__id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `itinerary`
--
ALTER TABLE `itinerary`
  MODIFY `itinerary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  MODIFY `itinerary_items_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_invoice`
--
ALTER TABLE `sub_invoice`
  MODIFY `sub_invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_invoice_items`
--
ALTER TABLE `sub_invoice_items`
  MODIFY `sub_invoice_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attraction_facility`
--
ALTER TABLE `attraction_facility`
  ADD CONSTRAINT `FK7ju5n4gl6gjqxrw352gn8jd08` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
  ADD CONSTRAINT `FKt6cb8ae6qoeac3o9p19y7m4uh` FOREIGN KEY (`attraction_place_id`) REFERENCES `attraction_place` (`attraction_place_id`);

--
-- Constraints for table `attraction_review`
--
ALTER TABLE `attraction_review`
  ADD CONSTRAINT `FKnpmc4j77yxlir67r9jpcprngs` FOREIGN KEY (`place_id`) REFERENCES `attraction_place` (`attraction_place_id`),
  ADD CONSTRAINT `FKtdbpjje7umx2navqr6sg4880l` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attraction_schedule`
--
ALTER TABLE `attraction_schedule`
  ADD CONSTRAINT `FKtfwd534cqt30v1m8qme6mg3as` FOREIGN KEY (`attraction_place_id`) REFERENCES `attraction_place` (`attraction_place_id`);

--
-- Constraints for table `grand_invoice`
--
ALTER TABLE `grand_invoice`
  ADD CONSTRAINT `FKdvc25k6mw7mtboxuii6onqp5n` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sub_invoice`
--
ALTER TABLE `sub_invoice`
  ADD CONSTRAINT `FKc4ysoq4gkqg0aif0cptx0itmt` FOREIGN KEY (`grand_invoice_id`) REFERENCES `grand_invoice` (`grand_invoice__id`),
  ADD CONSTRAINT `FKfis8069rn9k20546pkwrju5n5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sub_invoice_items`
--
ALTER TABLE `sub_invoice_items`
  ADD CONSTRAINT `FKu7ko1pcerp62t5ki5lj4h0dc` FOREIGN KEY (`sub_invoice_id`) REFERENCES `sub_invoice` (`sub_invoice_id`);

--
-- Constraints for table `sub_invoice_item_ticket`
--
ALTER TABLE `sub_invoice_item_ticket`
  ADD CONSTRAINT `FK4k02kwr4tv07mcyyb95egsr0g` FOREIGN KEY (`sub_invoice_item_id`) REFERENCES `sub_invoice_items` (`sub_invoice_item_id`),
  ADD CONSTRAINT `FKmec3p1e0xd531v719xdcsi9fd` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FKmvugyjf7b45u0juyue7k3pct0` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
