-- Drill 01 — Multi-Join Analytical Patterns: Order header enrichment
-- Business question: Which customer, employee, and shipper are associated with each order?
-- Expected output: order_id, customer_id, company_name, employee_name, shipper_name, order_date
-- Notes: return one row per order and enrich it with names from the related dimension tables
-- Tables used: Orders, Customers, Employees, Shippers

SELECT 
    o.order_id,
    o.customer_id,
    c.company_name,
    e.first_name || ' ' || e.last_name AS employee_name,
    sh.company_name AS shipper_name,
    o.order_date
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN employees e
    ON o.employee_id = e.employee_id
JOIN shippers sh
    ON sh.shipper_id = o.ship_via
ORDER BY o.order_id;