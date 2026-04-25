-- Drill 07 - Business Question Multi-Joins: Product reorder pressure
-- Business question: Which products look most urgent to reorder based on inventory and historical demand?
-- Expected output: product_id, product_name, supplier_name, category_name, units_in_stock, units_on_order, reorder_level, historical_quantity_sold
-- Grain: one row per product
-- Notes: preserve all products. Use a left join to sales history so products with no
--        order_details still appear, then compare stock fields from products.
-- Tables used: products, suppliers, categories, order_details

-- Write your query below.
