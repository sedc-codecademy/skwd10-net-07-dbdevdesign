SELECT b.Name,o.OrderDate,o.TotalPrice
FROM dbo.BusinessEntity as b
INNER JOIN dbo.[Order] as o ON b.id = o.BusinessEntityId
 
SELECT b.*
FROM dbo.BusinessEntity as b
LEFT JOIN dbo.[Order] as o ON b.id = o.BusinessEntityId
WHERE o.Id is null

