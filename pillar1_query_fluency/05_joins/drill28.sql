/* List employees and the number of customers they support.

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

0|CustomerId|INTEGER|1||1
1|FirstName|NVARCHAR(40)|1||0
2|LastName|NVARCHAR(20)|1||0
3|Company|NVARCHAR(80)|0||0
4|Address|NVARCHAR(70)|0||0
5|City|NVARCHAR(40)|0||0
6|State|NVARCHAR(40)|0||0
7|Country|NVARCHAR(40)|0||0
8|PostalCode|NVARCHAR(10)|0||0
9|Phone|NVARCHAR(24)|0||0
10|Fax|NVARCHAR(24)|0||0
11|Email|NVARCHAR(60)|1||0
12|SupportRepId|INTEGER|0||0
*/

SELECT
  e.EmployeeId AS employee_id,
  e.FirstName || ' ' || e.LastName AS employee_name,
  COUNT(c.CustomerId) AS supported_customers
FROM Employee AS e
LEFT JOIN Customer AS c
  ON e.EmployeeId = c.SupportRepId
GROUP BY 
    e.EmployeeId, 
    e.FirstName, 
    e.LastName
ORDER BY e.EmployeeId;