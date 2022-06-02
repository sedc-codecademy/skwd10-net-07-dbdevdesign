DROP TABLE IF EXISTS TableA;
DROP TABLE IF EXISTS TableB;

CREATE TABLE TableA (idA int);
CREATE TABLE TableB (idB int);

Insert into TableA values (1),(2)--,(3)
Insert into TableB values (2),(3)--,(4)

-- Cross join
select * 
from TableA
Cross join TableB
ORDER BY idA,idB

-- INNER JOIN
select a.idA 
from TableA as a
INNER JOIN TableB as b ON a.idA=b.idB

-- LEFT JOIN
select * 
from TableA as a
LEFT JOIN TableB as b ON a.idA=b.idB

-- RIGHT JOIN
select * 
from TableA as a
RIGHT JOIN TableB as b ON a.idA=b.idB

-- FULL JOIN
select * 
from TableA as a
FULL JOIN TableB as b ON a.idA=b.idB
