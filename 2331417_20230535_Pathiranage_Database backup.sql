-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2023 at 01:03 PM
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
-- Database: `book haven`
--

-- --------------------------------------------------------

--
-- Table structure for table `book item`
--

CREATE TABLE `book item` (
  `Item Code` char(10) NOT NULL,
  `Price in $` decimal(8,2) NOT NULL,
  `Stock Level` int(5) NOT NULL,
  `Recorder Level` int(5) NOT NULL,
  `ISBN` char(20) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Genre` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Author` varchar(200) DEFAULT NULL,
  `Publisher` varchar(200) DEFAULT NULL,
  `Year of Publication` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book item`
--

INSERT INTO `book item` (`Item Code`, `Price in $`, `Stock Level`, `Recorder Level`, `ISBN`, `Title`, `Genre`, `Category`, `Author`, `Publisher`, `Year of Publication`) VALUES
('B001', 19.99, 100, 20, '978-0-13-516630-1', 'The Great Gatsby', 'Fiction', 'Classic', 'F. Scott Fitzgerald', 'Scribner', '1925'),
('B002', 29.99, 75, 15, '978-0-7475-3269-6', 'Harry Potter and the Philosopher\'s Stone', 'Fantasy', 'Young Adult', 'J.K. Rowling', 'Bloomsbury', '1997'),
('B003', 24.99, 50, 10, '978-0-14-118776-0', 'To Kill a Mockingbird', 'Fiction', 'Classic', 'Harper Lee', 'Penguin', '1960'),
('B004', 14.99, 120, 30, '978-0-345-45349-4', '1984', 'Dystopian', 'Science Fiction', 'George Orwell', 'Signet', '1949'),
('B005', 39.99, 90, 18, '978-1-250-19657-5', 'The Catcher in the Rye', 'Fiction', 'Coming-of-Age', 'J.D. Salinger', 'Little, Brown', '1951'),
('B006', 170.66, 10, 5, '978-0-13-397077-7', 'Fundamentals of Database Systems', 'Non-Fiction', 'Database Management', 'Ramez Elmasri', 'Pearson', '2016'),
('B007', 170.66, 8, 3, '978-0-13-397077-6', 'Fundamentals of Database Systems', 'Non-Fiction', 'Database Management', 'Ramez Elmasri', 'Springer', '2016'),
('B008', 170.66, 5, 3, '978-0-13-397077-8', 'Fundamentals of Database Systems', 'Non-Fiction', 'Database Management', 'Ramez Elmasri', 'Atlas', '2016');

-- --------------------------------------------------------

--
-- Table structure for table `book item supplier`
--

CREATE TABLE `book item supplier` (
  `Item Code` char(10) NOT NULL,
  `User ID` char(10) NOT NULL,
  `Book Supply Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book item supplier`
--

INSERT INTO `book item supplier` (`Item Code`, `User ID`, `Book Supply Date`) VALUES
('B001', 'S004', '2023-08-05'),
('B002', 'S005', '2022-11-23'),
('B003', 'S001', '2023-03-11'),
('B004', 'S003', '2023-05-19'),
('B005', 'S002', '2023-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `order-book item`
--

CREATE TABLE `order-book item` (
  `Item Code` char(10) NOT NULL,
  `Order ID` char(100) NOT NULL,
  `Item Quantities` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order-book item`
--

INSERT INTO `order-book item` (`Item Code`, `Order ID`, `Item Quantities`) VALUES
('B001', 'ORD003', 1),
('B002', 'ORD004', 2),
('B003', 'ORD001', 1),
('B004', 'ORD005', 2),
('B005', 'ORD002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order-pay-banktransfer`
--

CREATE TABLE `order-pay-banktransfer` (
  `Payment ID` char(15) NOT NULL,
  `Order ID` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order-pay-banktransfer`
--

INSERT INTO `order-pay-banktransfer` (`Payment ID`, `Order ID`) VALUES
('BTPAY001', 'ORD002'),
('BTPAY002', 'ORD005'),
('BTPAY003', 'ORD004'),
('BTPAY004', 'ORD001'),
('BTPAY005', 'ORD003');

-- --------------------------------------------------------

--
-- Table structure for table `order-pay-online payment`
--

CREATE TABLE `order-pay-online payment` (
  `Payment ID` char(15) NOT NULL,
  `Order ID` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order-pay-online payment`
--

INSERT INTO `order-pay-online payment` (`Payment ID`, `Order ID`) VALUES
('ONPAY001', 'ORD001'),
('ONPAY002', 'ORD004'),
('ONPAY003', 'ORD003'),
('ONPAY004', 'ORD005'),
('ONPAY005', 'ORD002');

-- --------------------------------------------------------

--
-- Table structure for table `order-stationary item`
--

CREATE TABLE `order-stationary item` (
  `Item Code` char(10) NOT NULL,
  `Order ID` char(100) NOT NULL,
  `Item Quantities` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order-stationary item`
--

INSERT INTO `order-stationary item` (`Item Code`, `Order ID`, `Item Quantities`) VALUES
('St001', 'ORD002', 5),
('St002', 'ORD004', 10),
('St003', 'ORD001', 8),
('St004', 'ORD003', 4),
('St005', 'ORD005', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order ID` char(100) NOT NULL,
  `Order Date` date NOT NULL,
  `Delivery Address` varchar(200) NOT NULL,
  `Delivery Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order ID`, `Order Date`, `Delivery Address`, `Delivery Date`) VALUES
('ORD001', '2023-11-25', '778 Main Street, California', '2023-12-01'),
('ORD002', '2023-11-26', '969 Shopping Mall, Shop 23, WashingtonDC', '2023-12-02'),
('ORD003', '2023-11-27', '789 Maple Lane, North Carolina', '2023-12-03'),
('ORD004', '2023-11-28', '223 Pine Road, Lowa', '2023-12-04'),
('ORD005', '2023-11-29', '456 Cedar Street, Florida', '2023-12-05'),
('ORD006', '2023-11-27', '469 Second Street, Lowa', '2023-12-03'),
('ORD007', '2023-11-28', '232 Flower Road, WashingtonDC', '2023-12-04'),
('ORD008', '2023-11-30', '91 Tree Lane, Florida', '2023-12-07'),
('ORD009', '2023-12-01', '293 Base Road, California', '2023-12-09'),
('ORD010', '2023-12-02', '47 Cedar Street, North Carolina', '2023-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `payment-bank transfer`
--

CREATE TABLE `payment-bank transfer` (
  `Payment ID` char(15) NOT NULL,
  `Reference Number` char(15) NOT NULL,
  `Transaction Date` date NOT NULL,
  `Amount in $` decimal(8,2) NOT NULL,
  `Account Number` char(15) NOT NULL,
  `Bank Name` char(15) NOT NULL,
  `Branch Name` varchar(15) NOT NULL,
  `User ID` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment-bank transfer`
--

INSERT INTO `payment-bank transfer` (`Payment ID`, `Reference Number`, `Transaction Date`, `Amount in $`, `Account Number`, `Bank Name`, `Branch Name`, `User ID`) VALUES
('BTPAY001', 'REF123456', '2023-11-25', 500.00, 'ACC123456', 'Bank of America', 'Main Branch', 'C001'),
('BTPAY002', 'REF789012', '2023-11-26', 750.50, 'ACC789012', 'ABC Bank', 'City Branch', 'C005'),
('BTPAY003', 'REF345678', '2023-11-27', 1000.75, 'ACC345678', 'XYZ Bank', 'Suburb Branch', 'C003'),
('BTPAY004', 'REF901234', '2023-11-28', 300.25, 'ACC901234', 'Bank One', 'Downtown Branch', 'C004'),
('BTPAY005', 'REF567890', '2023-11-29', 150.99, 'ACC567890', 'City Bank', 'Central Branch', 'C002');

-- --------------------------------------------------------

--
-- Table structure for table `payment- online`
--

CREATE TABLE `payment- online` (
  `Payment ID` char(15) NOT NULL,
  `Reference Number` char(15) NOT NULL,
  `Transaction Date` date NOT NULL,
  `Amount in $` decimal(8,2) NOT NULL,
  `Payment Gateway` varchar(50) DEFAULT NULL,
  `Confirmation number` varchar(15) DEFAULT NULL,
  `User ID` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment- online`
--

INSERT INTO `payment- online` (`Payment ID`, `Reference Number`, `Transaction Date`, `Amount in $`, `Payment Gateway`, `Confirmation number`, `User ID`) VALUES
('ONPAY001', 'REF234176', '2023-11-25', 500.00, 'PayPal', 'CONF123', 'C001'),
('ONPAY002', 'REF781652', '2023-11-26', 800.50, 'Stripe', 'CONF456', 'C003'),
('ONPAY003', 'REF954678', '2023-11-27', 1200.75, 'Square', 'CONF789', 'C004'),
('ONPAY004', 'REF901378', '2023-11-28', 3050.25, 'Paytm', 'CONF012', 'C002'),
('ONPAY005', 'REF549370', '2023-11-29', 260.99, 'Braintree', 'CONF345', 'C005');

-- --------------------------------------------------------

--
-- Table structure for table `stationary item`
--

CREATE TABLE `stationary item` (
  `Item Code` char(10) NOT NULL,
  `Price in $` decimal(8,2) NOT NULL,
  `Stock Level` int(5) NOT NULL,
  `Recorder Level` int(5) NOT NULL,
  `Stationary Category` varchar(100) DEFAULT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `Warrenty` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stationary item`
--

INSERT INTO `stationary item` (`Item Code`, `Price in $`, `Stock Level`, `Recorder Level`, `Stationary Category`, `Brand`, `Warrenty`) VALUES
('St001', 4.99, 200, 50, 'Notebooks', 'Moleskine', 0),
('St002', 2.49, 300, 75, 'Pens', 'Pilot', 1),
('St003', 9.99, 100, 25, 'Desk Accessories', 'IKEA', 0),
('St004', 1.99, 500, 100, 'Staplers', 'Bostitch', 1),
('St005', 6.99, 150, 30, 'Markers', 'Sharpie', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stationary item supplier`
--

CREATE TABLE `stationary item supplier` (
  `Item Code` char(10) NOT NULL,
  `User ID` char(10) NOT NULL,
  `Stationary Supply Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stationary item supplier`
--

INSERT INTO `stationary item supplier` (`Item Code`, `User ID`, `Stationary Supply Date`) VALUES
('St001', 'S004', '2022-11-25'),
('St002', 'S005', '2023-09-21'),
('St003', 'S001', '2023-04-08'),
('St004', 'S003', '2023-09-08'),
('St005', 'S002', '2022-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `user-customer order`
--

CREATE TABLE `user-customer order` (
  `User ID` char(10) NOT NULL,
  `Order ID` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user-customer order`
--

INSERT INTO `user-customer order` (`User ID`, `Order ID`) VALUES
('C001', 'ORD005'),
('C002', 'ORD001'),
('C002', 'ORD006'),
('C002', 'ORD007'),
('C003', 'ORD003'),
('C003', 'ORD008'),
('C003', 'ORD009'),
('C003', 'ORD010'),
('C004', 'ORD002'),
('C005', 'ORD004');

-- --------------------------------------------------------

--
-- Table structure for table `user customer`
--

CREATE TABLE `user customer` (
  `User ID` char(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(200) NOT NULL,
  `ContactNo` char(11) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Billing Address` varchar(200) DEFAULT NULL,
  `Shipping Address` varchar(200) DEFAULT NULL,
  `Preferred Payment Method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user customer`
--

INSERT INTO `user customer` (`User ID`, `Name`, `Address`, `ContactNo`, `Email`, `Billing Address`, `Shipping Address`, `Preferred Payment Method`) VALUES
('C001', 'Dwayne Johnson', '123 Main Street, Florida', '071-8956471', 'johnsondwayne@gmail.com', '123 Main Street, Florida', '123 Main Street, Florida', 'Bank Transfer'),
('C002', 'Steve Jobs', '456 Flower Avenue, Lowa', '077-2563147', 'steve123@gmail.com', '456 Flower Avenue, Lowa', '456 Flower Avenue, Lowa', 'Online Payment'),
('C003', 'Mark Zuckerberg', '789 Pine Lane, Arizona', '070-8971235', 'zuckM45@gmail.com', '789 Pine Lane, Arizona', '789 Pine Lane, Villagetown, New Jersey', 'Bank Transfer'),
('C004', 'David Warner', '101 Cedar Road, New Jersey', '072-9517532', 'WarnerD89@yahoo.com', '1 Corporate Plaza, Business City, New York', '101 Cedar Road, New Jersey', 'Online Payment'),
('C005', 'Virat Kholi', '202 Maple Street, Alabama', '071-4215896', 'Kholikuttu69@yahoo.com', '123 Commerce Street, Commercial District, Washington', '555 Education Lane, Classroom 301, Academic Area, California', 'Bank Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `user supplier`
--

CREATE TABLE `user supplier` (
  `User ID` char(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `ContactNo` char(11) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Contact Person` varchar(50) NOT NULL,
  `Supplier Type` char(20) NOT NULL,
  `Payment Terms` varchar(100) DEFAULT NULL,
  `Delivery Time Lead Days` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user supplier`
--

INSERT INTO `user supplier` (`User ID`, `Name`, `Address`, `ContactNo`, `Email`, `Contact Person`, `Supplier Type`, `Payment Terms`, `Delivery Time Lead Days`) VALUES
('S001', 'John Doe Supplies', '123 Main Street, Cityville', '071-1234567', 'john.doe@gmail.com', 'John Doe', 'Company', 'Net 30', 7),
('S002', 'Jane Smith Stationers', '456 Oak Avenue, Townsville', '077-2345678', 'jane.smith@gmail.com', 'Jane Smith', 'Company', 'Net 45', 10),
('S003', 'Tom Holland', '789 Pine Lane, Villagetown', '070-3456789', 'htom96854@gmail.com', 'Tom Holland', 'Individual', 'Cash on Delivery', 5),
('S004', 'Company Supplies Ltd.', '101 Cedar Road, Hamletville', '077-9874563', 'company.supplies@yahoo.com', 'Company Supplies manager', 'Company', 'Net 60', 15),
('S005', 'SmallBiz Suppliers', '202 Maple Street, Hamletville', '071-5997864', 'smallbiz@yahoo.com', 'SmallBiz manager', 'Company', 'Net 15', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book item`
--
ALTER TABLE `book item`
  ADD PRIMARY KEY (`Item Code`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `book item supplier`
--
ALTER TABLE `book item supplier`
  ADD PRIMARY KEY (`Item Code`,`User ID`,`Book Supply Date`),
  ADD KEY `us_id_sup_bk_fk` (`User ID`);

--
-- Indexes for table `order-book item`
--
ALTER TABLE `order-book item`
  ADD PRIMARY KEY (`Item Code`,`Order ID`,`Item Quantities`),
  ADD KEY `od_id_bk_fk` (`Order ID`);

--
-- Indexes for table `order-pay-banktransfer`
--
ALTER TABLE `order-pay-banktransfer`
  ADD PRIMARY KEY (`Payment ID`,`Order ID`),
  ADD KEY `od_id_pay_bnk_tra_fk` (`Order ID`);

--
-- Indexes for table `order-pay-online payment`
--
ALTER TABLE `order-pay-online payment`
  ADD PRIMARY KEY (`Payment ID`,`Order ID`),
  ADD KEY `od_id_pay_onl_fk` (`Order ID`);

--
-- Indexes for table `order-stationary item`
--
ALTER TABLE `order-stationary item`
  ADD PRIMARY KEY (`Item Code`,`Order ID`,`Item Quantities`),
  ADD KEY `od_id_stat_fk` (`Order ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order ID`);

--
-- Indexes for table `payment-bank transfer`
--
ALTER TABLE `payment-bank transfer`
  ADD PRIMARY KEY (`Payment ID`),
  ADD UNIQUE KEY `Reference Number` (`Reference Number`),
  ADD UNIQUE KEY `Account Number` (`Account Number`),
  ADD KEY `us_id_bnk_tra_fk` (`User ID`);

--
-- Indexes for table `payment- online`
--
ALTER TABLE `payment- online`
  ADD PRIMARY KEY (`Payment ID`),
  ADD UNIQUE KEY `Reference Number` (`Reference Number`),
  ADD KEY `us_id_onl_tra_fk` (`User ID`);

--
-- Indexes for table `stationary item`
--
ALTER TABLE `stationary item`
  ADD PRIMARY KEY (`Item Code`);

--
-- Indexes for table `stationary item supplier`
--
ALTER TABLE `stationary item supplier`
  ADD PRIMARY KEY (`Item Code`,`User ID`,`Stationary Supply Date`),
  ADD KEY `us_id_sup_stat_fk` (`User ID`);

--
-- Indexes for table `user-customer order`
--
ALTER TABLE `user-customer order`
  ADD PRIMARY KEY (`User ID`,`Order ID`),
  ADD KEY `us_cus_od_id_fk` (`Order ID`);

--
-- Indexes for table `user customer`
--
ALTER TABLE `user customer`
  ADD PRIMARY KEY (`User ID`);

--
-- Indexes for table `user supplier`
--
ALTER TABLE `user supplier`
  ADD PRIMARY KEY (`User ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book item supplier`
--
ALTER TABLE `book item supplier`
  ADD CONSTRAINT `it_cd_bk_fk` FOREIGN KEY (`Item Code`) REFERENCES `book item` (`Item Code`),
  ADD CONSTRAINT `us_id_sup_bk_fk` FOREIGN KEY (`User ID`) REFERENCES `user supplier` (`User ID`);

--
-- Constraints for table `order-book item`
--
ALTER TABLE `order-book item`
  ADD CONSTRAINT `od_id_bk_fk` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`),
  ADD CONSTRAINT `od_it_cd_bk_fk` FOREIGN KEY (`Item Code`) REFERENCES `book item` (`Item Code`);

--
-- Constraints for table `order-pay-banktransfer`
--
ALTER TABLE `order-pay-banktransfer`
  ADD CONSTRAINT `od_id_pay_bnk_tra_fk` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`),
  ADD CONSTRAINT `od_pay_bnk_tra_fk` FOREIGN KEY (`Payment ID`) REFERENCES `payment-bank transfer` (`Payment ID`);

--
-- Constraints for table `order-pay-online payment`
--
ALTER TABLE `order-pay-online payment`
  ADD CONSTRAINT `od_id_pay_onl_fk` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`),
  ADD CONSTRAINT `od_pay_onl_fk` FOREIGN KEY (`Payment ID`) REFERENCES `payment- online` (`Payment ID`);

--
-- Constraints for table `order-stationary item`
--
ALTER TABLE `order-stationary item`
  ADD CONSTRAINT `od_id_stat_fk` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`),
  ADD CONSTRAINT `od_it_cd_stat_fk` FOREIGN KEY (`Item Code`) REFERENCES `stationary item` (`Item Code`);

--
-- Constraints for table `payment-bank transfer`
--
ALTER TABLE `payment-bank transfer`
  ADD CONSTRAINT `us_id_bnk_tra_fk` FOREIGN KEY (`User ID`) REFERENCES `user customer` (`User ID`);

--
-- Constraints for table `payment- online`
--
ALTER TABLE `payment- online`
  ADD CONSTRAINT `us_id_onl_tra_fk` FOREIGN KEY (`User ID`) REFERENCES `user customer` (`User ID`);

--
-- Constraints for table `stationary item supplier`
--
ALTER TABLE `stationary item supplier`
  ADD CONSTRAINT `it_cd_stat_fk` FOREIGN KEY (`Item Code`) REFERENCES `stationary item` (`Item Code`),
  ADD CONSTRAINT `us_id_sup_stat_fk` FOREIGN KEY (`User ID`) REFERENCES `user supplier` (`User ID`);

--
-- Constraints for table `user-customer order`
--
ALTER TABLE `user-customer order`
  ADD CONSTRAINT `us_cus_od_id_fk` FOREIGN KEY (`Order ID`) REFERENCES `orders` (`Order ID`),
  ADD CONSTRAINT `us_id_cus_fk` FOREIGN KEY (`User ID`) REFERENCES `user customer` (`User ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
