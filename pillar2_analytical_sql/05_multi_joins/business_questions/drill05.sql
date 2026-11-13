-- Drill:     05 — Employee portfolio mix
-- Topics:    multi-joins, aggregation, count distinct
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   What countries and categories make up each employee's sales portfolio?
--
-- Business context:
--   The sales manager wants to understand how each sales rep's revenue is
--   spread across markets and product categories.
--
-- Expected grain:   one row per employee, customer country, and category
-- Expected columns: employee_id, employee_name, country, category_id,
--                   category_name, revenue, orders_count
-- Tables used:      employees, orders, customers, order_details, products,
--                   categories
--
-- Notes:
--   join employees to orders, customers, order_details, products, and
--   categories. Count distinct orders at the final grain.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
