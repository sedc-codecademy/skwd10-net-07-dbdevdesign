CREATE OR ALTER PROCEDURE dbo.sp_InsertEmployee
(
	@FirstName nvarchar(100),  
	@LastName nvarchar(100),
	@DateOfBirth date = NULL,
	@Gender nchar(1) = NULL,
	@HireDate date = NULL,
	@NationalIdNumber nvarchar(20) = NULL,
	@EmployeeID int OUT
)
AS
BEGIN 
	INSERT INTO Employees(FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
	VALUES(@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

	-- SCOPE_IDENTITY() - Returns the last identity value inserted into an identity column in the same scope
	SET @EmployeeID = SCOPE_IDENTITY()
	
	SELECT * 
	FROM Employees 
	WHERE Id = @EmployeeID
END
GO

DECLARE @ReturnValue int, 
		@EmployeeIdOUT int 

EXEC @ReturnValue = dbo.sp_InsertEmployee 
					@FirstName = 'Martin',
					@LastName = 'Panovski',
					@DateOfBirth = '1993-10-01',
					@Gender = 'M',
					@HireDate = '2018-10-01',
					@NationalIdNumber = '1001992450006',
					@EmployeeId = @EmployeeIdOUT

SELECT @ReturnValue AS ReturnValue, @EmployeeIdOUT AS EmployeeIdOUT


select * from Employees order by Id desc