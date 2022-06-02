CREATE OR ALTER PROCEDURE CreateCustomer(@Name nvarchar(100), 
@AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100),
@CustomerSize nvarchar(10), @PhoneNumber nvarchar(20), @IsActive bit)
AS
BEGIN
	INSERT INTO Customer VALUES (@Name, @AccountNumber, @CustomerSize, @PhoneNumber, @IsActive);

	DECLARE @FirstLetter nchar(1)
	SET @FirstLetter = SUBSTRING(@Name, 1, 1)
	DECLARE @FirstLetterQuery nvarchar(2) = @FirstLetter + '%';
	SELECT * FROM Customer WHERE [Name] LIKE @FirstLetterQuery
END


SELECT * FROM Customer