
CREATE VIEW [Employees that made order] AS
SELECT emp.FirstName, emp.LastName, emp.HireDate, o.TotalPrice, o.OrderDate, c.Name
FROM Employees emp
INNER JOIN Orders o ON emp.Id = o.EmployeeId
INNER JOIN Customers c ON c.Id = o.CustomerId


