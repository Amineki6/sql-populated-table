CREATE TABLE Post(
	p_id INT PRIMARY KEY,
	likes INT,
	dislikes INT,
	creation_date DATE,
	tags VARCHAR(510),
);


INSERT INTO Post
VALUES (10001, 54, 2, '2022-10-15', N'cat');
INSERT INTO Post
VALUES (10002, 142, 12, '2022-10-15', N'dog');
INSERT INTO Post
VALUES (10003, 76, 0, '2022-10-16', N'family_guy');
INSERT INTO Post
VALUES (10004, 157, 29, '2022-10-17', N'football');
INSERT INTO Post
VALUES (10005, 223, 13, '2022-10-18', N'school');



SELECT *
FROM Post


CREATE TABLE Creation(
	c_id INT NOT NULL REFERENCES Post(p_id),
	PRIMARY KEY (c_id),
);


INSERT INTO Creation
VALUES (10002);
INSERT INTO Creation
VALUES (10003);
INSERT INTO Creation
VALUES (10005);


SELECT *
FROM Creation



CREATE TABLE Template(
	t_id INT NOT NULL REFERENCES Post(p_id),
	PRIMARY KEY (t_id),
);

INSERT INTO Template
VALUES (10001);
INSERT INTO Template
VALUES (10004);

SELECT *
FROM Template



CREATE TABLE Users(
	u_id INT PRIMARY KEY,
	username VARCHAR(255),
	password VARCHAR(255),
	bio VARCHAR(255),
	nfollowers INT,
);

INSERT INTO Users
VALUES (1001,N'TehTJ',N'e1yyerld',N'Germany',15);
INSERT INTO Users
VALUES (1002,N'giteam',N'kz1qb7bu',N'new account',10);
INSERT INTO Users
VALUES (1003,N'hugomcjohnson',N'xxqah9bb',N'26/10/2002',1);
INSERT INTO Users
VALUES (1004,N'SweetyByHeart',N'2ji2z6ai',N'',0);
INSERT INTO Users
VALUES (1005,N'Justthisdudeyaknow',N'ue1c9gtj',N'',4);
INSERT INTO Users
VALUES (1006,N'jack64467',N'uhapze0i',N'iykyk',29);
INSERT INTO Users
VALUES (1007,N'StolenHoodOrnament',N'j5lj4wkq',N'I like to travel',54);

SELECT *
FROM Users


CREATE TABLE Admin(
	a_id int NOT NULL REFERENCES Users(u_id),
	PRIMARY KEY (a_id),
);


INSERT INTO Admin
VALUES (1001);

SELECT *
FROM Admin


CREATE TABLE Moderator(
	`m_id` int NOT NULL REFERENCES Users(u_id),
	PRIMARY KEY (mid),
);
CREATE TABLE IsFollowing(
	`u1_id` NOT NULL REFERENCES Users(u_id),
	`u2_id` NOT NULL REFERENCES Users(u_id),
);
CREATE TABLE Likes(
	`p_id` int NOT NULL REFERENCES Post(p_id),
	`u_id` int NOT NULL REFERENCES Users(u_id),
);
CREATE TABLE Dislikes(
	`p_id` int NOT NULL REFERENCES Post(p_id),
	`u_id` int NOT NULL REFERENCES Users(u_id),
);
CREATE TABLE Posts(
	`p_id` int NOT NULL REFERENCES Post(p_id),
	`u_id` int NOT NULL REFERENCES Users(u_id),
);
Create TABLE Comments(
	`content` varchar(255),
	`comm_id` int NOT NULL PRIMARY KEY,
);
CREATE TABLE Commented_by(
	`c_id` int NOT NULL REFERENCES Comments(cid),
	`u_id` int NOT NULL REFERENCES Users(uid)
);
CREATE TABLE Commented_in(
	`p_id` int NOT NULL REFERENCES Post(pid),
	`c_id` int NOT NULL REFERENCES Comments(cid)
);