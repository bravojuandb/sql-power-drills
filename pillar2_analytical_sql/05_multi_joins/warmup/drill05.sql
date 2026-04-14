-- Drill 05 — Multi-Join Warmup: Enriched order lines
-- Business question: What product and category does each order line belong to?
-- Expected output: order_id, product_id, product_name, category_name, quantity
-- Notes: start from order_details, then join products and categories
-- Tables used: order_details, products, categories

SELECT 
	od.order_id,
	od.product_id,
	p.product_name,
	c.category_name,
	od.quantity
FROM order_details od
JOIN products p
	ON od.product_id = p.product_id
JOIN categories c
	ON p.category_id = c.category_id
ORDER BY order_id;