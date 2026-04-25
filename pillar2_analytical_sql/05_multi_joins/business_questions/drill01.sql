-- Drill 01 - Business Question Multi-Joins: Best customers by category
-- Business question: Which customers generate the most revenue inside each product category?
-- Expected output: category_id, category_name, customer_id, company_name, category_revenue, orders_count
-- Grain: one row per category and customer
-- Notes: join from customers to orders, order_details, products, and categories.
--        Count distinct orders so multi-line orders do not inflate the order count.
-- Tables used: customers, orders, order_details, products, categories

-- Write your query below.
