
-- Drill 06 — Subqueries: Customers with most recent order
-- Business question: What is the most recent order date for each customer?
-- Expected output: customer_id, contact_name, most_recent_order
-- Notes: MAX(order_date) returns the most recent order for the current customer
-- Tables used: customers, orders

SELECT 
     c.customer_id,
     c.contact_name,
     (
        SELECT MAX(o.order_date)
        FROM orders o
        WHERE o.customer_id = c.customer_id
     ) AS most_recent_order
FROM customers c
ORDER BY most_recent_order DESC;
