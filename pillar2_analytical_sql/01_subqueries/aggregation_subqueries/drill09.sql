-- Drill 09 — Weighted Revenue Thinking
-- Business question: What is total revenue per category?
-- Expected output: category_id, category_name, category_revenue
-- Notes: use revenue, not average price, as the business metric
-- Tables used: categories, products, order_details

-- Revenue formula:
-- unit_price * quantity * (1 - discount)
