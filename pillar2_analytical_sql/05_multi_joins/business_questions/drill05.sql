-- Drill 05 - Business Question Multi-Joins: Employee portfolio mix
-- Business question: What countries and categories make up each employee's sales portfolio?
-- Expected output: employee_id, employee_name, country, category_id, category_name, revenue, orders_count
-- Grain: one row per employee, customer country, and category
-- Notes: join employees to orders, customers, order_details, products, and categories.
--        Count distinct orders at the final grain.
-- Tables used: employees, orders, customers, order_details, products, categories

-- Write your query below.
