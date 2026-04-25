-- Drill 06 - Business Question Multi-Joins: Discount effectiveness
-- Business question: Where is revenue coming from discounted vs non-discounted line items?
-- Expected output: category_id, category_name, country, discounted_revenue, full_price_revenue, discounted_orders
-- Grain: one row per category and customer country
-- Notes: use conditional aggregation. Discounted revenue should include only rows
--        where order_details.discount is greater than zero.
-- Tables used: customers, orders, order_details, products, categories

-- Write your query below.
