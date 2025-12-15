# Subqueries — Analytical SQL (Northwind)

This subchapter focuses on **subqueries as a reasoning tool**, not as a syntactic trick.  
All drills are written against the **Northwind base tables** (not views), 
with explicit definitions to avoid ambiguity.

---

## Tables Used

These drills rely on the following core tables:

- **Customers** — customer identity and attributes  
- **Orders** — one row per order (customer → orders)  
- **Order Details** — line items per order (orders → products)  
- **Products** — product catalog and pricing  
- **Suppliers** — product suppliers  
- **Categories** — product grouping  

Primary join paths used throughout:

- `Customers → Orders → Order Details`
- `Products → Order Details → Orders`
- `Suppliers → Products`
- `Categories → Products`

---

## Subquery Drills

### 1. Scalar subquery in `SELECT`
Show each customer and the **total number of orders** they have placed,
using a scalar subquery in the `SELECT` clause.

---

### 2. Scalar subquery in `WHERE`
List products whose **unit price is above the average product price**
across the entire catalog.

---

### 3. `IN` subquery
List customers who have placed **at least one order in 1997**,
using an `IN` subquery.

---

### 4. `NOT IN` trap (NULL behavior)
Attempt to list customers who have **never placed an order** using `NOT IN`.
Observe the incorrect result caused by `NULL`s, then rewrite the query
using `NOT EXISTS`.  
Explain why the presence of `NULL` values causes `NOT IN` to return no rows.

---

### 5. `EXISTS` subquery
List suppliers that **supply at least one product**, using `EXISTS`
rather than a join.

---

### 6. Correlated subquery (per-row maximum)
For each customer, return their **most recent order date**
using a correlated subquery.

---

### 7. Correlated subquery with aggregation
List orders whose **order subtotal** (defined as `SUM(UnitPrice * Quantity * (1 - Discount))` from `Order Details`) is greater than the average subtotal for that same customer.

---

### 8. Derived table subquery (`FROM`)
Build a derived table that calculates **total revenue per customer** (using `SUM(UnitPrice * Quantity * (1 - Discount))`), then select only customers whose revenue is **above the global average**.

---

### 9. Subquery vs JOIN equivalence
Return customers who have **purchased a specific product (by ProductID)**:
- once using a subquery (`IN` or `EXISTS`)
- once using joins

Verify that both approaches return the same result.

---

## Completion Criteria

- Explain **why** each subquery returns one value, many values, or existence only
- Identify when a subquery is **clearer** than a join
- Recognize when a subquery should be rewritten for performance or clarity
