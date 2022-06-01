SELECT * FROM dbo.BusinessEntity

INSERT INTO dbo.[Order](OrderDate, 
                        Status, 
						BusinessEntityId, 
                        CustomerId,
						EmployeeId,
						TotalPrice,
						Comment)
SELECT '2019.05.01', 0,100,1,1,100,'TEST'

SELECT * FROM dbo.[Order]
WHERE BusinessEntityId = 100

ALTER TABLE dbo.[Order] with CHECK
ADD CONSTRAINT [FK_Order_BusinessEntity]
FOREIGN KEY ([BusinessEntityId])
REFERENCES dbo.BusinessEntity(Id)

UPDATE dbo.[Order]
SET	BusinessEntityId = 1
WHERE Id in (4200,
4201)