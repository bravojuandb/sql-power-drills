/*

### 8. Derived table subquery (`FROM`)
Build a derived table that calculates 
**total revenue per customer** (using `SUM(UnitPrice * Quantity * (1 - Discount))`),
 then select only customers whose revenue is **above the global average**.


-- Drill 08 — Subqueries: 
-- Business question: 
-- Expected output: 
-- Notes: 
-- Tables used: Customers, Orders


0|OrderID|INTEGER|1||1
1|ProductID|INTEGER|1||2
2|UnitPrice|NUMERIC|1|0|0
3|Quantity|INTEGER|1|1|0
4|Discount|REAL|1|0|0

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
  o.CustomerID AS customer_id,
  SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_revenue
FROM Orders o
JOIN "Order Details" od
  ON od.OrderID = o.OrderID
GROUP BY o.CustomerID;
