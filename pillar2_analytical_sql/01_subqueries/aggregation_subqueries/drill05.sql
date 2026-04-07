-- Drill 05 — Average of Order Totals
-- Business question: Which customers have an average order total above the global average order total?
-- Expected output: customer_id, avg_order_total
-- Notes: use nested aggregation layers
-- Tables used: orders, order_details

-- Hint:
-- 1. Build order totals
-- 2. Average those totals per customer
-- 3. Compare to the global average order total
-- Required shape:
-- - one subquery to compute one row per order
-- - one outer aggregation to compute one row per customer
-- - one scalar subquery to compare against the global average order total



SELECT 
	o.customer_id,
	AVG(ot.order_total) AS avg_order_total
FROM (
	SELECT 
		order_id,
		SUM(unit_price * quantity * (1 - discount)) AS order_total
	FROM order_details
	GROUP BY order_id
) ot
JOIN orders o
ON ot.order_id = o.order_id
GROUP BY o.customer_id
-- AVG at customer level grater than AVG at order level
HAVING AVG(ot.order_total) > (
	SELECT AVG(order_total)
		FROM (
			SELECT 
				order_id,
				SUM(unit_price * quantity * (1 - discount)) AS order_total
			FROM order_details
			GROUP BY order_id
		) ot
);