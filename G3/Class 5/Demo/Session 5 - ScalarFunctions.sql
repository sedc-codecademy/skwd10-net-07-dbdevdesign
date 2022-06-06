
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
SELECT dbo.GetStudentFullName(s.FirstName, s.LastName) AS [Student FullName]
FROM Student s
GO



-- RETURN TABLE Function
CREATE OR ALTER FUNCTION GetAllStudentsBornBetweenDate(@from date, @to date)
RETURNS TABLE
AS
	RETURN 
		SELECT s.FirstName, s.LastName, s.EnrolledDate, COUNT(*) AS [Number of students]
		FROM Student s
		WHERE s.DateOfBirth BETWEEN @from AND @to
		GROUP BY s.FirstName, s.LastName, s.EnrolledDate
GO

-- INCORRECT CALL OF FUNCTION THAT RETURNS TABLE AS RESULT
--SELECT dbo.GetAllStudentsBornBetweenDate(DATEADD(YEAR, -18, GETDATE()), GETDATE()) 
--FROM Student

SELECT *
FROM dbo.GetAllStudentsBornBetweenDate(DATEADD(YEAR, -30, GETDATE()), GETDATE())
ORDER BY EnrolledDate


select * from Student 
order by DateOfBirth
GO


CREATE OR ALTER FUNCTION FormatStudentName(@studentId INT)
RETURNS NVARCHAR(50)
AS 
BEGIN
DECLARE @Output NVARCHAR(255);

	SELECT @Output = CONCAT(s.FirstName, ' ', s.LastName, ' | CardNumber: ', s.StudentCardNumber)
				     FROM Student s
					 WHERE s.Id = @studentId
	RETURN @Output;
END
GO

SELECT dbo.FormatStudentName(s.Id) AS [FuncOutput]
FROM Student s