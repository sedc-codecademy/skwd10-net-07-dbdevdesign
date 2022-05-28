USE [SEDC];

SELECT * FROM [Order];
SELECT * FROM [BusinessEntity];

SELECT * FROM [Order]
CROSS JOIN [BusinessEntity];

SELECT * FROM [Customer]

SELECT * FROM [Order]
JOIN [BusinessEntity] ON [Order].BusinessEntityId = [BusinessEntity].Id
JOIN [Employee] ON [Order].EmployeeId = [Employee].[Id] 
WHERE [BusinessEntity].Id = 1

SELECT * FROM [Order] 
LEFT JOIN [BusinessEntity] ON [Order].BusinessEntityId = [BusinessEntity].Id


CREATE TABLE TableA (idA int);
CREATE TABLE TableB (idB int);

Insert into TableA values (1),(2)--,(3)
Insert into TableB values (2),(3)--,(4)

SELECT * 
from TableA
FULL JOIN TableB ON idA=idB