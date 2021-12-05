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
-- Table structure for table `welders`
--

DROP TABLE IF EXISTS `welders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'организация-работодатель',
  `position_work` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'занимаемая должность',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `welders_company_idx` (`company`),
  KEY `welders_firstname_lastname_birthday_idx` (`firstname`,`lastname`,`birthday`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='сварщики';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welders`
--

LOCK TABLES `welders` WRITE;
/*!40000 ALTER TABLE `welders` DISABLE KEYS */;
INSERT INTO `welders` VALUES (1,'Donavon','White','1990-10-07','Friesen-Stark','Qui dolores eum dolor aut omnis.','\0'),(2,'Ken','Anderson','2019-05-14','Price, Nienow and Cummerata','Quam nobis dolor quia.','\0'),(3,'Kathleen','Pollich','1978-03-14','Kovacek Inc','Voluptas qui et et nihil.',''),(4,'Rogers','Hills','1994-11-27','Kertzmann Inc','Modi ipsa consectetur eligendi voluptas.','\0'),(5,'Marjory','Larson','1983-06-30','Ullrich PLC','Corporis aut et veritatis.',''),(6,'Everette','Boyle','1978-10-07','Erdman LLC','Architecto suscipit fuga quasi aperiam.',''),(7,'Abbie','Raynor','2008-04-17','Rippin Group','Esse nam officiis fugit quod molestiae assumenda.',''),(8,'Omari','Lang','2002-02-20','Kub-Lynch','Laborum quod optio sequi ut vel qui omnis tempore.',''),(9,'Marietta','Kilback','1977-03-31','Conroy-Mosciski','Ullam autem fugiat laboriosam expedita delectus.','\0'),(10,'Kathryne','Luettgen','2011-06-23','Lowe-Ebert','Nisi qui debitis rerum veritatis deserunt.','\0'),(11,'Zora','Steuber','2000-04-12','Nicolas, Kreiger and Dare','Quam iure in odio et.',''),(12,'Dejah','Berge','1996-04-18','Runte-Feil','Tenetur sed et aut laboriosam consequatur consequatur libero.','\0'),(13,'Taryn','Pollich','2005-06-22','Lehner, Gulgowski and Kulas','Facilis asperiores rerum harum omnis voluptates aspernatur atque non.',''),(14,'Noel','Kulas','2021-04-19','Bednar-Hoppe','Sed voluptas dolores laboriosam aut praesentium qui quasi.',''),(15,'Jane','Johnson','1970-12-11','Wintheiser, Schroeder and Sporer','Temporibus corrupti porro exercitationem rerum eius architecto eaque.',''),(16,'Lewis','Witting','2009-11-03','Lockman and Sons','Ex quia aliquam voluptates id sit.','\0'),(17,'Harley','McKenzie','1998-10-05','Deckow-Wyman','Perferendis sapiente quia sit.','\0'),(18,'Schuyler','Brown','1994-03-07','Daniel-Moore','Error ut iusto numquam reprehenderit aperiam.',''),(19,'Nayeli','Boyle','1991-11-21','Armstrong, Heidenreich and Lesch','Soluta molestiae optio tempora repudiandae.',''),(20,'Amiya','Kuphal','1996-10-26','Marks, Sipes and Streich','Iusto non magni quia quis amet et sunt neque.','\0'),(21,'Garnet','Medhurst','1995-02-14','Gerhold, Reichert and Bruen','Iusto ea delectus quis voluptatem.','\0'),(22,'Anita','Altenwerth','2016-01-26','Conroy PLC','Maiores inventore exercitationem totam vel.','\0'),(23,'Lemuel','DuBuque','2012-07-29','Feeney-Jacobi','Est delectus itaque id similique rem nulla.','\0'),(24,'Jason','Ratke','2020-04-29','Hartmann, Rowe and Pollich','Quia cupiditate dolor non officia quia et.','\0'),(25,'Lexi','Medhurst','1989-04-18','Jacobson-Bosco','Labore fugit dolorem ipsam incidunt quia sapiente autem.',''),(26,'Sherman','Mohr','2007-10-05','Marquardt, Mann and Brekke','Consectetur et sed eaque ad soluta reprehenderit.','\0'),(27,'Jennifer','Hayes','1987-10-31','Heaney-Schinner','Quibusdam expedita assumenda eum nam facere itaque perspiciatis.',''),(28,'Domenica','Rowe','1983-09-17','McClure, Schimmel and Lehner','Ad deleniti quae sapiente possimus et laboriosam itaque.','\0'),(29,'Lisette','Grimes','1998-06-05','Little Ltd','Asperiores libero qui doloremque adipisci nostrum provident quia.','\0'),(30,'Laurine','Lemke','2020-11-14','Lebsack and Sons','Iste eum animi est.','');
/*!40000 ALTER TABLE `welders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 12:57:53
