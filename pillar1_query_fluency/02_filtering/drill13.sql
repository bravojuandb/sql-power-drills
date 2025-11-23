/* Employee hire dates between 2002 and 2003. 

0|EmployeeId|INTEGER|1||1
1|LastName|NVARCHAR(20)|1||0
2|FirstName|NVARCHAR(20)|1||0
3|Title|NVARCHAR(30)|0||0
4|ReportsTo|INTEGER|0||0
5|BirthDate|DATETIME|0||0
6|HireDate|DATETIME|0||0
7|Address|NVARCHAR(70)|0||0
8|City|NVARCHAR(40)|0||0
9|State|NVARCHAR(40)|0||0
10|Country|NVARCHAR(40)|0||0
11|PostalCode|NVARCHAR(10)|0||0
12|Phone|NVARCHAR(24)|0||0
13|Fax|NVARCHAR(24)|0||0
14|Email|NVARCHAR(60)|0||0

*/

SELECT HireDate 
FROM Employee
WHERE HireDate >= '2002-01-01' 
  AND HireDate < '2004-01-01';
