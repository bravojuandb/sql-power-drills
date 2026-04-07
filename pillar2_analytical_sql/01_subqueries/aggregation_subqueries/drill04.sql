-- Drill 04 — Join After Pre-Aggregation
-- Business question: What is total revenue per customer?
-- Expected output: customer_id, customer_revenue
-- Notes: first reduce order_details to one row per order in a subquery, then roll up again
-- Tables used: orders, order_details

-- Use revenue formula:
-- unit_price * quantity * (1 - discount)
-- Required shape:
-- 1. inner query: one row per order with order_total
-- 2. outer query: one row per customer with customer_revenue


-- Outer query. Grain is one row per customer
SELECT 
	o.customer_id,
	SUM(ot.order_revenue) AS customer_revenue
FROM  (	
-- Inner query. Grain is one row per order
	SELECT 
		order_id,
		SUM(unit_price * quantity * (1 - discount)) AS order_revenue
	FROM order_details
	GROUP BY order_id
	) AS ot
-- List all custmers including zero revenue
LEFT JOIN orders o
	ON o.order_id = ot.order_id
GROUP BY o.customer_id
ORDER BY customer_revenue DESC;