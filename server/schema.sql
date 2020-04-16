-- mysql -u root < server/schema.sql
DROP DATABASE IF EXISTS chat;
CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;

CREATE TABLE messages (
  id INT(11) NOT NULL AUTO_INCREMENT,
  text VARCHAR(100),
  createdAt DATETIME,
  roomname VARCHAR(50),
  -- room_id INT(11),
  user_id INT(11),
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(100),
  PRIMARY KEY (id)
);

-- CREATE TABLE rooms (
--   id INT(11) NOT NULL AUTO_INCREMENT,
--   roomname VARCHAR(100),
--   PRIMARY KEY (id)
-- );

-- ---
-- Foreign Keys
-- ---

ALTER TABLE messages ADD FOREIGN KEY (user_id) REFERENCES users (id);
-- ALTER TABLE messages ADD FOREIGN KEY (room_id) REFERENCES rooms (id);

/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

-- -- TEST DATA
-- INSERT INTO `users` (`username`) VALUES
-- ('testuser1');

-- INSERT INTO `messages` (`user_id`,`roomname`,`text`,`createdAt`) VALUES
-- ('1','mainroom','test9',now());


-- GET MESSAGES
-- select * from messages
-- inner join users on messages.user_id = users.id;

-- -- POST MESSAGES
-- insert into messages (text, createdAt, roomname, user_id) values
-- 	( req.body.text, now(), req.body.roomname,
-- 		( select id from users where username=req.body.username ) );

-- -- GET USER
-- select * from users ;

-- -- POST USER
-- insert into users (username)
-- 	values (req.body.username);



--     -- POST USER example
-- insert into users (username)
-- 	values ('req.body.username');


-- -- POST USER example
-- insert into users (username)
--   values ('req.body.username');

-- -- -- POST MESSAGES example
-- insert into messages (text, createdAt, roomname, user_id) values ( 'req.body.text', now(), 'req.body.roomname', ( select id from users where username='req.body.username' ) );



-- -- -- POST USER example
-- insert into users (username)
--   values ('bob');

-- -- -- POST MESSAGES example
-- insert into messages (text, createdAt, roomname, user_id) values ( 'test2', now(), 'main', ( select id from users where username='bob' ) );
