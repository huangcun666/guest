-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: guest
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sign_event`
--

DROP TABLE IF EXISTS `sign_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_event`
--

LOCK TABLES `sign_event` WRITE;
/*!40000 ALTER TABLE `sign_event` DISABLE KEYS */;
INSERT INTO `sign_event` VALUES (2,'小米手机发布会',1,0,'北京水立方','2019-03-24 09:33:15.442766',NULL,'2019-03-24 09:33:15'),(3,'红米手机发布会',1,0,'北京会展中心','2019-03-24 09:33:15.442766',NULL,'2019-03-24 09:33:15');
/*!40000 ALTER TABLE `sign_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-31 17:15:35
