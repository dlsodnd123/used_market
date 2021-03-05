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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mb_id` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mb_pw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mb_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mb_gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mb_postcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mb_roadAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mb_jibunAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mb_detailAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mb_phone` varchar(15) NOT NULL,
  `mb_email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mb_division` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mb_ joinDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mb_isWithdrawal` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  `mb_withdrawalDate` date DEFAULT NULL,
  `mb_class` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'mb',
  PRIMARY KEY (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('','$2a$10$q.YNpy.CQdPZdXxruoIhQ.hm7MjyGHt68eyblZSrh2VjFVh.uT74O','','','','','','','','','normal','2021-03-05 12:42:37','N',NULL,'mb'),('123123123','$2a$10$2lyR1868uppVN0JX8NHjcOQHFSSIMX7OzUdJiyUperWF5TQH2Rd5a','이순신','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1','99988887777','123123123@naver.com','normal','2021-02-01 16:40:52','N',NULL,'mb'),('asdasd123','$2a$10$6SKts456HNkc6u5HsPCRaOymoNzeLO.GW1sgNZB9us1m5j8kgd.R2','정약용','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1','11155556666','asdasd123@naver.com','normal','2021-02-17 09:10:30','N',NULL,'mb'),('green123','$2a$10$0dUaQkdBKiiWPRlFrS/b3ugYGyYoA8qnBPAd/pQ11zYux55S09UUm','임꺽정','남','34522','대전 동구 새울로68번길 34','대전 동구 용운동 393-5','1','33344445555','green123@naver.com','normal','2021-02-17 09:12:56','N',NULL,'mb'),('qweqwe123','$2a$10$rS5IAQo.3vx8iExS94uYnOo69iDEgUgmeojphp/jakLFBZpvgC0m2','홍길동','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1','00011114444','qweqwe123@naver.com','normal','2021-02-04 12:39:16','N',NULL,'mb'),('rmfls123','$2a$10$WJbiOH19WzGJEJlYyl8Lq..uTI9csg7gTd/qR8xdDJsZXm/VL8/4S','유관순','여','34522','대전 동구 새울로68번길 34','대전 동구 용운동 393-5','1','22255559999','rmfls123@naver.com','normal','2021-02-17 09:13:39','N',NULL,'mb');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
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
