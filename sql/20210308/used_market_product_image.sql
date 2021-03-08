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
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `pdimg_num` int NOT NULL AUTO_INCREMENT,
  `pdimg_pd_num` int NOT NULL,
  `pdimg_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pdimg_num`),
  KEY `FK_product_TO_product_image_1_idx` (`pdimg_pd_num`),
  CONSTRAINT `FK_product_TO_product_image_1` FOREIGN KEY (`pdimg_pd_num`) REFERENCES `product` (`pd_num`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (13,17,'/2021/02/10/300dc6cb-5fd5-427e-9f0e-5aa173043e57_샘플이미지3.jpg'),(17,13,'/2021/02/15/01842c3d-5996-4e25-ab28-f109758db79f_샘플이미지1.jpg'),(18,13,'/2021/02/15/3713b1fe-cf34-4696-ac88-3edcdf8ad823_샘플이미지2.jpg'),(19,14,'/2021/02/15/5580c310-b8d3-46b1-b1bc-818e87b026d3_샘플이미지3.jpg'),(20,14,'/2021/02/15/7e306c79-4d89-4c98-8874-21ca0ac9ace7_샘플이미지4.jpg'),(21,14,'/2021/02/15/d4e88a2d-a18e-4257-a345-c8ea7e6ba4bf_샘플이미지5.jpg'),(22,15,'/2021/02/15/c0f1210b-a8c8-4eac-8c2a-46221d85350a_샘플이미지6.jpg'),(23,15,'/2021/02/15/6a1e4bdc-3b3a-4d23-be3c-3fa97ed96c48_샘플이미지7.jpg'),(24,15,'/2021/02/15/d5377190-5a40-4fb9-8ccc-f014de6dd516_샘플이미지8.jpg'),(25,16,'/2021/02/15/1e371105-33ee-48b0-9008-d0a4dda4a1c8_샘플이미지9.jpg'),(26,16,'/2021/02/15/3b61b5fc-495b-41a6-ab58-4c498abb6cea_샘플이미지10.jpg'),(27,18,'/2021/02/15/5c60872c-7b8e-48d8-9fe4-3f7e8c9b7281_샘플이미지11.jpg'),(28,18,'/2021/02/15/e9da0bd5-7246-4b59-9858-548642cdd82a_샘플이미지12.jpg'),(29,18,'/2021/02/15/6611a60e-530d-4c73-9add-6f547b3c5e84_샘플이미지13.jpg'),(30,18,'/2021/02/15/6c9f7452-0d08-49f3-b416-2827c7842380_샘플이미지14.jpg'),(31,19,'/2021/02/25/e2cdf1e6-3cad-466f-9d48-8690b18e1c10_스타벅스 기프티콘.jpg'),(32,20,'/2021/02/25/a55bfd7c-7f45-432e-a2ae-40232d8e31ff_커블체어.jpg'),(33,20,'/2021/02/25/7fdbf902-d5e9-4af0-8089-bb2fc8a81f5b_커블체어2.jpg'),(34,20,'/2021/02/25/e3867476-3950-4635-9e56-5e9fa26e488a_커블체어3.jpg.crdownload'),(35,21,'/2021/02/25/c5678a35-af81-4097-a44c-531bb74446cb_갤럭시 워치.jpg'),(36,21,'/2021/02/25/b09fe5b2-e99c-4d80-a67f-d48e606ee9a0_갤럭시 워치2.jpg'),(37,21,'/2021/02/25/df8455b7-51d4-4264-8eec-9211d89b6e6b_갤럭시 워치3.jpg'),(38,21,'/2021/02/25/db579245-dafc-44ee-adbf-8175e823b1d5_갤럭시 워치4.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 17:47:16
