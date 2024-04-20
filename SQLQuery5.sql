SELECT TOP (1000) [DepartmentKey]
      ,[DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[IsActive]
  FROM [AdventureWorks2022].[dbo].[Department]

  update dbo.Department
  SET GroupName = 'r & d'
  where GroupName = 'Research and Development' 

  create index 


  CREATE INDEX idx_MyColumn
ON dbo.Department (Name);


select GETDATE diff


  select * from dbo.Department

  select GroupName count(*) from dbo.Department

  SELECT GroupName, COUNT(*) 
FROM dbo.Department 
GROUP BY GroupName;

UPDATE dbo.Department
SET GroupName = NULL
WHERE GroupName = 'r & d' AND
      (SELECT COUNT(*) FROM dbo.Department WHERE GroupName = 'r & d') < 1;

