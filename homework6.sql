
-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
SELECT 
	(SELECT first_name FROM users WHERE users.id = from_user_id) AS first_name,
	(SELECT last_name FROM users WHERE users.id = from_user_id) AS last_name, 
	COUNT(*) AS messages_sent
FROM messages
WHERE to_user_id = 1
AND is_delivered = 1
GROUP BY from_user_id
ORDER BY messages_sent DESC
LIMIT 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT COUNT(*) FROM posts_likes WHERE post_id IN (
	SELECT id FROM posts WHERE user_id IN (
		SELECT user_id FROM profiles WHERE YEAR(CURDATE()) - YEAR(birthday) < 18
		)
	);

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	(SELECT gender FROM profiles WHERE profiles.user_id = posts_likes.user_id) AS gender,
	COUNT(*) AS total
FROM posts_likes
WHERE like_type = 1
GROUP BY gender
HAVING gender IN ('m', 'f')
ORDER BY total DESC
LIMIT 1;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT 
  CONCAT(first_name, ' ', last_name) AS user_name,
  (SELECT COUNT(*) FROM posts_likes WHERE posts_likes.user_id = users.id) +
  (SELECT COUNT(*) FROM media WHERE media.user_id = users.id) +
  (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity
FROM users
ORDER BY overall_activity
LIMIT 1;