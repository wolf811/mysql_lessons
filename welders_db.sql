DROP DATABASE IF EXISTS welders_db;
CREATE DATABASE welders_db;
USE welders_db;

DROP TABLE IF EXISTS welders;
CREATE TABLE welders (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	birthday DATE,
	kleymo INT(5) UNIQUE COMMENT 'клеймо сварщика',
	company VARCHAR(100) COMMENT 'организация-работодатель',
	position_work VARCHAR(100) COMMENT 'занимаемая должность',
	is_deleted bit default 0,
	INDEX welders_firstname_lastname_birthday_kleymo_idx(firstname, lastname, birthday, kleymo)
) COMMENT 'реестр аттестованных сварщиков';

DROP TABLE IF EXISTS certificate;
CREATE TABLE certificate (
	welder_id SERIAL PRIMARY KEY,
	num_cert CHAR(20) COMMENT 'номер удостоверения',
	-- привязаться к id сварщика, центру и области аттестации
	start_date DATE COMMENT 'дата начала действия',
	stop_date DATE COMMENT 'дата окончания действия',
	is_deleted bit default 0,
	/*FOREIGN KEY (from_welder_id) REFERENCES welders(id),
	FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,*/
) COMMENT 'удостоверение сварщика';

DROP TABLE IF EXISTS place_cert;
CREATE TABLE place_cert (
	id SERIAL PRIMARY KEY,
	num_center CHAR COMMENT 'номер центра',
	cicher VARCHAR(20) COMMENT 'шифр центра аттестации',
	name_org VARCHAR(100) COMMENT 'название организации',
	city VARCHAR(100)
) COMMENT 'место аттестации';

DROP TABLE IF EXISTS area_cert;
CREATE TABLE area_cert (
	id SERIAL PRIMARY KEY,
	`level` INT(1) comment 'уровень',
	gtu CHAR(10) COMMENT 'группа технических усройств',
	welding_method CHAR(10) COMMENT 'способ сварки'
) COMMENT 'область аттестации';

DROP TABLE IF EXISTS type_cert;
CREATE TABLE type_cert (
	id SERIAL PRIMARY KEY,
	name_type_cert CHAR(20)
) COMMENT 'вид аттестации';


