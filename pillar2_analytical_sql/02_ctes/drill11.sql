-- Drill 11 — Analytical Question Using Layered CTEs
-- Business question: What is the monthly revenue trend for shipped orders only?
-- Expected output: year_month, revenue, orders_count
-- Notes: first filter to orders where ShippedDate IS NOT NULL, then compute order totals,
--        then aggregate those shipped orders by the month of OrderDate using a YYYY-MM style month key
-- Tables used: Orders, Order Details


WITH 
fulfilled_orders AS (
	SELECT
		order_id,
		order_date
	FROM orders
	WHERE shipped_date IS NOT NULL
),
order_totals AS (
	SELECT 
		order_id,
		ROUND(SUM(unit_price * quantity * (1 - discount))::numeric, 2) AS total_revenue
	FROM order_details
	GROUP BY order_id
)
SELECT
	to_char(date_trunc('month', fo.order_date), 'YYYY-MM') AS year_month,
	SUM(ot.total_revenue) AS revenue,
	COUNT(DISTINCT ot.order_id) AS orders_count
FROM fulfilled_orders fo
JOIN order_totals ot
	ON fo.order_id = ot.order_id
GROUP BY to_char(date_trunc('month', fo.order_date), 'YYYY-MM')
ORDER BY year_month ASC;