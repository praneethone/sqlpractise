SELECT TOP (1000) [ID]
      ,[FirstName]
      ,[LastName]
      ,[Gender]
      ,[Salary]
      ,[HireDate]
  FROM [AdventureWorks2022].[dbo].[Employees]

  drop procedure spEmployeecountbygender
  create procedure spEmployeecountbygender
  @Gender nvarchar(20),
  @Employeecount int Output
  as
  begin
	select @Employeecount=count(id)
	from Employees
	where Gender=@Gender
  end 


  declare @totalcount int
  execute spEmployeecountbygender 'male', @totalcount out
  print @totalcount

  sp_helptext spEmployeecountbygender

  sp_depends spEmployeecountbygender

  create schema xyz
  
  create database xyz
  
  Create Table sample(
  id int

  );

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'remp')
BEGIN
    EXEC('CREATE SCHEMA remp')
END

create Table [remp].[sample](
Id int,
name varchar(50)
)

 

 INSERT INTO Productsnew (ProductName,SupplierID,CategoryID,Unit,Price) Values ('Jeera Rice',1,7,'7,5 kg',120)