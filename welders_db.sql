DROP DATABASE IF EXISTS welders_db;
CREATE DATABASE welders_db;
USE welders_db;

DROP TABLE IF EXISTS welders;
CREATE TABLE welders (
	id SERIAL PRIMARY KEY,
	firsname VARCHAR(20),
	lastname VARCHAR(20),
	kleymo BIGINT,
	company VARCHAR(100),
	
);