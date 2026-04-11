-- Drill 08 — Subqueries: Derived table subquery using FROM
-- Business question: What's the total revenue per customer, 
--                    for customers whose revenue is above the global average?
-- Expected output: customer_id, total_revenue
-- Notes: 
-- Tables used: orders, order_details

/*
Build a derived table that calculates total revenue per customer
using SUM(unit_price * quantity * (1 - discount)),
then select only customers whose revenue is above the global average.


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

/*
-- Layer 1 (Derived table): Total revenue per customer

SELECT
  o.customer_id,
  SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
FROM orders o
JOIN order_details od
  ON od.order_id = o.order_id
GROUP BY o.customer_id;

-- Layer 2 (Scalar Subquery): Average of total_revenue over the per-customer total revenues
*/

SELECT 
  t.customer_id,
  t.total_revenue
FROM (
  SELECT 
    o.customer_id,
    SUM(od.quantity * od.unit_price * (1 - od.discount)) AS total_revenue
  FROM orders o
  JOIN order_details od
    ON o.order_id = od.order_id
  GROUP BY o.customer_id
) AS t
WHERE t.total_revenue > (
  SELECT AVG(t2.total_revenue)
  FROM (
    SELECT
      o2.customer_id,
      SUM(od2.unit_price * od2.quantity * (1 - od2.discount)) AS total_revenue
    FROM orders o2
    JOIN order_details od2
      ON od2.order_id = o2.order_id
    GROUP BY o2.customer_id
  ) AS t2
)

ORDER BY t.total_revenue DESC;
