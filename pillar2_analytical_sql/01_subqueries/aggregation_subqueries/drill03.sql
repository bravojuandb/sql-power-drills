-- Drill 03 — Aggregate at the Correct Grain
-- Business question: How many orders has each customer placed?
-- Expected output: customer_id, orders_count
-- Notes: start from a grouped subquery on orders; use the smallest table set needed; do not join order_details
-- Tables used: orders

-- Return one row per customer.

SELECT 
	customer_id,
	orders_count
FROM (
	SELECT 
		customer_id,
		COUNT(order_id) AS orders_count
	FROM orders
	GROUP BY customer_id
)
ORDER BY orders_count DESC;