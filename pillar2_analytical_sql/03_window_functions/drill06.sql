-- Drill:     06 — Running revenue total by month
-- Topics:    window functions, running total, date bucketing
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   How does cumulative revenue grow month by month?
--
-- Business context:
--   The finance analyst is preparing a growth chart and needs cumulative
--   revenue by month.
--
-- Expected grain:   one row per month
-- Expected columns: year_month, monthly_revenue, running_revenue
-- Tables used:      orders, order_details
--
-- Notes:
--   aggregate to one row per month before applying the running-total window


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
