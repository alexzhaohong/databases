-- mysql -u root < server/schema.sql
DROP DATABASE chat;
CREATE DATABASE chat;

USE chat;

DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;

CREATE TABLE messages (
  id INT(11),
  text VARCHAR(100),
  createdAt DATETIME,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT(11),
  username VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE rooms (
  id INT(11),
  roomname VARCHAR(100),
  PRIMARY KEY (id)
);


/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

