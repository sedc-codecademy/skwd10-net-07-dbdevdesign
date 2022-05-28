SELECT *
FROM dbo.Employee
WHERE LastName like 'S%'

SELECT *
FROM dbo.Employee
WHERE FirstName like '%a'


SELECT *
FROM dbo.Employee
WHERE FirstName = 'Goran'



SELECT * 
FROM Employee
WHERE HireDate >='1998.01.01' 
and HireDate < '1998.02.01'

SELECT *
FROM dbo.Employee
WHERE FirstName = 'Aleksandar'
ORDER BY LastName DESC

SELECT *
FROM dbo.Employee
WHERE Gender = 'F'
      AND FirstName like 'A%'
ORDER BY Id ASC
