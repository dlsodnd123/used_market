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
  `mb_withdrawalDate` datetime DEFAULT NULL,
  `mb_class` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'mb',
  PRIMARY KEY (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('123123123','$2a$10$NkTnJMllcGhB0R3ZYHs3GO2Wt58xdsJMf3btnkR63k1ME/ZEyt3tO','이순신','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1(수정)','00011114444','qweqwe123@naver.com','normal','2021-02-01 16:40:52','Y','2021-03-09 11:29:14','mb'),('asdasd123','$2a$10$DlgQgvTRbsGQ4XCJnwN7.uRWcSozMhxPMJhj8OwqGa5GhJntPM/eW','정약용','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1(수정)','00011114444','asdasd123@naver.com','normal','2021-02-17 09:10:30','N',NULL,'mb'),('green123','$2a$10$r0vnLZS0HMoxslYGzu1H8uZrNGqCM6JY6bBt.SnBH00CE6yZ3Ew2a','임꺽정','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1(수정)','00011114444','dlsodnd123@naver.com','normal','2021-02-17 09:12:56','N',NULL,'mb'),('qweqwe123','$2a$10$rS5IAQo.3vx8iExS94uYnOo69iDEgUgmeojphp/jakLFBZpvgC0m2','홍길동','남','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1(수정)','00011114444','qweqwe123@naver.com','normal','2021-02-04 12:39:16','N',NULL,'mb'),('rmfls123','$2a$10$N3xbx.p3ivMESyI/hett9O51kx.myIXOjqb5AKSFgKFEBKXXk1ZTC','유관순','여','28681','충북 청주시 서원구 남들로13번길 1','충북 청주시 서원구 수곡동 92-31','1(수정)','00011114444','rmfls123@naver.com','normal','2021-02-17 09:13:39','N',NULL,'mb');
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

-- Dump completed on 2021-03-17 17:47:58
