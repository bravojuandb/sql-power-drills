
-- Drill 02 — CTE: Compute total revenue per order
-- Business question: List all orders with their total revenue
-- Expected output: order_id, customer_id, order_total
-- Notes: total revenue formula (UnitPrice × Quantity × (1 − Discount))
-- Tables used: Orders, Order Details

/*
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

WITH order_totals AS(
    SELECT 
        od.OrderID AS order_id,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS order_total 
    FROM "Order Details" od 
    GROUP BY od.OrderID
)
SELECT 
    o.OrderID AS order_id,
    o.CustomerID AS customer_id,
    ROUND(ot.order_total, 2) AS order_total
FROM Orders o 
JOIN order_totals ot 
    ON o.OrderID = ot.order_id 
ORDER BY ot.order_total DESC;