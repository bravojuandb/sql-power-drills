/*

Drill 1 --- Scalar subquery in `SELECT`

Show each customer and the total number of orders they have placed,
using a scalar subquery in the `SELECT` clause.

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

SELECT 
    CustomerID,
    (SELECT COUNT(*)
     FROM Orders o 
     WHERE o.CustomerID = c.CustomerID) AS order_count
FROM Customers c;
ORDER BY order_count DESC, CustomerID;



/*
--Comparison to a JOIN: same output, but different logic

SELECT c.CustomerID, COUNT(O.OrderID) 
FROM Customers c 
LEFT JOIN Orders o 
    ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID;
*/