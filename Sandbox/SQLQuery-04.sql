/*
Recap:
	-Overview of sql server and version 
	-Database 
	-create, alter, drop, truncate 
	-insert, update, delete, select
	-where , condition and operator
	-order by : sorting
	-group by : count, avg, sum, max, min
	*-having 		
	-data type 
	*-constraints 
	-join and its type
Next:
	case when 
	keywords: 
			indentity, 
			top, 
			distinct, 
			select into
	union and it's type

Next:
	index
	view
	procedure
Next:
	function 
	trigger
Next:
	cte
	cursor
DBA:
	SQL Installation
	Security
	Backup and restory
	schema
	jobs
	replication
	...
	..
			

*/

/*	keywords: 
			indentity: auto incremental column
			top      : return top given no of rows 
			distinct : return unique values 
			select into : create new table from existing table
						: insert data into new table from existing table
*/
drop table sales_order

create table sales_order
(
oid int identity(1,1),  --start from 1 and increment by 1
custname varchar(100),
product varchar(100),
qty int,
price int,
odate datetime 
)


insert into sales_order 
values('chahat','dell',22411,1,getdate())

select * from sales_order 

--from top 
select top 1 * from sales_order 
select top 2 * from sales_order 
--from buttom
select top 2 * from sales_order  order by oid desc 

--distinct
select  * from sales_order 
select distinct  * from sales_order 
select distinct  custname,product from sales_order 
select  distinct price from sales_order 

--select into : insert data into new table
select * from sales_order
select * into new_sales from sales_order
select * from new_sales 

--insert selected rows
select * into new_sales2 from sales_order
where  oid >5 
select * from new_sales2 

--insert selectedc columns 
select custname,product into new_sales3 from sales_order
select * from new_sales3

-- 	case when : is conditional statement 
select * from sales_order

select oid,custname,product, qty,
	case when qty <100
	then 
		'low sales'
	else 
	    'excellent sales'
	end
 from sales_order


 --
 select oid,custname,product, qty,
	case when qty <100
	then 
		'low sales'
	else  case when qty<30000 
          then 
			'avg sales'
		else 
			'excellent sales'
		end
	end
 from sales_order


/*
	union : to merge two or more than two tables vertically
	      - table structure should be same
		  There are following types of join 
		  i. union    : return distinct rows
		  ii. union all : return all rows(duplicate as well)
*/
-- union 
--delete from sales_order  where oid<5
--delete from new_sales where oid>6

select * from sales_order 
select * from new_sales


select * from sales_order 
union
select * from new_sales

-- union all 
select * from sales_order 
union all
select * from new_sales






insert into sales_order 
values('chahat','dell',22411,1,getdate())

select * from sales_order 


create table cust_1
(
c_id int identity(1,1),  
first_name varchar(100),
last_name varchar(100),
email varchar(100),
addres varchar(150),
city varchar(50), 
)
select * from cust_1

insert into cust_1 
values('thomas','madison','jmopnroe@yahoo.com','jmonroe mt vernon hwk','orange')

select * from  cust_1

create table ord_1
(
order_id int,
cust_id int,
amount int,
order_date datetime
)

insert into ord_1
values(2,102,5089,14/04/1976)

insert into ord_1
values(3,103,57000,22/04/1984)

select * from  cust_1
select * from ord_1 where 