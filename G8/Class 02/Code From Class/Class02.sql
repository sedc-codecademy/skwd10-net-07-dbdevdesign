CREATE TABLE dbo.Product_test
(
  Id int identity(1,1),
  Code nvarchar(50) NULL,
  [Name] nvarchar(100) NULL,
  [Description] nvarchar(200) NULL,
  [Weight] decimal(18,2) NULL,
  Cost decimal(18,2) NULL,
  Price decimal(18,2) NULL
  CONSTRAINT DF_Product_Price DEFAULT (0)
)

INSERT INTO dbo.Product_test (Name)
VALUES ('Granola')

SELECT * FROM dbo.Product_test

INSERT INTO dbo.Product_test(Name, Price)
Values('Musli',10)

SELECT * FROM dbo.Product_test

ALTER TABLE dbo.Product_test
ADD CONSTRAINT DF_Product_Weight
DEFAULT (100) FOR	[Weight]

INSERT INTO dbo.Product_test (Name)
VALUES('Ovesni snegulki')

SELECT * FROM dbo.Product_test

ALTER TABLE dbo.Product_test
ADD CONSTRAINT CHK_Product_Price
CHECK (price>=0)

INSERT INTO dbo.Product_test (Name, Price)
VALUES ('Puter od kikiriki',-1)

INSERT INTO dbo.Product_test (Name, Price)
VALUES ('Puter ok kikiriki', 175)

select *
from dbo.Product_test

ALTER TABLE dbo.Product_test WITH CHECK
ADD CONSTRAINT UNQ_Product_Code
UNIQUE (Code)

UPDATE dbo.Product_test
SET Code = 1
--SELECT *
--FROM dbo.Product_test
WHERE Id = 1


UPDATE dbo.Product_test
SET Code = 2
WHERE Id = 2

UPDATE dbo.Product_test
SET Code = 3
WHERE Id = 3

UPDATE dbo.Product_test
SET Code= 4
WHERE Id = 6

INSERT INTO dbo.Product_test (Code, Name)
Values(5,'Zitarki')

SELECT * FROM dbo.Product_test