-- having : is condition which can apply with group by to filter the summarize data 

-- index  : is page which store data in sorted order 
-- suquery 
-- function : date, string , numeric 

--having :
use hrms 

select * from Employee

select gender , count(gender ) 
from Employee group by gender 

select gender , count(gender ) 
from Employee group by gender 
having count(gender ) > 2

-- index  : is page which store data in sorted order 
-- there are following types of index : i. cluster ii. non-cluster 
-- i. cluster : physically sorted data, primary key is default cluster index
--  primary key can be only one in table 
-- index imporve the data reading/query perfomance 

create table index_exmp(
sno int primary key,
name varchar(100),
email varchar(100)
)

insert into index_exmp
values(100,'nitin','nitin@gmail.com')

insert into index_exmp
values(10,'nitin','nitin@gmail.com')

insert into index_exmp
values(20,'nitin','nitin@gmail.com')



select * from index_exmp

select * from index_exmp
where sno =100


-- ii. non-cluster index is virtually sorted , data will store in table as it as however there will be new page where data location will be stored

create index iname  
on  index_exmp(name)

-- show table and index details
sp_help index_exmp


-- suquery : query inside query 

select * from employee 

-- show 2nd highest id 
select top 2 * from employee  order by eid desc 

-- 2+3*4
-- (2+3)*4

select top 1 * from 
		(select top 2 * from employee  order by eid desc ) a
order by eid asc 

-- show 3rd lowest eid 
select top 1 * from 
		(select top 3 * from employee  order by eid asc ) a
order by eid desc


-- function : date, string , numeric 
-- date 
select getdate()  -- yyyy-mm-dd
select datepart(yyyy, getdate() )
select datepart(mm, getdate() )
select datepart(day, getdate() )
select datepart(DAYOFYEAR, getdate() )
select datepart(weekday, getdate() )  -- sunday 1
select datepart(QUARTER, getdate() )

select DATEDIFF(yyyy,'1990-11-01',getdate())
select DATEDIFF(day,'1990-11-01',getdate())
select DATEDIFF(HOUR,'1990-11-01',getdate())

select DATEADD(year,10,getdate())

--string 
select *, upper(fname),lower(fname) , len(fname),replace(fname,'a','b') 
,ltrim(fname), rtrim(fname)
 from employee

