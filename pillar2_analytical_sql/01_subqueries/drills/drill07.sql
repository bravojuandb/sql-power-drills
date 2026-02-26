
-- Drill 07 — Subqueries: Orders above customer average subtotal 
-- Business question: Which orders have a subtotal greater than the average order 
--                    subtotal for that same customer?
-- Expected output: customer_id, company_name, order_id, order_subtotal
-- Notes: SUM(UnitPrice * Quantity * (1 - Discount))
-- Tables used: Customers, Orders, Order Details


/*

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

0|OrderID|INTEGER|1||1
1|ProductID|INTEGER|1||2
2|UnitPrice|NUMERIC|1|0|0
3|Quantity|INTEGER|1|1|0
4|Discount|REAL|1|0|0
*/

SELECT
    o.CustomerID AS customer_id,
    c.CompanyName AS company_name,
    o.OrderID AS order_id,
    (
        SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))
        FROM "Order Details" od
        WHERE od.OrderID = o.OrderID
    ) AS order_subtotal
FROM Orders o
JOIN Customers c
  ON c.CustomerID = o.CustomerID
WHERE
    (
        SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))
        FROM "Order Details" od
        WHERE od.OrderID = o.OrderID
    )
    >
    (
        SELECT AVG(order_total)
        FROM (
            SELECT
                o2.OrderID,
                SUM(od2.UnitPrice * od2.Quantity * (1 - od2.Discount)) AS order_total
            FROM Orders o2
            JOIN "Order Details" od2
              ON od2.OrderID = o2.OrderID
            WHERE o2.CustomerID = o.CustomerID
            GROUP BY o2.OrderID
        )
    );