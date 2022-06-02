SELECT SUM(Price) AS [Total product price]
FROM Products

SELECT SUM(Weight) AS [Total product weight]
FROM Products


-- MIN and MAX

SELECT MAX(TotalPrice) AS [Order with highest price]
FROM Orders

SELECT MIN(TotalPrice) AS [Order with lowest price]
FROM Orders

SELECT MIN(TotalPrice) AS [Order with lowest price]
FROM Orders
WHERE TotalPrice BETWEEN 1 AND 3200


SELECT MAX(Name) 
FROM Customers


select * from Orders
where TotalPrice is null

SELECT ROUND(AVG(Price), 0) AS [Average product price]
FROM Products

SELECT AVG(TotalPrice) AS [Average order total price]
FROM Orders


