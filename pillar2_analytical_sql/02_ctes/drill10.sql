-- Drill 10 — CTE with Multiple Joins
-- Business question: How much revenue did each product category generate?
-- Expected output: category_id, category_name, category_revenue
-- Notes: create a CTE that joins Orders, Order Details, Products, and Categories into
--        an enriched order-line dataset with a line-level revenue calculation, then aggregate to category level
-- Tables used: Orders, Order Details, Products, Categories


WITH enriched_order_lines AS (
	SELECT
		o.order_id,
		p.product_id,
		c.category_id,
		c.category_name,
		od.unit_price,
		od.quantity,
		od.discount,
		od.unit_price * od.quantity * (1 - od.discount) AS line_revenue
	FROM orders o
	JOIN order_details od
		ON o.order_id = od.order_id
	JOIN products p
		ON p.product_id = od.product_id
	JOIN categories c
		ON c.category_id = p.category_id
)
SELECT
	category_id,
	category_name,
	SUM(line_revenue) AS category_revenue
FROM enriched_order_lines
GROUP BY category_id, category_name
ORDER BY category_revenue DESC;


-- This is an alternative way to answer the business question
-- No need to join orders table

WITH 
	product_totals AS (
		SELECT
			product_id,
			SUM(unit_price * quantity * (1 - discount)) AS total_revenue
		FROM order_details
		GROUP BY product_id
	),
	product_categories AS (
		SELECT 
			p.product_id,
			c.category_id,
			c.category_name
		FROM products p
		JOIN categories c
			ON c.category_id = p.category_id
	)
SELECT 
	pc.category_id,
	pc.category_name,
	SUM(pt.total_revenue) AS category_revenue
FROM product_totals pt
JOIN product_categories pc
	ON pc.product_id = pt.product_id
GROUP BY pc.category_id, pc.category_name
ORDER BY category_revenue DESC;


