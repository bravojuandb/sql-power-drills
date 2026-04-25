-- Drill 01 - Business Question Multi-Joins: Best customers by category
-- Business question: Which customers generate the most revenue inside each product category?
-- Expected output: category_id, category_name, customer_id, company_name, category_revenue, orders_count
-- Grain: one row per category and customer
-- Notes: join from customers to orders, order_details, products, and categories.
--        Count distinct orders so multi-line orders do not inflate the order count.
-- Tables used: customers, orders, order_details, products, categories

WITH line_totals AS (
	SELECT 
		order_id,
		product_id,
		SUM(unit_price * quantity * (1 - discount)) AS line_total
	FROM order_details
	GROUP BY order_id, product_id
)
SELECT 
	cat.category_id,
	cat.category_name,
	cus.customer_id,
	cus.company_name,
	SUM(lt.line_total) AS category_revenue,
	COUNT(DISTINCT o.order_id) AS orders_count
FROM line_totals lt
JOIN products p
	ON p.product_id = lt.product_id
JOIN categories cat
	ON cat.category_id = p.category_id
JOIN orders o
	ON o.order_id = lt.order_id
JOIN customers cus
	ON o.customer_id = cus.customer_id
GROUP BY
	cat.category_id,
	cat.category_name,
	cus.customer_id,
	cus.company_name
ORDER BY 
	cat.category_id,
	category_revenue DESC;