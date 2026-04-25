-- Drill 09 — Multi-Join Analytical Patterns: Unmatched relationship analysis
-- Business question: Which customers have orders that have not yet shipped, and what shipper information is available for those orders?
-- Expected output: customer_id, company_name, order_id, shipper_name, shipped_date
-- Notes: preserve the order rows even when shipping details are missing or the order has not shipped yet
-- Tables used: customers, orders, shippers

SELECT 
	o.customer_id,
	c.company_name,
	o.order_id,
	sh.company_name AS shipper_name,
	o.shipped_date
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.ship_via = sh.shipper_id
WHERE o.shipped_date IS NULL;

-- LEFT JOIN shippers to preserve all unshipped orders even if shipper info is missing
-- Include shipped_date to expose the NULL condition used to identify unshipped orders