-- Drill 11 — Window Functions: Order vs customer average
-- Business question: How does each order total compare to the average order total for that same customer?
-- Expected output: customer_id, order_id, order_total, customer_avg_order_total
-- Notes: compute one row per order first, then use a windowed average over customer partitions
-- Tables used: Orders, Order Details

