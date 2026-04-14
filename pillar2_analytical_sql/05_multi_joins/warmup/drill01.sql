-- Drill 01 — Multi-Join Warmup: Customer orders
-- Business question: Which customer placed each order?
-- Expected output: customer_id, company_name, order_id, order_date
-- Notes: join customers to orders and return one row per order
-- Tables used: customers, orders

SELECT 
	c.customer_id,
	c.company_name,
	o.order_id,
	o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_id;
