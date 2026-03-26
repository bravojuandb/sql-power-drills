-- Drill 06 — CTE: Top 10 customers by total revenue
-- Business question: Which customers have generated the most revenue?
-- Expected output: customer_id, company_name, customer_revenue
-- Notes: reuse customer revenue logic in a CTE, then sort descending and return the top 10
-- Tables used: Customers, Orders, Order Details

--Custom solution for Postgres:
-- Cannot round double precision data type
-- ::numeric -> cast to numeric before rounding


WITH order_totals AS (
	SELECT 
		order_id,  
		SUM((unit_price * quantity * ( 1 - discount))::numeric) AS total_revenue_per_order
	FROM order_details
	GROUP BY order_id)
SELECT 
	o.customer_id, 
	c.company_name,
	ROUND(SUM(ot.total_revenue_per_order), 2) AS customer_revenue
FROM orders o
JOIN order_totals ot
	ON o.order_id = ot.order_id
JOIN customers c
	ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.company_name
ORDER BY customer_revenue DESC
LIMIT 10;