-- Drill:     04 — Shipping delay hotspots
-- Topics:    joins, date arithmetic, conditional aggregates
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which customer countries and shippers show the most shipping delay?
--
-- Business context:
--   The operations lead is reviewing carrier performance and wants to know
--   where deliveries take longest and miss the required date.
--
-- Expected grain:   one row per shipping country and shipper
-- Expected columns: ship_country, shipper_id, shipper_name, shipped_orders,
--                   avg_days_to_ship, late_orders
-- Tables used:      orders, shippers
--
-- Notes:
--   use only shipped orders for average shipping days. Treat late orders as
--   orders where shipped_date is after required_date.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
