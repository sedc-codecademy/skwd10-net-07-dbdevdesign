-- Singal statment table valued function
CREATE FUNCTION fn_GetCustomers()
RETURNS TABLE
as
RETURN SELECT * FROM Customer


SELECT * FROM dbo.fn_GetCustomers()
GO;

-- multi statment table valued function
CREATE Function fn_GetOrder()
RETURNs @orders TABLE (name varchar(255))
AS
BEGIN
	INSERT INTO @orders
	SELECT Comment from [Order];

	INSERT INTO @orders
	SELECT FirstName FROM [dbo].[Employee]
	RETURN;
END

SELECT * FROM dbo.fn_GetOrder();

GO
-- Test stored procedure
CREATE OR ALTER Procedure TestPrint (@firstParametar int = 0, @secondParametar int = 1)
as
BEGIN
	print @firstparametar;
	print 'Prviot parametar'

	print @secondParametar;
	print 'vtoriot parametar'
END
EXEC TestPrint 
EXEC TestPrint  1,  2
EXEC TestPrint @secondParametar= 2, @firstParametar = 1
-- the return type of a stored procedure is int and is the error code if there is no error then 0 is returned
declare @HasError int;

EXEC @HasError = TestPrint
SELECT @HasError;
GO;
-- create stored procedure that inserts into customer and gets all customers with the region from the input params
create or alter procedure dbo.NewCustomer 
(
	@Name nvarchar(100), @AccNumber nvarchar(50), @City nvarchar(100), @Region nvarchar(100), 
	 @isActive bit
)
AS
BEGIN
	INSERT INTO Customer (Name, AccountNumber, City, RegionName, isActive) VALUES
	(@Name, @AccNumber, @City, @Region, @isActive);

	SELECT * FROM Customer
	WHERE RegionName = @Region;

	SELECT * FROM Customer
	WHERE isActive = @isActive;
END


exec NewCustomer
	@Name = 'Viva',
	@AccNumber = '123',
	@City = 'Skopje',
	@Region = 'Skopski',
	@isActive = 1
GO;
-- out is used to return a scalar variable to the caller of the stored procedure
CREATE OR ALTER PROCEDURE EmployeeGendar (
@Gender nchar(1) = 'M', 
@GenderOutput int out
)
AS 
BEGIN
	SELECT * FROM Employee
	WHERE Gender = @Gender;

	SELECT @GenderOutput = count(*)
	FROM 
	Employee
	Where Gender = @Gender
END

declare @hasError int, @GenderCount int

EXEC @hasError = EmployeeGendar 'F',  @GenderCount OUT;

SELECT @hasError as HasError, @GenderCount as  GenderCount;

GO;
CREATE OR ALTER PROCEDURE InsertEmployee (
	@FirstName nvarchar(100),
	@LastName nvarchar (100),
	@DateOfBirth date,
	@Gender nchar(1),
	@HireDate date,
	@NatIdNumber nvarchar(20),
	@EmployeeId int OUT
)
as
BEGIN
	INSERT INTO Employee
	VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NatIdNumber);
	-- go zima poslednata vrednost na identity(id) vo scopot
	SET @EmployeeId = SCOPE_IDENTITY();
END

DECLARE @EmployeeIdOut int;

EXEC InsertEmployee
	@FirstName='Jovan',
	@LastName = 'Gjorgjiev',
	@DateOfBirth = '01-01-1998',
	@Gender = 'm',
	@HireDate = '01-01-2008',
	@NatIdNumber = '123456789',
	@EmployeeId = @EmployeeIdOut OUT

SELECT * FROM Employee
WHERE Id = @EmployeeIdOut
GO;
CREATE OR ALTER PROCEDURE findProductByName
(
	@productName nvarchar (255),
	@productCount int out,
	@productPriceTotal int out
)
AS
BEGIN
	select * from 
	Product where 
	Name = @productName;

	SELECT @productCount = COUNT(*) 
	from 
	Product where 
	Name = @productName;

	SELECT @productPriceTotal = SUM(Price) 
	from 
	Product where 
	Name = @productName;
END
DECLARE @productCountOut int, @productPriceTotalOut int;

EXEC findProductByName
	'Multigrain',
	@productCountOut out,
	@productPriceTotalOut out

SELECT @productCountOut as Count, @productPriceTotalOut priceTotal

GO

CREATE OR ALTER PROCEDURE CreateOrder
(
	@OrderDate date,
	@Status smallint,
	@BusinessEntityId int,
	@CustomerId int,
	@EmpoloyeeId int,
	@TotalPrice decimal,
	@Comment nvarchar(max)
)
as
BEGIN
	INSERT INTO [Order]
	VALUES (@OrderDate, @Status, @BusinessEntityId, @CustomerId, @EmpoloyeeId, @TotalPrice, @Comment);

	SELECT COUNT (*) as [Count of orders] FROM [Order]
	WHERE CustomerId = @CustomerId;

	SELECT SUM(TotalPrice) as TotalPrice FROM [Order]
	WHERE CustomerId = @CustomerId and BusinessEntityId = @BusinessEntityId
END

GO;

EXEC CreateOrder
	@OrderDate = '01-01-1998',
	@Status = 1,
	@BusinessEntityId = 1,
	@CustomerId = 1,
	@EmpoloyeeId = 1,
	@TotalPrice = 123,
	@Comment = 'asdasd'

GO;

CREATE OR ALTER PROCEDURE CreateOrderDetail
(
	@ProductId int,
	@OrderId int,
	@Quantity int
)
as
BEGIN
	declare @price int;
	SELECT @price = Price
	FROM Product
	WHERE Id = @ProductId;

	Insert into OrderDetails
	VAlues(@OrderId, @ProductId, @Quantity, @price);

	Update [Order]
	set TotalPrice = @price * @Quantity
	where Id = @OrderId;


	SELECT Product.Name, SUM(OrderDetails.Price * OrderDetails.Quantity) AS TotalPrice FROM OrderDetails 
	INNER JOIN Product on Product.Id = OrderDetails.ProductId
	GROUP BY Product.Id, Product.Name
END
GO;
EXEC CreateOrderDetail
	@ProductId = 1,
	@OrderId = 1,
	@Quantity = 5

PRINT CONVERT(Datetime2,'01-01-1998');