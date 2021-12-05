-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_cert`
--

DROP TABLE IF EXISTS `area_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_cert` (
  `level_cert_id` bigint(20) unsigned NOT NULL COMMENT 'уровень',
  `welding_method_id` bigint(20) unsigned NOT NULL COMMENT 'способ сварки',
  `gtu_id` bigint(20) unsigned NOT NULL COMMENT 'группа технических усройств',
  PRIMARY KEY (`level_cert_id`,`welding_method_id`,`gtu_id`),
  KEY `welding_method_id` (`welding_method_id`),
  KEY `gtu_id` (`gtu_id`),
  CONSTRAINT `area_cert_ibfk_1` FOREIGN KEY (`level_cert_id`) REFERENCES `level_cert` (`id`),
  CONSTRAINT `area_cert_ibfk_2` FOREIGN KEY (`welding_method_id`) REFERENCES `welding_method` (`id`),
  CONSTRAINT `area_cert_ibfk_3` FOREIGN KEY (`gtu_id`) REFERENCES `gtu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='область аттестации';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_cert`
--

LOCK TABLES `area_cert` WRITE;
/*!40000 ALTER TABLE `area_cert` DISABLE KEYS */;
INSERT INTO `area_cert` VALUES (1,1,1),(1,5,5),(1,9,9),(1,13,13),(1,17,17),(2,2,2),(2,6,6),(2,10,10),(2,14,14),(2,18,18),(3,3,3),(3,7,7),(3,11,11),(3,15,15),(3,19,19),(4,4,4),(4,8,8),(4,12,12),(4,16,16),(4,20,20);
/*!40000 ALTER TABLE `area_cert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 12:55:53
