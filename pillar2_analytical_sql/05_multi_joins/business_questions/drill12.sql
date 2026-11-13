-- Drill:     12 — Order profitability proxy
-- Topics:    multi-joins, pre-aggregation
-- Dataset:   Northwind (PostgreSQL)
-- Solved:    not yet
--
-- Business question:
--   Which orders combine high revenue, high discounts, and high freight?
--
-- Business context:
--   The finance analyst wants an order-level view to flag orders where
--   discounts and freight may be eroding margin.
--
-- Expected grain:   one row per order
-- Expected columns: order_id, customer_id, company_name, employee_name,
--                   shipper_name, order_revenue, discount_value, freight
-- Tables used:      orders, customers, employees, shippers, order_details
--
-- Notes:
--   aggregate order line revenue and discount value before adding customer,
--   employee, shipper, and freight fields.


-- =====================================================================
-- SOLUTION
-- =====================================================================



-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- <where I got stuck, what I tried that didn't work>
