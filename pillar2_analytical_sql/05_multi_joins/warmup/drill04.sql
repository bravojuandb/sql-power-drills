-- Drill 04 — Multi-Join Warmup: Product suppliers
-- Business question: Which supplier provides each product?
-- Expected output: product_id, product_name, supplier_id, supplier_name
-- Notes: join products to suppliers
-- Tables used: products, suppliers


SELECT 
	p.product_id,
	p.product_name,
	s.supplier_id,
	s.company_name AS supplier_name
FROM products p
JOIN suppliers s
	ON p.supplier_id = s.supplier_id
ORDER BY supplier_id, product_id;