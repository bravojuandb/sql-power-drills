-- Drill 10 — Reconciliation Habit
-- Business question: Does total line revenue match the sum of customer-level revenues?
-- Expected output: line_revenue_total, customer_revenue_total
-- Notes: use separate subqueries to reconcile totals across two aggregation paths
-- Tables used: orders, order_details

-- Required shape:
-- 1. one scalar subquery for total line revenue
-- 2. one scalar subquery that sums a customer-level revenue subquery
-- Both totals should match.

SELECT
    (
        SELECT SUM(unit_price * quantity * (1 - discount))
        FROM order_details
    ) AS line_revenue_total,
    (
        SELECT SUM(customer_revenue)
        FROM (
            SELECT
                o.customer_id,
                SUM(od.unit_price * od.quantity * (1 - od.discount)) AS customer_revenue
            FROM orders o
            JOIN order_details od
                ON o.order_id = od.order_id
            GROUP BY o.customer_id
        ) AS cr
    ) AS customer_revenue_total;