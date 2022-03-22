CREATE DATABASE IF NOT EXISTS Photoshare;
USE Photoshare;
DROP TABLE IF EXISTS Photos CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE Users (
    user_id int4  AUTO_INCREMENT,
    first_name varchar(255), 
    last_name varchar(255),
    email varchar(255) UNIQUE,
    password varchar(255),
    date_of_birth date, 
    hometown varchar(100), 
    gender char(10),
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE is_friend 
( 
	user1 INTEGER,
    user2 INTEGER,
    PRIMARY KEY (user1, user2), 
    FOREIGN KEY (user1) REFERENCES Users(user_id),
    FOREIGN KEY (user2) REFERENCES Users(user_id)
);

CREATE TABLE Albums 
( 
	album_id INTEGER, 
    name_a VARCHAR (255), 
    date_of_creation DATE, 
    PRIMARY KEY (album_id) 
);

CREATE TABLE Have (
owner_id INTEGER NOT NULL, 
album_id INTEGER,
PRIMARY KEY (album_id, owner_id), 
FOREIGN KEY (album_id) REFERENCES Albums(album_id), 
FOREIGN KEY (user2) REFERENCES Users(user_id) ON DELETE CASCADE
);


CREATE TABLE Photos 
( 
	photo_id INTEGER, 
	caption VARCHAR (255),
    data_p VARBINARY(100),
    PRIMARY KEY (photo_id));

CREATE TABLE Belong_to 
( 
	album_id INTEGER NOT NULL, 
	photo_id INTEGER,
    PRIMARY KEY (album_id, photo_id), 
    FOREIGN KEY (photo_id) REFERENCES Photos(photo_id), 
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE Comments 
( 
	comment_id INTEGER,
    text_c VARCHAR(1000),
    date_c DATE,
    PRIMARY KEY (comment_id) 
);

CREATE TABLE Comment_by 
( 
	user_id INTEGER NOT NULL, 
    comment_id INTEGER,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id), 
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Comment_on 
( 
	photo_id INTEGER,	
    comment_id INTEGER,
    PRIMARY KEY (photo_id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id), 
    FOREIGN KEY (photo_id)
    REFERENCES Photos(photo_id)
);

CREATE TABLE Tags 
( tag_word CHAR(25), 
PRIMARY KEY (tag_word)
);

CREATE TABLE Have_a_tag 
( 
	tag_word CHAR(25),
    photo_id INTEGER,
	PRIMARY KEY (tag_word, photo_id), 
    FOREIGN KEY (photo_id) REFERENCES Photos(photo_id),
    FOREIGN KEY (tag_word) REFERENCES Tags(tag_word)
);

CREATE TABLE Like_ 
(
	user_id INTEGER,
	photo_id INTEGER,
	PRIMARY KEY (user_id, photo_id), 
    FOREIGN KEY (photo_id) REFERENCES Photos(photo_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- INSERT INTO Users (email, password) VALUES ('test@bu.edu', 'test');
-- INSERT INTO Users (email, password) VALUES ('test1@bu.edu', 'test');
