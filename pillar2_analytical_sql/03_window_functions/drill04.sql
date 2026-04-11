-- Drill 04 — Window Functions: RANK() vs DENSE_RANK()
-- Business question: How do product rankings differ when ties are handled with RANK() versus DENSE_RANK()?
-- Expected output: product_id, total_quantity, sales_rank, dense_sales_rank
-- Notes: aggregate sold quantity per product first, then compare the two ranking functions
-- Tables used: Order Details

