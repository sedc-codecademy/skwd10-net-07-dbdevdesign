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

ALTER TABLE Products_Test
ADD CONSTRAINT CHK_ProductsTest_Price
CHECK (Price >= 0)
GO


INSERT INTO Products_Test ([Name], Price)
VALUES ('Coca-cola', -10)


INSERT INTO Products_Test ([Name], Price)
VALUES ('Coca-cola', 70)


SELECT * FROM Products_Test