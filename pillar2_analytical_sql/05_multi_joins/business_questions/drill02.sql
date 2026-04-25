-- Drill 02 - Business Question Multi-Joins: Category expansion opportunities
-- Business question: Which high-value customers have not purchased from a target category?
-- Expected output: customer_id, company_name, customer_revenue, missing_category_id, missing_category_name
-- Grain: one row per customer and missing category
-- Notes: first calculate total customer revenue, then compare each customer to the
--        category list. Preserve customers who have no purchases in the category.
-- Tables used: customers, orders, order_details, products, categories

-- Write your query below.
