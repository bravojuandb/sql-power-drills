-- Drill 06 — Multi-Join Warmup: Products with or without sales
-- Business question: How much total quantity has each product sold, including products with no sales?
-- Expected output: product_id, product_name, total_quantity
-- Notes: use a LEFT JOIN so unsold products still appear
-- Tables used: products, order_details

SELECT 
	p.product_id,
	p.product_name,
	COALESCE(SUM(od.quantity), 0) AS total_quantity
FROM products p
LEFT JOIN order_details od
	ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC;