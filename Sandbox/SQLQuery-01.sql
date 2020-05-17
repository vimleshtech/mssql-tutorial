
 
--  Create  new database 
create database SQL_DBA

-- switch database 
use SQL_DBA

--Create new table in database
create table users
(
id int,					--int : datatype for numeric		
name varchar(300),		--varchar: alpha numeric 
email varchar(30),
dob   datetime,
gender char(1),
country varchar(12)
)


--insert data 
insert into users 
values(1,'Nitin Sharma','nitin@gmail.com','1990-11-01','M','India')

--insert in selected columns
insert into users(id,name,email,dob,gender)
values(2,'Jatin Sharma','jatin@gmail.com','1991-01-01','M')


--select all columns and all rows
select * from users   -- * : show all columns

--update data in existing column
update users  set country ='us' 
where id =2 


-- delete selected rows
delete from users where id =1


--alter table and add new column
alter table users 
add pin int


--alter table and drop column 
alter table users 
drop column email 

--alter tble and change datatype or column size
alter table users 
alter column name varchar(200)
--

select * from users 




