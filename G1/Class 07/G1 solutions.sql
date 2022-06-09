--1. Find number of members that don’t have information for their location + number of members that don’t have phone info.
select count(*) as NUMBER, 'NO LOCATION' as DATA from
MEMBER
where Location is null
union
select count(*) NUMBER, 'NO PHONE' as DATA from
MEMBER
where PHONE is null

--2. Make a list what has every order’s date and member name and surname.Data should be ordered by date.
SELECT U_NAME, U_SURNAME, Date_order
FROM MEMBER MEM
INNER JOIN MORDER O ON O.M_ID_MEMBER=MEM.Id_MEMBER
ORDER BY Date_order DESC


--3. Find all different dates of orders for movies from the second shelf.
SELECT distinct Date_order
FROM MOVIE M
INNER JOIN MORDER O ON O.m_ID_movie=M.ID_MOVIE
where shelf=2

--4. Find all data for every order: movie title, its subtitle language, date of order, name and surname of the member who made the order.
SELECT U_NAME, U_SURNAME, TITLE, LANG, Date_order
FROM MOVIE M
INNER JOIN MORDER O ON O.m_ID_movie=M.ID_MOVIE
inner join MEMBER mem on mem.Id_MEMBER=o.M_ID_MEMBER
inner join lang l on m.L_ID_LANG=l.ID_LANG


--5. Find all data for every order: movie title, its subtitle language, date of order, name and surname of the member who made the order only for movies from first shelf. 
--Order the result according the language.
SELECT LANG,TITLE,U_NAME, U_SURNAME,Date_order
FROM MOVIE M
INNER JOIN MORDER O ON O.m_ID_movie=M.ID_MOVIE
inner join MEMBER mem on mem.Id_MEMBER=o.M_ID_MEMBER
inner join lang l on m.L_ID_LANG=l.ID_LANG
where shelf=1
order by lang

--6. Find number of movies per shelf and per language. The result should show data for shelf, language and number of movies with that language subtitle on the current shelf. 
--Order the result data according the shelf.
SELECT shelf, LANG, count(m.ID_MOVIE) as no_MOVIES
FROM MOVIE M
inner join lang l on m.L_ID_LANG=l.ID_LANG
group by  shelf, LANG
order by SHELF

--7. Find number of members that still didn’t make any order

SELECT COUNT(mem.Id_MEMBER) FROM dbo.MEMBER mem
WHERE not exists ( select 1 from dbo.MORDER mor where mem.Id_MEMBER = mor.M_ID_MEMBER)

-- or


select count(*) as members_withouth_orders from Member mem1
inner join (
select Id_MEMBER 
from member mem
left join MORDER o on o.M_ID_MEMBER=mem.Id_MEMBER
group by  Id_MEMBER
having count(o.ID_order)=0) mem2 on mem1.Id_MEMBER=mem2.Id_MEMBER


--8. Make a list of number of orders per language. The result should include ALL languages. 
--For languages without orders, there should be 0. Order the result starting from the biggest and ending with smallest value. (join Lang –Movie –Morder)

select LANG, count(id_order) as no_ORDER
from lang l
left join MOVIE m on l.ID_LANG=m.L_ID_LANG
left join MORDER o on o.m_ID_movie=m.ID_MOVIE
group by lang 
order by count(id_order) desc

--9. Find all orders made from member no.1 or orders for movie no.45
select o.*
from MORDER o
inner join MOVIE m on o.m_ID_movie=m.ID_MOVIE
inner join MEMBER mem on o.M_ID_MEMBER=mem.Id_MEMBER
where mem.Id_MEMBER=1 or m.ID_MOVIE=45

--10. Find all members that didn’t order any movie with Macedonian subtitle.
select distinct U_NAME, U_SURNAME
from member mem
left join MORDER o on o.M_ID_MEMBER=mem.Id_MEMBER
left join MOVIE m on m.ID_MOVIE=o.m_ID_movie
left join lang l on m.L_ID_LANG=l.ID_LANG
where LANG != 'MACEDONIAN'
