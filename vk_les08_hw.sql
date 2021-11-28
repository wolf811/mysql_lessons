USE vk;

/*1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
	который больше всех общался с нашим пользователем.*/

-- НЕВЕРНОЕ РЕШЕНИЕ ИЗ ДЗ УРОКА 6: не получается правильно вставить вложенный запрос
-- SELECT 
-- 	from_user_id AS my_user,
-- 	to_user_id AS friend,
-- 	COUNT(to_user_id) AS 'count_messages'
-- FROM messages WHERE from_user_id = 1 AND to_user_id IN (SELECT status FROM friend_requests WHERE status = 'approved')
-- GROUP BY to_user_id ORDER BY count_messages DESC LIMIT 1;
-- 
-- SELECT status FROM friend_requests WHERE status = 'approved';

-- ВЕРНОЕ РЕШЕНИЕ С ВЛОЖЕННЫМ ЗАПРОСОМ
SELECT 
	from_user_id AS my_user,
	(SELECT CONCAT(firstname, ' ', lastname) FROM users WHERE id=messages.from_user_id) AS name,
	COUNT(*) AS 'count_messages'
FROM messages 
WHERE to_user_id = 1 
AND from_user_id IN (
	SELECT initiator_user_id FROM friend_requests 
	WHERE (target_user_id = 1) AND status = 'approved'
	UNION 
	SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status = 'approved'
)
GROUP BY from_user_id ORDER BY count_messages DESC LIMIT 1;

-- РЕШЕНИЕ С ПОМОЩЬЮ JOIN
SELECT 
	m.from_user_id AS my_user,
	(SELECT CONCAT(firstname, ' ', lastname) FROM users WHERE id = m.from_user_id) AS name,
	COUNT(*) AS 'count_messages'
FROM messages m JOIN friend_requests fr ON 
	(fr.initiator_user_id = m.from_user_id AND m.to_user_id = fr.target_user_id)
WHERE m.to_user_id = 1 AND fr.status = 'approved'
GROUP BY m.from_user_id ORDER BY count_messages DESC LIMIT 1;
-- ====================================================================================

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
-- НЕВЕРНОЕ РЕШЕНИЕ ИЗ ДЗ УРОКА 6:
-- SELECT COUNT(*) AS 'count_likes' FROM likes WHERE user_id IN 
-- (SELECT user_id FROM profiles WHERE birthday > (CURRENT_DATE - INTERVAL 10 YEAR));

-- ВЕРНОЕ РЕШЕНИЕ С ВЛОЖЕННЫМ ЗАПРОСОМ
SELECT COUNT(*)
FROM likes 
WHERE media_id IN (
	SELECT id FROM media WHERE user_id IN (
		SELECT user_id FROM profiles AS p WHERE TIMESTAMPDIFF (YEAR, birthday, NOW())<10)
);

-- РЕШЕНИЕ С ПОМОЩЬЮ JOIN
SELECT COUNT(*) FROM likes l 
JOIN media m ON l.media_id = m.id
JOIN profiles p ON p.user_id = m.id 
-- WHERE TIMESTAMPDIFF (YEAR, p.birthday, NOW()) < 10;
WHERE p.birthday > (CURRENT_DATE - INTERVAL 10 YEAR);
-- ======================================================================================

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
-- НЕВЕРНОЕ РЕШЕНИЕ ИЗ ДЗ УРОКА 6: ничего умней придумать не удалось
-- SELECT 
-- 	user_id,
-- 	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
-- 	COUNT(*)
-- FROM likes GROUP BY user_id ORDER BY gender;

-- ВЕРНОЕ РЕШЕНИЕ С ВЛОЖЕННЫМ ЗАПРОСОМ
SELECT 
	gender,
	COUNT(*)
FROM (
	SELECT 
		user_id AS user,
		(SELECT gender FROM profiles WHERE user_id = user) AS gender
	FROM likes
) AS dummy
GROUP BY gender;

-- РЕШЕНИЕ С ПОМОЩЬЮ JOIN
SELECT gender, COUNT(*)
FROM likes l JOIN profiles p ON l.user_id = p.user_id
GROUP BY gender;
-- ======================================================================================







