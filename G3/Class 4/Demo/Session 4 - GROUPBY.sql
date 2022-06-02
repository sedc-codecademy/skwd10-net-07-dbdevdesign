SELECT Gender, FirstName, COUNT(*) AS [Number of employees]
from Employees
GROUP BY Gender, FirstName


SELECT Size, COUNT(*) AS [Size count]
FROM BusinessEntities
GROUP BY Size
HAVING Size <> 'Medium'


SELECT * FROM Products

SELECT Price, COUNT(*) AS [Price count]
FROM Products
GROUP BY Price


SELECT Name, Code, COUNT(*) AS [Count by name containing Soy]
FROM Products
GROUP BY Name, Code
HAVING Name like '%e%'



