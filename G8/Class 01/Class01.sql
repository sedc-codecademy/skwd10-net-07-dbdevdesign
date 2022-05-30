/*create database*/
--CREATE DATABASE SEDC

--USE SEDC
--GO

--/*Create table*/
CREATE TABLE dbo.Customer
(
  [Id] int identity(1,1),
  [Name] nvarchar(100) NOT NULL,  
  [City] nvarchar(100) NULL, 
  CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED (Id)
)

SELECT * FROM dbo.Customer

SELECT Id, Name, City
FROM  dbo.Customer

SELECT Name, City
FROM dbo.Customer

INSERT INTO dbo.Customer (Name, City)
VALUES ('Vero Strumica','Strumica')

INSERT INTO dbo.Customer(Name, City)
VALUES ('Tineks Skopje','Skopje')

INSERT INTO dbo.Customer(Name, City)
VALUES('Vero Tetovo','Tetovo')


SELECT *
FROM dbo.Customer
WHERE City = 'Tetovo'

DROP TABLE dbo.Customer