USE vk;

-- INSERT
INSERT INTO users (firstname, lastname, email, password_hash, phone)
VALUES ('Valentin', 'Kombarov', 'wolf811@gmail.com', 'dsfjkahfho9vknvklj', '89773570448');

INSERT INTO users
SET 
	firstname = 'Mark',
	lastname = 'Ivanov',
	email = 'ivanon@mail.ru',
	phone = '6978438229';

INSERT INTO users (firstname, lastname, email, password_hash, phone, is_deleted) VALUES 
	('Felix', 'Ryabov', 'fel@mail.ru', 'kdshfkjhkfjaf', '23749827839', 1),
	('Georgy', 'Petrov', 'petrov@mail.com', 'ldskjfslkj', '37428979', 1),
	('Artemiy', 'Kombarov', NULL, NULL, NULL, 0),
	('Svetlana', 'Tsukanova', 'mail@mail.ru', 'fjlkafka', NULL, 0),
	(NULL, 'Gorbachev', 'ddddd@mail.ru', 'ajflkj', '3242840', 1),
	('Anatoly', 'Popov', 'popov@mail.ru', 'sdkfjklsd', '27348923', 0),
	('Taisya', 'Kombarova', 'taya@mail.com', '34223rfswjfk', NULL, 1);
	
INSERT INTO users
SET 
	id = 2,
	firstname = 'Lavrentiy',
	lastname = 'Netot';
	
INSERT INTO communities (name) VALUES 
	('programmers'), ('housewives'), ('sportsman');
	
INSERT INTO media_types (name) VALUES 
	('photo'), ('video');
	
INSERT INTO users_communities (user_id, community_id) VALUES
	(2, 1), (44, 3);
	
INSERT users_communities VALUES
	(45, 1), (46, 3), (47, 3), (49, 2), (52, 2);








