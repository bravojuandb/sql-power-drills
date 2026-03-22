-- Drill 05 — CTE: Order totals from line totals
-- Business question: Compute total revenue per customer from order-level totals
-- Expected output: customerid, customer_total
-- Notes: first aggregate line totals into order totals, then roll them up by customer
-- Tables used: Orders, Order Details

WITH order_totals AS (
    SELECT
        orderid,
        SUM(unitprice * quantity * (1 - discount)) AS order_total
    FROM "order details"
    GROUP BY orderid
)
SELECT
    o.customerid,
    SUM(ot.order_total) AS customer_total
FROM order_totals ot
JOIN orders o
    ON ot.orderid = o.orderid
GROUP BY o.customerid
ORDER BY customer_total DESC;
