-- Drill 03 — Multi-Join Analytical Patterns: Customer revenue by category
-- Business question: How much revenue has each customer generated in each product category?
-- Expected output: customer_id, category_id, category_name, customer_category_revenue
-- Notes: follow the join path from customers to categories through orders, order_details, and products
-- Tables used: customers, orders, order_details, products, categories


-- This solution prioritizes the aggregation logic, starting from order_details
SELECT 
	cus.customer_id,
	p.category_id,
	cat.category_name,
	SUM(od.unit_price * od.quantity * (1 - od.discount)) AS customer_category_revenue
FROM order_details od
JOIN products p
	ON od.product_id = p.product_id
JOIN orders o
	ON o.order_id = od.order_id
JOIN customers cus
	ON o.customer_id = cus.customer_id
JOIN categories cat
	ON p.category_id = cat.category_id
GROUP BY cus.customer_id, p.category_id, cat.category_name
ORDER BY customer_category_revenue DESC;