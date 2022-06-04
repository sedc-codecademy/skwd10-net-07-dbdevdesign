
SELECT * FROM Student
GO

CREATE OR ALTER FUNCTION GetStudentFullName(@firstName nvarchar(50), @lastName nvarchar(50))
RETURNS NVARCHAR(255)
AS
BEGIN 
	RETURN CONCAT(@firstName, ' ', @lastName);
END
GO

-- CALL SCALAR FUNCTION
SELECT dbo.GetStudentFullName(FirstName, LastName) AS [Student FullName]
FROM Student
GO



-- RETURN TABLE Function

CREATE FUNCTION GetAllStudentsBornBetweenDate(@from date, @to date)
RETURNS TABLE
AS
	RETURN 
		SELECT *
		FROM Student
		WHERE DateOfBirth BETWEEN @from AND @to

