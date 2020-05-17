create database Ankit1
use Ankit1
create table employee (eno int, 
ename varchar (30), 
ecity varchar (30), 
salary int, 
deptno int)
select * from employee
insert into employee values (1, 'Sharad', 'Tilaknagar', 10000, 555
insert into employee values (2, 'Amit', 'Harinagar', 50000, 666)
insert into employee values (1, 'Anoop', 'Motinagar', 4000, 111)
insert into employee values (1, 'Abhishek', 'Subhashnagar', 3600, 444)
insert into employee values (1, 'Aashish', 'Patelnagar', 3800, 888)
delete from employee where eno=2
update employee set eno=2 where ename='Amit'
update employee set eno=3 where ename='Anoop'
update employee set eno=4 where ename='Abhishek'
update employee set eno=5 where ename='Aashish'	
update employee set ename='John', ecity='Delhi' where eno=1 

Alter table employee add dept_id int, dept_name varchar (50)
Alter table employee drop column dept_id
update employee set dept_name='A' where eno=1
update employee set dept_name='B' where eno=2
update employee set dept_name='C' where eno=3
update employee set dept_name='D' where eno=4
update employee set dept_name='E' where eno=5
update employee set dept_name='Accounts' where eno=1
update employee set salary=salary+1000 where dept_name='Accounts'

select * from employee

create table Employee_1 (Id int, Name varchar (20), Designation varchar (40), Branch varchar (10)) 
select * from Employee_1
Insert into Employee_1 values (1, 'Ram', 'Manager', 'Chennai')
Insert into Employee_1 values (1, 'Santosh', 'Supervisor', 'Banglore')
Insert into Employee_1 values (1, 'Hari', 'Assistant', 'Pune')
Alter table Employee_1 add salary int
Alter table Employee_1 Alter column Name varchar (50)
Delete from Employee_1 where Name='Santosh'
