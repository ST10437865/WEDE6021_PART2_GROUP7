-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 03:47 PM
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
-- Database: `clothingstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Role` varchar(50) DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`AdminID`, `Username`, `Password`, `Email`, `FullName`, `Role`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin@clothingstore.com', 'System Admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblaorder`
--

CREATE TABLE `tblaorder` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ClothesID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(50) DEFAULT 'pending',
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `DeliveryAddress` text DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblclothes`
--

CREATE TABLE `tblclothes` (
  `ClothesID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL DEFAULT 0,
  `Category` varchar(50) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Size` varchar(10) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblclothes`
--

INSERT INTO `tblclothes` (`ClothesID`, `Name`, `Description`, `Price`, `Stock`, `Category`, `Image`, `Size`, `Color`, `CreatedDate`) VALUES
(1, 'Classic White T-Shirt', '100% cotton comfortable t-shirt', 199.99, 50, 'T-Shirt', NULL, 'M', 'White', '2026-05-04 13:43:00'),
(2, 'Slim Fit Jeans', 'Dark blue denim jeans', 599.99, 30, 'Jeans', NULL, '32', 'Blue', '2026-05-04 13:43:00'),
(3, 'Floral Summer Dress', 'Beautiful floral pattern', 449.99, 15, 'Dress', NULL, 'M', 'Floral', '2026-05-04 13:43:00'),
(4, 'Leather Jacket', 'Genuine leather jacket', 1299.99, 10, 'Jacket', NULL, 'L', 'Black', '2026-05-04 13:43:00'),
(5, 'Running Shoes', 'Lightweight athletic shoes', 899.99, 25, 'Shoes', NULL, '9', 'Red', '2026-05-04 13:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` varchar(20) DEFAULT 'pending',
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserID`, `Username`, `Email`, `Password`, `Status`, `RegistrationDate`) VALUES
(1, 'John Doe', 'john.doe@email.com', '29ef52e7563626a96cea74b4085c1248c', 'verified', '2026-05-04 13:43:00'),
(2, 'Jane Smith', 'jane.smith@email.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'verified', '2026-05-04 13:43:00'),
(3, 'Mike Johnson', 'mike.johnson@email.com', '098f6bcd4621d373cade4e832627b4f6', 'verified', '2026-05-04 13:43:00'),
(4, 'Sarah Williams', 'sarah.williams@email.com', '25d55ad283aa400af464c76d713c07ad', 'verified', '2026-05-04 13:43:00'),
(5, 'David Brown', 'david.brown@email.com', 'e99a18c428cb38d5f260853678922e03', 'verified', '2026-05-04 13:43:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `tblaorder`
--
ALTER TABLE `tblaorder`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ClothesID` (`ClothesID`);

--
-- Indexes for table `tblclothes`
--
ALTER TABLE `tblclothes`
  ADD PRIMARY KEY (`ClothesID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblaorder`
--
ALTER TABLE `tblaorder`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblclothes`
--
ALTER TABLE `tblclothes`
  MODIFY `ClothesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblaorder`
--
ALTER TABLE `tblaorder`
  ADD CONSTRAINT `tblaorder_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `tbluser` (`UserID`),
  ADD CONSTRAINT `tblaorder_ibfk_2` FOREIGN KEY (`ClothesID`) REFERENCES `tblclothes` (`ClothesID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
