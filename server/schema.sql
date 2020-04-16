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
  user_id INT(11),
  room_id INT(11),
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE rooms (
  id INT(11) NOT NULL AUTO_INCREMENT,
  roomname VARCHAR(100),
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE messages ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE messages ADD FOREIGN KEY (room_id) REFERENCES rooms (id);

/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

