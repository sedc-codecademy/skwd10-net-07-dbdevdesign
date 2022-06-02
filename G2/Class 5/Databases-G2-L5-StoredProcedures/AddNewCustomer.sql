CREATE OR ALTER PROCEDURE CreateCustomer(@Name nvarchar(100), 
@AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100),
@CustomerSize nvarchar(10), @PhoneNumber nvarchar(20), @IsActive bit, @NumberOfCustomerWithSameLetter int OUTPUT,
@NumberOfCustomersInSameRegion int OUTPUT)
AS
BEGIN
	INSERT INTO Customer VALUES (@Name, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @IsActive);

	DECLARE @FirstLetter nchar(1)
	SET @FirstLetter = SUBSTRING(@Name, 1, 1)
	DECLARE @FirstLetterQuery nvarchar(2) = @FirstLetter + '%';

	SET @NumberOfCustomerWithSameLetter = (SELECT COUNT(*)  FROM Customer WHERE [Name] LIKE @FirstLetterQuery)

	SET @NumberOfCustomersInSameRegion = (SELECT COUNT(*) AS NumberOfCustomersInSameRegion FROM Customer 
									      WHERE RegionName = @RegionName)
END

GO
DECLARE @customersWithSameLetter INT;
DECLARE @customersInSameRegion INT;

EXEC CreateCustomer 'Peteks', '123414124', 'Skopje', 'Skopski', 'Large', '12345682', 1, @customersWithSameLetter OUTPUT,
@customersInSameRegion OUTPUT

SELECT @customersWithSameLetter as NrOfCustomersWithSameLetter, @customersInSameRegion as NrOfCustomersInSameRegion