-- Drill:     11 — Order vs customer average
-- Topics:    window functions, window aggregates, ctes
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   How does each order total compare to the average order total for that same
--   customer?
--
-- Business context:
--   The sales manager wants to spot orders that are unusually large or small
--   for that customer.
--
-- Expected grain:   one row per order
-- Expected columns: customer_id, order_id, order_total,
--                   customer_avg_order_total
-- Tables used:      orders, order_details
--
-- Notes:
--   compute one row per order first, then use a windowed average over customer
--   partitions


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
