SELECT count(*)
FROM dbo.Employee

SELECT Gender,count(*) as Total
FROM dbo.Employee
GROUP BY Gender 