
SELECT Name FROM Customers AS [Customer and products names]
UNION
SELECT Name FROM Products

SELECT FirstName FROM Employees
UNION
SELECT Name FROM Customers
ORDER BY FirstName;


SELECT Name FROM Products p
UNION ALL
SELECT Name FROM Products_Test pt
ORDER BY p.Name;



SELECT Name FROM Products
INTERSECT
SELECT Name FROM Products_Test


