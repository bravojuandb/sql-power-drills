-- Drill 06 — Distinct Counting Habit
-- Business question: How many unique customers placed at least one order in each year?
-- Expected output: order_year, active_customers
-- Notes: first deduplicate in a subquery, then count in the outer query
-- Tables used: orders

-- Return one row per year.
-- Required shape:
-- 1. inner query: one row per (order_year, customer_id)
-- 2. outer query: count customers per order_year


SELECT
    order_year,
    COUNT(*) AS active_customers
FROM (
    SELECT DISTINCT
        EXTRACT(YEAR FROM order_date) AS order_year,
        customer_id
    FROM orders
    WHERE order_date IS NOT NULL
      AND customer_id IS NOT NULL
) AS x
GROUP BY order_year
ORDER BY order_year;