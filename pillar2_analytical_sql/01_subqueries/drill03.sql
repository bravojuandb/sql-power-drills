/*

Drill 3 --- `IN` subquery

List customers (CustomerID, CompanyName, ContactName) 
who have placed at least one order in 2020, using an `IN` subquery.

0|CustomerID|TEXT|0||1
1|CompanyName|TEXT|0||0
2|ContactName|TEXT|0||0
3|ContactTitle|TEXT|0||0
4|Address|TEXT|0||0
5|City|TEXT|0||0
6|Region|TEXT|0||0
7|PostalCode|TEXT|0||0
8|Country|TEXT|0||0
9|Phone|TEXT|0||0
10|Fax|TEXT|0||0

0|OrderID|INTEGER|1||1
1|CustomerID|TEXT|0||0
2|EmployeeID|INTEGER|0||0
3|OrderDate|DATETIME|0||0
4|RequiredDate|DATETIME|0||0
5|ShippedDate|DATETIME|0||0
6|ShipVia|INTEGER|0||0
7|Freight|NUMERIC|0|0|0
8|ShipName|TEXT|0||0
9|ShipAddress|TEXT|0||0
10|ShipCity|TEXT|0||0
11|ShipRegion|TEXT|0||0
12|ShipPostalCode|TEXT|0||0
13|ShipCountry|TEXT|0||0

*/

-- Determine the inner query:
-- Customers with at least one purchase in 2020
/*
SELECT DISTINCT CustomerID
FROM Orders
WHERE OrderDate >= '2020-01-01'
  AND OrderDate <  '2021-01-01';
*/
-- Define the outer query:
-- Select complementary information for customers from customer table.

SELECT 
    c.CustomerID,
    c.CompanyName,
    c.ContactName
FROM Customers c
WHERE c.CustomerID IN (
    SELECT DISTINCT(o.CustomerID)
    FROM Orders o 
    WHERE o.OrderDate >= '2020-01-01'
      AND o.OrderDate < '2021-01-01'
);

-- Note: Always filter dates by range, not by extracted parts.