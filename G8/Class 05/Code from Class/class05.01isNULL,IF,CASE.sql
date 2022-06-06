--drop table #tmp
SELECT *INTO   #tmp
FROM   (SELECT N'1'       AS [Id],
               N'Aamir'   AS [FName],
               N'Shahzad' AS [LName]
        UNION ALL
        SELECT N'2'      AS [Id],
               N'Robert' AS [FName],
               N'Ladson' AS [LName]
        UNION ALL
        SELECT N'3'      AS [Id],
               N'John'   AS [FName],
               N'Rivers' AS [LName]
        UNION ALL
        SELECT N'4'    AS [Id],
               N'Mike' AS [FName],
               NULL    AS [LName]
        UNION ALL
        SELECT N'4'    AS [Id],
               N'Tina' AS [FName],
               N'Tina' AS [LName]) t;
SELECT [Id],
       [FName],
       [LName]FROM   #tmp


SELECT [Id],
       [FName],
       ISNULL([LName], 'Empty') AS LName,
       NULLIF(FName, LName)       AS ColValueNotEqual
FROM   #tmp 


ALTER VIEW dbo.BEwithEmployee
AS

select *,
       CASE WHEN Size = 'Small' then '0-50' -- 1st condition
	        WHEN Size = 'Medium' then '51-100' -- 2st condition
			WHEN Size = 'Large' then '>100' -- 3th condition
			ELSE 'Empty' END as NoEmployees,
			getdate() as CreatedDate
from dbo.BusinessEntity

select *
from dbo.BEwithEmployee


DECLARE @GENDER NVARCHAR(1)
SET @GENDER = 'F'

if(@GENDER = 'M')
BEGIN
        SELECT * 
		FROM dbo.Employee
		WHERE gender = 'M' and FirstName = 'Aleksandar'
END

ELSE
BEGIN
        Select *
		from dbo.Employee
END