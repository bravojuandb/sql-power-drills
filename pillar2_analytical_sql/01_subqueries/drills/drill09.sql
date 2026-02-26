
-- Drill 09 — Subqueries: Customers who have purchsed a specific product.
-- Business question: Give me all the customers who bought product 37 (Chartreuse verte) 
-- Expected output: customer_id
-- Notes: Once using a subquery (IN or EXISTS), once using a JOIN.
--        Verify that both approaches return the same result.
-- Tables used: Orders and Order Details

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

/*
SELECT DISTINCT
    o.CustomerID AS customer_id
FROM Orders o
JOIN "Order Details" od
ON o.OrderID = od.OrderID
WHERE od.ProductID = 37
ORDER BY o.CustomerID ASC;
*/

SELECT DISTINCT
    o.CustomerID
FROM Orders o
WHERE EXISTS (
    SELECT 1
    FROM "Order Details" od
    WHERE od.OrderID = o.OrderID
      AND od.ProductID = 37
)
ORDER BY o.CustomerID ASC;

/*
NOTES:

Question answered
	•	JOIN: “Show me the rows that match across tables.”
	•	Subquery (EXISTS / IN): “Does a matching row exist?”
JOINs combine data; subqueries often filter based on a condition.

Process (how the engine thinks)
	•	JOIN: Build the joined rows first → then filter → then deduplicate if needed.
	•	EXISTS subquery: For each outer row, check for a match → stop at the first hit (yes/no logic).

Efficiency
	•	JOIN: Can create many intermediate rows; often needs DISTINCT.
	•	EXISTS: Can short-circuit early; often more efficient for existence checks.
	•	Modern optimizers may rewrite one into the other, but intent still matters.

Rule of thumb
	•	Use JOIN when you need columns from multiple tables.
	•	Use EXISTS when you only care whether something happened.

IN vs EXISTS 
	•	IN:
            “Is this value inside this list?”
	•	EXISTS:
            “Does at least one row satisfy this condition?”


*/