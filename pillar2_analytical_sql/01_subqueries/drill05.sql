
-- Drill 05 — Subqueries: Suppliers that supply at least one product.
-- Business question: Does at least one row exist in Products for this supplier?
-- Expected output: supplier
-- Notes: Use EXISTS rather than a join
-- Tables used: Suppliers, Products

/*

Shape of an EXISTS query:

SELECT ...
FROM outer_table
WHERE EXISTS (
    SELECT 1
    FROM inner_table
    WHERE inner_table.fk = outer_table.pk
);

*/

SELECT SupplierID 
FROM Suppliers s
WHERE EXISTS (  -- EXISTS evaluates row existence (at least one product row for this supplier)
    SELECT 1
    FROM Products p
    WHERE p.SupplierID = s.SupplierID
);