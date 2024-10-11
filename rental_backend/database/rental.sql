-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 11, 2024 at 09:17 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
CREATE TABLE IF NOT EXISTS `agents` (
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(10) DEFAULT NULL,
  `landlordID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IDNumber` varchar(10) DEFAULT NULL,
  `earningRate` float DEFAULT NULL,
  `photoUrl` text,
  KEY `landlordID` (`landlordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`userName`, `ID`, `contact`, `email`, `landlordID`, `IDNumber`, `earningRate`, `photoUrl`) VALUES
('dwsdsd', 'HJHIWIgoIrcJyW735mSVz5ROes53', '1212321', 'sddsdsds', 'ZH7LGU5yg0NxXjeGE5KkkzmzkVh1', '3243444232', 13, 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/profile_photos%2Frentalimages.jpg?alt=media&token=1ed3e4cc-b935-4c44-8f5d-abe580ac528e'),
('Agent1', '5nd2SzgBxWSxdq5z6U6Msfor91f2', '1234567', 'agent1@gma', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', '121212122', 10, 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/profile_photos%2Frentalimages.jpg?alt=media&token=6020060c-f4a7-4785-9930-823f240c26ef');

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `ID` varchar(20) NOT NULL,
  `propertyID` varchar(20) DEFAULT NULL,
  `apartmentName` varchar(20) DEFAULT NULL,
  `totalUnits` int DEFAULT NULL,
  `occupiedUnits` int DEFAULT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `propertyID` (`propertyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landlords`
--

DROP TABLE IF EXISTS `landlords`;
CREATE TABLE IF NOT EXISTS `landlords` (
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photoUrl` text,
  `landlordTag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `landlordTag` (`landlordTag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `landlords`
--

INSERT INTO `landlords` (`userName`, `ID`, `contact`, `email`, `photoUrl`, `landlordTag`) VALUES
('Jane', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', '012345678', 'jane@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/profile_photos%2Frentalpassportphoto.jpg?alt=media&token=412280e5-992e-4a3e-92f9-ae444a3d0688', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `propertyName` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `landlordID` varchar(50) DEFAULT NULL,
  `photoUrl` text,
  PRIMARY KEY (`ID`),
  KEY `landlordID` (`landlordID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`ID`, `propertyName`, `location`, `landlordID`, `photoUrl`) VALUES
('fa2470e6-19b0-4aff-b7a0-25f21cd43577', 'Tsavo homes', 'Nairobi, Dagoretti', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/property_photos%2Frentalbean%20bags.png?alt=media&token=09a0d1a9-be59-4821-bd3f-c5df44712563'),
('ec6ba5a3-26d2-4f7e-978b-5e0a8d64bd9f', 'Comfort homes', 'Ngong, Kajiado', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/property_photos%2FrentalScreenshot%202024-05-11%20161635.png?alt=media&token=eb6fba33-93c1-4942-8bbc-ee258080ea5c'),
('290ef999-8552-404e-9b20-0a08c90611dc', 'Luxury Homes', 'Kilimani, Nairobi', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/property_photos%2Frentalpexels-zen-chung-5537998.jpg?alt=media&token=7d85064c-87b6-4c44-bfbb-0dd9879ac62f'),
('29700682-ed3d-4c7f-b9bb-b12573f5c621', 'property 1', 'Langata, Nairobi', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/property_photos%2Frentalproperty.jpg?alt=media&token=a574adad-b3c1-447a-be4c-258885ccd493'),
('57c4cae4-d17d-461e-93c3-98e8bcc2f36b', 'Prop 2', 'Nakuru', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'https://firebasestorage.googleapis.com/v0/b/rental-8ce87.appspot.com/o/property_photos%2Frentalsheenchair.png?alt=media&token=6a735c16-a74a-411c-ac17-9ba3acf403ae'),
('34302f5b-09dd-4e1b-be62-c113c3bf0a4e', 'prop 3', 'Mombasa', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', ''),
('041663d1-f874-4eaf-aeb9-a03e1532abe1', 'Propp 4', 'Nakuru', 'F94gEAHojSVaz5qFDv4cWKbO5Ut2', '');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
CREATE TABLE IF NOT EXISTS `tenants` (
  `userName` varchar(10) DEFAULT NULL,
  `ID` varchar(20) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(10) DEFAULT NULL,
  `landlordID` varchar(20) DEFAULT NULL,
  `IDNumber` varchar(10) DEFAULT NULL,
  `houseNo` varchar(50) DEFAULT NULL,
  `propertyID` varchar(100) DEFAULT NULL,
  `apartmentID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `landlordID` (`landlordID`),
  KEY `apartmentID` (`apartmentID`),
  KEY `propertyID` (`propertyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `type`, `createdDate`) VALUES
('F94gEAHojSVaz5qFDv4cWKbO5Ut2', 'landlord', '2024-08-28 15:21:03'),
('5nd2SzgBxWSxdq5z6U6Msfor91f2', 'agent', '2024-08-28 15:26:16');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
