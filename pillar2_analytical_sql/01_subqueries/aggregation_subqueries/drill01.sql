-- Drill 01 — Grain Check Before Aggregation
-- Business question: How many rows are in orders and order_details, and what does one row represent in each?
-- Expected output: orders_rows, order_details_rows
-- Notes: read table grain before writing joins or aggregations
-- Tables used: orders, order_details

-- Return one row with both counts.
-- Then explain, in your own words, which table is at order grain
-- and which table is at line-item grain.
