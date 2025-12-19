
-- Drill 06 — Subqueries: Customers with most recent order
-- Business question: What is the most recent order date for each customer?
-- Expected output: customer, most_recent_order
-- Notes: MAX(OrderDate) returns the most recent order for the current customer
-- Tables used: Customers, Orders

SELECT 
     c.CustomerID AS customer_id,
     c.ContactName AS contact_name,
     (
        SELECT MAX(o.OrderDate)
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
     ) AS most_recent_order
FROM Customers c
ORDER BY most_recent_order DESC;