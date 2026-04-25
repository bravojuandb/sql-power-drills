-- Drill 08 - Business Question Multi-Joins: Cross-sell category pairs
-- Business question: Which product categories are most often bought together in the same order?
-- Expected output: category_id_1, category_name_1, category_id_2, category_name_2, orders_count, customers_count
-- Grain: one row per unique category pair
-- Notes: build order-category rows first, then self-join them with category_id_1
--        less than category_id_2 so each pair appears once.
-- Tables used: orders, order_details, products, categories

-- Write your query below.
