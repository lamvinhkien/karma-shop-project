USE Karma
GO

-- DROP TABLE Product
CREATE TABLE Product(
	ProductId INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(32) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	ImageURL VARCHAR(64) NOT NULL,
	Availability NVARCHAR(16) NOT NULL,
	Description NVARCHAR(MAX) NOT NULL,
	Specification NVARCHAR(MAX) NOT NULL,
	Comments NVARCHAR(MAX) NOT NULL,
	Reviews NVARCHAR(MAX) NOT NULL,
	Category NVARCHAR(32) NOT NULL
)
GO

-- DROP TABLE Category
CREATE TABLE Category(
	CategoryId INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(32) NOT NULL,
	ImageURL VARCHAR(64) NOT NULL
)
GO

-- DROP TABLE Blog
CREATE TABLE Blog(
	BlogId INT PRIMARY KEY NOT NULL,
	ImageURL VARCHAR(64) NOT NULL,
	BlogName NVARCHAR(32) NOT NULL,
	Description NVARCHAR(MAX) NOT NULL,
	DetailDescription NVARCHAR(MAX) NOT NULL,
	Author NVARCHAR(32) NOT NULL,
	Tag NVARCHAR(128) NOT NULL,
	DatePost NVARCHAR (32) NOT NULL,
	Views NVARCHAR(16) NOT NULL,
	Comments INT NOT NULL,
	DetailComments NVARCHAR(MAX) NOT NULL
)
GO

-- DROP TABLE Banner
CREATE TABLE Banner(
	BannerId INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(32) NOT NULL,
	Description NVARCHAR(MAX) NOT NULL,
	ImageURL VARCHAR(64) NOT NULL,
)
GO