--
-- Table structure for table `area_cert`
--

DROP TABLE IF EXISTS `area_cert`;
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

INSERT INTO `area_cert` VALUES 
(1,1,1),(1,5,5),(1,9,9),(1,13,13),(1,17,17),(1,21,21),
(1,25,25),(1,29,29),(2,2,2),(2,6,6),(2,10,10),(2,14,14),
(2,18,18),(2,22,22),(2,26,26),(2,30,30),(3,3,3),(3,7,7),
(3,11,11),(3,15,15),(3,19,19),(3,23,23),(3,27,27),(4,4,4),
(4,8,8),(4,12,12),(4,16,16),(4,20,20),(4,24,24),(4,28,28);

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
CREATE TABLE `centers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cipher` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'шифр аттестационного центра',
  `name_org` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'название организации',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'местонахождение центра',
  `level_cert_id` bigint(20) unsigned NOT NULL,
  `welding_method_id` bigint(20) unsigned NOT NULL,
  `gtu_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cipher` (`cipher`),
  KEY `cipher_name_org_city_idx` (`cipher`,`name_org`,`city`),
  KEY `level_cert_id` (`level_cert_id`),
  KEY `welding_method_id` (`welding_method_id`),
  KEY `gtu_id` (`gtu_id`),
  CONSTRAINT `centers_ibfk_1` FOREIGN KEY (`level_cert_id`) REFERENCES `level_cert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `centers_ibfk_2` FOREIGN KEY (`welding_method_id`) REFERENCES `welding_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `centers_ibfk_3` FOREIGN KEY (`gtu_id`) REFERENCES `gtu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='аттестационные центры';

INSERT INTO `centers` VALUES 
(1,'ac-32','itaque','New Laruechester',1,1,1),
(2,'ac-51','ratione','Port Destineeview',2,2,2),
(3,'ac-53','consequatur','Port Cyril',3,3,3),
(4,'ac-36','alias','Wilkinsontown',4,4,4),
(5,'ac-20','sunt','New Marietta',1,5,5),
(6,'ac-42','dicta','Lake Mavericktown',2,6,6),
(7,'ac-10','hic','South Marques',3,7,7),
(8,'ac-13','in','Port Kellie',4,8,8),
(9,'ac-32','ggg','North Anissa',1,9,9),
(10,'ac-54','excepturi','North Tayahaven',2,10,10),
(11,'ac-88','odit','North Salvadorfurt',3,11,11),
(12,'ac-83','quos','West Logan',4,12,12),
(13,'ac-46','molestiae','East Matilda',1,13,13),
(14,'ac-25','reprehenderit','Lake Shaun',2,14,14),
(15,'ac-43','eos','East Cristobalmouth',3,15,15),
(16,'ac-56','eos','Gialand',4,16,16),
(17,'ac-16','recusandae','Lake Shane',1,17,17),
(18,'ac-27','occaecati','Aureliamouth',2,18,18),
(19,'ac-39','qui','Port Adelle',3,19,19),
(20,'ac-20','rerum','New Havenbury',4,20,20),
(21,'ac-53','soluta','West Carmineview',1,21,21),
(22,'ac-70','eum','Amelieborough',2,22,22),
(23,'ac-56','ipsa','North Brandyn',3,23,23),
(24,'ac-27','quibusdam','South Freidastad',4,24,24),
(25,'ac-14','dignissimos','Mertzmouth',1,25,25),
(26,'ac-87','autem','North Dakota',2,26,26),
(27,'ac-84','nobis','Graycechester',3,27,27),
(28,'ac-28','eius','Bartolettiport',4,28,28),
(29,'ac-40','sapiente','Lake Novella',1,29,29),
(30,'ac-73','eaque','New Murielville',2,30,30);

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
CREATE TABLE `certificates` (
  `welder_id` bigint(20) unsigned NOT NULL,
  `center_id` bigint(20) unsigned NOT NULL,
  `num_certificate` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'номер удостоверения',
  `start_date` date DEFAULT NULL COMMENT 'дата начала действия',
  `stop_date` date DEFAULT NULL COMMENT 'дата окончания действия',
  `kleymo_id` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_cert_id` bigint(20) unsigned DEFAULT NULL COMMENT 'вид аттестации',
  `level_cert_id` bigint(20) unsigned DEFAULT NULL COMMENT 'уровень',
  `welding_method_id` bigint(20) unsigned DEFAULT NULL COMMENT 'способ сварки',
  `gtu_id` bigint(20) unsigned DEFAULT NULL COMMENT 'группа технических устройств (гту)',
  PRIMARY KEY (`welder_id`,`center_id`),
  UNIQUE KEY `num_certificate` (`num_certificate`),
  KEY `num_certificate_idx` (`num_certificate`),
  KEY `center_id` (`center_id`),
  KEY `kleymo_id` (`kleymo_id`),
  KEY `type_cert_id` (`type_cert_id`),
  KEY `level_cert_id` (`level_cert_id`),
  KEY `welding_method_id` (`welding_method_id`),
  KEY `gtu_id` (`gtu_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`welder_id`) REFERENCES `welders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `certificates_ibfk_3` FOREIGN KEY (`kleymo_id`) REFERENCES `kleymo` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `certificates_ibfk_4` FOREIGN KEY (`type_cert_id`) REFERENCES `type_cert` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `certificates_ibfk_5` FOREIGN KEY (`level_cert_id`) REFERENCES `level_cert` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `certificates_ibfk_6` FOREIGN KEY (`welding_method_id`) REFERENCES `welding_method` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `certificates_ibfk_7` FOREIGN KEY (`gtu_id`) REFERENCES `gtu` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='удостоверение сварщика';

INSERT INTO `certificates` VALUES 
(1,1,'cert-8123','1979-11-27','2018-03-16','K0123',1,1,1,1),
(2,2,'cert-0123','1976-07-21','1992-03-29','K0001',2,2,2,2),
(3,3,'cert-3387','1996-01-01','1992-04-10','K3119',3,3,3,3),
(4,4,'cert-3215','1996-09-03','2006-10-28','K1539',1,4,4,4),
(5,5,'cert-3775','1996-09-07','1986-06-08','K5315',2,1,5,5),
(6,6,'cert-6707','1988-07-31','2000-02-25','K6079',3,2,6,6),
(7,7,'cert-3476','1977-01-17','1980-04-05','K0291',1,3,7,7),
(8,8,'cert-9476','1974-10-15','1998-05-27','K3569',2,4,8,8),
(9,9,'cert-9229','1976-11-15','1974-09-17','K0004',3,1,9,9),
(10,10,'cert-2861','2009-08-11','1998-11-03','K4270',1,2,10,10),
(11,11,'cert-3274','2021-06-10','1997-06-08','K4248',2,3,11,11),
(12,12,'cert-8822','1983-08-12','1977-05-15','K6323',3,4,12,12),
(13,13,'cert-2605','2016-02-11','1996-05-29','K0053',1,1,13,13),
(14,14,'cert-4074','1976-11-12','1992-09-13','K3803',2,2,14,14),
(15,15,'cert-1860','1992-07-23','2016-02-14','K6436',3,3,15,15),
(16,16,'cert-3745','1986-05-08','1982-06-04','K0566',1,4,16,16),
(17,17,'cert-4768','1987-05-03','1981-12-12','K7750',2,1,17,17),
(18,18,'cert-7111','2010-08-22','2001-07-08','K9997',3,2,18,18),
(19,19,'cert-0001','1984-12-23','2014-02-03','K0006',1,3,19,19),
(20,20,'cert-4289','1982-07-17','2014-07-22','K4888',2,4,20,20),
(21,21,'cert-6203','2002-04-27','1977-12-15','K6762',3,1,21,21),
(22,22,'cert-2569','2008-09-18','1983-06-24','K0069',1,2,22,22),
(23,23,'cert-6205','1996-08-12','2008-10-18','K7404',2,3,23,23),
(24,24,'cert-1139','1994-12-06','1974-08-28','76439',3,4,24,24),
(25,25,'cert-8086','1988-08-02','1980-03-21','K8395',1,1,25,25),
(26,26,'cert-6674','1993-08-03','2015-05-16','K0854',2,2,26,26),
(27,27,'cert-8045','1993-06-04','2017-08-22','89849',3,3,27,27),
(28,28,'cert-2781','1996-12-21','1980-09-14','K1278',1,4,28,28),
(29,29,'cert-3749','1993-03-05','2019-11-19','K0968',2,1,29,29),
(30,30,'cert-7025','1986-01-10','2011-11-10','98721',3,2,30,30);

--
-- Table structure for table `gtu`
--

DROP TABLE IF EXISTS `gtu`;
CREATE TABLE `gtu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='группы технических устройств';

INSERT INTO `gtu` VALUES 
(1,'gtu_quos','Magni rerum sequi iusto vel sint est voluptatem.'),
(2,'gtu_utfg','Eum qui ullam consequatur molestiae hic temporibus.'),
(3,'gtu_quil','Quia et consequatur ad qui iusto.'),
(4,'gtu_nost','Et qui quia modi atque molestias.'),
(5,'gtu_aute','Consequuntur nihil qui vel.'),
(6,'gtu_quik','Et mollitia voluptatum et nemo rerum nemo similique.'),
(7,'gtu_tota','Esse nesciunt iusto similique non magnam qui.'),
(8,'gtu_hicp','Et doloribus vel cum soluta aut ducimus.'),
(9,'gtu_idop','Qui eligendi eius voluptatum ut eaque omnis dicta aperiam.'),
(10,'gtu_reru','Et cupiditate sed veritatis est.'),
(11,'gtu_sint','Animi error at sequi dolorum ratione aspernatur.'),
(12,'gtu_plac','Quod voluptatem voluptate perspiciatis deserunt molestiae.'),
(13,'gtu_nihi','Sit iure sit consectetur incidunt soluta.'),
(14,'gtu_susc','Natus tempore autem laborum optio.'),
(15,'gtu_etbn','Voluptatem quia sunt natus.'),
(16,'gtu_anim','Est quod ducimus illo autem.'),
(17,'gtu_labo','Alias voluptatem omnis quibusdam quia.'),
(18,'gtu_etkl','Est quisquam pariatur ea labore et.'),
(19,'gtu_maio','Aut voluptate voluptate dicta aut est ducimus possimus deserunt.'),
(20,'gtu_perf','Sequi iure sed sit.'),
(21,'gtu_faci','Sunt qui sit unde beatae magni ducimus sint corporis.'),
(22,'gtu_dolo','Dolore atque saepe voluptatem veniam vero provident laborum quod.'),
(23,'gtu_cupi','Doloribus dolorum blanditiis consequuntur exercitationem officiis.'),
(24,'gtu_quod','Quis reprehenderit rerum quia cumque assumenda sunt.'),
(25,'gtu_ipsa','Vel et explicabo est soluta.'),
(26,'gtu_etui','Et eligendi eum distinctio debitis ipsum vel.'),
(27,'gtu_adip','Recusandae repudiandae asperiores asperiores qui expedita.'),
(28,'gtu_cons','Assumenda et aut quisquam ea aut ut impedit.'),
(29,'gtu_epud','Eum natus iusto sed eum est sit eaque.'),
(30,'gtu_sapi','Qui odio ut nisi voluptatibus optio maxime incidunt.');

--
-- Table structure for table `kleymo`
--

DROP TABLE IF EXISTS `kleymo`;
CREATE TABLE `kleymo` (
  `id` char(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'номер клейма',
  `welder_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `welder_id` (`welder_id`),
  CONSTRAINT `kleymo_ibfk_1` FOREIGN KEY (`welder_id`) REFERENCES `welders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='клеймо сварщика';

INSERT INTO `kleymo` VALUES 
('K0123',1,'1977-06-18 19:08:22'),
('K0001',2,'1997-09-25 13:49:45'),
('K3119',22,'1993-10-31 06:34:04'),
('K1539',27,'2013-09-19 14:54:26'),
('K5315',25,'1991-07-04 04:53:29'),
('K6079',10,'1977-02-20 16:17:11'),
('K0291',17,'1974-06-05 06:04:08'),
('K3569',23,'2004-10-17 21:34:39'),
('K0004',6,'1973-06-13 07:19:22'),
('K4270',11,'1985-12-11 04:42:01'),
('K4248',14,'2008-05-11 08:15:43'),
('K6323',24,'2021-02-04 07:32:34'),
('K0053',4,'1992-04-26 11:51:42'),
('K3803',18,'2017-06-06 16:50:37'),
('K6436',12,'2002-11-25 02:50:57'),
('K0566',29,'1972-09-03 05:31:12'),
('K7750',26,'1983-06-21 19:07:08'),
('K9997',28,'2007-02-12 21:32:24'),
('K0006',20,'2006-02-26 01:09:48'),
('K4888',30,'1983-04-04 07:44:48'),
('K6762',9,'1983-07-28 06:03:43'),
('K0069',7,'2014-05-17 05:08:04'),
('K7404',15,'2005-04-12 14:33:49'),
('76439',5,'1974-04-30 21:33:48'),
('K8395',16,'2017-03-17 22:11:53'),
('K0854',8,'1976-02-26 11:05:10'),
('89849',3,'1982-11-10 20:09:13'),
('K1278',19,'1978-10-31 05:09:03'),
('K0968',13,'2003-10-22 18:48:31'),
('98721',21,'1986-11-11 20:09:48');

--
-- Table structure for table `level_cert`
--

DROP TABLE IF EXISTS `level_cert`;
CREATE TABLE `level_cert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='уровень аттестации';

INSERT INTO `level_cert` VALUES (1,'I'),(2,'II'),(3,'III'),(4,'IV');

--
-- Table structure for table `type_cert`
--

DROP TABLE IF EXISTS `type_cert`;
CREATE TABLE `type_cert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='вид аттестации';

INSERT INTO `type_cert` VALUES (1,'первичная'),(2,'дополнительная'),(3,'продление');

--
-- Table structure for table `welders`
--

DROP TABLE IF EXISTS `welders`;
CREATE TABLE `welders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'организация-работодатель',
  `position_work` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'занимаемая должность',
  PRIMARY KEY (`id`),
  KEY `welders_company_idx` (`company`),
  KEY `welders_firstname_lastname_birthday_idx` (`firstname`,`lastname`,`birthday`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='сварщики';

INSERT INTO `welders` VALUES 
(1,'Berry','Osinski','1993-12-10','Schroeder, Bogisich and Mueller','Magnam quaerat consectetur accusamus commodi.'),
(2,'Kaylin','Turcotte','2009-03-08','Kreiger-Quitzon','Sit earum labore eos vitae aperiam dolores vel.'),
(3,'Isobel','Kutch','2005-09-30','Nikolaus, Schowalter and Fahey','Est suscipit in dicta aut fugit adipisci.'),
(4,'Edmund','Boyle','2007-02-27','Witting, Murray and Larkin','Voluptas rerum corporis iure est ullam ullam.'),
(5,'Carleton','Sipes','1984-07-21','Yost-Stamm','Accusamus nemo tempore dignissimos quis similique.'),
(6,'Joelle','Durgan','1993-05-14','Hackett LLC','Molestiae quia accusamus voluptas in cupiditate.'),
(7,'Dee','Herman','1991-05-11','Sanford-Roob','Dolores doloribus quo voluptatum repellat adipisci quidem voluptatem.'),
(8,'Loyal','Doyle','2013-04-10','Windler Ltd','Quod fuga consequatur error minima dolores a.'),
(9,'Kadin','Zemlak','2015-08-23','Kihn-Aufderhar','Voluptatem officiis mollitia occaecati perferendis.'),
(10,'Rachael','Bashirian','1978-09-22','Corwin, Johnson and Rippin','Dolores est et iure quam accusantium accusantium ab.'),
(11,'Jalen','Shields','2000-10-16','Hoppe, Connelly and Christiansen','Incidunt nisi eum incidunt provident dolores odit eum.'),
(12,'Sherwood','Nikolaus','1981-01-10','Effertz, Steuber and Gleichner','Quis sequi neque est impedit.'),
(13,'Austin','Smith','2000-06-19','Funk Ltd','Et nisi delectus aspernatur voluptates.'),
(14,'Hilton','Conn','1982-07-31','Ankunding-Aufderhar','Saepe repellendus ea cupiditate nisi.'),
(15,'Leta','Lebsack','1972-08-04','White, Friesen and O\'Conner','Voluptatem deleniti aliquam quisquam autem voluptas.'),
(16,'Kenny','Will','2001-08-26','Lindgren-Dietrich','Ducimus nemo laboriosam ut consequatur.'),
(17,'Garrison','Quigley','2007-10-16','Leuschke Group','Ea maxime impedit eos quasi enim id.'),
(18,'Trudie','Aufderhar','1991-07-04','Ryan, Breitenberg and Cartwright','Nihil quae sed fugit quae.'),
(19,'Marcos','Walter','1973-03-01','White Ltd','Placeat iste accusamus culpa.'),
(20,'Diamond','Schmidt','1973-03-01','Kessler Inc','Eum et fuga consequatur exercitationem sequi.'),
(21,'Josianne','Deckow','2021-11-14','Stamm, Marks and Wilkinson','Nihil ea adipisci esse possimus ea.'),
(22,'Lourdes','Boyer','1982-01-28','Dickens PLC','Aut voluptas vero rerum officia aperiam vitae maiores occaecati.'),
(23,'Toni','Prohaska','2000-12-27','Abbott, Ledner and Swift','Eaque cum ut voluptas eligendi.'),
(24,'Thelma','Wilderman','1990-11-27','Hodkiewicz-Kunde','Sequi voluptatum deserunt soluta incidunt facilis ea consequatur.'),
(25,'Tia','Satterfield','1993-03-30','Kerluke, Roob and Mante','Aut consequatur similique facilis sit corrupti dignissimos.'),
(26,'Alexanne','Aufderhar','1989-01-13','Grimes, Boyle and Strosin','Consequuntur maxime pariatur iusto amet placeat.'),
(27,'Lamar','Mayert','2002-08-19','Hahn-Johns','Animi ipsam iste magnam assumenda deserunt.'),
(28,'Quincy','Borer','1986-05-28','Fritsch Inc','Eos debitis dolor fuga rerum facilis quia.'),
(29,'Libbie','Stehr','2020-01-05','Lesch-Schowalter','Laudantium quasi ut atque voluptas.'),
(30,'Rashad','Bogisich','1979-01-29','Ledner-Dibbert','Totam nisi voluptatem nostrum qui delectus aut amet.');


--
-- Table structure for table `welding_method`
--

DROP TABLE IF EXISTS `welding_method`;
CREATE TABLE `welding_method` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='способ сварки';

INSERT INTO `welding_method` VALUES 
(1,'wm_sit','Alias qui suscipit molestiae voluptates qui error.'),
(2,'wm_non','Fugiat aperiam qui blanditiis.'),
(3,'wm_nat','Magni eveniet dolorem sit repudiandae quos.'),
(4,'wm_acc','Ut nulla impedit omnis consequuntur.'),
(5,'wm_ita','Dolores non consequuntur dolor consequatur incidunt est non.'),
(6,'wm_qua','Laborum quae dolorem pariatur quod consequatur tempora.'),
(7,'wm_bea','Sit non totam sapiente dolorum amet corporis recusandae.'),
(8,'wm_opt','Qui esse vitae omnis mollitia voluptatem.'),
(9,'wm_qui','Perferendis voluptas eos in non.'),
(10,'wm_vel','Quod non illum est nemo voluptates.'),
(11,'wm_atq','Corrupti molestias vitae a minus blanditiis est.'),
(12,'wm_vol','Laborum saepe sint consequuntur.'),
(13,'wm_lau','Cumque cum saepe aperiam distinctio id eaque.'),
(14,'wm_dis','Quo dignissimos esse eos nulla.'),
(15,'wm_ape','Et doloremque aut quia exercitationem porro inventore.'),
(16,'wm_eiu','Alias repellendus aliquam ad non.'),
(17,'wm_sus','Doloremque quis veritatis impedit rem.'),
(18,'wm_sir','Qui consectetur officia vitae laboriosam autem et.'),
(19,'wm_rat','Explicabo reiciendis aut nihil consequatur est voluptatem earum.'),
(20,'wm_aut','Voluptas sapiente pariatur ratione sequi temporibus.'),
(21,'wm_dol','Omnis reiciendis aliquam aut et aspernatur in.'),
(22,'wm_rer','Aut ut est eaque ea.'),
(23,'wm_dol','Ab omnis nesciunt unde dolorum accusamus perspiciatis.'),
(24,'wm_off','Quaerat reprehenderit neque consectetur itaque non ducimus.'),
(25,'wm_seq','Ut ratione pariatur atque non et sit.'),
(26,'wm_ido','Magnam dolore commodi architecto ipsam et adipisci eos.'),
(27,'wm_tem','Illum vitae omnis modi voluptates.'),
(28,'wm_mol','Culpa dolor maxime quas est ut quo ratione.'),
(29,'wm_fug','Quo vitae eos aut excepturi qui laboriosam.'),
(30,'wm_dok','Quis molestias omnis tenetur nulla.');

