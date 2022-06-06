ALTER FUNCTION dbo.fn_EmployeeFullName (@EmployeeID int)
RETURNS NVARCHAR(200)
AS
BEGIN
        DECLARE @Result NVARCHAR(200)

		SELECT @Result = FirstName + '/' + LastName
		FROM dbo.Employee
		WHERE ID = @EmployeeID

		RETURN @RESULT

END

SELECT dbo.fn_EmployeeFullName(1)
