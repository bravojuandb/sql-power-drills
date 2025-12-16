/*

Drill 2 --- Scalar subquery in `WHERE`

List products whose unit price is above the average product price
across the entire catalog.

0|ProductID|INTEGER|1||1
1|ProductName|TEXT|1||0
2|SupplierID|INTEGER|0||0
3|CategoryID|INTEGER|0||0
4|QuantityPerUnit|TEXT|0||0
5|UnitPrice|NUMERIC|0|0|0
6|UnitsInStock|INTEGER|0|0|0
7|UnitsOnOrder|INTEGER|0|0|0
8|ReorderLevel|INTEGER|0|0|0
9|Discontinued|TEXT|1|'0'|0

*/

-- Scalar subquery (simplest approach)
-- (Compute the AVG once, then filter rows)

SELECT
    ProductID,
    UnitPrice
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products
);

-- Window function approach
-- (Compute AVG once, attach it to every row, apply filter.)

SELECT
    ProductID,
    UnitPrice
FROM (
    SELECT
        ProductID,
        UnitPrice,
        AVG(UnitPrice) OVER () AS avg_unit_price
    FROM Products
)
WHERE UnitPrice > avg_unit_price;