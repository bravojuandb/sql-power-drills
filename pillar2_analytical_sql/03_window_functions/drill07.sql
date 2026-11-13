-- Drill:     07 — Moving average across months
-- Topics:    window functions, window frames, moving average
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   What is the 3-month moving average of monthly revenue?
--
-- Business context:
--   The sales manager wants a smoothed revenue trend that is not dominated by
--   single-month spikes.
--
-- Expected grain:   one row per month
-- Expected columns: year_month, monthly_revenue, moving_avg_3_month
-- Tables used:      orders, order_details
--
-- Notes:
--   aggregate to month grain first, then use a framed window ordered by month


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
