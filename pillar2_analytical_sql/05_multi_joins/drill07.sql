-- Drill 07 — Multi-Join Analytical Patterns: Pre-aggregate before a join
-- Business question: What is the total revenue for each order once customer and shipper information is attached?
-- Expected output: order_id, customer_id, customer_name, shipper_name, order_total
-- Notes: compute one row per order first, then join to customers and shippers
-- Tables used: order_details, orders, customers, shippers


SELECT 
	od.order_id,
	c.customer_id,
    c.company_name,
	sh.company_name AS shipper_name,
	SUM(od.unit_price * od.quantity * (1 - od.discount)) AS order_total
FROM order_details od
JOIN orders o
	ON o.order_id = od.order_id
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN shippers sh
	ON o.ship_via = sh.shipper_id
GROUP BY 
	od.order_id,
	c.customer_id,
    c.company_name,
	sh.company_name
ORDER BY order_total DESC;

-- Pre-aggregation:

WITH order_totals AS (
    SELECT
        order_id,
        SUM(unit_price * quantity * (1 - discount)) AS order_total
    FROM order_details
    GROUP BY order_id
)
SELECT
    ot.order_id,
    o.customer_id,
    c.company_name,
    sh.company_name AS shipper_name,
    ot.order_total
FROM order_totals ot
JOIN orders o
    ON o.order_id = ot.order_id
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN shippers sh
    ON o.ship_via = sh.shipper_id
ORDER BY ot.order_total DESC;