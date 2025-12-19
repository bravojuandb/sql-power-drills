/*

Drill 4 --- `NOT IN` trap (NULL behavior)

Attempt to list customers who have never placed an order using `NOT IN`.
Observe the incorrect result caused by `NULL`s, then rewrite the query
using `NOT EXISTS`.  
Explain why the presence of `NULL` values causes `NOT IN` to return no rows.

0|CustomerID|TEXT|0||1
1|CompanyName|TEXT|0||0
2|ContactName|TEXT|0||0
3|ContactTitle|TEXT|0||0
4|Address|TEXT|0||0
5|City|TEXT|0||0
6|Region|TEXT|0||0
7|PostalCode|TEXT|0||0
8|Country|TEXT|0||0
9|Phone|TEXT|0||0
10|Fax|TEXT|0||0

0|OrderID|INTEGER|1||1
1|CustomerID|TEXT|0||0
2|EmployeeID|INTEGER|0||0
3|OrderDate|DATETIME|0||0
4|RequiredDate|DATETIME|0||0
5|ShippedDate|DATETIME|0||0
6|ShipVia|INTEGER|0||0
7|Freight|NUMERIC|0|0|0
8|ShipName|TEXT|0||0
9|ShipAddress|TEXT|0||0
10|ShipCity|TEXT|0||0
11|ShipRegion|TEXT|0||0
12|ShipPostalCode|TEXT|0||0
13|ShipCountry|TEXT|0||0
*/

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
WHERE NOT EXISTS (. -- Correct
  SELECT 1
  FROM Orders AS o
  WHERE o.CustomerID = c.CustomerID
);