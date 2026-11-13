-- Drill:     12 — Running total vs final total
-- Topics:    window functions, running total, window frames
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   How does monthly revenue compare between a running total and the final
--   total repeated on every row?
--
-- Business context:
--   The finance analyst wants to show how much of the total revenue had been
--   reached by each month.
--
-- Expected grain:   one row per month
-- Expected columns: year_month, monthly_revenue, running_revenue,
--                   final_revenue_total
-- Tables used:      orders, order_details
--
-- Notes:
--   compare a cumulative window with a full-partition window over monthly
--   revenue


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
