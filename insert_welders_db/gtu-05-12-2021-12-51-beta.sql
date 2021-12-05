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
-- Table structure for table `gtu`
--

DROP TABLE IF EXISTS `gtu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gtu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='группы технических устройств';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gtu`
--

LOCK TABLES `gtu` WRITE;
/*!40000 ALTER TABLE `gtu` DISABLE KEYS */;
INSERT INTO `gtu` VALUES (1,'non','Iste ratione maiores enim repellat.'),(2,'quisquam','Autem adipisci consequatur a.'),(3,'saepe','Odit quis numquam illum.'),(4,'cupiditate','Quos ratione ut autem eius.'),(5,'error','Voluptas explicabo quibusdam nam iure soluta consequatur.'),(6,'ipsum','In assumenda et qui saepe.'),(7,'et','Libero fugiat excepturi facere doloribus.'),(8,'est','Cupiditate rerum quod nostrum.'),(9,'quia','Repellendus consequatur sit dolorum impedit doloremque minima earum.'),(10,'consequatur','Cupiditate cupiditate quia exercitationem sit eum sed distinctio.'),(11,'libero','Itaque quibusdam ut quia quia possimus dignissimos voluptatibus.'),(12,'magni','Eos sit quasi facere earum.'),(13,'autem','Harum est laboriosam voluptas ipsa inventore dolor enim.'),(14,'aperiam','Voluptate dolore dolores nesciunt aut ratione.'),(15,'cumque','Aliquam doloribus sed aut.'),(16,'sint','Qui quam natus quis dolor.'),(17,'voluptatem','Esse sed commodi voluptatem perferendis eligendi.'),(18,'laboriosam','Enim et facilis nihil eaque accusamus explicabo vel.'),(19,'nemo','Reiciendis aliquid perferendis voluptatem dolor.'),(20,'dolor','Minus veniam non accusantium praesentium architecto non officiis.'),(21,'aliquam','Illum assumenda consequatur quas dignissimos in.'),(22,'earum','Non quidem cupiditate assumenda praesentium eligendi.'),(23,'facere','Nulla expedita minima exercitationem sed velit quasi.'),(24,'aliquid','Aut corrupti odit facilis eum saepe aperiam molestias.'),(25,'beatae','Corporis repellat est nesciunt itaque ut id.'),(26,'harum','Quaerat rerum minus cupiditate maiores est laboriosam.'),(27,'ad','Quod expedita est dolorum quas odio aspernatur nihil.'),(28,'reiciendis','Omnis debitis minus sint porro maiores impedit autem.'),(29,'deserunt','Aliquid facere tenetur fuga consectetur explicabo consequatur.'),(30,'quos','Enim nisi occaecati et cumque optio nemo.'),(31,'voluptate','Dolore velit dolore ut eum amet.'),(32,'voluptates','Hic nemo quod libero nostrum.'),(33,'iste','Mollitia distinctio id qui occaecati odit reprehenderit sequi sunt.'),(34,'aut','Et voluptatibus adipisci quaerat enim.'),(35,'adipisci','Nemo temporibus earum nihil eum in aut.'),(36,'occaecati','Ea impedit sint iste dolor praesentium asperiores.'),(37,'vitae','Sit autem ipsum consequatur veritatis est quia.'),(38,'inventore','Est sunt exercitationem voluptatum itaque.'),(39,'repellat','Veritatis asperiores amet quaerat incidunt qui illum.'),(40,'laborum','Odio a rerum voluptatem rerum et.'),(41,'suscipit','Optio excepturi voluptatem aspernatur impedit sed repellendus.'),(42,'eveniet','Nam et aut sed et numquam rerum.'),(43,'sed','Quos quisquam et et quia ut.'),(44,'delectus','Iusto vel accusamus suscipit maiores qui sed nesciunt.'),(45,'perferendis','Enim maxime autem ipsa consectetur totam natus quam.'),(46,'corporis','Dolores omnis quis veritatis ex ut ut.'),(47,'ut','Optio illum ut suscipit incidunt dignissimos placeat sed odio.'),(48,'omnis','Eveniet incidunt hic explicabo.'),(49,'ducimus','Animi rerum delectus cum illum praesentium illo occaecati.'),(50,'pariatur','Laudantium amet enim explicabo et vel ducimus.');
/*!40000 ALTER TABLE `gtu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 12:51:53
