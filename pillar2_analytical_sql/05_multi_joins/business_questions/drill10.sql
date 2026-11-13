-- Drill:     10 — Supplier customer footprint
-- Topics:    multi-joins, count distinct
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which suppliers reach the broadest set of customers across countries?
--
-- Business context:
--   The purchasing manager wants to know which suppliers' products reach
--   customers in many countries.
--
-- Expected grain:   one row per supplier and customer country
-- Expected columns: supplier_id, supplier_name, customer_country,
--                   customers_count, orders_count, supplier_revenue
-- Tables used:      suppliers, products, order_details, orders, customers
--
-- Notes:
--   count distinct customers and distinct orders after joining through
--   products and order lines. Revenue remains at order-line grain.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
