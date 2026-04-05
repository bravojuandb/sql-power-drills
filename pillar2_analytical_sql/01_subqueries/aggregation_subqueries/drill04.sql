-- Drill 04 — Join After Pre-Aggregation
-- Business question: What is total revenue per customer?
-- Expected output: customer_id, customer_revenue
-- Notes: first reduce order_details to one row per order in a subquery
-- Tables used: orders, order_details

-- Use revenue formula:
-- unit_price * quantity * (1 - discount)
