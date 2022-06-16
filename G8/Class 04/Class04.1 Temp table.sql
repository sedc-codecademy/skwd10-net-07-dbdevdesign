--Declare Variables
DECLARE @FirstName nvarchar(50)
SET	@FirstName = 'Ana'

DECLARE @LastName nvarchar(50)
SET	 @LastName = 'Stoilov'

SELECT @FirstName, @LastName

SELECT *
FROM dbo.Employee
WHERE FirstName = @FirstName and LastName = @LastName

--Temp table
CREATE TABLE #FemaleEmployee
(
  ID int,
  FirstName nvarchar(50),
  LastName nvarchar(50),
  Age int
)

INSERT INTO #FemaleEmployee(Id, FirstName, LastName, Age)
VALUES (1, 'Ana','Stojanova',25)

INSERT INTO #FemaleEmployee(Id, FirstName, LastName, Age)
VALUES (2, 'Elena','Trajkovska',32)

SELECT * FROM #FemaleEmployee

--Global TEMP TABLE
CREATE TABLE ##FemaleEmployee
(
  ID int,
  FirstName nvarchar(50),
  LastName nvarchar(50),
  Age int
)

INSERT INTO ##FemaleEmployee(Id, FirstName, LastName, Age)
VALUES (1, 'Sanja','Stojanova',25)

INSERT INTO ##FemaleEmployee(Id, FirstName, LastName, Age)
VALUES (2, 'Blagica','Trajkovska',32)

select * from ##FemaleEmployee

drop table ##FemaleEmployee

--Table Variable 
DECLARE @FemaleEmployee TABLE
(
  ID int,
  FirstName nvarchar(50),
  LastName nvarchar(50),
  Age int
)

INSERT INTO @FemaleEmployee (ID,FirstName,LastName,Age)
values (1,'Daniela','Spasovska',36)


INSERT INTO @FemaleEmployee (ID,FirstName,LastName,Age)
values (2,'Elena','Trajanovska',36)

select * from @FemaleEmployee

select * from #FemaleEmployee