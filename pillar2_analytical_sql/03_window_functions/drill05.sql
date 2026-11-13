-- Drill:     05 — Top 3 products per category
-- Topics:    window functions, ranking, top-n per group
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which 3 products generate the most revenue within each category?
--
-- Business context:
--   The category manager is reviewing the assortment and wants to know which
--   products carry each category.
--
-- Expected grain:   one row per category and product (top 3 products per
--                   category)
-- Expected columns: category_id, category_name, product_id, product_name,
--                   product_revenue, category_rank
-- Tables used:      order_details, products, categories
--
-- Notes:
--   compute product revenue first, then rank within each category; use
--   ROW_NUMBER() for exactly 3 rows per category or RANK() if tied extras
--   should be kept


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
