-- Drill 04 — `NOT IN` Trap
-- Business question: Which customers have never placed an order?
-- Expected output: customer_id, company_name
-- Notes: show why `NOT IN` breaks with `NULL`, then rewrite with `NOT EXISTS`
-- Tables used: customers, orders

/*

-- WRONG / fragile if the subquery can produce NULL
-- Attempt to list customers who never placed an order.
SELECT
  c.CustomerID,
  c.CompanyName
FROM Customers c
WHERE c.CustomerID NOT IN (  -- Incorrect
  SELECT o.CustomerID
  FROM Orders o
);

-- Check if there are any NULLS in o.CustomerID 
-- Is there any unknown / not recorded value in CustomerId field?
SELECT COUNT(*) AS null_customer_ids_in_orders
FROM Orders
WHERE CustomerID IS NULL;

*/

-- Correct: NULL-safe anti-join
SELECT
  c.CustomerID,
  c.CompanyName
FROM Customers AS c
WHERE NOT EXISTS ( -- Correct
  SELECT 1
  FROM Orders AS o
  WHERE o.CustomerID = c.CustomerID
);
