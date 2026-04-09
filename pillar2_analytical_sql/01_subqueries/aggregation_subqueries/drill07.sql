-- Drill 07 — WHERE vs HAVING
-- Business question: Which customers have total revenue greater than 5000?
-- Expected output: customer_id, customer_revenue
-- Notes: compute grouped results in a subquery, then filter in the outer query
-- Tables used: orders, order_details

-- Required shape:
-- 1. inner query: one row per customer with customer_revenue
-- 2. outer query: filter rows where customer_revenue > 5000
-- Prefer outer WHERE on the derived table over HAVING in the final step.

SELECT * 
FROM (
	SELECT 
		o.customer_id,
		SUM(ot.order_total) AS customer_revenue
	FROM (
		SELECT 
			order_id,
			SUM(unit_price * quantity * (1 - discount)) AS order_total
		FROM order_details
		GROUP BY order_id
	) AS ot
	JOIN orders o
		ON ot.order_id = o.order_id
	GROUP BY o.customer_id
) AS customer_totals
WHERE customer_revenue > 5000
ORDER BY customer_revenue DESC;