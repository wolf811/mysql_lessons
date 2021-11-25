-- Урок 6. Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”
USE vk;

/*1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
	который больше всех общался с нашим пользователем.*/

-- SELECT 
-- 	MSG.to_user_id AS friend, COUNT(*) AS count_messages, MSG.from_user_id AS my_user, FR.status
-- 	FROM messages MSG LEFT JOIN friend_requests FR ON (FR.initiator_user_id=MSG.from_user_id AND MSG.to_user_id=FR.target_user_id )
-- 	WHERE MSG.from_user_id = 1 AND FR.status='approved'
-- 	GROUP BY friend ORDER BY count_messages DESC LIMIT 1;
SELECT 
	MSG.from_user_id AS my_user, MSG.to_user_id AS friend, FR.status, COUNT(*) AS count_messages
	FROM messages AS MSG, friend_requests AS FR
	WHERE FR.initiator_user_id = 1 AND FR.status='approved' AND MSG.from_user_id = 1
	GROUP BY friend ORDER BY count_messages DESC LIMIT 1;

-- что-то неправильно

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.



-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.