-- Date:      2026-11-17
-- Level:     easy
-- Topics:    joins, filters, inventory
-- Dataset:   Northwind (PostgreSQL)
--
-- Business question:
--   Which active products are at or below their reorder level with nothing
--   on order, and which supplier do we need to call for each one?
--
-- Business context:
--   The purchasing manager wants the list of products to restock today.
--   Discontinued products must not be reordered.
--
-- Expected grain:   one row per product
-- Expected columns: product_id, product_name, supplier_name (company_name),
--                   units_in_stock, reorder_level, units_on_order
--                   ordered by units_in_stock ascending, then product_id
-- Tables used:      products, suppliers


-- =====================================================================
-- MY SOLUTION (before review, as submitted from pgAdmin)
-- =====================================================================

SELECT 
	p.product_id,
	p.product_name,
	s.company_name,
	p.units_in_stock,
	p.reorder_level,
	p.units_on_order
FROM products p
JOIN suppliers s
	ON p.supplier_id = s.supplier_id
WHERE p.units_in_stock < p.reorder_level
	AND p.discontinued = 0
ORDER BY p.units_in_stock ASC, p.product_id;

-- =====================================================================
-- PROCESS NOTES (optional)
-- =====================================================================
-- I finished in 12 minutes.
-- The join path was easy: products -> suppliers.
-- I remembered to exclude discontinued products.
-- I read "at or below" as "below" and used <.
-- I forgot the "nothing on order" condition, so I never filtered units_on_order.
-- I also kept company_name and did not rename it to supplier_name.


-- =====================================================================
-- REVIEW
-- =====================================================================
-- What worked:
--   The join with suppliers, the discontinued filter, the columns and the
--   order with the tie-breaker on product_id. Done in 12 minutes.
--
-- What was wrong or fragile (and why):
--   1. I used < instead of <=. The question says "at or below" the reorder
--      level. A product with 10 in stock and a reorder level of 10 needs
--      restocking, but my query left it out.
--   2. I did not filter units_on_order = 0. My list included products that
--      already have an order on the way. Purchasing would call suppliers
--      for nothing.
--   3. I did not rename company_name to supplier_name, so the column did
--      not match the header.
--
-- Key takeaway:
--   Turn every phrase of the question into a condition, one by one:
--   "active", "at or below", "nothing on order". Then check each one in the
--   WHERE before running the query.


-- =====================================================================
-- FINAL VERSION
-- =====================================================================

SELECT
    p.product_id,
    p.product_name,
    s.company_name AS supplier_name,
    p.units_in_stock,
    p.reorder_level,
    p.units_on_order
FROM products p
JOIN suppliers s
    ON s.supplier_id = p.supplier_id
WHERE p.units_in_stock <= p.reorder_level
    AND p.units_on_order = 0
    AND p.discontinued = 0
ORDER BY p.units_in_stock ASC, p.product_id;

-- =====================================================================
-- BUSINESS INSIGHT
-- =====================================================================
-- The result is the list of active products that purchasing should reorder
-- today. The ones at the top, with the least stock, are the most urgent, and
-- each row shows the supplier to call.