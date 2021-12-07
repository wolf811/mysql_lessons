USE welders_db;

-- DDL
INSERT INTO welders (id, firstname, lastname, birthday, company, position_work) VALUES (DEFAULT,'Valentin','Kombarov', '1981-10-15', NULL, NULL);
UPDATE welders SET company = 'ООО "НЕДК"', position_work = 'электрогазосварщик 4 разряда' WHERE id = 31;
SELECT id, firstname FROM welders WHERE firstname LIKE 'Val%';
DELETE FROM welders WHERE firstname LIKE 'Val%';

SHOW CREATE TABLE certificates;
ALTER TABLE certificates DROP FOREIGN KEY certificates_ibfk_4;

-- Актуально ли здесь применение типа данных SET? Или лучше использовать JSON? Не понятно как применять при вставке в отдельную колонку?
TRUNCATE type_cert;
ALTER TABLE type_cert MODIFY name SET ('первичная', 'дополнительная', 'продление') NOT NULL;
INSERT INTO `type_cert` VALUES (1,'первичная'),(2,'дополнительная'),(3,'продление');

ALTER TABLE certificates ADD FOREIGN KEY (type_cert_id) REFERENCES type_cert(id) ON DELETE SET NULL ON UPDATE SET NULL; 

/* В таблице `centers` поля `level_cert_id`, `welding_method_id`, `gtu_id` будут, и должны, иметь несколько значений, которые добавятся из соответствующих справочников.
 * Как правильно сделать вставку данных при таком варианте? через SELECT?
 * Возможно изначально выбрать другой тип данных для справочников `level_cert`, `welding_method, `gtu` на которые ссылаются данные поля? Типа JSON? */

