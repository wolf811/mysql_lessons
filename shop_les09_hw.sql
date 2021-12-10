-- УРОК 9. Практическое задание

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	phone BIGINT
);

-- Практическое задание по теме “Транзакции, переменные, представления”

/* 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции. */

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

/* 2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
 и соответствующее название каталога name из таблицы catalogs. */

USE shop;

DROP VIEW IF EXISTS name_prod_cat;
CREATE VIEW name_prod_cat AS 
SELECT p.name AS name_prod, c.name AS name_cat FROM products p
JOIN catalogs c ON (p.catalog_id = c.id);

SELECT * FROM name_prod_cat npc;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи". */

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS VARCHAR(100) DETERMINISTIC 
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
		RETURN 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN 
		RETURN 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN 
		RETURN 'Добрый вечер';
		ELSE 
		RETURN'Доброй ночи';
	END CASE;

END//

SELECT hello();

/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 Допустимо присутствие обоих полей или одно из них. 
 Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 При попытке присвоить полям NULL-значение необходимо отменить операцию. */

-- DROP TRIGGER IF EXISTS prod_text_n_null//
-- CREATE TRIGGER prod_text_n_null BEFORE INSERT ON products
-- FOR EACH ROW 
-- BEGIN 
-- 	SELECT name, description FROM products p WHERE name <> NULL OR desription <> NULL;
-- 	SET 
-- END//

-- дальше не успел













