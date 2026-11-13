-- Drill:     07 — Product reorder pressure
-- Topics:    multi-joins, left join, aggregation
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which products look most urgent to reorder based on inventory and
--   historical demand?
--
-- Business context:
--   The inventory planner needs a prioritized list of products to reorder,
--   including products that have never sold.
--
-- Expected grain:   one row per product
-- Expected columns: product_id, product_name, supplier_name, category_name,
--                   units_in_stock, units_on_order, reorder_level,
--                   historical_quantity_sold
-- Tables used:      products, suppliers, categories, order_details
--
-- Notes:
--   preserve all products. Use a left join to sales history so products with
--   no order_details still appear, then compare stock fields from products.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
