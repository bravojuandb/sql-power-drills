-- Drill 11 - Business Question Multi-Joins: Underpenetrated categories by country
-- Business question: Where does a category have buyers but a small share of global category revenue?
-- Expected output: country, category_id, category_name, country_category_revenue, global_category_revenue, country_share
-- Grain: one row per customer country and category
-- Notes: calculate revenue by country and category, then compare it with the global
--        category total. Only include categories with actual buyers in that country.
-- Tables used: customers, orders, order_details, products, categories

-- Write your query below.
