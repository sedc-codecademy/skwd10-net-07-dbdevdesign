USE [SEDC]
GO


DROP TABLE IF EXISTS [Products_Test]
GO

CREATE TABLE Products_Test (
[Id] int IDENTITY(1,1) NOT NULL,
[Code] nvarchar(50) NULL,
[Name] nvarchar(100) NULL,
[Description] nvarchar(max) NULL,
[Weight] decimal(18, 2) NULL,
[Price] decimal(18,2) NULL,
[Cost] decimal(18,2) NULL
)
GO

INSERT INTO Products_Test (Name, Price) 
VALUES ('Musli bar', 100), ('Coca-cola', 30), ('Chocolate bar', 50) 


SELECT * FROM Products_Test



SELECT * FROM Products_Test
WHERE Price >= 100


SELECT * FROM Products_Test
WHERE Price < 100


SELECT * FROM Products_Test
WHERE Price < 100 AND Price > 50


SELECT * FROM Products_Test
WHERE Price < 100 AND Price > 50


SELECT * FROM Products_Test
WHERE Price BETWEEN 20 AND 100

SELECT * FROM Products_Test
WHERE Price <> 50


SELECT * FROM Products_Test
WHERE Name LIKE 'm%'

SELECT * FROM Products_Test
WHERE Name LIKE '%R'

SELECT * FROM Products_Test
WHERE Name LIKE '%Mu%'