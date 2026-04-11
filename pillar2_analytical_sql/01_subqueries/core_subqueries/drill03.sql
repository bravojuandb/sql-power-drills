-- Drill 03 — `IN` Subquery
-- Business question: Which customers placed at least one order in 2020?
-- Expected output: customer_id, company_name, contact_name
-- Notes: use an `IN` subquery to filter customers based on order activity in a date range
-- Tables used: customers, orders

-- Determine the inner query:
-- Customers with at least one purchase in 2020
/*
SELECT DISTINCT customer_id
FROM orders
WHERE order_date >= '2020-01-01'
  AND order_date <  '2021-01-01';
*/
-- Define the outer query:
-- Select complementary information for customers from customer table.

SELECT 
    c.customer_id,
    c.company_name,
    c.contact_name
FROM customers c
WHERE c.customer_id IN (
    SELECT DISTINCT o.customer_id
    FROM orders o 
    WHERE o.order_date >= '2020-01-01'
      AND o.order_date < '2021-01-01'
);

-- Note: Always filter dates by range, not by extracted parts.
