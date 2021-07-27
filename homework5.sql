-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.


UPDATE users SET created_at = NOW(), updated_at = NOW();

-- 20.10.2017 8:10

/* Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
 * время помещались значения в формате 20.10.2017 8:10. 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

SELECT STR_TO_DATE(created_at, '%d.%m.%Y. %k.%i') FROM users;

UPDATE 
	users 
SET 
	created_at  = STR_TO_DATE(created_at, '%d.%m.%Y. %k.%i'),
	updated_at  = STR_TO_DATE(updated_at , '%d.%m.%Y. %k.%i');

SELECT * FROM users;

DESCRIBE users;

ALTER TABLE users
CHANGE update_at update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;



/* В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 	0, если товар закончился и выше нуля, если на складе имеются запасы. 
 	Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех 
*/

SELECT * FROM storehouses_products;

INSERT INTO storehouses_products (storehouse_id, product_id, value)
VALUES 
		(1,543,0),
		(1,789,2500),
		(1,3432,0),
		(1,826,30),
		(1,719,500),
		(1,613,1);
		
SELECT * FROM storehouses_products ORDER BY value;

SELECT id, value, IF(value > 0, 0, 1) AS sort FROM storehouses_products ORDER BY value;

SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;
