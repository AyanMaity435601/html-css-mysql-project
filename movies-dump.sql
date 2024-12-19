-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `award_roles`
--

DROP TABLE IF EXISTS `award_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_roles` (
  `award_name` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `award_details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`award_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_roles`
--

LOCK TABLES `award_roles` WRITE;
/*!40000 ALTER TABLE `award_roles` DISABLE KEYS */;
INSERT INTO `award_roles` VALUES ('BEST ACTOR','MALE ACTOR','BEST ACTOR'),('BEST ACTRESS','FEMALE ACTOR','BEST ACTRESS'),('BEST CINEMATOGRAPHY','CINEMATOGRAPHY',NULL),('BEST DIRECTOR','DIRECTOR','FILM DIRECTOR'),('BEST FILM','FILM','AWARD IN CATEGORY OF BEST FILM'),('BEST LYRICIST','LYRICIST','LYRICS SONG WRITER AWARD'),('BEST MUSIC DIRECTION','MUSIC DIRECTOR',NULL),('BEST MUSIC DIRECTOR','MUSIC DIRECTOR',NULL),('BEST PLAYBACK SINGER FEMALE','FEMALE PLAYBACK SINGER',NULL),('BEST PLAYBACK SINGER MALE','MALE PLAYBACK SINGER',NULL),('BEST SUPPORTING ACTOR','MALE ACTOR',NULL);
/*!40000 ALTER TABLE `award_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `award_name` varchar(100) NOT NULL,
  `award_year` int NOT NULL,
  `awarded_to_movie` varchar(100) DEFAULT NULL,
  `starname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`award_name`,`award_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES ('BEST ACTOR',1994,'BAAZIGAR','SHAHRUKH KHAN'),('BEST ACTOR',1996,'DILWALE DULHANIA LE JAYENGE','SHAHRUKH KHAN'),('BEST ACTOR',2002,'LAGAAN','AMIR KHAN'),('BEST ACTOR',2008,'CHAK DE! INDIA','SHAHRUKH KHAN'),('BEST ACTRESS',1996,'DILWALE DULHANIA LE JAYENGE','KAJOL'),('BEST ACTRESS',2002,'LAGAAN','GRACY SINGH'),('BEST DIRECTOR',1994,'BAAZIGAR','SHAHRUKH KHAN'),('BEST DIRECTOR',1996,'DILWALE DULHANIA LE JAYENGE','ADITYA CHOPRA'),('BEST DIRECTOR',2002,'LAGAAN','ASHUTOSH GOWARIKER'),('BEST FILM',1994,'BAAZIGAR',NULL),('BEST FILM',1996,'DILWALE DULHANIA LE JAYENGE',NULL),('BEST FILM',2002,'LAGAAN',NULL),('BEST LYRICIST',2002,'LAGAAN','JAVED AKHTAR'),('BEST MUSIC DIRECTOR',1994,'BAAZIGAR','ANU MALIK'),('BEST MUSIC DIRECTOR',2002,'LAGAAN','A.R. RAHMAN'),('BEST PLAYBACK SINGER FEMALE',2002,'LAGAAN','ALKA YAGNIK'),('BEST PLAYBACK SINGER MALE',1983,'NAMAK HALAL','KISHORE KUMAR'),('BEST PLAYBACK SINGER MALE',2002,'LAGAAN','UDIT NARAYAN'),('BEST PLAYBACK SINGER MALE',2008,'CHAK DE! INDIA','SUKHWINDER SINGH'),('BEST SUPPORTING ACTOR',1974,'NAMAK HARAM','AMITABH BACHHAN');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `title` varchar(100) NOT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `length` int DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('BAAZIGAR','THRILLER',NULL),('CHAK DE! INDIA','SPORTS',153),('DILWALE DULHANIA LE JAYENGE','ROMANCE',189),('HERA PHERI','COMEDY',156),('KARAN ARJUN','DRAMA',175),('LAGAAN','DRAMA',244),('NAMAK HALAL','COMEDY',172),('NAMAK HARAM','DRAMA',146),('SHOLAY','ACTION',204),('SWADES','DRAMA',189);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stardetails`
--

DROP TABLE IF EXISTS `stardetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stardetails` (
  `starname` varchar(100) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`starname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stardetails`
--

LOCK TABLES `stardetails` WRITE;
/*!40000 ALTER TABLE `stardetails` DISABLE KEYS */;
INSERT INTO `stardetails` VALUES ('A.R. RAHMAN',NULL,'M'),('ADITYA CHOPRA',NULL,'M'),('ALKA YAGNIK',NULL,'F'),('AMIR KHAN','1965-03-14','M'),('AMITABH BACHHAN','1942-10-11','M'),('ANU MALIK',NULL,'M'),('ASHUTOSH GOWARIKER',NULL,'M'),('DHARMENDRA','1935-12-08','M'),('GAYATRI JOSHI',NULL,'F'),('GRACY SINGH',NULL,'F'),('HEMA MALINI','1948-10-16','F'),('JAVED AKHTAR',NULL,'M'),('KAJOL',NULL,'F'),('KISHORE KUMAR',NULL,'M'),('SALMAN KHAN','1965-12-27','M'),('SHAHRUKH KHAN','1965-11-02','M'),('SHATRUGHAN SINHA','1946-07-15','M'),('SHILPA SHETTY','1975-06-08','F'),('SUKHWINDER SINGH',NULL,'M'),('UDIT NARAYAN',NULL,'M');
/*!40000 ALTER TABLE `stardetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starphoto`
--

DROP TABLE IF EXISTS `starphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starphoto` (
  `starname` varchar(100) NOT NULL,
  `Photo` longblob,
  PRIMARY KEY (`starname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starphoto`
--

LOCK TABLES `starphoto` WRITE;
/*!40000 ALTER TABLE `starphoto` DISABLE KEYS */;
INSERT INTO `starphoto` VALUES ('AMITABH BACHHAN','');
/*!40000 ALTER TABLE `starphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starsin`
--

DROP TABLE IF EXISTS `starsin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starsin` (
  `starname` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`starname`,`title`,`role`),
  KEY `fk_cat` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starsin`
--

LOCK TABLES `starsin` WRITE;
/*!40000 ALTER TABLE `starsin` DISABLE KEYS */;
INSERT INTO `starsin` VALUES ('ANU MALIK','BAAZIGAR','MUSIC DIRECTOR'),('KAJOL','BAAZIGAR','FEMALE ACTOR'),('SHAHRUKH KHAN','BAAZIGAR','DIRECTOR'),('SHAHRUKH KHAN','BAAZIGAR','MALE ACTOR'),('SHILPA SHETTY','BAAZIGAR','FEMALE ACTOR'),('SHAHRUKH KHAN','CHAK DE! INDIA','MALE ACTOR'),('SUKHWINDER SINGH','CHAK DE! INDIA','MALE PLAYBACK SINGER'),('ADITYA CHOPRA','DILWALE DULHANIA LE JAYENGE','DIRECTOR'),('KAJOL','DILWALE DULHANIA LE JAYENGE','FEMALE ACTOR'),('SHAHRUKH KHAN','DILWALE DULHANIA LE JAYENGE','MALE ACTOR'),('SALMAN KHAN','KARAN ARJUN','MALE ACTOR'),('SHAHRUKH KHAN','KARAN ARJUN','MALE ACTOR'),('A.R. RAHMAN','LAGAAN','MUSIC DIRECTOR'),('ALKA YAGNIK','LAGAAN','FEMALE PLAYBACK SINGER'),('AMIR KHAN','LAGAAN','MALE ACTOR'),('ASHUTOSH GOWARIKER','LAGAAN','DIRECTOR'),('GRACY SINGH','LAGAAN','FEMALE ACTOR'),('JAVED AKHTAR','LAGAAN','LYRICIST'),('UDIT NARAYAN','LAGAAN','MALE PLAYBACK SINGER'),('AMITABH BACHHAN','NAMAK HALAL','MALE ACTOR'),('KISHORE KUMAR','NAMAK HALAL','MALE PLAYBACK SINGER'),('AMITABH BACHHAN','NAMAK HARAM','MALE ACTOR'),('AMITABH BACHHAN','SHOLAY','MALE ACTOR'),('DHARMENDRA','SHOLAY','MALE ACTOR'),('HEMA MALINI','SHOLAY','FEMALE ACTOR'),('GAYATRI JOSHI','SWADES','FEMALE ACTOR'),('SHAHRUKH KHAN','SWADES','MALE ACTOR');
/*!40000 ALTER TABLE `starsin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `temp1`
--

DROP TABLE IF EXISTS `temp1`;
/*!50001 DROP VIEW IF EXISTS `temp1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `temp1` AS SELECT 
 1 AS `starname`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `temp1`
--

/*!50001 DROP VIEW IF EXISTS `temp1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sganguly`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `temp1` AS select `s`.`starname` AS `starname`,`m`.`genre` AS `genre` from (`movies` `m` join `starsin` `s`) where (`s`.`starname`,`m`.`title`,`m`.`genre`) in (select `s`.`starname`,`m`.`title`,`m`.`genre` from (`movies` `m` join `starsin` `s`) where (`m`.`title` = `s`.`title`)) is false */;
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

-- Dump completed on 2024-08-01 10:39:34
