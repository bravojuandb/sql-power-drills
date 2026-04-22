-- Drill 11 — Multi-Join Analytical Patterns: Customer-supplier relationship matrix
-- Business question: How much revenue did each customer generate for each supplier, and across how many distinct orders?
-- Expected output: customer_id, company_name, supplier_id, supplier_name, supplier_revenue, orders_count
-- Notes: aggregate to one row per customer and supplier pair, and count distinct orders at that same reporting grain
-- Tables used: customers, orders, order_details, products, suppliers

WITH order_totals AS (
	SELECT 
		order_id,
		product_id,
		SUM(unit_price * quantity * (1 - discount)) AS line_total
	FROM order_details
	GROUP BY order_id, product_id
)
SELECT 
	cus.customer_id,
	cus.company_name,
	sup.supplier_id,
	sup.company_name AS supplier_name,
	SUM(ot.line_total) AS supplier_revenue,
	COUNT(DISTINCT o.order_id) AS order_count
FROM order_totals ot
JOIN products p
	ON ot.product_id = p.product_id
JOIN suppliers sup
	ON p.supplier_id = sup.supplier_id
JOIN orders o
	ON ot.order_id = o.order_id
JOIN customers cus
	ON o.customer_id = cus.customer_id
GROUP BY
	cus.customer_id,
	cus.company_name,
	sup.supplier_id,
	sup.company_name;