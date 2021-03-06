DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT IGNORE INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты'),
  (DEFAULT, 'Оперативная память');
 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';
INSERT INTO `users` VALUES 
(1,'nihil','1979-10-09','1993-06-09 17:57:49','2014-08-17 22:44:25'),
(2,'ut','1984-07-01','2014-07-25 13:58:32','2007-03-24 02:38:43'),
(3,'autem','2009-02-17','2016-04-16 10:54:45','1987-01-12 23:08:27'),
(4,'rerum','2008-09-22','1975-06-05 23:35:46','1991-09-30 18:20:35'),
(5,'ipsum','2013-11-16','1976-02-14 21:39:04','1998-12-16 01:51:33'),
(6,'voluptatum','1996-06-09','1994-09-04 15:43:00','1998-01-19 09:15:20'),
(7,'non','1988-12-08','1979-03-18 11:15:56','1974-12-21 19:20:47'),
(8,'eum','1974-08-31','2009-03-19 19:13:38','1990-02-01 21:32:17'),
(9,'unde','1989-06-06','2009-10-28 16:41:30','1974-04-11 02:58:03'),
(10,'et','1986-04-16','1978-10-14 09:43:35','1980-11-01 13:39:05'),
(11,'officiis','1993-05-17','1994-06-09 19:14:28','1989-07-30 10:04:54'),
(12,'enim','2016-07-15','1997-01-28 14:24:41','2019-12-19 11:17:23'),
(13,'et','1999-01-06','2005-02-02 17:57:40','1999-02-24 01:35:38'),
(14,'quis','2002-02-04','1991-02-14 11:21:29','2013-08-11 16:27:48'),
(15,'ut','2004-07-07','1984-05-27 19:30:40','2008-07-18 05:22:49');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id(catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO `products` VALUES 
(1,'processor Intel','Iste iure qui voluptatem et laborum voluptatem dignissimos.',2.09,1,'1989-03-04 08:42:37','2006-12-02 14:09:45'),
(2,'ddr4','Commodi porro occaecati ut.',8.53,2,'1976-12-04 20:55:01','1973-12-19 19:23:10'),
(3,'temporibus','Ullam optio occaecati quo accusamus aut.',12.31,3,'2002-05-04 00:17:55','2019-01-25 20:59:10'),
(4,'libero','Dolorem similique ex nulla harum.',0.00,1,'1972-08-23 03:15:02','1975-10-06 06:50:49'),
(5,'processor AMD','Rerum tenetur sapiente aut velit sit sapiente.',0.00,2,'2009-05-20 07:25:15','1984-08-21 19:24:11'),
(6,'materinka','Ut consectetur porro ad voluptas.',25964.00,3,'1994-05-24 13:22:47','1999-02-06 12:17:51'),
(7,'reiciendis','Nihil quas doloribus et nesciunt earum in corporis.',11710.27,1,'1970-08-22 17:32:07','1981-08-07 01:09:59');

ALTER  TABLE products CHANGE catalog_id catalog_id BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE products ADD FOREIGN KEY (catalog_id) REFERENCES catalogs (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

ALTER  TABLE orders CHANGE user_id user_id BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE orders ADD FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE;
INSERT INTO `orders` VALUES 
(1,1,'2017-03-30 14:46:48','2014-06-10 07:41:31'),
(2,2,'2019-06-26 21:50:13','2008-05-18 00:21:00'),
(3,3,'1975-04-22 20:39:53','1989-04-16 05:39:13'),
(4,4,'1998-07-08 16:02:25','2010-05-16 02:25:17');

INSERT INTO `orders` VALUES 
(DEFAULT,7,'2017-03-30 14:46:48','2014-06-10 07:41:31'),
(DEFAULT,2,'2019-06-26 21:50:13','2008-05-18 00:21:00'),
(DEFAULT,11,'1975-04-22 20:39:53','1989-04-16 05:39:13'),
(DEFAULT,1,'2017-03-30 14:46:48','2014-06-10 07:41:31'),
(DEFAULT,2,'2019-06-26 21:50:13','2008-05-18 00:21:00'),
(DEFAULT,10,'1975-04-22 20:39:53','1989-04-16 05:39:13'),
(DEFAULT,5,'2017-03-30 14:46:48','2014-06-10 07:41:31'),
(DEFAULT,2,'2019-06-26 21:50:13','2008-05-18 00:21:00'),
(DEFAULT,8,'1975-04-22 20:39:53','1989-04-16 05:39:13'),
(DEFAULT,4,'1998-07-08 16:02:25','2010-05-16 02:25:17');

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

ALTER TABLE orders_products CHANGE order_id order_id BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE orders_products CHANGE product_id product_id BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE orders_products ADD FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE orders_products ADD FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
INSERT INTO `orders_products` VALUES 
(1,1,1,2,'2002-07-25 01:35:50','2018-08-26 09:46:03'),
(3,2,2,5,'1993-08-25 14:11:39','1994-08-25 23:01:52'),
(4,3,3,9,'1989-08-29 23:46:56','1998-12-20 08:17:52');

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY, 
  user_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  finished_at DATETIME NULL,
  started_at DATETIME NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

ALTER TABLE discounts ADD FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE discounts ADD FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE;
INSERT INTO `discounts` VALUES 
(1,1,1,53,'1979-06-08 08:34:48','1991-08-14 16:23:09','1985-04-30 19:58:15','1973-05-18 11:28:12'),
(2,2,2,0,'2016-01-27 10:17:13','1998-07-23 02:05:36','1971-02-24 18:43:21','1996-06-13 20:08:19'),
(3,3,3,6627230,'1986-03-10 23:13:41','2016-06-29 10:22:22','2000-04-18 11:20:27','1985-06-29 00:41:28'),
(4,4,4,7486550,'2007-06-02 10:35:45','1987-05-29 13:39:13','1973-02-05 01:08:10','1975-11-25 19:54:48'),
(5,5,5,47849,'2019-03-22 15:33:49','2012-01-14 05:53:33','1997-07-09 02:56:50','1988-07-21 00:08:23');

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';
INSERT INTO `storehouses` VALUES 
(1,'sklad1','1975-05-20 07:14:00','1979-08-02 21:43:35'),
(2,'sklad2','2008-12-27 10:15:00','1999-04-11 08:15:00'),
(3,'sklad3','1999-06-22 06:18:45','1980-03-20 06:50:08'),
(4,'sklad4','1979-07-12 21:02:24','2004-01-13 11:29:49'),
(5,'sklad5','2019-03-26 07:42:51','2000-10-12 17:38:59');

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (storehouse_id) REFERENCES storehouses (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE

) COMMENT = 'Запасы на складе';

INSERT INTO `storehouses_products` VALUES 
(1,1,1,1,'1990-07-01 11:06:25','2011-01-31 01:17:03'),
(2,2,2,0,'1983-03-24 01:08:40','1978-09-16 08:58:49'),
(3,3,3,3,'1981-10-03 15:07:52','2020-07-09 23:04:37'),
(4,4,4,5,'2003-09-10 16:49:48','1974-08-27 12:47:55'),
(5,5,5,6,'1970-07-18 14:59:17','2004-06-01 14:09:45'),
(6,1,6,6,'2019-02-14 09:25:06','1970-05-08 23:33:34'),
(7,2,7,3,'2000-02-06 06:32:25','2001-11-02 06:18:22'),
(8,3,1,4,'2015-10-26 22:43:39','1991-05-31 06:18:34'),
(9,4,2,4,'1970-12-31 16:09:51','2009-09-29 19:32:23'),
(10,5,3,7,'1999-01-06 22:13:28','1988-08-27 04:12:02');

-- Урок 7. Практическое задание по теме "Сложные запросы"
-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.name, COUNT(*) AS total_orders 
FROM users u JOIN orders o ON u.id = o.user_id 
GROUP BY u.name ORDER BY total_orders DESC;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name AS products, c.name AS catalogs 
FROM products p JOIN catalogs c ON p.catalog_id = c.id;

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

-- не успел
























