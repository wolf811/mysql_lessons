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
-- Table structure for table `welding_method`
--

DROP TABLE IF EXISTS `welding_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `welding_method` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='способ сварки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welding_method`
--

LOCK TABLES `welding_method` WRITE;
/*!40000 ALTER TABLE `welding_method` DISABLE KEYS */;
INSERT INTO `welding_method` VALUES (1,'temporibus','Ut quia corrupti assumenda praesentium suscipit aut qui.'),(2,'eveniet','Quibusdam nobis sint velit numquam.'),(3,'velit','Debitis quia dolor nulla omnis cumque animi.'),(4,'qui','Officiis provident dolor eius at nihil.'),(5,'omnis','Perspiciatis est in doloribus iusto sint consequatur.'),(6,'et','Eos magnam omnis aut pariatur saepe totam.'),(7,'aspernatur','Occaecati rerum ad hic.'),(8,'porro','Incidunt iure inventore similique illum esse vel est enim.'),(9,'sed','Eaque et minima quam recusandae cumque excepturi consequatur.'),(10,'soluta','In itaque enim iusto ipsa quo.'),(11,'deserunt','Iure doloremque et voluptates et sit nam.'),(12,'nisi','Quia quis ut veritatis cupiditate consectetur aspernatur inventore nihil.'),(13,'sit','Sit molestiae quae omnis voluptas.'),(14,'ipsam','Et officiis rerum maiores dolorem expedita.'),(15,'esse','Iste et aut voluptatum reprehenderit saepe itaque voluptatem.'),(16,'pariatur','Accusamus sint aliquid adipisci cupiditate soluta aspernatur esse dolorem.'),(17,'excepturi','Quisquam placeat molestias atque ipsam nam nobis.'),(18,'vel','Est maiores quis eum possimus ipsa.'),(19,'veritatis','Et tempora perferendis qui voluptatem esse consectetur et.'),(20,'nam','Sed optio est quo fuga sunt dignissimos.'),(21,'laboriosam','Modi voluptate iure officia.'),(22,'ea','Id officiis corrupti corporis nihil unde exercitationem dolorem aut.'),(23,'rem','Nostrum accusantium esse eos officia.'),(24,'possimus','Dolor eius sit sit iure nostrum rem similique impedit.'),(25,'nihil','Rem ut dignissimos illum suscipit.'),(26,'sunt','Sed sed earum qui nobis.'),(27,'aut','Dicta sapiente tempore atque sit provident laboriosam.'),(28,'voluptates','Est sit sit sunt eos.'),(29,'est','Quis est nesciunt maxime.'),(30,'quo','Itaque eum et consectetur.'),(31,'minus','Ipsa illum eligendi tempora ex possimus tempora molestiae.'),(32,'dolor','Illo ducimus nulla non similique laboriosam deserunt ea.'),(33,'accusamus','Aperiam dolorem dolores est et ducimus dolor minus.'),(34,'quasi','Cum et corrupti saepe voluptatem laborum.'),(35,'facere','Non eos sed veniam ducimus velit.'),(36,'rerum','Libero qui maxime necessitatibus dicta.'),(37,'ullam','Possimus eos omnis sed aliquam aut magni molestias.'),(38,'officiis','Ad quia quia natus libero et.'),(39,'totam','Perferendis qui nemo deserunt sit.'),(40,'earum','Amet id autem consequatur tenetur.'),(41,'enim','Dolore ratione voluptas quidem corporis sed sit qui.'),(42,'distinctio','Officiis veniam ut animi sit.'),(43,'reprehenderit','Facilis autem est error deleniti maxime autem distinctio.'),(44,'tempora','Ipsum ratione quasi dicta facere quo voluptatum.'),(45,'ut','Qui nulla dolorem molestias totam.'),(46,'quod','Placeat sit nostrum aut aut quia repudiandae ratione.'),(47,'quia','Quod repellat sed vel quod expedita non rem.'),(48,'ducimus','Quod reprehenderit quia atque.'),(49,'aliquid','Quaerat in dolorem dolore atque.'),(50,'magni','Veniam ex dolores et eos velit deserunt velit.');
/*!40000 ALTER TABLE `welding_method` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 12:54:41
