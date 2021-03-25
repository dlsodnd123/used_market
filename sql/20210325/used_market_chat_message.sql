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
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `chmg_num` int NOT NULL AUTO_INCREMENT,
  `chmg_chro_num` int NOT NULL,
  `chmg_mb_id` varchar(13) NOT NULL,
  `chmg_content` varchar(255) NOT NULL,
  `chmg_sendDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chmg_num`),
  KEY `FK_merber_TO_chat_message_1_idx` (`chmg_mb_id`),
  KEY `FK_chat_room_TO_chat_message_1_idx` (`chmg_chro_num`),
  CONSTRAINT `FK_chat_room_TO_chat_message_1` FOREIGN KEY (`chmg_chro_num`) REFERENCES `chat_room` (`chro_num`),
  CONSTRAINT `Fk_member_TO_chat_message_1` FOREIGN KEY (`chmg_mb_id`) REFERENCES `member` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (3,1,'asdasd123','구매가능 한가요?','2021-03-24 11:18:32'),(4,1,'rmfls123','네 가능합니다','2021-03-24 11:22:55'),(5,1,'asdasd123','택배로도 가능 한가요?','2021-03-24 11:23:18'),(6,1,'asdasd123','가격 얼마까지 절충 가능 한가요?? 5만원까지 가능한가요??','2021-03-24 11:23:37'),(7,6,'asdasd123','구매가능한가요?','2021-03-25 09:14:46'),(8,7,'asdasd123','아직 판매중인가요?','2021-03-25 09:15:37'),(9,8,'qweqwe123','혹시 아직 판매중이신가요??','2021-03-25 09:16:29'),(2215,1,'asdasd123','123123','2021-03-25 13:02:16');
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-25 13:09:06
