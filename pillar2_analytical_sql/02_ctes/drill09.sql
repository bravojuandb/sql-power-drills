-- Drill 09 — CTE vs Subquery Comparison
-- Business question: Which customers have total revenue above the average customer revenue?
-- Expected output: customer_id, company_name, customer_revenue, avg_customer_revenue
-- Notes: first compute total revenue per customer for customers with at least one order, 
--        then compute the average of those customer totals and return only customers above that average
-- Tables used: Customers, Orders, Order Details


WITH customer_totals AS (
	SELECT 
		o.customer_id,
		SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
	FROM order_details od
	JOIN orders o
		ON o.order_id = od.order_id
	GROUP BY o.customer_id
)
SELECT 
	c.customer_id,
	c.company_name,
	ct.total_revenue AS customer_revenue,
	(
		SELECT AVG(total_revenue)
		FROM customer_totals	
	) AS avg_customer_revenue
FROM customers c
JOIN customer_totals ct
	ON c.customer_id = ct.customer_id
WHERE ct.total_revenue > (
	SELECT AVG(total_revenue)
	FROM customer_totals
)
ORDER BY customer_revenue DESC;