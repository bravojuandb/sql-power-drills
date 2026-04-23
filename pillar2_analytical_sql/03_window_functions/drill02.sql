-- Drill 02 — Window Functions: ROW_NUMBER() per customer
-- Business question: What number is each order within a customer's own order history?
-- Expected output: customer_id, order_id, order_date, customer_order_number
-- Notes: partition by customer and order by order_date; break same-day ties with order_id
-- Tables used: orders

SELECT 
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS customer_order_number
FROM orders;