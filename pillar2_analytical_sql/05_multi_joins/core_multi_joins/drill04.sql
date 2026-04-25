-- Drill 04 — Multi-Join Analytical Patterns: Supplier reach across customers
-- Business question: How many unique customers bought at least one product from each supplier?
-- Expected output: supplier_id, supplier_name, unique_customers
-- Notes: count distinct customers after joining through orders and order details
-- Tables used: suppliers, products, order_details, orders

SELECT 
	s.supplier_id,
	s.company_name AS supplier_name,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM orders o
JOIN order_details od 
	ON od.order_id = o.order_id
JOIN products p
	ON p.product_id = od.product_id
JOIN suppliers s
	ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.company_name
ORDER BY unique_customers DESC;
