SHOW CREATE TABLE posts;
/*CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `fk_posts_to_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci*/

INSERT INTO posts VALUES(DEFAULT, 2, 'Posts number one', DEFAULT, DEFAULT);
INSERT INTO posts VALUES(DEFAULT, 2, 'Posts number two', DEFAULT, DEFAULT);

SELECT * FROM posts;

-- пост лайки
CREATE TABLE posts_likes (
	post_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	like_type BOOLEAN DEFAULT TRUE,
	PRIMARY KEY(post_id, user_id),
	INDEX post_idx (post_id),
	INDEX user_idx (user_id),
	CONSTRAINT posts_likes_fk FOREIGN KEY (post_id) REFERENCES posts (id),
	CONSTRAINT user_likes_fk FOREIGN KEY (user_id) REFERENCES users (id)
);

-- заполнение таблицы пост_лайки
INSERT INTO posts_likes VALUES(1, 1, DEFAULT);
INSERT INTO posts_likes VALUES(2, 1, DEFAULT);
INSERT INTO posts_likes VALUES(1, 2, DEFAULT);
INSERT INTO posts_likes VALUES(2, 2, DEFAULT);
INSERT INTO posts_likes VALUES(3, 1, DEFAULT);

-- медиа лайки
CREATE TABLE media_likes (
	media_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	like_type BOOLEAN DEFAULT TRUE,
	PRIMARY KEY(media_id, user_id),
	INDEX media_idx (media_id),
	INDEX user_idx (user_id),
	CONSTRAINT media_likes_ml FOREIGN KEY (media_id) REFERENCES media (id),
	CONSTRAINT user_likes_ml FOREIGN KEY (user_id) REFERENCES users (id)
);

-- заполнение таблицы медиа_лайки
INSERT INTO media_likes VALUES(1, 1, DEFAULT);
INSERT INTO media_likes VALUES(2, 1, DEFAULT);
INSERT INTO media_likes VALUES(1, 2, DEFAULT);
INSERT INTO media_likes VALUES(2, 2, DEFAULT);
INSERT INTO media_likes VALUES(3, 1, DEFAULT);

SELECT * FROM media_likes;


/* Черный список */

CREATE TABLE black_list(
	author_id BIGINT UNSIGNED NOT NULL,
	banned_id BIGINT UNSIGNED NOT NULL,
	banned BOOLEAN DEFAULT FALSE,
	PRIMARY KEY(author_id, banned_id),
	INDEX author_idx (author_id),
	INDEX banned_idx (banned_id),
	CONSTRAINT users_author_id FOREIGN KEY (author_id) REFERENCES users (id),
	CONSTRAINT users_banned_id FOREIGN KEY (banned_id) REFERENCES users (id)
);

INSERT INTO black_list VALUES(1, 1, DEFAULT);
INSERT INTO black_list VALUES(2, 1, DEFAULT);
INSERT INTO black_list VALUES(1, 2, DEFAULT);
INSERT INTO black_list VALUES(2, 2, DEFAULT);
