-- Drill 03 — Multi-Join Warmup: Product categories
-- Business question: Build a product list that is ready for reporting, including the category label for each product.
-- Expected output: product_id, product_name, category_id, category_name
-- Notes: join products to categories
-- Tables used: products, categories

SELECT 
	p.product_id,
	p.product_name,
	c.category_id,
	c.category_name
FROM products p
JOIN categories c
	ON p.category_id = c.category_id
ORDER BY category_id;