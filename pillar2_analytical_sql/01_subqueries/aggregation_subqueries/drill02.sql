-- Drill 02 — Scalar subqueries for counting
-- Business question: How many total orders exist, how many have shipped_date, and how many have customer_id?
-- Expected output: total_orders, shipped_orders, orders_with_customer
-- Notes: use scalar subqueries to answer three related counting questions
-- Tables used: orders

SELECT
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM orders WHERE shipped_date IS NOT NULL) AS shipped_orders,
    (SELECT COUNT(*) FROM orders WHERE customer_id IS NOT NULL) AS orders_with_customer;
