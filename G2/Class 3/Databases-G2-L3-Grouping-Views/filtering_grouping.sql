USE [SEDC];

SELECT LastName, COUNT(*) AS PeopleWithLastName FROM [Employee]
GROUP BY LastName

SELECT LastName, SUM(Id) FROM [Employee]
GROUP BY LastName

SELECT Gender, COUNT(*) FROM [Employee]
GROUP BY Gender

SELECT * FROM Employee

SELECT LastName, MIN(Id) as MinId FROM [Employee]
GROUP BY LastName ORDER BY MinId

SELECT FirstName, MAX(Id) as MaxId FROM [Employee]
GROUP BY FirstName ORDER BY MaxId

SELECT FirstName, MAX(Id) as MaxId FROM [Employee]
GROUP BY FirstName ORDER BY MaxId

SELECT * FROM [Order];

SELECT AVG(TotalPrice) as AvgTotalPrice FROM [Order];

SELECT BusinessEntityId, CustomerId, SUM(TotalPrice) FROM [Order]
GROUP BY CustomerId, BusinessEntityId
HAVING CustomerId < 20