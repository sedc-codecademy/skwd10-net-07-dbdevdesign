DECLARE @Today datetime
SET @Today = GETDATE()
--SELECT @Today

SELECT @Today,
       CONVERT(nvarchar(20),@today, 102) as convert_example,
       CAST('20' as int) as cast_example,
	   N'Дана' as string_example