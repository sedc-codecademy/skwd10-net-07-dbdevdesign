Declare @test nvarchar(100)
SET @test = 'T'
-- 
if(Len(@test) < 2)
  SELECT 'Too short name';
Else if (LEN(@test) >2 and LEN(@test) < 5)
	Select 'Na prav pat si'
ELSE 
	SELECT @test + ' is a suitable name.' AS [Name Check Result];​

	-- _ 
	-- %
SELECT REPLACE (Name, 'Vero Bitola', 'Vero Skopje'), Name FROM Customer

GO
-- Declare scalar variable for storing FirstName values​

--Assign value ‘Aleksandar’ to the FirstName variable​

-- Find all Employees having FirstName same as the variable
Declare @FirstName nvarchar(100)
SET @FirstName = 'Aleksandar'

--Select @FirstName

SELECT * FROM Employee
WHERE FirstName = @FirstName

GO;
--Declare table variable that will contain EmployeeId and DateOfBirth
DECLARE @EmployeeList TABLE (EmployeeId int, DateOfBirth datetime2)

--Fill the table variable with all Female employees​
INSERT INTO @EmployeeList
SELECT Id, DateOfBirth FROM Employee
Where Gender = 'F'

SELECT * FROM @EmployeeList

GO;
-- ​​Declare temp table that will contain LastName and HireDate columns
CREATE TABLE #EmployeeList (LastName nvarchar(255), HireDate datetime2)

-- Fill the temp table with all Male employees having First Name starting with ‘A’

INSERT INTO #EmployeeList
SELECT LastName, HireDate FROM Employee
WHERE Gender = 'M' and FirstName Like 'A%'

-- Retrieve the employees from the table which last name is with 7 characters
SELECT * FROM #EmployeeList
WHERE LEN(LastName) = 7; 

DROP TABLE #EmployeeList
GO

-- Declare scalar function (fn_FormatProductName) 
-- for retrieving the Product description for specific ProductId in the following format:​
Create FUNCTION dbo.fn_FormatProductName(@ProductId int)
RETURNS nvarchar(2000)
AS
BEGIN 
	Declare @Result nvarchar(2000);
	SELECT @Result = SUBSTRING(Code, 2,2) + '-' + RIGHT(name, 3) + '-' + CAST(Price as nvarchar(200))
	FROM Product
	Where Id = @ProductId and Price > 10
	return @Result;
END;
GO
ALTER FUNCTION dbo.fn_FormatProductName(@ProductId int)
RETURNS nvarchar(2000)
AS
BEGIN 
	Declare @Result nvarchar(2000);
	SELECT @Result = SUBSTRING(Code, 2,2) + '-' + RIGHT(name, 3) + '-' + CAST(Price as nvarchar(200))
	FROM Product
	Where Id = @ProductId and Price > 25
	return @Result;
END;
GO;
SELECT dbo.fn_FormatProductName (1)
SELECT Price, dbo.fn_FormatProductName (Id) FROM Product
WHERE dbo.fn_FormatProductName (Id) is not null

SELECT SUBSTRING(Code, 2,2) + '-' + RIGHT(name, 3) + '-' + CAST(Price as nvarchar(200)) FROM Product


-- date function
DECLARE @dt datetime
set @dt = GETDATE()

-- dateadd days
SELECT 
@dt as [Now], 
DATEADD(day, -7, @dt) as [Last Week],
DATEADD(day, 7, @dt) as [Next Week]
-- date function
DECLARE @dt datetime
set @dt = GETDATE()
-- date add minutes
SELECT 
@dt as [Now], 
DATEADD(MINUTE, -30, @dt) as [30 minutes in the past],
DATEADD(MINUTE, 30, @dt) as [30 minutes in the feture]
DECLARE @dt datetime
set @dt = GETDATE()
SELECT
@dt as [Now],
DATEDIFF(DAY, '01.01.2022', @dt) [DayDiff],
DATEDIFF(Month, '01.01.2022', @dt) [MonthDiff],
DATEDIFF(MINUTE, '01.01.2022', @dt)[MinuteDiff]

SELECT
 CONVERT(int, '1998')

 SELECT CONVERT(nvarchar(30), Price) FROM Product
 
 declare @counter int
 declare @tabela Table (CounterValue int)
 Set @counter = 0;
 While(@counter < 10)
 BEGIN
	INSERT INTO @tabela VALUES(@counter);
	SET @counter = @counter + 1;
 END
 SELECT * FROM @tabela
GO;
 CREATE FUNCTION FK_Range(@lenght int, @startAt int)
 RETURNS NVarchar(2000)
 AS
 BEGIN
	declare @result nvarchar(2000);
	declare @ourStartAt int
	set @ourStartAt = @startAt;
	while(@ourStartAt <= @lenght)
	Begin
		SET @result = @result + ','  + CONVERT(nvarchar(100), @ourStartAt);
		SET @ourStartAt = @ourStartAt + 1;
	end
	return @result;
 END

 ALTER FUNCTION FK_Range(@lenght int, @startAt int)
 RETURNS NVarchar(2000)
 AS
 BEGIN
	declare @result nvarchar(2000);
	SET @result = '';
	declare @ourStartAt int
	set @ourStartAt = @startAt;
	while(@ourStartAt <= @lenght)
	Begin
		SET @result = @result + ','  + CONVERT(nvarchar(100), @ourStartAt);
		SET @ourStartAt = @ourStartAt + 1;
	end
	return @result;
 END

 ALTER FUNCTION FK_Range(@lenght int, @startAt int)
 RETURNS NVarchar(2000)
 AS
 BEGIN
	declare @result nvarchar(2000);
	SET @result = '';
	declare @ourStartAt int
	set @ourStartAt = @startAt;
	while(@ourStartAt <= @lenght)
	Begin
		if(@ourStartAt = @startAt)
		begin
		SET @result = @result   + CONVERT(nvarchar(100), @ourStartAt);
		end
		else
		begin
		SET @result = @result + ','  + CONVERT(nvarchar(100), @ourStartAt);
		end
		SET @ourStartAt = @ourStartAt + 1;
	end
	return @result;
 END

 SELECT dbo.FK_Range(10, 0)