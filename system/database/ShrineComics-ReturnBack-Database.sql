DROP DATABASE IF EXISTS ShrineComics_ReturnBack;

CREATE DATABASE IF NOT EXISTS ShrineComics_ReturnBack;

USE ShrineComics_ReturnBack;

CREATE TABLE IF NOT EXISTS user(
	user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	username VARCHAR(512) NOT NULL UNIQUE,
	password VARCHAR(512) NOT NULL,
	email VARCHAR(512) NOT NULL UNIQUE,
	address TEXT NULL,
	role ENUM("reader","writer") NULL,
	point INT NULL,
	status ENUM("login","logout","suspend"),
	join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS comic(
	comic_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	title VARCHAR(512) NOT NULL UNIQUE,
	page INT NULL,
	price INT NOT NULL,
	writer VARCHAR(512) NOT NULL, CONSTRAINT fk_comic_writer FOREIGN KEY (writer) REFERENCES user(username),
	genre VARCHAR(512) NULL,
	release_date DATE NULL,
	comment TEXT NULL,
	image TEXT NULL,
	banner TEXT NULL,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS buy_comic(
	buy_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL, CONSTRAINT fk_buy_user_id FOREIGN KEY (user_id) REFERENCES user(user_id),
	comic_id INT NOT NULL, CONSTRAINT fk_buy_comic_id FOREIGN KEY (comic_id) REFERENCES comic(comic_id),
	user_name VARCHAR(512) NOT NULL, CONSTRAINT fk_buy_user_name FOREIGN KEY (user_name) REFERENCES user(username),
	comic_name VARCHAR(512) NOT NULL, CONSTRAINT fk_buy_comic_name FOREIGN KEY (comic_name) REFERENCES comic(title),
	buy_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS comment(
	comment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	sender_id INT NOT NULL, CONSTRAINT fk_comment_sender_id FOREIGN KEY (sender_id) REFERENCES user(user_id),
	receiver_id INT NOT NULL, CONSTRAINT fk_comment_receiver_id FOREIGN KEY (receiver_id) REFERENCES user(user_id),
	sender VARCHAR(512) NOT NULL, CONSTRAINT fk_comment_sender FOREIGN KEY (sender) REFERENCES user(username),
	receiver VARCHAR(512) NOT NULL, CONSTRAINT fk_comment_receiver FOREIGN KEY (receiver) REFERENCES user(username),
	comic_name VARCHAR(512) NOT NULL, CONSTRAINT fk_comment_comic_name FOREIGN KEY (comic_name) REFERENCES comic(title),
	comic_hash VARCHAR(512) NOT NULL, CONSTRAINT fk_comment_comic_hash FOREIGN KEY (comic_hash) REFERENCES comic(hash_code),
	text_comment TEXT NULL,
	comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS feedback(
	feedback_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	sender_id INT NOT NULL, CONSTRAINT fk_feedback_sender_id FOREIGN KEY (sender_id) REFERENCES user(user_id),
	receiver_id INT NOT NULL, CONSTRAINT fk_feedback_receiver_id FOREIGN KEY (receiver_id) REFERENCES user(user_id),
	sender VARCHAR(512) NOT NULL, CONSTRAINT fk_feedback_sender FOREIGN KEY (sender) REFERENCES user(username),
	receiver VARCHAR(512) NOT NULL, CONSTRAINT fk_feedback_receiver FOREIGN KEY (receiver) REFERENCES user(username),
	text_feedback TEXT NULL,
	feedback_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS super_admin(
	super_admin_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(512) NOT NULL UNIQUE,
	password VARCHAR(512) NOT NULL,
	email VARCHAR(512) NOT NULL UNIQUE,
	hash_code VARCHAR(512) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS do_admin(
	do_admin_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	admin_hash VARCHAR(512) NOT NULL, CONSTRAINT fk_do_admin_admin_hash FOREIGN KEY (admin_hash) REFERENCES super_admin(hash_code),
	do_delete BOOLEAN,
	do_add BOOLEAN,
	do_edit BOOLEAN,
	do_delete_comic BOOLEAN,
	do_edit_comic BOOLEAN
);
