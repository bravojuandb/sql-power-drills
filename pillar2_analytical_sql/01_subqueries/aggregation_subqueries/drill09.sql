-- Drill 09 — Weighted Revenue Thinking
-- Business question: What is total revenue per category?
-- Expected output: category_id, category_name, category_revenue
-- Notes: use a product-level revenue subquery, then aggregate again at category level
-- Tables used: categories, products, order_details

-- Revenue formula:
-- unit_price * quantity * (1 - discount)
-- Required shape:
-- 1. inner query: one row per product with product_revenue
-- 2. outer query: join to categories and roll up to category_revenue


SELECT 
	p.category_id,
	c.category_name,
	SUM(pr.product_revenue) AS category_revenue
FROM (
	SELECT 
		product_id,
		SUM(unit_price * quantity * (1 - discount)) AS product_revenue
	FROM order_details
	GROUP BY product_id
) AS pr
JOIN products p
	ON p.product_id = pr.product_id
JOIN categories c
	ON p.category_id = c.category_id
GROUP BY p.category_id, c.category_name;