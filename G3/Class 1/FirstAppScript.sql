CREATE DATABASE MyAppdatabase;

USE MyAppdatabase;

CREATE TABLE Students(
Id int NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
Age tinyint NULL
);

INSERT INTO Students (Id, FirstName, LastName, Age)
VALUES (1, 'Martin', 'Panovski', 28);

INSERT INTO Students (Id, FirstName, LastName, Age)
VALUES (1, 'Hristijan', 'Taseski', 30);

SELECT * FROM Students

UPDATE Students
SET Id = 2
WHERE FirstName = 'Hristijan'

--DELETE FROM Students
