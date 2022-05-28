CREATE VIEW MaleEmployees AS
SELECT Id, FirstName, LastName, Gender From [Employee]
WHERE Gender = 'M'

CREATE VIEW CustomersFromSkopje AS
SELECT * FROM [Customer]
WHERE City = 'Skopje'

SELECT * FROM MaleEmployees
WHERE FirstName = 'Aleksandar'

SELECT * FROM CustomersFromSkopje
WHERE [Name] LIKE 'Vero%'