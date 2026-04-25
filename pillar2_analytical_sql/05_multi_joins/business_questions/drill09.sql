-- Drill 09 - Business Question Multi-Joins: Market revenue quality
-- Business question: Which customer countries and shippers have high freight relative to revenue?
-- Expected output: country, shipper_id, shipper_name, orders_count, revenue, freight_total, freight_to_revenue_ratio
-- Grain: one row per customer country and shipper
-- Notes: pre-aggregate order revenue at order grain before joining freight, otherwise
--        freight can be duplicated across order lines.
-- Tables used: customers, orders, order_details, shippers

-- Write your query below.
