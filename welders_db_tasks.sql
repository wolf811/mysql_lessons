-- ЗАДАЧИ ДЛЯ WELDERS_DB

-- Скрипты характерных выборок, включающих группировки, JOIN'ы, вложенные таблицы

-- 1. Выбрать места аттестации, где есть возможность пройти аттестацию на 3й уровень, метод сварки wm_off, гту gtu_perf
-- SELECT c.cipher FROM centers c WHERE c.cipher = (
-- SELECT lc.name FROM level_cert lc WHERE name = 'III'
-- UNION 
-- SELECT wm.short_name FROM welding_method wm WHERE short_name LIKE '%off'
-- UNION 
-- SELECT g.short_name FROM gtu g WHERE short_name LIKE '%perf');

-- 2. Найти удостоверения, которые были выданы сварщикам из городов Carleton, Kadin
-- 3. Найти сварщиков, которые проходили аттестацию в городе, где проживают.
-- 4. Вывести удостоверения, которые заканчиваются менее, чем через 3 месяца
-- 5. Найти специалистов у которых область деятельности имеет 4й уровень, метод сварки wm_off, гту gtu_perf
-- 6.

-- Представления

-- 1. 
-- 2.

-- Хранимые процедуры

-- 1. 
-- 2.

-- Триггеры

-- 1. 
-- 2.