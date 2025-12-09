/* Employees and their direct reports 
(include employees with zero reports). 

Person a reports to person b when when 
person a is placed under b in the hierarchy,
ad b is a's manager.

This is a self join, because both employees and
reports are in the same table.

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

SELECT
    m.FirstName || ' ' || m.LastName AS manager_name,
    COALESCE(r.FirstName || ' ' || r.LastName, 'no direct reports') AS report_name
FROM Employee AS m -- manager
LEFT JOIN Employee AS r -- direct report
    ON r.ReportsTo = m.EmployeeId
ORDER BY manager_name, report_name;