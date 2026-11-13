-- Drill:     03 — Supplier concentration risk
-- Topics:    multi-joins, aggregation, share of total
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which categories depend most heavily on a small number of suppliers?
--
-- Business context:
--   The purchasing manager wants to identify categories where losing one
--   supplier would put most of the category's revenue at risk.
--
-- Expected grain:   one row per category and supplier
-- Expected columns: category_id, category_name, supplier_id, supplier_name,
--                   supplier_revenue, category_revenue, supplier_revenue_share
-- Tables used:      order_details, products, categories, suppliers
--
-- Notes:
--   calculate supplier revenue within each category, then compare it with
--   total category revenue. Watch the aggregation grain before computing the
--   share.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
