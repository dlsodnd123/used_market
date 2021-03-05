CREATE DATABASE  IF NOT EXISTS `used_market` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `used_market`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: used_market
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `stand`
--

DROP TABLE IF EXISTS `stand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stand` (
  `st_name` varchar(25) NOT NULL,
  `st_mb_id` varchar(13) NOT NULL,
  `st_img` varchar(255) DEFAULT NULL,
  `st_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`st_name`),
  KEY `FK_merber_TO_stand_1` (`st_mb_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_merber_TO_stand_1` FOREIGN KEY (`st_mb_id`) REFERENCES `member` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stand`
--

LOCK TABLES `stand` WRITE;
/*!40000 ALTER TABLE `stand` DISABLE KEYS */;
INSERT INTO `stand` VALUES ('123123123의 가판대','123123123','/2021/02/10/23a4f7c6-7f7d-478d-b5f4-3e7c6b29eb15_샘플이미지5.jpg','안녕하세요 123123123의 가판대 입니다.'),('asdasd123의 가판대','asdasd123','/2021/02/23/a2427cf0-288e-4d76-8f02-9fc8b5245c64_기본이미지.jpg',NULL),('green123의 가판대','green123',NULL,NULL),('qweqwe123가판대','qweqwe123','/2021/02/09/42f9ca76-8a26-437f-ae4e-a93ed9cac406_샘플이미지1.jpg','안녕하세요!! 123\n\n\nㅁㅁ'),('rmfls123의 가판대','rmfls123','/2021/02/17/30d8cfb1-64d1-444e-93b6-bbe60276d7f2_샘플이미지10.jpg',NULL),('의 가판대','',NULL,NULL);
/*!40000 ALTER TABLE `stand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-05 15:51:50
