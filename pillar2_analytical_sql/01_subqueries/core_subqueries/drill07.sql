
-- Drill 07 — Subqueries: Orders above customer average subtotal 
-- Business question: Which orders have a subtotal greater than the average order 
--                    subtotal for that same customer?
-- Expected output: customer_id, company_name, order_id, order_subtotal
-- Notes: SUM(UnitPrice * Quantity * (1 - Discount))
-- Tables used: customers, orders, order_details


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
    o.customer_id,
    c.company_name,
    o.order_id,
    (
        SELECT SUM(od.unit_price * od.quantity * (1 - od.discount))
        FROM order_details od
        WHERE od.order_id = o.order_id
    ) AS order_subtotal
FROM orders o
JOIN customers c
  ON c.customer_id = o.customer_id
WHERE
    (
        SELECT SUM(od.unit_price * od.quantity * (1 - od.discount))
        FROM order_details od
        WHERE od.order_id = o.order_id
    )
    >
    (
        SELECT AVG(order_total)
        FROM (
            SELECT
                o2.order_id,
                SUM(od2.unit_price * od2.quantity * (1 - od2.discount)) AS order_total
            FROM orders o2
            JOIN order_details od2
              ON od2.order_id = o2.order_id
            WHERE o2.customer_id = o.customer_id
            GROUP BY o2.order_id
        ) AS customer_orders
    );
