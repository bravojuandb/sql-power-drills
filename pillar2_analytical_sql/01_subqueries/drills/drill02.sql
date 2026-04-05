-- Drill 02 — Scalar Subquery in WHERE
-- Business question: Which products are priced above the average product price?
-- Expected output: product_id, unit_price
-- Notes: use a scalar subquery in the WHERE clause to compare each product price to the catalog average
-- Tables used: products

-- Scalar subquery (simplest approach)
-- (Compute the AVG once, then filter rows)


SELECT 
	product_id,
	unit_price
FROM products
WHERE unit_price > (
    SELECT 
        AVG(unit_price) 
        FROM products
);

-- Window function approach
-- (Compute AVG once, attach it to every row, apply filter.)
/*
SELECT
    product_id,
    unit_price
FROM (
    SELECT
        product_id,
        unit_price,
        AVG(unit_price) OVER () AS avg_unit_price
    FROM products
)
WHERE unit_price > avg_unit_price;
*/
