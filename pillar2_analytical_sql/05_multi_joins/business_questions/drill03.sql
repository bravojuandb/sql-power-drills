-- Drill 03 - Business Question Multi-Joins: Supplier concentration risk
-- Business question: Which categories depend most heavily on a small number of suppliers?
-- Expected output: category_id, category_name, supplier_id, supplier_name, supplier_revenue, category_revenue, supplier_revenue_share
-- Grain: one row per category and supplier
-- Notes: calculate supplier revenue within each category, then compare it with total
--        category revenue. Watch the aggregation grain before computing the share.
-- Tables used: order_details, products, categories, suppliers

-- Write your query below.
