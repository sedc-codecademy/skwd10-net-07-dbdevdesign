CREATE OR ALTER PROCEDURE PrintVariables (@variableOne nchar(1) = 2, @variableTwo nvarchar(200) = '')
AS
BEGIN
	PRINT 'First variable is ' + @variableOne;
	PRINT 'Second variable is ' + @variableTwo;
END

--EXEC PrintVariables @variableOne = '1',  @variableTwo = 'Variable Two'

DECLARE	@ReturnValue int
EXEC @ReturnValue = PrintVariables
SELECT	@ReturnValue as ReturnValue