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

-- Get all employees with first name Viktor or last name Trajanov
(SELECT FirstName, LastName from [Employee] WHERE FirstName = 'Viktor')
UNION
(SELECT FirstName, LastName from [Employee] WHERE LastName = 'Trajanov')

-- Get all employees with first name Viktor or last name Trajanov (With Duplicate)
(SELECT FirstName, LastName from [Employee] WHERE FirstName = 'Viktor')
UNION ALL
(SELECT FirstName, LastName from [Employee] WHERE LastName = 'Trajanov')

-- Get all employees with first name Viktor and last name Trajanov
(SELECT Id, FirstName, LastName from [Employee] WHERE FirstName = 'Viktor')
INTERSECT
(SELECT FirstName, LastName from [Employee] WHERE LastName = 'Trajanov')

SELECT [Name], [Region] From BusinessEntity
UNION
SELECT [Name], [RegionName] FROM Customer



CREATE TABLE [User] (
Id INT PRIMARY KEY,
Age INT DEFAULT (0)
--CONSTRAINT DF_AGE DEFAULT 0 FOR [AGE]
)

INSERT INTO [User](Id) VALUES (1)

SELECT * FROM [User]

INSERT INTO [User] VALUES (2, 15)

ALTER TABLE [User]
ADD CONSTRAINT DF_Age 
DEFAULT 0 FOR [Age]

CREATE TABLE [Car] (
Id INT PRIMARY KEY NOT NULL,
Price INT NOT NULL CHECK ([Price] > 0)
);

INSERT INTO Car VALUES (1, -1)

ALTER TABLE [Car]
ADD CONSTRAINT CH_Price 
CHECK ([Price] > 0 AND Price < 100)

INSERT INTO Car VALUES (1, 111)
INSERT INTO Car VALUES (1, 99)

CREATE TABLE [Phonebook] (
Id INT NOT NULL PRIMARY KEY,
[Name] NVARCHAR(255) NOT NULL,
PhoneNumber NVARCHAR(15) NOT NULL UNIQUE
)

SELECT * FROM [Phonebook];
INSERT INTO [Phonebook] VALUES (1, 'Miki', '078537928')
INSERT INTO [Phonebook] VALUES (2, 'Bojan', '078537923')