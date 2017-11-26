USE master
IF EXISTS(select * from sys.databases where name='BlogDB')
DROP DATABASE BlogDB
CREATE DATABASE BlogDB
GO

USE BlogDB
GO

CREATE TABLE Category(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(20)
);
GO

CREATE TABLE Article(
	ID int IDENTITY(1,1) PRIMARY KEY,
	CategoryID int FOREIGN KEY REFERENCES Category(ID),
	Name nvarchar(255),
	ImagePath nvarchar(255),
	PostedDate datetime,
	Content nvarchar(2000)	
);
GO

CREATE TABLE Contact(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255),
	Email varchar(255),
	Phone varchar(255),
	Company nvarchar(255),
	Content nvarchar(1000)
);
GO

INSERT INTO Category (Name)
VALUES
	('Art'),
	('Beauty'),
	('Food'),
	('Car');
GO

INSERT INTO Article (CategoryID, Name, ImagePath, PostedDate, Content)
VALUES
	('1','Why blog?','images\img03 - Copy (2) - Copy.jpg','1/27/1997','Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment.'),
	('2','Deadpool!','images\img03 - Copy (2).jpg','6/9/1969','Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment.'),
	('3','Crusty Rat!','images\img03 - Copy (3).jpg','12/21/2012','Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment.'),
	('4','Homie!','images\img03 - Copy.jpg','2/27/2000','Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment.'),
	('4','Why blog?','images\img03.jpg','10/10/2010','Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment. Google+ and FaceBook are most popular social media network. Do you know how to make a simple blog? Let try in this assignment.');
GO