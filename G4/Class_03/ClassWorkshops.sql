-- many to many joins
select distinct c.Name from BusinessEntity as be
INNER JOIN [Order]  As o ON be.Id = o.BusinessEntityId
INNER JOIN Customer as c ON o.CustomerId = c.Id
Where be.Name = 'Vitalia Skopje'
-- many to many joins

select distinct be.Name from Customer as c
INNER JOIN [Order]  As o ON c.Id = o.CustomerId
INNER JOIN BusinessEntity as be ON o.BusinessEntityId = be.Id
Where c.Name = 'Zegin Skopje'

--Calculate the total amount on all orders in the system
SELECT SUM (TotalPrice) from [Order]

-- Calculate the total amount per BusinessEntity on all orders in the system
select BusinessEntityId, SUM (TotalPrice) as TotalPrice from [Order]
Group by BusinessEntityId

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
select BusinessEntityId, SUM (TotalPrice) as TotalPrice from [Order]
where CustomerId < 20
Group by BusinessEntityId
-- Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system

SELECT BusinessEntityId, BusinessEntity.Name, MAx(TotalPrice) as maximum, AVG(TotalPrice) as avrage  
FROM [Order]
JOIN BusinessEntity on BusinessEntityId = BusinessEntity.Id
GROUP BY BusinessEntityId, BusinessEntity.Name
ORDER BY AVG(TotalPrice) DESC

-- Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
select BusinessEntityId, SUM (TotalPrice) as TotalPrice from [Order]
Group by BusinessEntityId
Having SUM (TotalPrice) > 635558

-- Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 and filter only total orders less than 100000
select BusinessEntityId, SUM (TotalPrice) as TotalPrice from [Order]
where CustomerId < 20
Group by BusinessEntityId
Having SUM (TotalPrice) < 100000

-- Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. Filter only records where Total order amount is more than 4x bigger than average
SELECT BusinessEntityId, BusinessEntity.Name, MAX(TotalPrice) as MAXIMUM, AVG(TotalPrice)
FROM dbo.[Order]
JOIN BusinessEntity on BusinessEntityId = BusinessEntity.Id
GROUP BY BusinessEntityId, BusinessEntity.Name
HAVING MAX(TotalPrice * 4) > AVG(TotalPrice)
-- Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer
GO;
CREATE VIEW vw_CustomerOrders AS 
(
select CustomerId, sum(TotalPrice) as TotalPrice from [Order]
GROUP BY CustomerId
);
GO;

Select * from vw_CustomerOrders
Where CustomerId < 20
GO;
-- Change the view to show Customer Names instead of CustomerId
ALTER VIEW vw_CustomerOrders AS
(
select Customer.Name, sum(TotalPrice) as TotalPrice from [Order]
INNER JOIN Customer on CustomerId = Customer.Id
GROUP BY Customer.Name
)

GO;
GO;
-- Change the view to show the results ordered by the customer with biggest total price
ALTER VIEW vw_CustomerOrders AS
(
select top 1000 Customer.Name, sum(TotalPrice) as TotalPrice from [Order]
INNER JOIN Customer on CustomerId = Customer.Id
GROUP BY Customer.Name
ORDER BY SUM(TotalPrice) DESC
)

GO;
-- Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 
Create View  vw_EmployeeOrders AS (
 SELECT TOP 1000 e.FirstName + ' ' + e.LastName as FullName, p.Name, SUM(od.Quantity) as Quantity FROM [Order] as o
 INNER JOIN OrderDetails as od on od.OrderId = o.Id
 INNER JOIN Employee e on e.Id = o.EmployeeId
 INNER JOIN Product p on p.Id = od.ProductId
 GROUP BY FirstName, LastName, p.Name
 ORDER BY SUM(od.Quantity)
);
GO;
select RegionName from Customer
GO;
-- Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 
CREATE OR ALTER View  vw_EmployeeOrders AS (
 SELECT TOP 1000 e.FirstName + ' ' + e.LastName as FullName, p.Name, SUM(od.Quantity) as Quantity FROM [Order] as o
 INNER JOIN OrderDetails as od on od.OrderId = o.Id
 INNER JOIN Employee e on e.Id = o.EmployeeId
 INNER JOIN Product p on p.Id = od.ProductId
 INNER JOIN BusinessEntity be on be.Id = o.BusinessEntityId
 where Region = 'Skopski'
 GROUP BY FirstName, LastName, p.Name
 ORDER BY SUM(od.Quantity)
);
GO;
Select * from vw_EmployeeOrders
