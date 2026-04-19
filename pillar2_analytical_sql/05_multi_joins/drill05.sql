-- Drill 05 — Multi-Join Analytical Patterns: Employee category sales
-- Business question: How much revenue has each employee generated in each product category?
-- Expected output: employee_id, employee_name, category_id, category_name, category_revenue
-- Notes: join orders to employees, then continue through order_details, products, and categories
-- Tables used: employees, orders, order_details, products, categories

SELECT 
	o.employee_id,
	COALESCE(e.first_name || ' ' || e.last_name) AS employee_name,
	p.category_id,
	c.category_name,
	SUM(od.unit_price * od.quantity * (1 - od.discount)) AS category_revenue
FROM order_details od
JOIN products p
	ON p.product_id = od.product_id
JOIN categories c
	ON c.category_id = p.category_id
JOIN orders o
	ON o.order_id = od.order_id
JOIN employees e
	ON e.employee_id = o.employee_id
GROUP BY 
	COALESCE(e.first_name || ' ' || e.last_name),
	o.employee_id,
	p.category_id,
	c.category_name
ORDER BY o.employee_id, category_revenue DESC;