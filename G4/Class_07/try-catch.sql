



CREATE OR ALTER PROCEDURE usp_ExampleProc
as
	SELECT 1/0
GO
BEGIN TRY
	EXEC usp_ExampleProc
END TRY
BEGIN CATCH
	SELECT
		ERROR_NUMBER() as ErrorNumber,
		ERROR_MESSAGE() as ErrorMessage,
		ERROR_LINE() as ErrorLine,
		ERROR_SEVERITY() ErrorSeverity,
		ERROR_PROCEDURE() ErrorProcedure
END CATCH

GO
CREATE OR ALTER PROCEDURE MakeOrder
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		INSERT INTO [Order]
		VALUES ('01-01-1998', 1, 1, 1, 1, 20, 'comment');

		Declare @orderId int;
		SET @orderId = SCOPE_IDENTITY();
		THROW  500001, 'E NE MOZE', 1;
		INSERT INTO [OrderDetails]
		VALUES (@orderId, 1, 20, 30);

		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() as ErrorMessage,
		ERROR_NUMBER()
	END CATCH
END

-- without transaction
GO
CREATE OR ALTER PROCEDURE MakeOrder
AS
BEGIN
	BEGIN TRY

		INSERT INTO [Order]
		VALUES ('01-01-1998', 1, 1, 1, 1, 20, 'comment');

		Declare @orderId int;
		SET @orderId = SCOPE_IDENTITY();
		THROW  500001, 'E NE MOZE', 1;
		INSERT INTO [OrderDetails]
		VALUES (@orderId, 1, 20, 30);

	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() as ErrorMessage,
		ERROR_NUMBER()
	END CATCH
END

EXEC MakeOrder