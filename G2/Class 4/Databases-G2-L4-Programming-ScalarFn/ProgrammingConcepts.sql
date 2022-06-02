

GO 
  CREATE TABLE #TempTable (Id INT, TableName NVARCHAR(20));
  DECLARE @TotalNumberOfCustomers INT;
  SET @TotalNumberOfCustomers = 0;
  
  SET @TotalNumberOfCustomers = (SELECT COUNT(Id) FROM [Customer]);
  
  SELECT Id, @TotalNumberOfCustomers as TotalNumberOfCustomers FROM [Customer]
  WHERE AccountNumber > @TotalNumberOfCustomers;

GO 
	DECLARE @NumberOfCustomersFromShtip INT;
	SET @NumberOfCustomersFromShtip = (SELECT COUNT(Id) FROM [Customer] WHERE RegionName = 'Stipski');

	IF (@NumberOfCustomersFromShtip > 5)
		SELECT 'More than 5 customers from Stipski Region';
	ELSE 
		SELECT 'Less than 5 customers from Stipski Region';

GO 
	DECLARE @NewCustomersFromStipskiRegion TABLE (CustomerName NVARCHAR(255), 
											      CustomerRegion NVARCHAR(255), 
												  CustomerCity NVARCHAR(255));

	INSERT INTO @NewCustomersFromStipskiRegion 
		SELECT [Name], RegionName, [City] FROM [Customer] 
		WHERE RegionName = 'Stipski';
	
	--SELECT * FROM @NewCustomersFromStipskiRegion;

	CREATE TABLE NewCustomersTest (CustomerName NVARCHAR(255), 
											      CustomerRegion NVARCHAR(255), 
												  CustomerCity NVARCHAR(255));

    INSERT INTO NewCustomersTest SELECT [CustomerName], [CustomerRegion], [CustomerCity] FROM @NewCustomersFromStipskiRegion;

	SELECT * FROM NewCustomersTest;

	SELECT * FROM #TempTable;

