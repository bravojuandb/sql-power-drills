-- Drill 10 — Multi-Join Analytical Patterns: Star-style analytical query
-- Business question: What are revenue and order count by month, category, and shipper?
-- Expected output: year_month, category_id, shipper_id, revenue, orders_count
-- Notes: build an enriched order-line dataset first, then aggregate to the requested reporting grain
-- Tables used: orders, order_details, products, categories, shippers



WITH order_totals AS (
	SELECT
		order_id,
		product_id,
		SUM(quantity * unit_price * (1 - discount)) AS line_total
	FROM order_details
	GROUP BY order_id, product_id
)
SELECT 
	TO_CHAR(order_date, 'YYYY-MM') AS year_month,
	p.category_id,
	o.ship_via,
	SUM(ot.order_total) AS revenue,
	COUNT(DISTINCT ot.order_id) AS order_count
FROM orders o
JOIN order_totals ot
	ON o.order_id = ot.order_id
JOIN products p
	ON ot.product_id = p.product_id
GROUP BY 
	TO_CHAR(order_date, 'YYYY-MM'),
	p.category_id,
	o.ship_via
ORDER BY p.category_id;