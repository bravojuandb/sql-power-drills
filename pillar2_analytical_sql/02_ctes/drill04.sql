
-- Drill 04 — CTE: Multiple CTEs: total orders and total revenue.
-- Business question: Total orders and total revenue per customer
-- Expected output: customer_id, company_name, orders_count, customer_revenue
-- Notes:
-- Tables used: Customers, Orders, Order Details

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

cid  name       type     notnull  dflt_value  pk
---  ---------  -------  -------  ----------  --
0    OrderID    INTEGER  1                    1 
1    ProductID  INTEGER  1                    2 
2    UnitPrice  NUMERIC  1        0           0 
3    Quantity   INTEGER  1        1           0 
4    Discount   REAL     1        0           0 
*/


WITH total_orders AS (
  SELECT 
    c.CustomerID AS customer_id,
    c.CompanyName AS company_name,
    COUNT(*) AS orders_count
  FROM Customers c
  JOIN Orders o ON o.CustomerID = c.CustomerID
  GROUP BY c.CustomerID, c.CompanyName
),
total_revenue AS (
  SELECT 
    o.CustomerID AS customer_id,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS customer_revenue
  FROM Orders o
  JOIN "Order Details" od ON od.OrderID = o.OrderID
  GROUP BY o.CustomerID
)
SELECT
  t_orders.customer_id,
  t_orders.company_name,
  t_orders.orders_count,
  t_rev.customer_revenue
FROM total_orders AS t_orders
JOIN total_revenue AS t_rev
  ON t_rev.customer_id = t_orders.customer_id
ORDER BY t_orders.orders_count DESC, t_rev.customer_revenue DESC;