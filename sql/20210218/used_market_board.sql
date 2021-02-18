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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `bo_num` int NOT NULL AUTO_INCREMENT,
  `bo_mb_id` varchar(13) NOT NULL,
  `bo_pd_num` int DEFAULT NULL,
  `bo_type` int NOT NULL,
  `bo_title` varchar(15) DEFAULT NULL,
  `bo_content` longtext NOT NULL,
  `bo_registerDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_isDel` varchar(1) NOT NULL DEFAULT 'N',
  `bo_views` int NOT NULL DEFAULT '0',
  `bo_orignNum` int DEFAULT NULL,
  `bo_groupOrd` int DEFAULT NULL,
  `bo_groupLayer` int DEFAULT NULL,
  PRIMARY KEY (`bo_num`),
  KEY `FK_merber_TO_board_1` (`bo_mb_id`),
  KEY `FK_product_TO_board_1_idx` (`bo_pd_num`),
  CONSTRAINT `FK_merber_TO_board_1` FOREIGN KEY (`bo_mb_id`) REFERENCES `member` (`mb_id`),
  CONSTRAINT `FK_product_TO_board_1` FOREIGN KEY (`bo_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'qweqwe123',13,4,NULL,'내용수정 테스트','2021-02-16 11:40:07','Y',0,NULL,NULL,NULL),(2,'qweqwe123',13,4,NULL,'변경사항','2021-02-16 12:01:01','Y',0,NULL,NULL,NULL),(3,'qweqwe123',13,4,NULL,'내용수정 테스트','2021-02-16 12:01:14','N',0,NULL,NULL,NULL),(4,'qweqwe123',13,4,NULL,'asdasd','2021-02-17 14:54:58','N',0,NULL,NULL,NULL),(5,'qweqwe123',13,4,NULL,'상품문의 테스트','2021-02-17 14:55:12','N',0,NULL,NULL,NULL),(6,'qweqwe123',13,4,NULL,'상품문의 테스트 2','2021-02-17 16:02:59','N',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 17:51:10
