SELECT STRING_AGG(Name, ', ') AS [All customer names aggergated]
FROM Customers


SELECT STRING_AGG(FirstName, ' | ') AS [Same name concatenated]
FROM Employees
WHERE FirstName = 'Ana'


SELECT GETDATE()
SELECT CAST(GETDATE() AS Year) AS CurrentDate


SELECT DATEADD(year, -1, GETDATE())


select * from Employees