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
--  is_deleted bit default 0,
	INDEX welders_company_idx(company),
	INDEX welders_firstname_lastname_birthday_idx(firstname, lastname, birthday)
) COMMENT 'сварщики';

DROP TABLE IF EXISTS kleymo;
CREATE TABLE kleymo (
	id CHAR(5) NOT NULL PRIMARY KEY COMMENT 'номер клейма',
	welder_id BIGINT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (welder_id) REFERENCES welders(id) ON DELETE CASCADE ON UPDATE CASCADE
) comment 'клеймо сварщика';

DROP TABLE IF EXISTS type_cert;
CREATE TABLE type_cert (
	id SERIAL PRIMARY KEY,
	name CHAR(20) UNIQUE
) COMMENT 'вид аттестации';

-- СПРАВОЧНИКИ ДЛЯ ОБЛАСТИ АТТЕСТАЦИИ
DROP TABLE IF EXISTS level_cert;
CREATE TABLE level_cert (
	id SERIAL PRIMARY KEY,
-- 	name SET('I', 'II', 'III', 'IV') UNIQUE
	name CHAR(20) UNIQUE
) COMMENT 'уровень аттестации';

DROP TABLE IF EXISTS welding_method;
CREATE TABLE welding_method (
	id SERIAL PRIMARY KEY,
	short_name CHAR(20),
	full_name VARCHAR (255)
) COMMENT 'способ сварки';

DROP TABLE IF EXISTS gtu;
CREATE TABLE gtu (
id SERIAL PRIMARY KEY,
short_name CHAR(20),
full_name VARCHAR (255)
) COMMENT 'группы технических устройств';

-- ОБЛАСТЬ АТТЕСТАЦИИ
DROP TABLE IF EXISTS area_cert;
CREATE TABLE area_cert (
	level_cert_id BIGINT UNSIGNED NOT NULL COMMENT 'уровень',
	welding_method_id BIGINT UNSIGNED NOT NULL COMMENT 'способ сварки',
	gtu_id BIGINT UNSIGNED NOT NULL COMMENT 'группа технических усройств',
	PRIMARY KEY (level_cert_id, welding_method_id, gtu_id),
	
	FOREIGN KEY (level_cert_id) REFERENCES level_cert(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (welding_method_id) REFERENCES welding_method(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (gtu_id) REFERENCES gtu(id) ON DELETE NO ACTION ON UPDATE NO ACTION
) COMMENT 'область аттестации';

-- МЕСТО АТТЕСТАЦИИ
DROP TABLE IF EXISTS centers;
CREATE TABLE centers (
	id SERIAL PRIMARY KEY,
	cipher CHAR(20) UNIQUE COMMENT 'шифр аттестационного центра',
	name_org VARCHAR(100) COMMENT 'название организации',
	city VARCHAR(100) COMMENT 'местонахождение центра',
	level_cert_id BIGINT UNSIGNED NOT NULL,
	welding_method_id BIGINT UNSIGNED NOT NULL,
	gtu_id BIGINT UNSIGNED NOT NULL,
	
	INDEX cipher_name_org_city_idx(cipher, name_org, city),
	
	FOREIGN KEY (level_cert_id) REFERENCES level_cert(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (welding_method_id) REFERENCES welding_method(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (gtu_id) REFERENCES gtu(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'аттестационные центры';

SELECT cipher,city FROM centers;

-- УДОСТОВЕРЕНИЯ
DROP TABLE IF EXISTS certificates;
CREATE TABLE certificates (
	welder_id BIGINT UNSIGNED NOT NULL,
	center_id BIGINT UNSIGNED NOT NULL,
	num_certificate VARCHAR(100) UNIQUE COMMENT 'номер удостоверения',
	start_date DATE COMMENT 'дата начала действия',
	stop_date DATE COMMENT 'дата окончания действия',
	kleymo_id CHAR(5),
	type_cert_id BIGINT UNSIGNED COMMENT 'вид аттестации',
	level_cert_id BIGINT UNSIGNED COMMENT 'уровень',
	welding_method_id BIGINT UNSIGNED COMMENT 'способ сварки',
	gtu_id BIGINT UNSIGNED COMMENT 'группа технических устройств (гту)',
	PRIMARY KEY (welder_id, center_id),
-- 	is_deleted bit default 0,
	
	INDEX num_certificate_idx(num_certificate),
	
	FOREIGN KEY (welder_id) REFERENCES welders(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (center_id) REFERENCES centers(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (kleymo_id) REFERENCES kleymo(id) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (type_cert_id) REFERENCES type_cert(id) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (level_cert_id) REFERENCES level_cert(id) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (welding_method_id) REFERENCES welding_method(id) ON DELETE SET NULL ON UPDATE SET NULL,
	FOREIGN KEY (gtu_id) REFERENCES gtu(id) ON DELETE SET NULL ON UPDATE SET NULL
) COMMENT 'удостоверение сварщика';


