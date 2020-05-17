
USE MASTER 
--create new db
create database DB_HRMS1

--call to db 
use db_hrms

--create table 
create table emp
(
eid			int,
ename		varchar(30),
gender		varchar(10),
salary		int
)


select * from emp 


--insert 
insert into emp(eid,ename,gender,salary)
values(2,'jatin','m',99992222)

;
--bulck insert
insert into emp(eid,ename,gender,salary)
values(3,'chaht','f',22222),
	  (4,'ayush','m',4444222),
      (5,'kshitiz','m',99992222)

-- update 

update emp 
set ename = 'CHAHAT'
, SALARY = 222222
WHERE EID  = 3



-- DELETE 
DELETE FROM EMP   -- REMOVE ALL RECORDS 
WHERE EID  = 1   -- REMOVE SELECTED RECORD WHERE ID  = 1


--
SELECT * FROM EMP

--ALTER
ALTER TABLE EMP 
ADD COUNTRY VARCHAR(100)


ALTER TABLE EMP 
ALTER COLUMN  COUNTRY VARCHAR(200)



ALTER TABLE EMP 
DROP COLUMN COUNTRY


--DROP TABLE 
DROP TABLE EMP  -- DATA WITH STRUCTUE 

--TRUNCATE TABLE 
TRUNCATE TABLE EMP -- ONLY DATA : ALL RECORDS WILL BE REMOVED 


