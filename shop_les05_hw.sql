USE shop;

-- УРОК 5: Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

/*1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.*/

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES 
	('Valentin', '1981-10-15', NOW(), NOW()),
	('Svetlana', '1981-12-27', NOW(), NOW()),
	('Artemiy', '2010-12-27', NOW(), NOW()),
	('Taisiya', '2015-10-28', NOW(), NOW());

/*2. Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/

TRUNCATE users;

ALTER TABLE users CHANGE created_at created_at VARCHAR(255);
ALTER TABLE users CHANGE updated_at updated_at VARCHAR(255);

INSERT INTO users (created_at, updated_at) VALUES 
	('20.10.2017 8:10', '20.10.2017 8:10');

UPDATE  users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');
UPDATE  users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE updated_at	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Почему то не изменились типы столбцов на DATETIME, во вкладке "Данные"... 

/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех записей.*/

INSERT INTO storehouses_products (value) VALUES
	(1), (0), (1200), (36), (420), (0);

SELECT value FROM storehouses_products ORDER BY value = 0, value ASC;

/*4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий (may, august)*/

-- INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES 
-- 	('Valentin', '1981-10-15', NOW(), NOW()),
-- 	('Svetlana', '1981-12-27', NOW(), NOW()),
-- 	('Artemiy', '2010-12-27', NOW(), NOW()),
-- 	('Taisiya', '2015-10-28', NOW(), NOW());

/*5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.*/

-- УРОК 5: Практическое задание по теме «Агрегация данных»

/*1. Подсчитайте средний возраст пользователей в таблице users.*/

/*2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

/*3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.*/
