CREATE PROCEDURE dbo.TestSP (@First int = 0, @Second int = 1)
AS
BEGIN
        
		PRINT 'First'
		PRINT @first
		PRINT 'Second'
		PRINT @Second

END

--1--
exec dbo.TestSP 
--2--
exec dbo.TestSP 2,3

--3--
declare @f int
set @f = 5

declare @s int
set @s = 6

exec dbo.TestSP @f, @s

--4--
exec dbo.TestSP @first = 5
exec dbo.TestSP @second = 10
exec dbo.TestSP @first = 10, @second = 15
