/*
Given these these two tables:

    customers(customer_id, name, country)

    orders(order_id, customer_id, order_date, total_amount)


Perform the following queries:

    1. INNER JOIN – 
        Show each customer’s name alongside their order IDs.

    2. GROUP BY + SUM – 
        Calculate total spending per customer.

    3. CASE WHEN – 
        Label each customer as "High Spender" 
        if total spending > 500, else "Regular".

    4. Simple WITH (CTE) – 
        Use a CTE to first compute each customer’s total spending, 
        then filter only "High Spenders".

    5. WHERE with filters – 
        Find all orders above 100 from customers in "Spain" only.


INNER JOINs → Core for combining data from multiple tables.

Aggregations (GROUP BY, SUM) → Used constantly in reporting, pipeline validation, and data profiling.

Conditional logic (CASE WHEN) → Essential for feature creation, categorization, and transformation.

CTEs → Foundation for breaking complex logic into readable steps.

Filtering (WHERE) → Core to query performance and correctness.

COALESCE / NULL handling → A surprisingly common pain point in real pipelines.
*/

-- 1 INNER JOIN

SELECT c.name, o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;


-- 2.1 Total spending per customer (INNER JOIN: only customers with orders)

SELECT 
    c.customer_id
    c.name, 
    SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 2.2 Total spending per customer, including customers with zero orders (LEFT JOIN)

SELECT
    c.customer_id
    c.name
    COALESCE(SUM(o.total_amount), 0) AS total_spending
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 3.1

SELECT
  c.customer_id,
  c.name,
  COALESCE(SUM(o.total_amount), 0) AS total_spending,
  CASE
    WHEN COALESCE(SUM(o.total_amount), 0) > 500 THEN 'High Spender'
    ELSE 'Regular'
  END AS spender_type
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;


-- 3.2

SELECT
  c.customer_id,
  c.name,
  COALESCE(SUM(o.total_amount), 0) AS total_spending,
  CASE
    WHEN COALESCE(SUM(o.total_amount), 0) > 500 THEN 'High Spender'
    ELSE 'Regular'
  END AS spender_type
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

-- 4.1

WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(o.total_amount), 0) AS total_spending
  FROM customers c
  LEFT JOIN orders o
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_id, c.name
)
SELECT *
FROM customer_totals
WHERE total_spending > 500;

-- 4.2 

WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(o.total_amount), 0) AS total_spending
  FROM customers c
  LEFT JOIN orders o
    ON o.customer_id = c.customer_id
  GROUP BY c.customer_id, c.name
)
SELECT
  customer_id,
  name,
  total_spending,
  CASE
    WHEN total_spending = 0 THEN 'Bad Customer'
    WHEN total_spending > 500 THEN 'High Spender'
    ELSE 'Regular'
  END AS spender_type
FROM customer_totals
ORDER BY total_spending DESC, name;

-- 5

SELECT
  c.name,
  o.order_id,
  o.total_amount,
  c.country
FROM customers AS c
JOIN orders AS o
  ON o.customer_id = c.customer_id
WHERE o.total_amount > 100
  AND c.country = 'Spain';

