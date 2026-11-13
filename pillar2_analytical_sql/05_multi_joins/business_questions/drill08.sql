-- Drill:     08 — Cross-sell category pairs
-- Topics:    multi-joins, self-join, count distinct
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which product categories are most often bought together in the same order?
--
-- Business context:
--   The marketing manager is planning bundles and wants to know which
--   categories customers already buy together.
--
-- Expected grain:   one row per unique category pair
-- Expected columns: category_id_1, category_name_1, category_id_2,
--                   category_name_2, orders_count, customers_count
-- Tables used:      orders, order_details, products, categories
--
-- Notes:
--   build order-category rows first, then self-join them with category_id_1
--   less than category_id_2 so each pair appears once.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
