CREATE PROCEDURE dbo.InsertNewCustomer 
(
  @Name nvarchar(100),  @AccountNumber nvarchar(50),@City nvarchar(100),
  @Region nvarchar(100), @isActive bit
)

AS
BEGIN
    
	  INSERT INTO dbo.Customer (Name, AccountNumber, City, RegionName, isActive)
	  VALUES (@Name, @AccountNumber, @City, @Region, @isActive)

	  SELECT *
	  FROM dbo.Customer
	  WHERE RegionName = @Region

	  SELECT *
	  FROM dbo.Customer
	  WHERE Name = @Name

END


exec dbo.InsertNewCustomer 
      @Name = 'Test Customer',
	  @AccountNumber = '12345',
	  @City= 'Skopje',
	  @Region = 'Skopski',
	  @isActive=1
