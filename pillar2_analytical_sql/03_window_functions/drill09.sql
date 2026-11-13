-- Drill:     09 — Next order date with LEAD()
-- Topics:    window functions, lead
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   What is the next order date for each order within the same customer's
--   history?
--
-- Business context:
--   The account manager wants to see when each customer came back after an
--   order, to study repeat-purchase cadence.
--
-- Expected grain:   one row per order
-- Expected columns: customer_id, order_id, order_date, next_order_date
-- Tables used:      orders
--
-- Notes:
--   use LEAD() partitioned by customer and ordered by order_date, order_id


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
