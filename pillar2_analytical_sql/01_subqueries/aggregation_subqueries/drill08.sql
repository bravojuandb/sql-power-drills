-- Drill 08 — Product Totals vs Average Product Totals
-- Business question: Which products have total sold quantity above the average total sold quantity across products?
-- Expected output: product_id, total_quantity
-- Notes: aggregate once per product, then compare to an outer average
-- Tables used: order_details

-- Use a subquery or derived table to compute product totals first.
