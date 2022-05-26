SELECT * FROM Employee
WHERE FirstName = 'goran'  

-- % moze da zameni 0,1 ili kolku bilo
-- _ moze da zameni samo 1 karakter
SELECT * FROM Employee
WHERE LastName like ''

SELECT * FROM Employee
WHERE DateOfBirth != '1988-01-01'


SELECT * FROM Employee
WHERE Gender = 'm'

SELECT * FROM Employee
WHERE HireDate >= '1998-01-01' and HireDate < '1998-02-01'

SELECT * FROM Employee
WHERE HireDate between '1998-01-01' and '1998-02-01'

SELECT * FROM Employee
WHERE Id between 40 and 50 -- between pomegju vrednosti


SELECT * FROM Employee
WHERE HireDate between '1990-01-01' and '1990-02-01' and LastName like 'S%'

SELECT * FROM Employee
WHERE FirstName = 'Aleksandar'
ORDER BY LastName ASC

SELECT * FROM Employee
WHERE Gender = 'm' 
ORDER BY HireDate DESC

SELECT [Name] ​

FROM BusinessEntity​

UNION ​-- Spojuvanje na dva set

SELECT [Name] ​

FROM Customer

SELECT Id, Name AS TEST

FROM BusinessEntity​

UNION ALL​

SELECT ID, Name ​

FROM Customer

SELECT FirstName,LastName ​

FROM Employee​

WHERE FirstName = 'Aleksandar'​

INTERSECT ​

SELECT FirstName,LastName ​

FROM Employee​

WHERE LastName = 'Nikolovski'

SELECT Region FROM BusinessEntity
INTERSECT
SELECT RegionName FROM Customer


ALTER TABLE Product
ADD CONSTRAINT DF_Product_Price
DEFAULT 1 FOR Price -- default value

SELECT * FROM Product

ALTER TABLE Product WITH NOCHECK -- no check predhodno dodadeni redovi ne mora da go pominat checkot
ADD CONSTRAINT CK_Product_Price2
CHECK (Price <  Cost)


ALTER TABLE Product WITH NOCHECK
ADD CONSTRAINT UQ_Product_Price
UNiQUE (Name)

 ALTER TABLE [dbo].[Order] WITH NOCHECK
  ADD CONSTRAINT FK_ORDER_BusinessEntityId
  Foreign key (BusinessEntityId) -- Foreign key CONSTRAINT znaci deka vo BusinessEntityId moze da ima vrednost samo na id od BusinessEntity tabelata
  REFERENCES BusinessEntity (Id)

  CREATE TABlE A 
  (
	ID int Identity Primary key,
	TableBId int 
  )

  Create TABLE B
  (
	Id int identity primary key,
	TableA [int] Foreign key references A(ID)
  )

  ALter Table A
  ADD CONSTRAINT FK_A_TableBId
  Foreign key (TableBId)
  REFERENCES B (Id)
  Alter table A
  DROP CONSTRAINT FK_A_TableBId
  
  select * from B
  select * from A
  CROSS JOIN B -- AxB

  SELECT * FROM A as tabelaA
  INNER JOIN B 
  ON tabelaA.TableBId = b.Id -- samo kade sto tableBid e ednakvo na tabela b Id

  SELECT * FROM A as tabelaA
  Right JOIN B 
  ON tabelaA.TableBId = b.Id -- se od desna strana i presekot

  select c.Name, p.Name from Customer as c
  CROSS JOIN Product as p

  SELECT * FROM BusinessEntity AS b
  INNER JOIN [Order] AS o
  ON b.Id = o.BusinessEntityId

   SELECT * FROM BusinessEntity AS b
  LEFT JOIN [Order] AS o
  ON b.Id = o.BusinessEntityId
  where o.Id is null

  SELECT * FROM Customer as c
   LEFT JOIN [Order] AS o
  ON c.Id = o.CustomerId  
  where o.Id is null

  SELECT * FROM [Order] as O
  Right JOIN Customer c
  ON o.CustomerId = c.Id
  where o.Id is null