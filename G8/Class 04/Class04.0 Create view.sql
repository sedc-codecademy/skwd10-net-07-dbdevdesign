CREATE VIEW dbo.MaleEmployee
AS
SELECT *
FROM dbo.Employee
WHERE Gender = 'M'
GO

SELECT * 
FROM dbo.MaleEmployee
GO

ALTER VIEW dbo.MaleEmployee
AS
Select FirstName, LastName, NationalIdNumber
from dbo.Employee

SELECT * FROM dbo.MaleEmployee


CREATE VIEW dbo.TotalAmountPerBE
AS
SELECT B.Name as BusinessEntityName, sum(TotalPrice) as Total
from dbo.BusinessEntity as b
inner join dbo.[Order] as o ON b.id=o.BusinessEntityId
group by b.Name

SELECT * FROM dbo.TotalAmountPerBE
