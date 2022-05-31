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

INSERT INTO Products_Test ([Name], Price)
VALUES ('Chocolate bar', 100), ('Musli bar', 200)
GO

SELECT * FROM Products_Test 


ALTER TABLE Products_Test
ADD CONSTRAINT DF_ProductsTest_Weight
DEFAULT 100 FOR [Weight]
GO


INSERT INTO Products_Test ([Name], Price)
VALUES ('Smoki', 100), ('Snickers', 200)
GO

