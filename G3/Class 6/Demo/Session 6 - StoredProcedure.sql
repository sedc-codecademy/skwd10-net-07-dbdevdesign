

CREATE OR ALTER PROCEDURE [Students with Gender]
AS
	SELECT * FROM Student s
	WHERE s.Gender = 'F'
GO

EXEC [Students with Gender]



