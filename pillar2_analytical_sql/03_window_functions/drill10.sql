-- Drill:     10 — Share of category revenue
-- Topics:    window functions, window aggregates, share of total
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   What share of category revenue does each product contribute?
--
-- Business context:
--   The category manager wants to know how concentrated each category's
--   revenue is in a few products.
--
-- Expected grain:   one row per product
-- Expected columns: category_id, product_id, product_revenue,
--                   category_revenue, revenue_share
-- Tables used:      order_details, products, categories
--
-- Notes:
--   compute product revenue first, then use a window aggregate to repeat
--   category totals


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
