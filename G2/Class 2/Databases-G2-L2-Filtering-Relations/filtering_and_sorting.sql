USE [SEDC]

-- Get all employees where first name is Aleksandar and last name starts with T
SELECT * FROM [Employee] WHERE FirstName = 'Aleksandar' AND LastName LIKE 'T%'

-- Get all employees which were hired between 2005-05-01 and  2006-07-01 (not included)
SELECT * FROM [Employee] WHERE HireDate >= '2005-05-01' AND HireDate < '2006-07-01'

-- Get all employees with first name Viktor or last name Trajanov
SELECT * FROM [Employee] WHERE FirstName = 'Viktor' OR LastName = 'Trajanov'

-- Get all employees with first name Viktor or last name Trajanov and order by Date of Birth and Id
SELECT * FROM [Employee] WHERE FirstName = 'Viktor' OR LastName = 'Trajanov'
						 ORDER BY DateOfBirth, Id ASC