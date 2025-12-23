
-- Drill 01 — CTE: Customers who have placed at least one order.
-- Business question: List active customers
-- Expected output: customer_id, company_name, orders_count
-- Notes: 
-- Tables used: Customers, Orders

/*
cid  name          type  notnull  dflt_value  pk
---  ------------  ----  -------  ----------  --
0    CustomerID    TEXT  0                    1 
1    CompanyName   TEXT  0                    0 
2    ContactName   TEXT  0                    0 
3    ContactTitle  TEXT  0                    0 
4    Address       TEXT  0                    0 
5    City          TEXT  0                    0 
6    Region        TEXT  0                    0 
7    PostalCode    TEXT  0                    0 
8    Country       TEXT  0                    0 
9    Phone         TEXT  0                    0 
10   Fax           TEXT  0                    0 

cid  name            type      notnull  dflt_value  pk
---  --------------  --------  -------  ----------  --
0    OrderID         INTEGER   1                    1 
1    CustomerID      TEXT      0                    0 
2    EmployeeID      INTEGER   0                    0 
3    OrderDate       DATETIME  0                    0 
4    RequiredDate    DATETIME  0                    0 
5    ShippedDate     DATETIME  0                    0 
6    ShipVia         INTEGER   0                    0 
7    Freight         NUMERIC   0        0           0 
8    ShipName        TEXT      0                    0 
9    ShipAddress     TEXT      0                    0 
10   ShipCity        TEXT      0                    0 
11   ShipRegion      TEXT      0                    0 
12   ShipPostalCode  TEXT      0                    0 
13   ShipCountry     TEXT      0                    0 
*/


WITH customer_orders AS (
    SELECT 
        o.CustomerID AS customer_id,
        COUNT(*) AS orders_count
    FROM Orders o
    GROUP BY o.CustomerID
)
SELECT 
    c.CustomerID AS customer_id,
    c.CompanyName AS company_name,
    co.orders_count
FROM Customers c
JOIN customer_orders co 
ON c.CustomerID = co.customer_id 
ORDER BY co.orders_count DESC;

-- Notes:
-- 1. Create a customer level fact: How many order does a customer have?
--      this is the aggregation step, before any join.
--      the cte is reusable.
--      there's no need of filtering, it includes at least one oreder.
-- 2. enrich that fact with customer attributes: What is customer called?