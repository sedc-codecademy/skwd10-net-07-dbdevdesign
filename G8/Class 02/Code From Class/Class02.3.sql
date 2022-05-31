use sedc
--drop table #a
--drop table #b
create table #a (name nvarchar(50))
insert into #a values ('Dana')
insert into #a values('Angel')
insert into #a values('Filip')


create table #b (name nvarchar(50))
insert into #b values ('Jovana')
insert into #b values('Maja')
insert into #b values('Filip')


select *
from #a

select *
from #b

select *
from #a
UNION ALL
select *
from #b




select *
from #a
intersect
select *
from #b

