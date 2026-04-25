-- Drill 08 — Multi-Join Analytical Patterns: Dimension-enriched category reporting
-- Business question: For each category, what are revenue, number of products sold, and number of active customers?
-- Expected output: category_id, category_name, category_revenue, distinct_products_sold, active_customers
-- Notes: be careful with row multiplication and use distinct counts only where the business question requires them
-- Tables used: categories, products, order_details, orders

SELECT 
	p.category_id,
	c.category_name,
	SUM(od.unit_price * od.quantity * (1 - od.discount)) AS category_revenue,
	COUNT(DISTINCT p.product_id) AS distinct_products_sold,
	COUNT(DISTINCT o.customer_id) AS active_customers
FROM order_details od
JOIN products p
	ON od.product_id = p.product_id
JOIN categories c
	ON p.category_id = c.category_id
JOIN orders o
	ON od.order_id = o.order_id
GROUP BY
	p.category_id,
	c.category_name
ORDER BY category_revenue DESC;