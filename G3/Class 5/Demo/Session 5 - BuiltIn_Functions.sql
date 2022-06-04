
-- Built in function LEN()
-- Count the number of characters in a nvarchar values

SELECT FirstName, LEN(FirstName) AS [Name Length]
FROM Student


-- Built in function SUBSTRING()
-- Gets portion of string in nvarchar or varchar values

SELECT s.FirstName, s.LastName, SUBSTRING(gr.Comment, 1, 4) AS [Comment substring]
FROM Student s
INNER JOIN Grade gr ON s.Id = gr.StudentId


-- Built in function REPLACE()
-- Replace a given string value with another one

SELECT s.FirstName, s.LastName, REPLACE(gr.Comment, 'D', 'Dovolen')
FROM Student s
INNER JOIN Grade gr ON s.Id = gr.StudentId


SELECT s.FirstName, s.LastName, REPLACE(s.LastName, 'Jovanova', 'Petrova') AS [Replaced value]
FROM Student s
INNER JOIN Grade gr ON s.Id = gr.StudentId


-- Builin function GETDATE()
-- Get the current date from the system/server

ALTER TABLE Student
ADD DateCreated DateTime


SELECT * FROM Student

INSERT INTO Student 
(FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIdNumber, StudentCardNumber, DateCreated)
VALUES('Martin', 'Panovski', '1993-08-27', GETDATE(), 'M', 411343, 'sc-89712', GETDATE())





