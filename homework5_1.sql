-- Подсчитайте средний возраст пользователей в таблице users.
SELECT TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age
FROM users;

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM users;


/* Подсчитайте количество дней рождения, 
 * которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
SELECT name, birthday_at FROM users;

SELECT YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at) FROM users;

SELECT concat_ws('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at)) AS day1 FROM users;

SELECT date(concat_ws('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))) AS day1 FROM users;

SELECT date_format(date(concat_ws('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day1 FROM users;

SELECT date_format(date(concat_ws('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day1,
	COUNT(*) AS total 
FROM users 
GROUP BY day1
ORDER BY total DESC;