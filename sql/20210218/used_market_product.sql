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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_num` int NOT NULL AUTO_INCREMENT,
  `pd_mb_id` varchar(13) NOT NULL,
  `pd_title` varchar(25) NOT NULL,
  `pd_category` varchar(10) NOT NULL,
  `pd_content` longtext,
  `pd_price` int NOT NULL,
  `pd_deal` varchar(3) NOT NULL,
  `pd_registerDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pd_isSale` varchar(1) NOT NULL DEFAULT 'N',
  `pd_saleDate` varchar(25) DEFAULT NULL,
  `pd_isDel` varchar(1) NOT NULL DEFAULT 'N',
  `pd_count` int NOT NULL DEFAULT '0',
  `pd_views` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pd_num`),
  KEY `FK_member_TO_product_1` (`pd_mb_id`),
  CONSTRAINT `FK_member_TO_product_1` FOREIGN KEY (`pd_mb_id`) REFERENCES `member` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (13,'qweqwe123','청바지 판매합니다.(수정)','남성의류','111(수정)\r\n가나\r\n다라',18000,'직거래','2021-02-09 12:36:28','N',NULL,'N',0,0),(14,'qweqwe123','니트 판매','남성의류','111222',25000,'택배','2021-02-09 12:43:57','N',NULL,'N',0,0),(15,'qweqwe123','전자레인지 판매합니다.','가전','123123',35000,'택배','2021-02-09 17:09:06','N',NULL,'N',0,0),(16,'qweqwe123','책상판매합니다.','가구/인테리어','111\r\n111',45000,'택배','2021-02-10 09:47:18','N',NULL,'N',0,0),(17,'123123123','철재옷장 팝니다.','가구/인테리어','거의 사용하지 않은 새 상품입니다.',25000,'택배','2021-02-10 15:02:15','N',NULL,'N',0,0),(18,'qweqwe123','이미지 순서 테스트 입니다.','키즈','테스트\r\n입니다.',50000,'직거래','2021-02-15 14:18:44','N',NULL,'N',0,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
