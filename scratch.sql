
-- GET MESSAGES
select * from messages 
inner join users on messages.user_id = users.id;

-- POST MESSAGES
insert into messages (text, createdAt, roomname, user_id) values
	( req.body.text, now(), roomname,
		( select id from users where username=req.body.username ) );

-- GET USER
select * from users 

-- POST USER
insert into users (username) 
	values (req.body.username);


INSERT INTO `users` (`username`) VALUES
('testuser1');

INSERT INTO `messages` (`user_id`,`roomname`,`text`,`createdAt`) VALUES 
('1','mainroom','9','test9',now());

