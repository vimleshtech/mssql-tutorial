

use hrms

go 
CREATE TABLE [dbo].[MyDepartment]
(
   [DepartmentID] [smallint] NOT NULL,
   [DepartmentName] [nvarchar](30) NOT NULL,
   [ParentID] [nvarchar](40) NULL,
   CONSTRAINT [PK_DepartmentID] PRIMARY KEY CLUSTERED ( [DepartmentID] ASC )
   WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO

INSERT INTO [dbo].[MyDepartment] ([DepartmentID],[DepartmentName],[ParentID])
VALUES
   ('1','CEO',null),
   ('2','President','1'),
   ('3','Chairman','1'),
   ('4','Vice President','2'),
   ('5','Associate Vice President','4'),
   ('6','Senior Manager','4'),
   ('7','Delivery Manager','4'),
   ('8','Program Manager','4'),
   ('9','Project Manager','5'),
   ('10','Planning Manager','5'),
   ('11','Execution Manager','5'),
   ('12','Project Leader','6'),
   ('13','Project Planner','6'),
   ('14','Senior Project Lead','12'),
   ('15','Team Lead','12'),
   ('16','Sprint Lead','12'),
   ('17','Statistics Department','6'),
   ('18','Logistics Department','6'),
   ('19','Sales Account','7'),
   ('20','Customer Service','7'),
   ('21','Product Support B','8'),
   ('22','Sales Department','21'),
   ('23','Purchase Department','21'),
   ('24','Group Manager','8'),
   ('25','Overseas Department','24'),
   ('26','Domestic Department','24');
go	


select *FROM MyDepartment

--get the group level 
WITH OrgTree (DepartmentID, DepartmentName, ParentID, Tree)
AS
(
   SELECT DepartmentID, DepartmentName, ParentID , 0 AS Tree 
   FROM MyDepartment
   WHERE ParentID IS NULL
   UNION ALL
   SELECT MyDepartment.DepartmentID, MyDepartment.DepartmentName, MyDepartment.ParentID , OrgTree.Tree + 1
   FROM MyDepartment
   JOIN OrgTree ON MyDepartment.ParentID = OrgTree.DepartmentID
)
 
SELECT * FROM OrgTree ORDER BY Tree


/*
	With CTE as.
	(
	Select Id,city,[state],row_number() over (partition by City,[state] order by City) as CityNumber from [CityMaster]
	)
	delete from CTE where CityNumber >1.
*/



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


select * ,row_number() OVER( PARTITION BY STATE ORDER BY STATE) from CTEMaster

With CTE as   
(  
Select Id,city,[state],row_number() over (partition by City,[state] order by City) as CityNumber from [CTEMaster]  
)  


Select * from CTE order by city,[state] 

--DELETE DUPLICATE ROWS
With CTE as   
(  
Select Id,city,[state],row_number() over (partition by City,[state] order by City) as CityNumber from [CTEMaster]  
)  
delete from CTE where CityNumber >1 




----------------pivot table ---unpivot table---------------

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
SELECT [Year], Pankaj,Rahul,Sandeep FROM   
(SELECT Name, [Year] , Sales FROM PEmployee )Tab1  
PIVOT  
(  
SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)) AS Tab2  
ORDER BY [Tab2].[Year]  



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

