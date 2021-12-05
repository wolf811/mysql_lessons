/* База данных "Реестр аттестационных сварщиков" - предназначена для хранения информации об аттестациях сварщиков.
 * Основные сущности: сварщики, клейма сварщиков, аттестационные центры (место аттестации), вид аттестации, область аттестации, удостоверения.
 * - Сварщики - уникальные имена, могут иметь несколько удостоверений.
 * - Аттестационные центры - уникальные имена, имеют определенную область аттестации, в рамках которой могут аттестовать сварщиков.
 * - Вид аттестации - первичная, дополнительная, продление.
 * - Область аттестации - это совокупность уровня, методов сварки и групп технических устройств (gtu). Не уникальная сущность, в отличии от ее составляющих.
 * - Удостоверения - уникальный документ, который содержит вид аттестации, определенную область аттестации, место аттестации (аттестационный центр). */

DROP DATABASE IF EXISTS welders_db;
CREATE DATABASE welders_db;
USE welders_db;

DROP TABLE IF EXISTS welders;
CREATE TABLE welders (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	birthday DATE,
	company VARCHAR(100) COMMENT 'организация-работодатель',
	position_work VARCHAR(100) COMMENT 'занимаемая должность',
-- 	kleymo CHAR(5) UNIQUE COMMENT 'клеймо сварщика',
	is_deleted bit default 0,
	INDEX welders_company_idx(company),
	INDEX welders_firstname_lastname_birthday_idx(firstname, lastname, birthday)
) COMMENT 'сварщики';
INSERT INTO welders VALUES 
(1,'Donavon','White','1990-10-07','Friesen-Stark','Qui dolores eum dolor aut omnis.',0),
(2,'Ken','Anderson','2019-05-14','Price, Nienow and Cummerata','Quam nobis dolor quia.',0),
(3,'Kathleen','Pollich','1978-03-14','Kovacek Inc','Voluptas qui et et nihil.',1),
(4,'Rogers','Hills','1994-11-27','Kertzmann Inc','Modi ipsa consectetur eligendi voluptas.',0),
(5,'Marjory','Larson','1983-06-30','Ullrich PLC','Corporis aut et veritatis.',0),
(6,'Everette','Boyle','1978-10-07','Erdman LLC','Architecto suscipit fuga quasi aperiam.',0),
(7,'Abbie','Raynor','2008-04-17','Rippin Group','Esse nam officiis fugit quod molestiae assumenda.',0),
(8,'Omari','Lang','2002-02-20','Kub-Lynch','Laborum quod optio sequi ut vel qui omnis tempore.',0),
(9,'Marietta','Kilback','1977-03-31','Conroy-Mosciski','Ullam autem fugiat laboriosam expedita delectus.',0),
(10,'Kathryne','Luettgen','2011-06-23','Lowe-Ebert','Nisi qui debitis rerum veritatis deserunt.',0),
(11,'Zora','Steuber','2000-04-12','Nicolas, Kreiger and Dare','Quam iure in odio et.',1),
(12,'Dejah','Berge','1996-04-18','Runte-Feil','Tenetur sed et aut laboriosam consequatur consequatur libero.',1),
(13,'Taryn','Pollich','2005-06-22','Lehner, Gulgowski and Kulas','Facilis asperiores rerum harum omnis voluptates aspernatur atque non.',0),
(14,'Noel','Kulas','2021-04-19','Bednar-Hoppe','Sed voluptas dolores laboriosam aut praesentium qui quasi.',1),
(15,'Jane','Johnson','1970-12-11','Wintheiser, Schroeder and Sporer','Temporibus corrupti porro exercitationem rerum eius architecto eaque.',1),
(16,'Lewis','Witting','2009-11-03','Lockman and Sons','Ex quia aliquam voluptates id sit.',0),
(17,'Harley','McKenzie','1998-10-05','Deckow-Wyman','Perferendis sapiente quia sit.',1),
(18,'Schuyler','Brown','1994-03-07','Daniel-Moore','Error ut iusto numquam reprehenderit aperiam.',1),
(19,'Nayeli','Boyle','1991-11-21','Armstrong, Heidenreich and Lesch','Soluta molestiae optio tempora repudiandae.',0),
(20,'Amiya','Kuphal','1996-10-26','Marks, Sipes and Streich','Iusto non magni quia quis amet et sunt neque.',0),
(21,'Garnet','Medhurst','1995-02-14','Gerhold, Reichert and Bruen','Iusto ea delectus quis voluptatem.',0),
(22,'Anita','Altenwerth','2016-01-26','Conroy PLC','Maiores inventore exercitationem totam vel.',0),
(23,'Lemuel','DuBuque','2012-07-29','Feeney-Jacobi','Est delectus itaque id similique rem nulla.',1),
(24,'Jason','Ratke','2020-04-29','Hartmann, Rowe and Pollich','Quia cupiditate dolor non officia quia et.',0),
(25,'Lexi','Medhurst','1989-04-18','Jacobson-Bosco','Labore fugit dolorem ipsam incidunt quia sapiente autem.',1),
(26,'Sherman','Mohr','2007-10-05','Marquardt, Mann and Brekke','Consectetur et sed eaque ad soluta reprehenderit.',0),
(27,'Jennifer','Hayes','1987-10-31','Heaney-Schinner','Quibusdam expedita assumenda eum nam facere itaque perspiciatis.',0),
(28,'Domenica','Rowe','1983-09-17','McClure, Schimmel and Lehner','Ad deleniti quae sapiente possimus et laboriosam itaque.',0),
(29,'Lisette','Grimes','1998-06-05','Little Ltd','Asperiores libero qui doloremque adipisci nostrum provident quia.',0),
(30,'Laurine','Lemke','2020-11-14','Lebsack and Sons','Iste eum animi est.',0);

-- УДОСТОВЕРЕНИЯ (один ко многим - несколько удостоверений может принадлежать одному сварщику)
DROP TABLE IF EXISTS certificates;
CREATE TABLE certificates (
	welder_id BIGINT UNSIGNED NOT NULL,
	center_id BIGINT UNSIGNED NOT NULL,
	num_certificate VARCHAR(100) UNIQUE COMMENT 'номер удостоверения',
	start_date DATE COMMENT 'дата начала действия',
	stop_date DATE COMMENT 'дата окончания действия',
	from_center CHAR(20) COMMENT 'место аттестации',
	from_type_cert CHAR(20) COMMENT 'вид аттестации',
	from_level_cert CHAR(20) COMMENT 'уровень',
	from_welding_method CHAR(20) COMMENT 'способ сварки',
	from_gtu CHAR(20) COMMENT 'группа технических устройств (гту)',
-- 	kleymo_id CHAR(5) UNIQUE COMMENT 'клеймо сварщика',
	from_num_kleymo CHAR(5),
	PRIMARY KEY (welder_id, center_id),
	is_deleted bit default 0,
	
	INDEX num_certificate_idx(num_certificate),
	
	FOREIGN KEY (welder_id) REFERENCES welders(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (center_id) REFERENCES centers(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (from_num_kleymo) REFERENCES kleymo(num_kleymo) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (from_center) REFERENCES centers(cipher) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (from_type_cert) REFERENCES type_cert(name) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (from_level_cert) REFERENCES level_cert(name) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (from_welding_method) REFERENCES welding_method(short_name) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (from_gtu) REFERENCES gtu(short_name) ON DELETE SET NULL ON UPDATE SET NULL
) COMMENT 'удостоверение сварщика';
SHOW CREATE TABLE certificates;
ALTER TABLE certificates DROP FOREIGN KEY `certificates_ibfk_4`;
ALTER TABLE certificates DROP COLUMN from_center;
INSERT INTO certificates (
	welder_id, 
	center_id, 
	num_certificate,
	start_date,
	stop_date,
	from_type_cert,
	from_level_cert,
	from_welding_method,
	from_gtu,
	from_num_kleymo
) VALUES
(1,1,'11111','2020-12-02','2023-12-02','первичная','I','temporibus','cupiditate','5.6'),
(2,2,'22222','2021-12-02','2024-12-02','дополнительная','II','omnis','non','20295'),
(3,3,'33333','2018-12-02','2020-12-02','первичная','II','deserunt','non','34.68'),
(12,3,'45123','2010-12-02','2012-12-02','продление','III','deserunt','non','54587'),
(8,10,'55523','2020-12-02','2022-12-02','продление','IV','soluta','libero','12419');

DROP TABLE IF EXISTS kleymo;
CREATE TABLE kleymo (
	id SERIAL PRIMARY KEY,
	welder_id BIGINT UNSIGNED DEFAULT NULL,
	num_kleymo CHAR(5) UNIQUE comment 'номер клейма',
	created_at DATETIME DEFAULT NOW()
) comment 'клеймо сварщика';
ALTER TABLE kleymo ADD FOREIGN KEY (welder_id) REFERENCES welders(id) ON DELETE CASCADE ON UPDATE CASCADE;
INSERT INTO `kleymo` VALUES 
(1,1,'5.6','2016-01-25 17:35:00'),
(2,2,'20295','1982-01-01 13:29:30'),
(3,3,'34.68','2000-11-18 03:03:45'),
(4,4,'1.121','2020-05-06 09:44:53'),
(5,5,'1831','1971-07-05 19:27:07'),
(6,6,'','2019-07-08 04:10:19'),
(7,7,'50138','2014-04-14 22:31:03'),
(8,8,'12419','1981-08-30 04:23:10'),
(9,9,'56639','1987-02-26 10:33:23'),
(10,10,'15575','1978-10-09 04:56:08'),
(11,11,'12229','1978-03-22 14:44:46'),
(12,12,'54587','1976-12-06 04:31:17'),
(13,13,'46736','1972-06-12 11:27:48'),
(14,14,'83737','2016-07-11 05:48:11'),
(15,15,'1','2019-03-20 08:07:41'),
(16,16,'4140','2000-07-02 04:08:23'),
(17,17,'26812','1981-04-05 01:56:49'),
(18,18,'702.7','1993-10-18 09:07:13'),
(19,19,'5198.','1998-10-13 05:36:08'),
(20,20,'527.0','2015-07-30 20:22:35'),
(21,21,'66985','1985-03-29 12:50:15'),
(22,22,'29395','1981-01-16 02:28:26'),
(23,23,'574','1978-01-21 11:42:53'),
(24,24,'1.938','2008-07-31 17:15:05'),
(25,25,'4.075','1976-05-29 07:20:50'),
(26,26,'547.2','1979-10-25 09:25:31'),
(27,27,'8.276','2017-01-02 19:28:00'),
(28,28,'61.8','2014-05-20 03:19:00'),
(29,29,'43981','2006-04-21 12:20:23'),
(30,30,'204.4','1991-12-21 15:04:34');

DROP TABLE IF EXISTS type_cert;
CREATE TABLE type_cert (
	id SERIAL PRIMARY KEY,
-- 	name ENUM('первичная', 'дополнительная', 'продление') UNIQUE
	name CHAR(20) UNIQUE
) COMMENT 'вид аттестации';
INSERT INTO type_cert VALUES (DEFAULT,'первичная'),(DEFAULT,'дополнительная'),(DEFAULT,'продление');

-- ОБЛАСТЬ АТТЕСТАЦИИ
DROP TABLE IF EXISTS area_cert;
CREATE TABLE area_cert (
	level_cert_id BIGINT UNSIGNED NOT NULL COMMENT 'уровень',
	welding_method_id BIGINT UNSIGNED NOT NULL COMMENT 'способ сварки',
	gtu_id BIGINT UNSIGNED NOT NULL COMMENT 'группа технических усройств',
	PRIMARY KEY (level_cert_id, welding_method_id, gtu_id),
	
	FOREIGN KEY (level_cert_id) REFERENCES level_cert(id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
	FOREIGN KEY (welding_method_id) REFERENCES welding_method(id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
	FOREIGN KEY (gtu_id) REFERENCES gtu(id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
) COMMENT 'область аттестации';
INSERT INTO `area_cert` VALUES (1,1,1),(1,5,5),(1,9,9),(1,13,13),(1,17,17),(2,2,2),(2,6,6),(2,10,10),(2,14,14),(2,18,18),(3,3,3),(3,7,7),(3,11,11),(3,15,15),(3,19,19),(4,4,4),(4,8,8),(4,12,12),(4,16,16),(4,20,20);

-- СПРАВОЧНИКИ ДЛЯ ОБЛАСТИ АТТЕСТАЦИИ
DROP TABLE IF EXISTS level_cert;
CREATE TABLE level_cert (
	id SERIAL PRIMARY KEY,
-- 	name ENUM('I', 'II', 'III', 'IV') UNIQUE
	name CHAR(20) UNIQUE
) COMMENT 'уровень аттестации';
INSERT INTO level_cert (id, name) VALUES (1,'I'), (2, 'II'), (3, 'III'), (4, 'IV');

DROP TABLE IF EXISTS welding_method;
CREATE TABLE welding_method (
	id SERIAL PRIMARY KEY,
	short_name CHAR(20) UNIQUE,
	full_name VARCHAR (255)
) COMMENT 'способ сварки';
INSERT INTO `welding_method` VALUES 
(1,'temporibus','Ut quia corrupti assumenda praesentium suscipit aut qui.'),
(2,'eveniet','Quibusdam nobis sint velit numquam.'),
(3,'velit','Debitis quia dolor nulla omnis cumque animi.'),
(4,'qui','Officiis provident dolor eius at nihil.'),
(5,'omnis','Perspiciatis est in doloribus iusto sint consequatur.'),
(6,'et','Eos magnam omnis aut pariatur saepe totam.'),
(7,'aspernatur','Occaecati rerum ad hic.'),
(8,'porro','Incidunt iure inventore similique illum esse vel est enim.'),
(9,'sed','Eaque et minima quam recusandae cumque excepturi consequatur.'),
(10,'soluta','In itaque enim iusto ipsa quo.'),
(11,'deserunt','Iure doloremque et voluptates et sit nam.'),
(12,'nisi','Quia quis ut veritatis cupiditate consectetur aspernatur inventore nihil.'),
(13,'sit','Sit molestiae quae omnis voluptas.'),
(14,'ipsam','Et officiis rerum maiores dolorem expedita.'),
(15,'esse','Iste et aut voluptatum reprehenderit saepe itaque voluptatem.'),
(16,'pariatur','Accusamus sint aliquid adipisci cupiditate soluta aspernatur esse dolorem.'),
(17,'excepturi','Quisquam placeat molestias atque ipsam nam nobis.'),
(18,'vel','Est maiores quis eum possimus ipsa.'),
(19,'veritatis','Et tempora perferendis qui voluptatem esse consectetur et.'),
(20,'nam','Sed optio est quo fuga sunt dignissimos.');

DROP TABLE IF EXISTS gtu;
CREATE TABLE gtu (
id SERIAL PRIMARY KEY,
short_name CHAR(20) UNIQUE,
full_name VARCHAR (255)
) COMMENT 'группы технических устройств';
INSERT INTO `gtu` VALUES 
(1,'non','Iste ratione maiores enim repellat.'),
(2,'quisquam','Autem adipisci consequatur a.'),
(3,'saepe','Odit quis numquam illum.'),
(4,'cupiditate','Quos ratione ut autem eius.'),
(5,'error','Voluptas explicabo quibusdam nam iure soluta consequatur.'),
(6,'ipsum','In assumenda et qui saepe.'),
(7,'et','Libero fugiat excepturi facere doloribus.'),
(8,'est','Cupiditate rerum quod nostrum.'),
(9,'quia','Repellendus consequatur sit dolorum impedit doloremque minima earum.'),
(10,'consequatur','Cupiditate cupiditate quia exercitationem sit eum sed distinctio.'),
(11,'libero','Itaque quibusdam ut quia quia possimus dignissimos voluptatibus.'),
(12,'magni','Eos sit quasi facere earum.'),
(13,'autem','Harum est laboriosam voluptas ipsa inventore dolor enim.'),
(14,'aperiam','Voluptate dolore dolores nesciunt aut ratione.'),
(15,'cumque','Aliquam doloribus sed aut.'),
(16,'sint','Qui quam natus quis dolor.'),
(17,'voluptatem','Esse sed commodi voluptatem perferendis eligendi.'),
(18,'laboriosam','Enim et facilis nihil eaque accusamus explicabo vel.'),
(19,'nemo','Reiciendis aliquid perferendis voluptatem dolor.'),
(20,'dolor','Minus veniam non accusantium praesentium architecto non officiis.');

-- МЕСТО АТТЕСТАЦИИ
DROP TABLE IF EXISTS centers;
CREATE TABLE centers (
	id SERIAL PRIMARY KEY,
-- 	num_center INT(5) uni COMMENT 'номер центра',
	cipher CHAR(20) UNIQUE COMMENT 'шифр аттестационного центра',
	name_org VARCHAR(100) COMMENT 'название организации',
	city VARCHAR(100),
	from_level_cert CHAR(20),
	from_welding_method CHAR(20),
	from_gtu CHAR(20),
	
	INDEX cipher_name_org_city_idx(cipher, name_org, city),
	
	FOREIGN KEY (from_level_cert) REFERENCES level_cert(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (from_welding_method) REFERENCES welding_method(short_name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (from_gtu) REFERENCES gtu(short_name) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'аттестационные центры';
INSERT INTO centers VALUES 
(1,'Center1', 'Friesen-Stark','Moscow', 'III','temporibus','non'),
(2,'Center2', 'Price, Nienow and Cummerata','London','IV','nisi','quisquam'),
(3,'Center3', 'Kovacek Inc','New York','II','ipsam','saepe'),
(4,'Center4', 'Kertzmann Inc','Suzdal','I','excepturi','cupiditate'),
(5,'Center5', 'Ullrich PLC','Moscow','I','pariatur','error'),
(6,'Center6', 'Erdman LLC','Suzdal','II','excepturi','ipsum'),
(7,'Center7', 'Rippin Group','London','IV','pariatur','et'),
(8,'Center8', 'Laborum quod', 'Cankt-Peterburg','IV','temporibus','est'),
(9,'Center9', 'Conroy-Mosciski','Domodedovo','III','ipsam','quia'),
(10,'Center10', 'Lowe-Ebert','Podolsk','III','temporibus','consequatur');


