-- Drill:     06 — Discount effectiveness
-- Topics:    multi-joins, conditional aggregates
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Where is revenue coming from discounted vs non-discounted line items?
--
-- Business context:
--   The pricing analyst wants to see where revenue depends on discounts, by
--   category and market.
--
-- Expected grain:   one row per category and customer country
-- Expected columns: category_id, category_name, country, discounted_revenue,
--                   full_price_revenue, discounted_orders
-- Tables used:      customers, orders, order_details, products, categories
--
-- Notes:
--   use conditional aggregation. Discounted revenue should include only rows
--   where order_details.discount is greater than zero.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
