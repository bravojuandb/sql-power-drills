-- Drill 02 - Business Question Multi-Joins: Category expansion opportunities
-- Business question: Which high-value customers have not purchased from a target category?
-- Expected output: customer_id, company_name, customer_revenue, missing_category_id, missing_category_name
-- Grain: one row per customer and missing category
-- Notes: first calculate total customer revenue, then compare each customer to the
--        category list. Preserve customers who have no purchases in the category.
-- Tables used: customers, orders, order_details, products, categories


WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.company_name,
        COALESCE(
            ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2),
            0
        ) AS customer_revenue
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.company_name
),

customer_categories AS (
    SELECT DISTINCT
        c.customer_id,
        cat.category_id
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN products p
        ON od.product_id = p.product_id
    JOIN categories cat
        ON p.category_id = cat.category_id
)

SELECT 
    cr.customer_id,
    cr.company_name,
    cr.customer_revenue,
    cat.category_id AS missing_category_id,
    cat.category_name AS missing_category_name
FROM customer_revenue cr
CROSS JOIN categories cat
LEFT JOIN customer_categories cc
    ON cr.customer_id = cc.customer_id
   AND cat.category_id = cc.category_id
WHERE cc.category_id IS NULL
  AND cr.customer_revenue > 0
ORDER BY 
    cr.customer_revenue DESC,
    cr.customer_id,
    missing_category_id;