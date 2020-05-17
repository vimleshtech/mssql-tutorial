/*
Recap :
		create database
		create tables
		data insert
		update
		delete 
		show
Today's topics
	   where / search data
	   condtional operator : > >= < <=  in , not in , between ,not between , is null , is not nuyll
	   order by/sorting of data 
	   group by / summarize the data by category
	   aggregiate function : max, min, sum, count, avg 	
*/
use hrms   --switch database

select * from C_Employee
--where 
select * from C_Employee where EmpID = 2

select * from C_Employee where empname ='amit'

select * from C_Employee where EmpID > 2
select * from C_Employee where EmpID >= 2

select * from C_Employee where EmpID < 20

select * from C_Employee where EmpID in (2,3,5)  -- in given list
select * from C_Employee where EmpID not in (2,3,5) --not in given list

select * from C_Employee where salary >=25000 and salary<=60000
--between 
select * from C_Employee where  Salary between 25000 and 30000
select * from C_Employee where  Salary not between 25000 and 30000

-- is null
select * from C_Employee where  empname is null
select * from C_Employee where  empname is not null

 -- order by/sorting of data 
 select * from C_Employee  order by empname asc 
 select * from C_Employee  order by empname desc
 select * from C_Employee  order by salary  -- default is asc
 select * from C_Employee  order by empname desc
 
 --aggregiate function : max, min, sum, count, avg 	
 --get row count
 select count(*) from C_Employee

 select sum(salary) from C_Employee
 select max(salary) from C_Employee
 select min(salary) from C_Employee

 select avg(salary) from C_Employee

 select sum(salary),avg(salary),max(salary),min(salary) from C_Employee



--group by 
select empname, count(empname) from c_employee group by empname 
/*
6. select 
1. from 
2. where
3. group by
4. having 
5. order by 

*/

select * from C_Employee
select address, count(address) from c_employee group by address 

/*
   Q. create new database for school
   Q. create table to store/save student details
   q. insert 6-10 rows in table
   q. show all data from table
   q. filter/search by name 
   q. filter/search by gender
   q. filter/search by date of birth
   q. sort by gender
   q. sort by age/dob
   q. get totoal student count
*/


create database sql_pr

use sql_pr

create table db1
(
id int,
name varchar(30),
gender char(1),
dob datetime,
roll_no int,
sch_code int,
en_mrk int,
ma_mrk int,
sci_mrk int
)

insert into db1                
values(1,'Atul','m','2019-01-01',001,10001,56,88,97)

insert into db1 (id,name,gender,dob,roll_no,sch_code,en_mrk,ma_mrk,sci_mrk)
values(2,'Riya','f','2018-01-01',002,10001,56,67,78)
 
insert into db1 (id,name,gender,dob,roll_no,sch_code,en_mrk,ma_mrk,sci_mrk)
values(3,'Monika','f','2019-12-09',003,10001,43,56,76)

insert into db1 (id,name,gender,dob,roll_no,sch_code,en_mrk,ma_mrk,sci_mrk)
values(4,'Asha','f','2018-01-01',004,10001,67,87,98)

insert into db1 (id,name,gender,dob,roll_no,sch_code,en_mrk,ma_mrk,sci_mrk)
values(5,'Komal','f','2019-01-09',005,10001,45,76,87)

insert into db1 (id,name,gender,dob,roll_no,sch_code,en_mrk,ma_mrk,sci_mrk)
values(6,'advika','f','2014-01-01',006,10001,33,39,56)

select * from db1

select * from db1 where name='riya'

select * from db1 where gender='m'


select * from db1 where dob='2019-01-01 00:00:00.000'
select * from db1 order by gender asc 
select * from db1 order by dob asc 
select count(*) from db1 

