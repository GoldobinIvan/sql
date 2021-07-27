-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT * FROM orders;
DESCRIBE orders;

INSERT INTO orders VALUES
(DEFAULT, 1, DEFAULT, DEFAULT),
(DEFAULT, 2, DEFAULT, DEFAULT),
(DEFAULT, 1, DEFAULT, DEFAULT),
(DEFAULT, 3, DEFAULT, DEFAULT);

SELECT * FROM users;

SELECT * FROM users
WHERE users.id IN (SELECT orders.user_id FROM orders);


-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT
  products.id,
  products.name,
  (SELECT
 	catalogs.name
   FROM
 	catalogs
   WHERE
 	catalogs.id = products.catalog_id) AS 'catalogs'
FROM
  products;
  
/* (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.
 */
 
 CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_ VARCHAR(50),
  to_ VARCHAR(50)
 );

 CREATE TABLE cites (
  label VARCHAR(50),
  name VARCHAR(50)
 );

INSERT INTO flights VALUES
(DEFAULT, 'moscow', 'omsk'),
(DEFAULT, 'novgorod', 'kazan'),
(DEFAULT, 'irkutsk', 'moscow'),
(DEFAULT, 'omsk', 'irkutsk'),
(DEFAULT, 'moscow', 'kazan');

INSERT INTO cites VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');
 
SELECT * FROM flights;


SELECT 
	id, 
	(SELECT cites.name FROM cites WHERE cites.label = flights.from_) AS from_,
	(SELECT cites.name FROM cites WHERE cites.label = flights.to_) AS to_
FROM flights;





