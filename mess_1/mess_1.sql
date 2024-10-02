SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Table structure for table `category`

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table `category`

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Curry\r\n', 'Enable'),
(2, 'Breads\r\n', 'Enable'),
(3, 'Rice', 'Enable'),
(4, 'Sweets', 'Enable');

-- Table structure for table `items`

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `category_id`, `status`) VALUES
(1, 'Butter Panner', 12.00, 1, 'Enable'),
(2, 'chole', 15.00, 1, 'Enable'),
(3, 'Dal', 15.00, 1, 'Enable'),
(4, 'Roti', 4.00, 2, 'Enable'),
(5, 'Bajra', 7.00, 2, 'Disable'),
(6, 'Steam Rice', 10.00, 3, 'Enable'),
(7, 'Jeera Rice', 13.00, 3, 'Enable'),
(8, 'Gulab jamun', 15.00, 4, 'Enable'),
(9, 'kheer', 17.00, 4, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `mess_order`
--

CREATE TABLE `mess_order` (
  `id` int(11) NOT NULL,
  `table_id` varchar(250) NOT NULL,
  `gross_amount` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) NOT NULL,
  `net_amount` decimal(12,2) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` enum('admin','user','cashier') NOT NULL,
  `status` enum('In Process','Completed') NOT NULL DEFAULT 'In Process'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mess_order`
--

INSERT INTO `mess_order` (`id`, `table_id`, `gross_amount`, `tax_amount`, `net_amount`, `created`, `created_by`, `status`) VALUES
(1008, '2', 20.00, 2.60, 22.60, '2023-10-29 12:53:50', 'admin', 'Completed'),
(1009, '1', 37.00, 4.81, 41.81, '2023-10-29 12:57:01', 'admin', 'In Process'),
(1010, '3', 43.00, 5.59, 48.59, '2023-10-29 12:57:46', 'admin', 'In Process');

-- --------------------------------------------------------

--
-- Table structure for table `mess_order_item`
--

CREATE TABLE `mess_order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `rate` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mess_order_item`
--

INSERT INTO `mess_order_item` (`id`, `order_id`, `category_id`, `item_id`, `quantity`, `rate`, `amount`) VALUES
(1, 1001, 1, 1, 1, 12.00, 12.00),
(2, 1001, 3, 3, 1, 24.00, 24.00),
(3, 1005, 1, 1, 1, 12.00, 12.00),
(4, 1006, 1, 1, 1, 12.00, 12.00),
(8, 1008, 1, 1, 1, 12.00, 12.00),
(9, 1008, 2, 4, 2, 4.00, 8.00),
(10, 1009, 1, 2, 1, 15.00, 15.00),
(11, 1009, 2, 4, 3, 4.00, 12.00),
(12, 1009, 3, 6, 1, 10.00, 10.00),
(13, 1010, 1, 3, 1, 15.00, 15.00),
(14, 1010, 4, 8, 1, 15.00, 15.00),
(15, 1010, 3, 7, 1, 13.00, 13.00);

-- --------------------------------------------------------

--
-- Table structure for table `mess_table`
--

CREATE TABLE `mess_table` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `capacity` int(3) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mess_table`
--

INSERT INTO `mess_table` (`id`, `name`, `capacity`, `status`) VALUES
(1, 'Table 1', 4, 'Enable'),
(2, 'Table 2', 2, 'Enable'),
(3, 'Table 3', 4, 'Enable'),
(4, 'Table 4', 2, 'Enable'),
(5, 'Table 5', 4, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `percentage` decimal(4,2) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `tax_name`, `percentage`, `status`) VALUES
(1, 'SGST', 5.50, 'Enable'),
(2, 'CGST', 7.50, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','user','cashier') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `gender`, `email`, `password`, `mobile`, `address`, `created`, `role`) VALUES
(1, 'Harshal', 'Chaudhari', 'Male', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '1234567890', '', '2023-07-28 22:45:58', 'admin'),
(2, 'Om', 'Borse', 'Male', 'user1@gmail.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2023-08-28 22:45:58', 'cashier'),
(3, 'Atharva', 'Bonde', 'Male', 'user2@gmail.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2023-09-28 22:45:58', 'user'),
(4, 'Sanskar', 'Chaudhari', 'Male', 'user3@gmail.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2023-08-28 22:45:58', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess_order`
--
ALTER TABLE `mess_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess_order_item`
--
ALTER TABLE `mess_order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess_table`
--
ALTER TABLE `mess_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mess_order`
--
ALTER TABLE `mess_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `mess_order_item`
--
ALTER TABLE `mess_order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mess_table`
--
ALTER TABLE `mess_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;