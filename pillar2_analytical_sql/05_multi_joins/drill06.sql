-- Drill 06 — Multi-Join Analytical Patterns: Left join coverage check
-- Business question: What is the total sold quantity for each product, including unsold products?
-- Expected output: product_id, product_name, total_quantity
-- Notes: use a LEFT JOIN so products with no matching order lines still appear
-- Tables used: products, order_details

SELECT 
	p.product_id,
	p.product_name,
	COALESCE(SUM(od.quantity), 0) AS total_sold_quantity
FROM products p
LEFT JOIN order_details od
	ON p.product_id = od.product_id
GROUP BY 
	p.product_id,
	p.product_name
ORDER BY total_sold_quantity DESC;
	