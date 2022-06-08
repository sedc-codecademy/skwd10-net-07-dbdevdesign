CREATE OR ALTER PROCEDURE sp_AddCustomer
(
	@Name nvarchar(100),
	@AccountNumber nvarchar(100) = NULL,
	@City nvarchar(100) = NULL,
	@RegionName nvarchar(100) = NULL,
	@CustomerSize nvarchar(10) = NULL,
	@PhoneNumber nvarchar(20) = NULL,
	@IsActive bit
)
AS
BEGIN 
IF(LEN(@Name) < 5) 
BEGIN
	SELECT 'The name cannot have less than 5 characters' AS ERROR
END
ELSE
BEGIN
	INSERT INTO dbo.Customers 
	(Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
	VALUES(@Name, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @IsActive)

	SELECT COUNT(*) AS CustomersInRegion
	FROM Customers
	WHERE RegionName = @RegionName

END
END


DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_AddCustomer]
		@Name = N'Reptil',
		@AccountNumber = N'1234522',
		@City = N'Bitola',
		@RegionName = N'Bitolski',
		@CustomerSize = N'Large',
		@PhoneNumber = N'070222142',
		@IsActive = 1

SELECT	'Return Value' = @return_value

GO





SELECT Name, RegionName, COUNT(*) AS Number 
FROM Customers
WHERE RegionName = 'Bitolski'
GROUP BY Name, RegionName