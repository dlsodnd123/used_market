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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cmt_num` int NOT NULL AUTO_INCREMENT,
  `cmt_bo_num` int NOT NULL,
  `cmt_mb_id` varchar(13) NOT NULL,
  `cmt_pd_num` int DEFAULT NULL,
  `cmt_content` varchar(50) NOT NULL,
  `cmt_isDel` varchar(1) NOT NULL DEFAULT 'N',
  `cmt_registerDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmt_num`),
  KEY `FK_merber_TO_comment_1` (`cmt_mb_id`) /*!80000 INVISIBLE */,
  KEY `FK_board_TO_comment_1_idx` (`cmt_bo_num`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_board_TO_comment_1` FOREIGN KEY (`cmt_bo_num`) REFERENCES `board` (`bo_num`),
  CONSTRAINT `FK_merber_TO_comment_1` FOREIGN KEY (`cmt_mb_id`) REFERENCES `member` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (120,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:18:28'),(121,77,'qweqwe123',0,'답글 2','Y','2021-03-04 17:25:53'),(122,78,'qweqwe123',0,'답글 3','Y','2021-03-04 17:26:22'),(123,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:27:38'),(124,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:28:25'),(125,77,'qweqwe123',0,'답글','Y','2021-03-04 17:29:54'),(126,78,'qweqwe123',0,'답글 3','Y','2021-03-04 17:31:10'),(127,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:32:11'),(128,77,'qweqwe123',0,'답글 2(수정)','Y','2021-03-04 17:32:19'),(129,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:33:43'),(130,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:34:51'),(131,76,'qweqwe123',0,'답글 1','Y','2021-03-04 17:35:14'),(132,76,'qweqwe123',0,'ㅂㅈㄱㅂㅈㄷㄱㅂ','Y','2021-03-04 17:35:32'),(133,76,'qweqwe123',0,'123123123','Y','2021-03-04 17:36:27'),(134,76,'qweqwe123',0,'123132','Y','2021-03-04 17:38:06'),(135,76,'qweqwe123',0,'123123','Y','2021-03-04 17:38:21'),(136,76,'qweqwe123',0,'답글 ','Y','2021-03-05 09:00:49'),(137,76,'qweqwe123',0,'답글','Y','2021-03-05 09:09:15'),(138,76,'qweqwe123',0,'답글123123(123123)','Y','2021-03-05 09:09:34'),(139,76,'qweqwe123',0,'23423423423','Y','2021-03-05 09:09:44');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-05 15:51:49
