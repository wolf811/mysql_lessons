-- Урок 6. Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”
USE vk;

/*1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
	который больше всех общался с нашим пользователем.*/

-- этот скрипт работает, но только мы еще это не проходили (подсказали)
SELECT 
	MSG.to_user_id AS friend, COUNT(*) AS count_messages, MSG.from_user_id AS my_user, FR.status
	FROM messages MSG LEFT JOIN friend_requests FR ON (FR.initiator_user_id=MSG.from_user_id AND MSG.to_user_id=FR.target_user_id )
	WHERE MSG.from_user_id = 1 AND FR.status='approved'
	GROUP BY friend ORDER BY count_messages DESC;

-- не получается правильно вставить вложенный запрос
SELECT 
	from_user_id AS my_user,
	to_user_id AS friend,
	COUNT(to_user_id) AS 'count_messages'
FROM messages WHERE from_user_id = 1 AND to_user_id IN (SELECT status FROM friend_requests WHERE status = 'approved')
GROUP BY to_user_id ORDER BY count_messages DESC LIMIT 1;

SELECT status FROM friend_requests WHERE status = 'approved';

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

-- общее кол-во лайков всех пользователей
SELECT COUNT(*) AS 'count_likes' FROM likes;
-- пользователи младше 10 лет
SELECT user_id FROM profiles WHERE birthday > (CURRENT_DATE - INTERVAL 10 YEAR);

-- итоговый запрос
SELECT COUNT(*) AS 'count_likes' FROM likes WHERE user_id IN 
(SELECT user_id FROM profiles WHERE birthday > (CURRENT_DATE - INTERVAL 10 YEAR));

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
-- ничего умней придумать не удалось
SELECT 
	user_id,
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	COUNT(*)
FROM likes GROUP BY user_id ORDER BY gender;