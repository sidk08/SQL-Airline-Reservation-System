-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `Zipcode` int(11) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1004,2115,'MA','Boston','USA'),(1005,415,'CA','California','USA'),(1006,2515,'TN','Memphis','USA'),(1007,2315,'TX','Texas','USA');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airliner`
--

DROP TABLE IF EXISTS `airliner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airliner` (
  `AirlinerId` int(11) NOT NULL,
  `AirlinerName` varchar(45) DEFAULT NULL,
  `AirlinerType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AirlinerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airliner`
--

LOCK TABLES `airliner` WRITE;
/*!40000 ALTER TABLE `airliner` DISABLE KEYS */;
INSERT INTO `airliner` VALUES (170,'Luftsanza','Wide-Body'),(273,'AirIndia','Wide-Body'),(321,'KLM','Narrow-Body'),(747,'Emirates','Wide-Body'),(786,'AirFrance','Large - Body');
/*!40000 ALTER TABLE `airliner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airliner_has_manufaturer`
--

DROP TABLE IF EXISTS `airliner_has_manufaturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airliner_has_manufaturer` (
  `ManuID` int(11) NOT NULL,
  `Airliner_AirlinerId` int(11) NOT NULL,
  PRIMARY KEY (`Airliner_AirlinerId`),
  KEY `fk_Airliner_has_Manufaturer_Manufaturer1_idx` (`ManuID`),
  CONSTRAINT `ManuID` FOREIGN KEY (`ManuID`) REFERENCES `manufaturer` (`ManuID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airliner_has_Manufaturer_Airliner1` FOREIGN KEY (`Airliner_AirlinerId`) REFERENCES `airliner` (`AirlinerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airliner_has_manufaturer`
--

LOCK TABLES `airliner_has_manufaturer` WRITE;
/*!40000 ALTER TABLE `airliner_has_manufaturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `airliner_has_manufaturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bookingviewinformationtable`
--

DROP TABLE IF EXISTS `bookingviewinformationtable`;
/*!50001 DROP VIEW IF EXISTS `bookingviewinformationtable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookingviewinformationtable` AS SELECT 
 1 AS `CustomerId`,
 1 AS `FirstName`,
 1 AS `ReservationID`,
 1 AS `ReservationDate`,
 1 AS `FlightID`,
 1 AS `PaymentId`,
 1 AS `PaymentDate`,
 1 AS `PaymentMethodId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `CardID` int(11) NOT NULL,
  `CardType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CardID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp850;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (3001,'Master'),(3002,'Visa'),(3003,'Mastro');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Mobileno` int(11) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `AddressID` int(11) NOT NULL,
  `CreditCard_CardID` int(11) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `fk_Customer_Address_idx` (`AddressID`),
  KEY `fk_Customer_CreditCard1_idx` (`CreditCard_CardID`),
  CONSTRAINT `AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_CreditCard1` FOREIGN KEY (`CreditCard_CardID`) REFERENCES `creditcard` (`CardID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2142,'Siddhesh','Kuvelar',984445565,'kuvelar.s@gmai.com',1004,3001),(2147,'Ritesh','Patil',984445566,'patil.ri@gmai.com',1005,3002),(2149,'Apurva','kushare',984445568,'apurva.s@gmai.com',1007,3002),(2198,'Aashta','Dinchakicha',984445567,'shah.s@gmai.com',1006,3003);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `FlightID` varchar(23) NOT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `CertificateId` int(11) NOT NULL,
  `AirlinerId` int(11) NOT NULL,
  `TotalSeatCapacity` int(11) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  `TotalSeatBooked` int(11) DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  KEY `fk_Flight_MaintainanceCertificate1_idx` (`CertificateId`),
  KEY `fk_Flight_Airliner1_idx` (`AirlinerId`),
  CONSTRAINT `AirlinerId` FOREIGN KEY (`AirlinerId`) REFERENCES `airliner` (`AirlinerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CertificateId` FOREIGN KEY (`CertificateId`) REFERENCES `maintainancecertificate` (`CertificateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('AF-360','Boston','Dallas','2017-12-24 21:40:00','2017-12-25 01:23:00',1,786,44,'476',48),('AI-456','Surat','Chicago','2018-01-07 21:40:00','2018-01-08 01:23:00',0,273,55,'523',0),('EM-360','London','Newark','2017-12-08 08:40:00','2017-12-09 18:23:00',1,747,75,'400',30),('EM-549','Frankfurt','Boston','2017-12-18 09:40:00','2017-12-19 12:23:00',1,747,50,'546',32),('KL-360','London','Newark','2017-12-28 10:40:00','2017-12-28 18:23:00',1,321,100,'800',30),('KL-712','Memphis','Boston','2017-12-20 06:40:00','2017-12-20 11:45:00',1,321,75,'448',75),('KL-713','London','Newark','2017-12-18 18:40:00','2017-12-19 18:23:00',1,321,65,'400',60);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainancecertificate`
--

DROP TABLE IF EXISTS `maintainancecertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintainancecertificate` (
  `CertificateId` int(11) NOT NULL,
  `CertificateStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CertificateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainancecertificate`
--

LOCK TABLES `maintainancecertificate` WRITE;
/*!40000 ALTER TABLE `maintainancecertificate` DISABLE KEYS */;
INSERT INTO `maintainancecertificate` VALUES (0,'Invalid'),(1,'Valid');
/*!40000 ALTER TABLE `maintainancecertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufaturer`
--

DROP TABLE IF EXISTS `manufaturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufaturer` (
  `ManuID` int(11) NOT NULL,
  `Manufacture Name` varchar(45) DEFAULT NULL,
  `Manufaturercol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ManuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufaturer`
--

LOCK TABLES `manufaturer` WRITE;
/*!40000 ALTER TABLE `manufaturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufaturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentId` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `PaymentAmount` int(11) DEFAULT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `ReservationID` int(11) NOT NULL,
  PRIMARY KEY (`PaymentId`),
  KEY `fk_Payment_Payment Method1_idx` (`PaymentMethodId`),
  KEY `fk_Payment_Reservation1_idx` (`ReservationID`),
  CONSTRAINT `PaymentMethodId` FOREIGN KEY (`PaymentMethodId`) REFERENCES `paymentmethod` (`PaymentMethodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ReservationID` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (6000,'2017-10-19 10:40:00',3200,52,2001),(6001,'2017-10-20 10:40:00',2240,52,2002);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethod` (
  `PaymentMethodId` int(11) NOT NULL,
  `PaymentInvoiceCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (51,'Cash'),(52,'Card');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `ReservationDate` varchar(45) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `FlightID` varchar(23) NOT NULL,
  `TicketTypeID` int(11) NOT NULL,
  `SeatBooked` int(11) DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `fk_Reservation_Customer1_idx` (`CustomerId`),
  KEY `fk_Reservation_Flight1_idx` (`FlightID`),
  KEY `TicketTypeID_idx` (`TicketTypeID`),
  CONSTRAINT `CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FlightID` FOREIGN KEY (`FlightID`) REFERENCES `flight` (`FlightID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TicketTypeID` FOREIGN KEY (`TicketTypeID`) REFERENCES `tickettype` (`TicketTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (2001,'2017-10-19 12:23:00',2142,'KL-360',10,2),(2002,'2017-10-20 12:23:00',2147,'KL-712',11,4),(2003,'2017-10-21 12:12:00',2198,'EM-549',11,5),(2004,'2017-10-22 12:23:00',2149,'EM-360',10,12),(2005,'2017-10-23 12:23:00',2147,'KL-360',10,6),(2006,'2017-10-24 12:23:00',2142,'AF-360',11,8);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER example_before_book_seat
     BEFORE INSERT ON reservation FOR EACH ROW
    
     BEGIN
           DECLARE xid INT;
           declare yid INT;
          
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = new.flightid into xid,yid;
          
          
          
          if(yid < xid + new.SeatBooked)
     
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not able to Book seat.All seats for this flighr are booked';
          END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER example_increment_by_one
     after INSERT ON reservation FOR EACH ROW
    
     BEGIN
           DECLARE xid INT;
           declare yid int;
			declare zid Int;
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = new.flightid into xid,yid;
		
        
        if(yid > xid + new.SeatBooked)
     
          THEN
               
          
          
               
                    
		UPDATE flight

         SET TotalSeatBooked = xid + NEW.SeatBooked
         WHERE flight.FlightID = NEW.flightid ;
          
          END IF;
          

          
     
		
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_booking 
     after delete ON reservation FOR EACH ROW
    
     BEGIN
           DECLARE xid INT;
           declare yid int;
			declare zid Int;
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = old.flightid into xid,yid;
		
        
        
	  UPDATE flight

         SET TotalSeatBooked = xid - old.SeatBooked
         WHERE flight.FlightID = old.flightid ;
          
          
  
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seatbooked`
--

DROP TABLE IF EXISTS `seatbooked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seatbooked` (
  `SeatNumber` int(11) NOT NULL,
  `SeatType` varchar(45) DEFAULT NULL,
  `Reservation_ReservationID` int(11) NOT NULL,
  PRIMARY KEY (`SeatNumber`),
  KEY `fk_SeatBooked_Reservation1_idx` (`Reservation_ReservationID`),
  CONSTRAINT `fk_SeatBooked_Reservation1` FOREIGN KEY (`Reservation_ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatbooked`
--

LOCK TABLES `seatbooked` WRITE;
/*!40000 ALTER TABLE `seatbooked` DISABLE KEYS */;
INSERT INTO `seatbooked` VALUES (23,'Economy',2001),(24,'Busines',2002),(28,'Ecomony',2001);
/*!40000 ALTER TABLE `seatbooked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickettype`
--

DROP TABLE IF EXISTS `tickettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickettype` (
  `TicketTypeID` int(11) NOT NULL,
  `TicketTypeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TicketTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickettype`
--

LOCK TABLES `tickettype` WRITE;
/*!40000 ALTER TABLE `tickettype` DISABLE KEYS */;
INSERT INTO `tickettype` VALUES (10,'One way'),(11,'Two Way');
/*!40000 ALTER TABLE `tickettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `CalculateRevenuesByAirline` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateRevenuesByAirline`()
BEGIN
SELECT airliner.AirlinerName , sum(Price * flight.TotalSeatBooked) as rev from flight
INNER JOIN airliner
ON
airliner.AirlinerId = flight.AirlinerId
GROUP BY AirlinerName
order by rev desc
limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeMaintanceCertificateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeMaintanceCertificateStatus`(flightID varchar(30),CertificateId INT)
BEGIN
	
    
    UPDATE flight
SET flight.CertificateId = CertificateId
WHERE flight.FlightID = flightID;
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `firstAvailableFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `firstAvailableFlight`(param datetime)
BEGIN
SELECT flight.DepartureTime as 'FirstAvailableFlight' ,flight.Source,flight.Destination from flight 
WHERE flight.DepartureTime > param
order by flight.DepartureTime asc
limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewCustomerRecordByBookingId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewCustomerRecordByBookingId`(param1 INT)
BEGIN
select c.FirstName,c.LastName,r.ReservationID,r.ReservationDate,r.TicketTypeID,r.FlightID,s.SeatNumber,s.SeatType
from customer as c
inner join reservation as r
on
c.CustomerId  = r.CustomerId
inner join seatbooked as s on
r.ReservationID = s.Reservation_ReservationID

where c.CustomerId = param1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bookingviewinformationtable`
--

/*!50001 DROP VIEW IF EXISTS `bookingviewinformationtable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookingviewinformationtable` AS select `c`.`CustomerId` AS `CustomerId`,`c`.`FirstName` AS `FirstName`,`r`.`ReservationID` AS `ReservationID`,`r`.`ReservationDate` AS `ReservationDate`,`r`.`FlightID` AS `FlightID`,`p`.`PaymentId` AS `PaymentId`,`p`.`PaymentDate` AS `PaymentDate`,`p`.`PaymentMethodId` AS `PaymentMethodId` from ((`customer` `c` join `reservation` `r` on((`c`.`CustomerId` = `r`.`CustomerId`))) join `payment` `p` on((`r`.`ReservationID` = `p`.`ReservationID`))) where (`p`.`PaymentAmount` > 500) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14  2:01:38
