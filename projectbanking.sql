-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: online_banking_services
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `AccountType` enum('Checking','Savings','Loan') NOT NULL,
  `AccountNumber` varchar(20) NOT NULL,
  `Balance` decimal(15,2) DEFAULT '0.00',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Active','Dormant','Closed') DEFAULT 'Active',
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `AccountNumber` (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'Checking','CHK0001',1350.50,'2024-12-28 05:50:30','Active'),(2,2,'Savings','SAV0002',2650.00,'2024-12-28 05:50:30','Active'),(3,3,'Checking','CHK0003',320.75,'2024-12-28 05:50:30','Active'),(4,4,'Savings','SAV0004',5000.00,'2024-12-28 05:50:30','Active'),(5,5,'Checking','CHK0005',125.25,'2024-12-28 05:50:30','Active');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_2nf`
--

DROP TABLE IF EXISTS `accounts_2nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_2nf` (
  `CustomerID` int DEFAULT NULL,
  `AccountNumber` varchar(20) NOT NULL,
  `AccountType` enum('Checking','Savings','Loan') DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `accounts_2nf_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers_2nf` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_2nf`
--

LOCK TABLES `accounts_2nf` WRITE;
/*!40000 ALTER TABLE `accounts_2nf` DISABLE KEYS */;
INSERT INTO `accounts_2nf` VALUES (1,'1001','Checking',1500.50),(1,'1002','Savings',2500.00);
/*!40000 ALTER TABLE `accounts_2nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bcnf`
--

DROP TABLE IF EXISTS `accounts_bcnf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bcnf` (
  `CustomerID` int DEFAULT NULL,
  `AccountNumber` varchar(20) NOT NULL,
  `AccountType` enum('Checking','Savings','Loan') DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `accounts_bcnf_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers_bcnf` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bcnf`
--

LOCK TABLES `accounts_bcnf` WRITE;
/*!40000 ALTER TABLE `accounts_bcnf` DISABLE KEYS */;
INSERT INTO `accounts_bcnf` VALUES (1,'1001','Checking',1500.50),(1,'1002','Savings',2500.00);
/*!40000 ALTER TABLE `accounts_bcnf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  `DateOfBirth` date NOT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Anmol','Singh','anmol.singh@example.com','1234567890','123 Main St, Cityville','1990-01-01','2024-12-28 05:48:30'),(2,'Amrit','Kaur','amrit.kaur@example.com','2345678901','456 Elm St, Townsville','1992-02-02','2024-12-28 05:48:30'),(3,'Olive','Johnson','olive.johnson@example.com','3456789012','789 Oak St, Villagetown','1994-03-03','2024-12-28 05:48:30'),(4,'Snuggle','Patel','snuggle.patel@example.com','4567890123','321 Pine St, Hamletburg','1996-04-04','2024-12-28 05:48:30'),(5,'Catbahadur','Rai','catbahadur.rai@example.com','5678901234','654 Cedar St, Parkland','1998-05-05','2024-12-28 05:48:30');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_1nf`
--

DROP TABLE IF EXISTS `customers_1nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_1nf` (
  `CustomerID` int NOT NULL,
  `Customer_info` varchar(100) DEFAULT NULL,
  `AccountNumber` varchar(20) NOT NULL,
  `AccountType` enum('Checking','Savings','Loan') DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_1nf`
--

LOCK TABLES `customers_1nf` WRITE;
/*!40000 ALTER TABLE `customers_1nf` DISABLE KEYS */;
INSERT INTO `customers_1nf` VALUES (1,'Ram Thapa','1001','Checking',1500.50),(1,'Ram Thapa','1002','Savings',2500.00);
/*!40000 ALTER TABLE `customers_1nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_2nf`
--

DROP TABLE IF EXISTS `customers_2nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_2nf` (
  `CustomerID` int NOT NULL,
  `Customer_info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_2nf`
--

LOCK TABLES `customers_2nf` WRITE;
/*!40000 ALTER TABLE `customers_2nf` DISABLE KEYS */;
INSERT INTO `customers_2nf` VALUES (1,'Ram Thapa'),(2,'John Cena');
/*!40000 ALTER TABLE `customers_2nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_2normal`
--

DROP TABLE IF EXISTS `customers_2normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_2normal` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_2normal`
--

LOCK TABLES `customers_2normal` WRITE;
/*!40000 ALTER TABLE `customers_2normal` DISABLE KEYS */;
INSERT INTO `customers_2normal` VALUES (1,'John Doe','john.doe@example.com','1234567890','123 Elm St','1985-05-15'),(2,'Jane Smith','jane.smith@example.com','0987654321','456 Oak St','1990-08-22'),(3,'Alice Johnson','alice.johnson@example.com','1122334455','789 Pine St','1980-12-05'),(4,'Bob Brown','bob.brown@example.com','2233445566','101 Maple St','1992-03-10'),(5,'Charlie Davis','charlie.davis@example.com','3344556677','202 Birch St','1988-07-25'),(6,'David Evans','david.evans@example.com','4455667788','303 Cedar St','1995-09-18');
/*!40000 ALTER TABLE `customers_2normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_bcnf`
--

DROP TABLE IF EXISTS `customers_bcnf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_bcnf` (
  `CustomerID` int NOT NULL,
  `Customer_info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_bcnf`
--

LOCK TABLES `customers_bcnf` WRITE;
/*!40000 ALTER TABLE `customers_bcnf` DISABLE KEYS */;
INSERT INTO `customers_bcnf` VALUES (1,'Ram Thapa'),(2,'John Cena');
/*!40000 ALTER TABLE `customers_bcnf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `TransactionDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` text,
  PRIMARY KEY (`TransactionID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'Deposit',500.00,'2024-12-01 04:30:00',NULL),(2,2,'Withdrawal',100.00,'2024-12-02 06:45:00',NULL),(3,3,'Transfer',200.75,'2024-12-03 04:00:00',NULL),(4,4,'Deposit',3000.00,'2024-12-04 08:15:00',NULL),(5,5,'Withdrawal',25.25,'2024-12-05 10:35:00',NULL),(6,1,'Withdrawal',150.00,'2024-12-28 06:36:30',NULL),(7,2,'Deposit',150.00,'2024-12-28 06:36:30',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unnormalizedcustomers`
--

DROP TABLE IF EXISTS `unnormalizedcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unnormalizedcustomers` (
  `CustomerID` int DEFAULT NULL,
  `Customer_info` varchar(100) DEFAULT NULL,
  `AccountNumber` varchar(20) DEFAULT NULL,
  `AccountType` enum('Checking','Savings','Loan') DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unnormalizedcustomers`
--

LOCK TABLES `unnormalizedcustomers` WRITE;
/*!40000 ALTER TABLE `unnormalizedcustomers` DISABLE KEYS */;
INSERT INTO `unnormalizedcustomers` VALUES (1,'Ram Thapa','1001','Checking',1500.50),(1,'Ram Thapa','1002','Savings',2500.00),(2,'John Cena','1003','Checking',320.75),(3,'Hari Lal','1004','Savings',5000.00),(3,'Hari Lal','1005','Checking',125.25),(4,'Sita Kumari','1006','Loan',10000.00);
/*!40000 ALTER TABLE `unnormalizedcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'anmol123','hashedpassword1'),(2,2,'amrit456','hashedpassword2'),(3,3,'olive789','hashedpassword3'),(4,4,'snuggle001','hashedpassword4'),(5,5,'catbahadur999','hashedpassword5');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-31 22:06:22
