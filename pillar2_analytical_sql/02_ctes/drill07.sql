-- Drill 07 — CTE: Most recent order date per customer
-- Business question: What is the most recent order date for each customer?
-- Expected output: customer_id, company_name, most_recent_order_date
-- Notes: create a CTE that groups Orders by customer and uses MAX(OrderDate), then join to Customers
-- Tables used: Customers, Orders

WITH last_orders AS (
    SELECT 
        customer_id,
        MAX(order_date) AS most_recent_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    c.company_name,
    lo.most_recent_order_date
FROM customers c
JOIN last_orders lo
    ON c.customer_id = lo.customer_id
ORDER BY lo.most_recent_order_date DESC, c.customer_id;
