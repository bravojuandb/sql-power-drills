-- Drill:     08 — Previous order date with LAG()
-- Topics:    window functions, lag
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   What was the previous order date for each order within the same customer's
--   history?
--
-- Business context:
--   The customer success lead wants to measure how much time passes between a
--   customer's consecutive orders.
--
-- Expected grain:   one row per order
-- Expected columns: customer_id, order_id, order_date, previous_order_date
-- Tables used:      orders
--
-- Notes:
--   use LAG() partitioned by customer and ordered by order_date, order_id


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
