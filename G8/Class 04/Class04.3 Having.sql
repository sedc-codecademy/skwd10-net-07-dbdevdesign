SELECT B.Name as BusinessEntityName, sum(TotalPrice) as Total
from dbo.BusinessEntity as b
inner join dbo.[Order] as o ON b.id=o.BusinessEntityId
group by b.Name
having sum(totalprice)>650000