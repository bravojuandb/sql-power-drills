-- Drill:     09 — Market revenue quality
-- Topics:    multi-joins, pre-aggregation, ratios
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which customer countries and shippers have high freight relative to
--   revenue?
--
-- Business context:
--   The finance analyst wants to find markets and carriers where freight costs
--   eat a large share of revenue.
--
-- Expected grain:   one row per customer country and shipper
-- Expected columns: country, shipper_id, shipper_name, orders_count, revenue,
--                   freight_total, freight_to_revenue_ratio
-- Tables used:      customers, orders, order_details, shippers
--
-- Notes:
--   pre-aggregate order revenue at order grain before joining freight,
--   otherwise freight can be duplicated across order lines.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
