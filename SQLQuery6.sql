SELECT TOP (1000) [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2022].[HumanResources].[Department]

  select * from dbo.ORDERS
  select * FROM dbo.Products


EXEC sp_RENAME 'dbo.Products.ProductID', 'CustomerID', 'COLUMN'


  SELECT CustomerID, ProductID FROM dbo.ORDERS INNER JOIN dbo.Products ON CustomerID = ProductID

  SELECT * FROM dbo.employee

  CREATE PROCEDURE Sp_Employee
  @eno int,
  @ename varchar(100),
  @dno int
  AS
  BEGIN
  INSERT INTO dbo.employee values(@eno,@ename,@dno)
  END

  EXecute Sp_Employee @eno ='4' ,@ename= 'sspms', @dno='12'