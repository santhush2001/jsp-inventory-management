-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 05:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(4, 'Electronics', 'Devices like phones, laptops, cameras, and gadgets.', '2024-12-14 07:24:11', '2024-12-14 07:24:11'),
(5, 'Furniture', 'Items for home and office such as tables, chairs, and sofas.', '2024-12-14 07:24:33', '2024-12-14 07:24:33'),
(6, 'Clothing & Apparel', 'Clothes and accessories like shirts, dresses, shoes, and hats.', '2024-12-14 07:24:48', '2024-12-14 07:24:48'),
(7, 'Groceries', 'Everyday food items and household products.', '2024-12-14 07:25:03', '2024-12-14 07:25:03'),
(8, 'Health & Beauty', 'Personal care products like skincare, makeup, and vitamins.', '2024-12-14 07:25:20', '2024-12-14 07:25:20'),
(9, 'Sports & Outdoors', 'Equipment for sports, camping, hiking, and outdoor activities.', '2024-12-14 07:25:51', '2024-12-14 07:25:51'),
(10, 'Toys & Games', 'Toys for kids and games for entertainment.', '2024-12-14 07:26:05', '2024-12-14 07:26:05'),
(11, 'Office Supplies', 'Items needed for office work, like pens, paper, and printers.', '2024-12-14 07:26:20', '2024-12-14 07:26:20'),
(12, 'Automotive', 'Car parts, accessories, and tools for vehicle maintenance.', '2024-12-14 07:26:33', '2024-12-14 07:26:33'),
(13, 'Books & Stationery', 'Books and writing materials like notebooks and pens.', '2024-12-14 07:26:47', '2024-12-14 07:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `shipping_address`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'janith', 'janthbandara12@gmail.com', '1234', '19/7 kandy', '2024-12-14 01:46:53', '2024-12-15 03:23:58', 17),
(2, 'ravindu', 'ravindu12@gmail.com', '12344566', 'sadsad', '2024-12-14 01:57:54', '2024-12-15 03:24:54', 21),
(5, 'Chicken', 'chicken@gmail.com', '423423324', 'dss', '2024-12-14 05:18:15', '2024-12-15 03:22:23', 24),
(11, 'pasan', 'pasanja@gmail.com', '0812332244', 'matale', '2024-12-15 03:25:51', '2024-12-15 03:28:28', 27),
(13, 'santhusha', 'sanjayakody67@gmail.com', '0765143632', '312', '2024-12-15 03:29:09', '2024-12-15 03:29:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity_changed` int(11) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(50) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shipping_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `order_status`, `customer_id`, `total_amount`, `created_at`, `updated_at`, `shipping_address`) VALUES
(6, '2024-12-14 13:19:53', 'delivered', 5, 123453.00, '2024-12-14 13:19:53', '2024-12-14 16:12:50', 'sadasdsad'),
(7, '2024-12-14 13:29:59', 'pending', 5, 2321.00, '2024-12-14 13:29:59', '2024-12-14 16:13:07', 'hasdjsdjg'),
(8, '2024-12-14 13:32:55', 'cancelled', 2, 1600000.00, '2024-12-14 13:32:55', '2024-12-14 16:15:48', 'sadsad'),
(9, '2024-12-14 13:38:49', 'pending', 2, 123453.00, '2024-12-14 13:38:49', '2024-12-14 16:40:49', '19/2 fdnfjdfsn'),
(10, '2024-12-14 13:46:04', 'delivered', 2, 800000.00, '2024-12-14 13:46:04', '2024-12-14 16:40:38', 'sadsad'),
(12, '2024-12-15 03:26:43', 'Pending', 11, 123453.00, '2024-12-15 03:26:43', '2024-12-15 03:26:43', '12/2 qwew'),
(13, '2024-12-16 07:18:56', 'Pending', 13, 123453.00, '2024-12-16 07:18:56', '2024-12-16 07:18:56', '312/12'),
(14, '2024-12-16 07:28:05', 'processing', 13, 800000.00, '2024-12-16 07:28:05', '2024-12-16 11:27:34', '312'),
(15, '2024-12-16 16:36:33', 'Pending', 13, 32434.00, '2024-12-16 16:36:33', '2024-12-16 16:36:33', '312');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) GENERATED ALWAYS AS (`quantity` * `price`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_date`, `payment_amount`, `payment_method`, `payment_status`) VALUES
(1, 14, '2024-12-16 07:28:05', 800000.00, 'Cash on Delivery', 'Pending'),
(2, 15, '2024-12-16 16:36:33', 32434.00, 'Credit Card', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `quantity_in_stock`, `category_id`, `supplier_id`, `created_at`, `updated_at`) VALUES
(7, 'Smartphone', 'samsung s24 ultra', 800000.00, 46, 4, 1, '2024-12-14 07:29:44', '2024-12-16 07:28:05'),
(8, 'Office Desk', 'A spacious wooden desk', 32434.00, 22, 5, 7, '2024-12-14 07:30:27', '2024-12-16 16:36:33'),
(9, 'Car Tire', 'All-season tire, size 205/55R16, suitable for most vehicles.', 2321.00, 28, 12, 5, '2024-12-14 07:31:12', '2024-12-14 13:29:59'),
(10, 'acer laptop', 'i5 11gen', 123453.00, 212, 4, 1, '2024-12-14 07:33:00', '2024-12-16 07:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_email`, `contact_phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'samantha', 'samantha@gmail.com', '213123131', '19/7 batagalla', '2024-12-12 15:17:24', '2024-12-14 05:21:47'),
(5, 'ruwntha', 'ruwan@gmail.com', '32434234', '12/4', '2024-12-12 15:36:02', '2024-12-12 16:31:53'),
(7, 'ruwan', 'ruwan3@gmail.com', '4332423', '12/4 kandy', '2024-12-12 16:36:50', '2024-12-12 16:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `contact`, `role`) VALUES
(1, 'santhusha', 'sanjayakody67@gmail.com', 'qwert1234', '0765143632', 'customer'),
(2, 'jhonee', 'abc@gmail.com', 'qwert1234', '1234127172', 'admin'),
(6, 'admin', 'admin1@gmail.com', 'admin1234', '0765143632', 'admin'),
(13, 'santhusha', 'lakshanjayakody40@gmail.com', 'qwert1234', '84394374', 'user'),
(16, 'ruwan', 'ruwan2@gmail.com', 'wqeqwqwwqe', '08364534734', 'user'),
(17, 'janith', 'janthbandara12@gmail.com', '12345678', '1234', 'customer'),
(21, 'ravindu', 'ravindu12@gmail.com', 'eqwwqtrwq', '12344566', 'customer'),
(24, 'Chicken', 'chicken@gmail.com', 'dsfsdfdsf', '423423324', 'customer'),
(26, 'nuwindu', 'nuwan@gmail.com', 'asdasdas', '0765143633', 'user'),
(27, 'pasan', 'pasanja@gmail.com', '12345678', '0812332244', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `fk_user_customer` (`user_id`);

--
-- Indexes for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_user_customer` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
