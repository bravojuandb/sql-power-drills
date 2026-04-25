-- Drill 12 - Business Question Multi-Joins: Order profitability proxy
-- Business question: Which orders combine high revenue, high discounts, and high freight?
-- Expected output: order_id, customer_id, company_name, employee_name, shipper_name, order_revenue, discount_value, freight
-- Grain: one row per order
-- Notes: aggregate order line revenue and discount value before adding customer,
--        employee, shipper, and freight fields.
-- Tables used: orders, customers, employees, shippers, order_details

-- Write your query below.
