CREATE FUNCTION dbo.fn_GetCustomerRegion(@CustomerId INT)
RETURNS NVARCHAR(255)
AS
BEGIN
	DECLARE @CustomerRegion NVARCHAR(255)
	SET @CustomerRegion = (SELECT RegionName FROM Customer WHERE Id = @CustomerId)

	RETURN @CustomerRegion
END


SELECT dbo.fn_GetCustomerRegion(1)