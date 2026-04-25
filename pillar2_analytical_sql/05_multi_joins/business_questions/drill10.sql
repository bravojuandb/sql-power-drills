-- Drill 10 - Business Question Multi-Joins: Supplier customer footprint
-- Business question: Which suppliers reach the broadest set of customers across countries?
-- Expected output: supplier_id, supplier_name, customer_country, customers_count, orders_count, supplier_revenue
-- Grain: one row per supplier and customer country
-- Notes: count distinct customers and distinct orders after joining through products
--        and order lines. Revenue remains at order-line grain.
-- Tables used: suppliers, products, order_details, orders, customers

-- Write your query below.
