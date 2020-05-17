

use hrms

--CTE : Common Type Expression 
-------------------------- CTE -------------------------------------------

use hrms 

DROP TABLE CTEMaster

CREATE TABLE [CTEMaster](  
[Id] [int] ,  
[City] [varchar](50) NULL,  
[State] [varchar](50) NULL  
)



insert into [CTEMaster]  
Select 1,'Aurangabad','BIHAR' union all  
Select 2,'Aurangabad','MAHARASHTRA' union all  
Select 3,'Bijapur','KARNATAKA' union all  
Select 4,'Bijapur','CHHATTISGARH' union all  
Select 5,'Bilaspur','CHHATTISGARH' union all  
Select 6,'Bilaspur','HIMACHAL PRADESH' union all  
Select 7,'Jamui','BIHAR' union all  
Select 8,'Kullu','HIMACHAL PRADESH' union all  
Select 9,'Pune','MAHARASHTRA' union all  
Select 10,'Mumbai','MAHARASHTRA' union all  
Select 11,'Kolhapur','MAHARASHTRA' union all  
Select 12,'Nashik','MAHARASHTRA' union all  
Select 13,'Mysore','KARNATAKA' union all  
Select 14,'Raigarh','CHHATTISGARH'   UNION ALL 
Select 15,'Aurangabad','BIHAR' union all  
Select 16,'Bilaspur','CHHATTISGARH' union all  
Select 17,'Bijapur','KARNATAKA'  

select * from CTEMaster 

select city,count(*) 
from CTEMaster 
group by city 

--Row_Number()



select * from CTEMaster

select *,row_number() over (partition by [state] order by state)  from CTEMaster

--remove duplicate row from table 

With  temp as 
(  
Select Id,city,state,row_number() over (partition by City,[state] order by City) as CityNumber from [CTEMaster]  
)  


--Select * from temp order by city,[state] 
--Select * from temp where citynumber > 1
delete  from temp where citynumber > 1

--DELETE DUPLICATE ROWS
With CTE as   
(  
Select Id,city,[state],row_number() over (partition by City,[state] order by City) as CityNumber from [CTEMaster]  
)  
delete from CTE where CityNumber >1 




----------------pivot table ---unpivot table---------------

select * from PEmployee  

CREATE TABLE PEmployee  
(  
   Name [nvarchar](max),  
   [Year] [int] ,  
   Sales [int]  
)


INSERT INTO PEmployee  
SELECT 'Pankaj',2010,72500 UNION ALL  
SELECT 'Rahul',2010,60500 UNION ALL  
SELECT 'Sandeep',2010,52000 UNION ALL  
SELECT 'Pankaj',2011,45000 UNION ALL  
SELECT 'Sandeep',2011,82500 UNION ALL  
SELECT 'Rahul',2011,35600 UNION ALL  
SELECT 'Pankaj',2012,32500 UNION ALL  
SELECT 'Pankaj',2010,20500 UNION ALL  
SELECT 'Rahul',2011,200500 UNION ALL  
SELECT 'Sandeep',2010,32000 


--When we execute above query, SQL Server throws an error because we can’t provide integer value as a column name directly. 
SELECT [Year], Pankaj,Rahul,Sandeep 
FROM   
	
	(SELECT Name, [Year] , Sales FROM PEmployee ) Tab1  
PIVOT  
	(  
		SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)
	) AS Tab2  

ORDER BY [Tab2].[Year]  

--
select * from (SELECT Name, [Year] , Sales FROM PEmployee )Tab1  


/*
--ERROR:
SELECT Name, 2010,2011,2012 FROM   
(SELECT Name, [Year] , Sales FROM Employee )Tab1  
PIVOT  
(  
SUM(Sales) FOR [Year] IN (2010,2011,2012)) AS Tab2  
ORDER BY Tab2.Name
*/

--
SELECT Name, [2010],[2011],[2012] FROM   
(SELECT Name, [Year] , Sales FROM PEmployee )Tab1  
PIVOT  
(  
SUM(Sales) FOR [Year] IN ([2010],[2011],[2012])) AS Tab2  
ORDER BY Tab2.Name 

--UNPIVOT 

CREATE TABLE #Tab 
(  
   [Year] int,  
   Pankaj int,  
   Rahul int,  
   Sandeep int  
) 

INSERT INTO #Tab 
SELECT [Year], Pankaj,Rahul,Sandeep FROM   
(SELECT Name, [Year] , Sales FROM PEmployee )Tab1  
PIVOT  
(  
SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)) AS Tab2  
ORDER BY [Tab2].[Year]  


SELECT Name,[Year] , Sales FROM #Tab t  
UNPIVOT  
(  
Sales FOR Name IN (Pankaj,Rahul,Sandeep)  
) AS TAb2  

