-- creates a user database for our new social media application.
CREATE DATABASE IF NOT EXISTS users;

-- activates user database.
USE users;

-- creates user demographics table.
CREATE TABLE users (
	user_id int NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	username VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(15) NOT NULL,
	street_address VARCHAR(30),
	city VARCHAR(30),
	state CHAR(2),
	zip VARCHAR(5),
    phone VARCHAR(10),
	PRIMARY KEY (user_id)
);

-- view users table field definitions.
DESC users;

-- create comments table.  PK is comment_id and FK is user_id from users table. Field datetimestamp defaults to now.
CREATE TABLE comments (
	comment_id INT NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    datetimestamp DATETIME DEFAULT NOW(),
    comment LONGTEXT,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
  
-- view comments table field definitions.
DESC comments;  
  
-- create posts table. PK is comment_id and FK is user_id from users table and also FK comment_id from comments table.  Field datetimestamp defaults to now.
CREATE TABLE posts (
	post_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    comment_id INT,
    datetimestamp DATETIME DEFAULT NOW(),
    post VARCHAR(200),
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);
    
-- view posts table field definitions.
DESC posts;    

/*
-- add data to users table.
INSERT INTO users VALUES(1,'TOM','SMITH','PEACHES','TOM@HOTMAIL.COM', 'DOIT22', '600 MILLER AVE', 'RENO', 'NV','55966','4064559966');
INSERT INTO users VALUES(2,'GRETTA','TYSON','MOMO','GRETTY@GMAIL.COM', '12345', '888 SKIM ST', 'HELENA', 'AR','02296','555123456');

-- show data in users table.
SELECT * FROM USERS;

-- insert datat into comments table.
INSERT INTO comments (user_id,comment) VALUES(2, 'Get going!');

-- show data in comments table.
SELECT * FROM comments;

-- insert data into posts table.  
INSERT INTO posts (user_id, comment_id, post) VALUES(2,1,'post 2');

-- show data in posts table.
SELECT * FROM posts;

-- show all 3 tables joined and data.  Left Join used from users table.
SELECT users.*, comments.*, posts.* FROM users
LEFT JOIN comments ON users.user_id = comments.user_id
LEFT JOIN posts ON comments.comment_id = posts.comment_id;    
*/

    
