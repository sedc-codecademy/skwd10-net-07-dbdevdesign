--String funkcii
SELECT FirstName,
       LastName,
	   REPLACE(firstname,'na','XX') as replace_example,
	   SUBSTRING(firstname,1,2) as substring_example,
	   LEFT(FirstName,3) as left_example,
	   RIGHT(FirstName,3) as right_example,
	   LEN(firstname) as len_firstname,
	   len(lastname) as len_lastname,
	   Concat(FirstName,'-',LastName) as concat_example
FROM dbo.Employee
--WHERE LEN(FirstName)=3


--Date Functions
declare @Today datetime
set @Today = getdate()

select @Today as Today, DATEADD(day,-7,@today) as dateaddlastweek, DATEADD(month,1, @today) as dateaddmonth

select @Today as Today, DATEDIFF(day,'2022.05.02',@Today) as datediff_example

select @Today as Today, DATEDIFF(day,dateadd(month,-1,@Today),@Today) as datediff_example
