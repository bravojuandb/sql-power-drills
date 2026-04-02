-- Drill 12 — Readability & Naming Discipline
-- Business question: Can the same earlier drill result be rewritten with clearer CTE naming?
-- Expected output: same result set as the original query
-- Notes: choose one earlier drill and rewrite it using clear pipeline-style CTE names
--        such as line_totals, order_totals, customer_totals, or fulfilled_orders
-- Tables used: depends on the earlier drill chosen

-- I chose this drill: 

-- Drill 05 — CTE: Order totals from line totals
-- Business question: Compute total revenue per customer from order-level totals
-- Expected output: customerid, customer_total
-- Notes: first aggregate line totals into order totals, then roll them up by customer
-- Tables used: Orders, Order Details


WITH 
line_totals AS (
	SELECT
		order_id,
		unit_price * quantity * (1 - discount) AS line_total
	FROM order_details
),
order_totals AS (
	SELECT
		order_id,
		SUM(line_total) AS order_total
	FROM line_totals
	GROUP BY order_id
),
customer_totals AS (
	SELECT
		o.customer_id,
		SUM(ot.order_total) AS customer_total
	FROM order_totals ot
	JOIN orders o
		ON o.order_id = ot.order_id
	GROUP BY o.customer_id
)
SELECT
	customer_id,
	ROUND(customer_total::numeric, 2) AS customer_total
FROM customer_totals
ORDER BY customer_total DESC;