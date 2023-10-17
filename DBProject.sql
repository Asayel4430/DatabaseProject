CREATE DATABASE  IF NOT EXISTS `travel_agency` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travel_agency`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travel_agency
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `ID` decimal(50,0) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ID_EP` decimal(50,0) DEFAULT NULL,
  `start_manage` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Air France','France',1234,'2022-01-01'),(2,'British Airways','UK',5678,'2022-02-01'),(3,'Lufthansa','Germany',9012,'2022-03-01'),(4,'Emirates','UAE',3456,'2022-04-01'),(5,'Delta Air Lines','USA',7890,'2022-05-01');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `passport_no` decimal(9,0) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` decimal(15,0) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `birth_date` varchar(50) NOT NULL,
  PRIMARY KEY (`passport_no`),
  CONSTRAINT `customer_chk_1` CHECK ((`Gender` in (_utf8mb4'Male',_utf8mb4'Female')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (12263678,'Abdullah','Al Otaibi','abdullah5543@gmail.com',966543948775,'Male','2000-04-17'),(12433571,'Amera','Al hazmi','Amera1ahazmi@gmail.com',966567890123,'Female','2000-12-06'),(34567890,'Hamd','Al heseni','Hamd_heseni@gmail.com',97134567890,'Male','1985-10-23'),(45678901,'Alice','Johnson','alicejohnson@gmail.com',442078917866,'Female','2000-12-06'),(63729264,'Farah','Hamdi','Farahh1233@gmail.com',20068901600,'Female','2002-07-20');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` decimal(50,0) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `salary` decimal(7,2) NOT NULL,
  `phone_No` decimal(15,0) NOT NULL,
  `commission` varchar(50) DEFAULT NULL,
  `hireDate` varchar(11) NOT NULL,
  `bonus` decimal(50,0) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ID_AL` decimal(50,0) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Employee_FK` (`ID_AL`),
  CONSTRAINT `Employee_FK` FOREIGN KEY (`ID_AL`) REFERENCES `airline` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (3267,'Ahmed','rashed','Jeddah',4750.00,966555573256,'%0','14-8-1997',55,'ahmed66@gmail.com',5),(4828,'Sedra','Al Ali','Makkah',5300.00,9665674120472,'%2','16-12-2000',12,'sedra21@gmail.com',3),(5432,'jhone','Hider','Bangkuk',4800.00,9665857264857,'%5','29-6-1991',8,'jhone3@gmail.com',2),(5437,'Mohammed','Al Qahtani','Jeddah',5300.00,9665488748765,'%5','9-8-1998',0,'mQathani5543@gmail.com',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `IATA_code` varchar(50) NOT NULL,
  `city_code` varchar(50) DEFAULT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  `departure_time` varchar(10) DEFAULT NULL,
  `destination_city` varchar(50) DEFAULT NULL,
  `departure_city` varchar(50) DEFAULT NULL,
  `ID_AL` decimal(50,0) NOT NULL,
  PRIMARY KEY (`IATA_code`),
  KEY `flight_FK` (`ID_AL`),
  CONSTRAINT `flight_FK` FOREIGN KEY (`ID_AL`) REFERENCES `airline` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('AMS-BER','AMS',798,'22:15:00','Amesterdam','berlin',1),('AMS-GVA','AMS',150,'02:25:00','Amesterdam','Geneva',4),('AMS-TBS','AMS',100,'12:00:00','Amsterdam','Tbilisi',3),('BGY-OMO','BGY',489,'11:42:00','Milan','Mostar',5),('IST-TBS','IST',234,'16:30:00','Istanbul','Tbilisi',5),('JED-KWI','JED',1000,'09:45:00','Jeddah','Kuwait',2);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_on`
--

DROP TABLE IF EXISTS `reserva_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_on` (
  `Passport_No` decimal(9,0) NOT NULL,
  `serv_ID` decimal(7,0) NOT NULL,
  `St_ID` varchar(5) NOT NULL,
  `Date` date DEFAULT NULL,
  `total_price` decimal(7,2) DEFAULT NULL,
  `Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Passport_No`,`serv_ID`,`St_ID`),
  KEY `Reserva_OnFK2` (`serv_ID`),
  KEY `Reserva_OnFK3` (`St_ID`),
  CONSTRAINT `Reserva_OnFK1` FOREIGN KEY (`Passport_No`) REFERENCES `customer` (`passport_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reserva_OnFK2` FOREIGN KEY (`serv_ID`) REFERENCES `services` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reserva_OnFK3` FOREIGN KEY (`St_ID`) REFERENCES `seats` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_on`
--

LOCK TABLES `reserva_on` WRITE;
/*!40000 ALTER TABLE `reserva_on` DISABLE KEYS */;
INSERT INTO `reserva_on` VALUES (12263678,6,'AA1','2023-11-08',4089.09,'First calss'),(12433571,5,'YK34','2023-09-21',2029.25,'Premium Economy calss'),(34567890,4,'AD3','2023-12-16',4267.86,'First calss'),(45678901,1,'BL40','2023-07-06',1610.51,'Business calss'),(63729264,2,'CJ15','2023-06-27',3301.55,'Business calss');
/*!40000 ALTER TABLE `reserva_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `ID` varchar(5) NOT NULL,
  `class` char(5) NOT NULL,
  `price` decimal(7,0) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `IATA_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Seats_FK` (`IATA_code`),
  CONSTRAINT `Seats_FK` FOREIGN KEY (`IATA_code`) REFERENCES `flight` (`IATA_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seats_chk_1` CHECK ((`status` in (_utf8mb4'Available',_utf8mb4'Reserved')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('AA1','A',2450,'Reserved','AMS-BER'),('AD3','A',1900,'Reserved','BGY-OMO'),('BL40','B',900,'Reserved','IST-TBS'),('CJ15','C',1900,'Reserved','AMS-GVA'),('YK34','Y',1200,'Reserved','JED-KWI');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ID` decimal(7,0) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Healthy food','100'),(2,'Vegetarian food','150'),(3,'Keto meal','120'),(4,'exstra weight','200'),(5,'carry bags','60'),(6,'Delivery to the hotel','80');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'travel_agency'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-10  1:52:05
