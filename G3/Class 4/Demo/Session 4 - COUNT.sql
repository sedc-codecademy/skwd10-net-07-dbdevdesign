SELECT COUNT(*) AS [Number of Customers]
FROM Customers

SELECT COUNT(Name) AS [CustomerName]
FROM Customers


SELECT COUNT(Weight) AS [Products Weight]
FROM Products_Test

SELECT COUNT(DISTINCT Price) AS [Products Price]
FROM Products_Test


SELECT COUNT(Name) AS [CustomerName]
FROM Customers
WHERE Name = 'Tobacco Tetovo'

SELECT COUNT(DISTINCT Name) AS [CustomerName]
FROM Customers

select * from Customers


INSERT INTO Customers (Name, IsActive)
VALUES ('Tobacco Tetovo', 1)