USE vk;

-- 1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
-- по 10-100 не получилось, сайт отказывался нормально работать, пришлось вручную как-то

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
INSERT INTO profiles (user_id, gender, birthday, hometown) VALUES 
	(2, 'm', '1981-02-25', 'Moscow'),
	(44, 'm', '1981-02-25', 'Novgorod'),
	(45, 'm', '1981-02-25', 'Kursk'),
	(46, 'm', '1981-02-25', 'Orel'),
	(47, 'm', '1981-02-25', 'Cankt-Peterburg'),
	(48, 'm', '1981-02-25', 'Moscow'),
	(49, 'f', '1981-02-25', 'Tambov'),
	(50, 'm', '1981-02-25', 'Moscow'),
	(51, 'm', '1981-02-25', 'Tambov'),
	(52, 'f', '1981-02-25', 'Dobodedovo');
INSERT INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`) VALUES 
	(2, 50, 'requested'),
	(45, 47, 'requested'),
	(52, 44, 'requested'),
	(2, 48, 'requested'),
	(50, 46, 'requested');
INSERT INTO messages (from_user_id, to_user_id, body) VALUES  
	(2, 50, 'Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et.'),
	(48, 44,'Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed.'),
	(45, 52,'Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi.'),
	(46, 47,'Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit.'),
	(51, 47,'Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur.');
INSERT INTO media (user_id, media_type_id, body, filename, `size`) VALUES 
	(44, 1, 'Sed mollitia quo', 'photo_1', 3),
	(52, 2, 'Sed mollitia quo', 'photo_35', 3),
	(46, 2, 'Sed mollitia quo', 'photo_031', 3),
	(2, 1, 'Sed mollitia quo', 'photo_11', 3),
	(50, 1, 'Sed mollitia quo', 'photo_156', 3);
INSERT INTO photo_albums (name, user_id) VALUES 
	('first_album', 49),
	('second_album', 45),
	('next_album', 51),
	('last_album', 52);
INSERT INTO photos (album_id, media_id) VALUES 
	(3, 6), (1, 7), (2, 8), (4, 10);
INSERT INTO likes (user_id, media_id) VALUES 
	(45, 9), (2, 7), (52, 10);

-- 2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.

-- обновляю столбец с повторяющимся firstname таблицы users для id = 50, который изначально был null
update users set firstname = 'Valentin' where id = 50;
-- теперь можно выбрать уникальные имена в алфавитном порядке
select distinct firstname from users order by firstname;

-- 3. Первые пять пользователей пометить как удаленные.

-- обновляю данные столбца is_deleted в значение 0
update users set is_deleted = 0 where is_deleted = 1;
-- помечаем первые 5 строк(пользователей) как удаленные
update users set is_deleted = 1 limit 5;

-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).

-- добавляю сообщение "из будущего" в таблцицу message
insert into messages (from_user_id, to_user_id, body, created_at) 
values (2, 50, "message from future", "2022-10-01 0:00:00");
-- теперь удаляю это и последющие сообщения, которые позднее сегоднящней даты
delete from messages where created_at > NOW();

-- 5. Написать название темы курсового проекта.
-- Тема курсового проекта: Прототип базы данных "Реестр аттестованных сварщиков"





