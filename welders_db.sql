/* База данных "Реестр аттестационных сварщиков" - предназначена для хранения информации об аттестациях сварщиков.
 * Основные сущности: сварщики, аттестационные центры (место аттестации), вид аттестации, область аттестации, удостоверения.
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
	kleymo CHAR(5) UNIQUE COMMENT 'клеймо сварщика',
	company VARCHAR(100) COMMENT 'организация-работодатель',
	position_work VARCHAR(100) COMMENT 'занимаемая должность',
	is_deleted bit default 0,
	
	INDEX welders_firstname_lastname_birthday_kleymo_idx(firstname, lastname, birthday, kleymo)
) COMMENT 'реестр аттестованных сварщиков';

-- ОБЛАСТЬ АТТЕСТАЦИИ (пока не знаю как к ней привязаться, использую отдельно справочники)
DROP TABLE IF EXISTS area_cert;
CREATE TABLE area_cert (
	id SERIAL PRIMARY KEY,
	`level` INT(1) comment 'уровень',
	welding_method CHAR COMMENT 'способ сварки',
	gtu CHAR COMMENT 'группа технических усройств'
) COMMENT 'область аттестации';

-- СПРАВОЧНИКИ ДЛЯ ОБЛАСТИ АТТЕСТАЦИИ
DROP TABLE IF EXISTS type_cert;
CREATE TABLE type_cert (
	id SERIAL PRIMARY KEY,
-- 	name ENUM('первичная', 'дополнительная', 'продление') UNIQUE
	name CHAR(20) UNIQUE
) COMMENT 'вид аттестации';

DROP TABLE IF EXISTS level_cert;
CREATE TABLE level_cert (
	id SERIAL PRIMARY KEY,
-- 	name ENUM('I', 'II', 'III', 'IV') UNIQUE
	name CHAR(20) UNIQUE
) COMMENT 'уровень аттестации';

DROP TABLE IF EXISTS welding_method;
CREATE TABLE welding_method (
	id SERIAL PRIMARY KEY,
	short_name CHAR(20) UNIQUE,
	full_name VARCHAR (255)
) COMMENT 'способ сварки';

DROP TABLE IF EXISTS gtu;
CREATE TABLE gtu (
id SERIAL PRIMARY KEY,
short_name CHAR(20) UNIQUE,
full_name VARCHAR (255)
) COMMENT 'группы технических устройств';

-- МЕСТО АТТЕСТАЦИИ
DROP TABLE IF EXISTS centers;
CREATE TABLE centers (
	id SERIAL PRIMARY KEY,
	num_center INT(5) COMMENT 'номер центра',
	cipher CHAR(20) UNIQUE COMMENT 'шифр аттестационного центра',
	name_org VARCHAR(100) COMMENT 'название организации',
	city VARCHAR(100),
	from_welding_method VARCHAR(255),
	from_gtu VARCHAR(255),
	
	INDEX cipher_idx(cipher),
	
	FOREIGN KEY (from_welding_method) REFERENCES welding_method(short_name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (from_gtu) REFERENCES gtu(short_name) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT 'аттестационные центры';

-- УДОСТОВЕРЕНИЯ (один ко многим - несколько удостоверений может принадлежать одному сварщику)
DROP TABLE IF EXISTS certificates;
CREATE TABLE certificates (
	welder_id SERIAL PRIMARY KEY,
	num_certificate VARCHAR(100) COMMENT 'номер удостоверения',
	start_date DATE COMMENT 'дата начала действия',
	stop_date DATE COMMENT 'дата окончания действия',
	-- место аттестации
	center CHAR(20), 
	-- вид аттестации
	from_type_cert CHAR(20),
	-- уровень
	from_level_cert CHAR(20),
	-- способ сварки
	from_welding_method CHAR(20),
	-- гту
	from_gtu CHAR(20),
	-- ---------------------
	is_deleted bit default 0,
	
	INDEX num_certificate_idx(num_certificate),
	
	FOREIGN KEY (welder_id) REFERENCES welders(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (center) REFERENCES centers(cipher) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (from_type_cert) REFERENCES type_cert(name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (from_level_cert) REFERENCES level_cert(name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (from_welding_method) REFERENCES welding_method(short_name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (from_gtu) REFERENCES gtu(short_name) ON DELETE RESTRICT ON UPDATE RESTRICT
) COMMENT 'удостоверение сварщика';

