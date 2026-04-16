-- Drill 02 — Multi-Join Analytical Patterns: Order line enrichment
-- Business question: What product, category, and supplier information belongs to each order line?
-- Expected output: order_id, product_id, product_name, category_name, supplier_name, quantity
-- Notes: keep one row per order line while joining through products to categories and suppliers
-- Tables used: order_details, products, categories, suppliers

SELECT 
	od.order_id,
	p.product_id,
	p.product_name,
	c.category_name,
	s.company_name AS supplier_name,
	od.quantity
FROM order_details od
JOIN products p
	ON od.product_id = p.product_id
JOIN categories c
	ON p.category_id = c.category_id
JOIN suppliers s	
	ON p.supplier_id = s.supplier_id;