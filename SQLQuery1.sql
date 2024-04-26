select * from [deptdb].[dbo].[dept]

select  count(*) from[HumanResources].[Department] where GroupName='Sales and Marketing'


SELECT GroupName, COUNT(*) AS GroupCount
FROM [HumanResources].[Department]
GROUP BY GroupName;
