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
  `bo_st_name` varchar(25) DEFAULT NULL,
  `bo_type` int NOT NULL,
  `bo_title` varchar(15) DEFAULT NULL,
  `bo_content` longtext NOT NULL,
  `bo_registerDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bo_isDel` varchar(1) NOT NULL DEFAULT 'N',
  `bo_views` int NOT NULL DEFAULT '0',
  `bo_orignNum` int DEFAULT NULL,
  `bo_groupOrd` int DEFAULT NULL,
  `bo_groupLayer` int DEFAULT NULL,
  PRIMARY KEY (`bo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (79,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 입니다.','2021-03-29 16:16:08','Y',0,NULL,NULL,NULL),(80,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 16:53:26','N',0,NULL,NULL,NULL),(81,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기 2','2021-03-29 17:19:08','Y',0,NULL,NULL,NULL),(82,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기 3','2021-03-29 17:19:13','Y',0,NULL,NULL,NULL),(83,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기2','2021-03-29 17:20:33','Y',0,NULL,NULL,NULL),(84,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기3','2021-03-29 17:21:46','Y',0,NULL,NULL,NULL),(85,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기2','2021-03-29 17:22:01','Y',0,NULL,NULL,NULL),(86,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기3','2021-03-29 17:22:06','Y',0,NULL,NULL,NULL),(87,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:22:20','Y',0,NULL,NULL,NULL),(88,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:22:26','Y',0,NULL,NULL,NULL),(89,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:22:30','Y',0,NULL,NULL,NULL),(90,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:22:34','Y',0,NULL,NULL,NULL),(91,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:24:37','Y',0,NULL,NULL,NULL),(92,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:24:42','Y',0,NULL,NULL,NULL),(93,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:24:47','Y',0,NULL,NULL,NULL),(94,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기2','2021-03-29 17:29:53','Y',0,NULL,NULL,NULL),(95,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기3','2021-03-29 17:29:59','Y',0,NULL,NULL,NULL),(96,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기4','2021-03-29 17:30:03','Y',0,NULL,NULL,NULL),(97,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:30:30','Y',0,NULL,NULL,NULL),(98,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:30:34','Y',0,NULL,NULL,NULL),(99,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:30:40','Y',0,NULL,NULL,NULL),(100,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:31:05','Y',0,NULL,NULL,NULL),(101,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:31:13','Y',0,NULL,NULL,NULL),(102,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:32:34','Y',0,NULL,NULL,NULL),(103,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:32:40','Y',0,NULL,NULL,NULL),(104,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:35:11','Y',0,NULL,NULL,NULL),(105,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:35:17','Y',0,NULL,NULL,NULL),(106,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:35:20','Y',0,NULL,NULL,NULL),(107,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 남기기','2021-03-29 17:35:31','Y',0,NULL,NULL,NULL),(108,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항1','2021-03-29 17:40:04','Y',0,NULL,NULL,NULL),(109,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항2','2021-03-29 17:40:10','Y',0,NULL,NULL,NULL),(110,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항 3','2021-03-29 17:40:16','Y',0,NULL,NULL,NULL),(111,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:40:37','Y',0,NULL,NULL,NULL),(112,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:40:44','Y',0,NULL,NULL,NULL),(113,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:41:58','Y',0,NULL,NULL,NULL),(114,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:42:01','Y',0,NULL,NULL,NULL),(115,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:42:04','Y',0,NULL,NULL,NULL),(116,'asdasd123',0,'qweqwe가판대',5,NULL,'오ㅗ오오','2021-03-29 17:42:15','Y',0,NULL,NULL,NULL),(117,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:42:21','Y',0,NULL,NULL,NULL),(118,'asdasd123',0,'qweqwe가판대',5,NULL,'문의사항','2021-03-29 17:42:26','Y',0,NULL,NULL,NULL);
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

-- Dump completed on 2021-03-29 17:48:35
