-- Drill 04 - Business Question Multi-Joins: Shipping delay hotspots
-- Business question: Which customer countries and shippers show the most shipping delay?
-- Expected output: ship_country, shipper_id, shipper_name, shipped_orders, avg_days_to_ship, late_orders
-- Grain: one row per shipping country and shipper
-- Notes: use only shipped orders for average shipping days. Treat late orders as
--        orders where shipped_date is after required_date.
-- Tables used: orders, shippers

-- Write your query below.
