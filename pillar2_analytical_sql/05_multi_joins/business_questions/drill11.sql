-- Drill:     11 — Underpenetrated categories by country
-- Topics:    multi-joins, share of total
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Where does a category have buyers but a small share of global category
--   revenue?
--
-- Business context:
--   The regional sales manager is looking for countries where a category
--   already sells but has room to grow.
--
-- Expected grain:   one row per customer country and category
-- Expected columns: country, category_id, category_name,
--                   country_category_revenue, global_category_revenue,
--                   country_share
-- Tables used:      customers, orders, order_details, products, categories
--
-- Notes:
--   calculate revenue by country and category, then compare it with the global
--   category total. Only include categories with actual buyers in that
--   country.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
