
/* VARIABLES */

-- DECLARATION
DECLARE @num1 INT;
DECLARE @num2 INT;
DECLARE @result INT;

-- INITIALIZATION 
SET @num1 = 10;
SET @num2 = 15;
SET @result = @num1 + @num2;


SELECT @result AS [Sum of two]
GO


-- IF/ELSE statement

DECLARE @FullName nvarchar(50);
SET @FullName = 'Hristijan Taseski';

IF(LEN(@FullName) < 2)
	SELECT 'Too short name!' AS [Incorrect Result];
ELSE 
	SELECT @FullName + ' is a suitable name!' AS [Result];


-- Concatenation of string values using CONCAT()
DECLARE @Name nvarchar(50);
SET @Name = 'Martin Panovski';

IF(LEN(@Name) < 2)
	SELECT 'Too short name!' AS [Incorrect Result];
ELSE 
	SELECT CONCAT(@Name, ' is a suitable name!') AS [Result];



-- BEGIN/END
DECLARE @StudentName NVARCHAR(50);
DECLARE @Age INT;
DECLARE @Result NVARCHAR(255)

SET @StudentName = 'Aneta';
SET @Age = 124;

IF(LEN(@StudentName) < 3)
BEGIN
	SELECT 'ERROR' AS [Status];
	SET @Result = 'Too short name';
END
ELSE
BEGIN 
	IF(@Age > 120)
	BEGIN
		SELECT 'ERROR' AS [Status];
		SET @Result = 'Age is incorrect!';
	END
ELSE 
BEGIN
	SELECT 'SUCCESS' AS [Status];
	SET @Result = CONCAT(@StudentName, ' is correct!');
  END
END

SELECT @Result AS [RESULT]
