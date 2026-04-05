-- Drill 01 — Scalar Subquery in SELECT
-- Business question: How many orders has each customer placed?
-- Expected output: customer_id, order_count
-- Notes: use a scalar subquery in the SELECT clause to count orders per customer
-- Tables used: Customers, Orders

SELECT
    c.customer_id,
    (
        SELECT COUNT(o.order_id)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;


--Comparison to a JOIN: same output, but different logic

/*
SELECT 
    c.customer_id, 
    COUNT(o.order_id) 
FROM customers c 
LEFT JOIN orders o 
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id;
*/

--Most natural solution for that business question

/*
SELECT 
    customer_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;
*/