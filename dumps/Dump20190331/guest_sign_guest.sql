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
-- Table structure for table `sign_guest`
--

DROP TABLE IF EXISTS `sign_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `sign` tinyint(1) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign_guest_event_id_phone_96bd84df_uniq` (`event_id`,`phone`),
  CONSTRAINT `sign_guest_event_id_fa7638b3_fk_sign_event_id` FOREIGN KEY (`event_id`) REFERENCES `sign_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_guest`
--

LOCK TABLES `sign_guest` WRITE;
/*!40000 ALTER TABLE `sign_guest` DISABLE KEYS */;
/*!40000 ALTER TABLE `sign_guest` ENABLE KEYS */;
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
