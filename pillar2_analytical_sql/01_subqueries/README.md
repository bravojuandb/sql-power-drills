# Subqueries — Analytical SQL (Northwind)

This chapter focuses on **subqueries as a reasoning tool**, not as a syntactic trick.  

All drills are written against the **Northwind base tables** used throughout Pillar 2.

---

## Chapter Structure

`01_subqueries` is currently split into two drill tracks:

### 1. `core_subqueries/`
This track introduces the main subquery forms:

- scalar subqueries
- `IN` / `EXISTS`
- `NOT EXISTS` and the `NOT IN` null trap
- correlated subqueries
- derived-table subqueries in `FROM`
- subquery vs join comparison

Current drill count: `drill01.sql` to `drill09.sql`

### 2. `aggregation_subqueries/`
This track focuses on subqueries used to **protect grain and stage aggregation**:

- pre-aggregation before joins
- grouped comparisons
- distinct counting habits
- `WHERE` vs `HAVING`
- reconciliation checks across aggregation paths

Current drill count: `drill01.sql` to `drill10.sql`

This second track has its own local README with a more detailed drill-by-drill description:
[aggregation_subqueries/README.md](aggregation_subqueries/README.md)

---

## Tables Used

These drills rely on the following core tables:

- `customers`
- `orders`
- `order_details`
- `products`
- `suppliers`
- `categories`

Primary join paths used throughout:

- `customers -> orders -> order_details`
- `products -> order_details -> orders`
- `suppliers -> products`
- `categories -> products`

---

## Completion Criteria

By the end of `01_subqueries`, the learner should be able to:

- explain why a subquery returns one value, many values, or existence only
- identify when a subquery is clearer than a join
- recognize when a subquery should be rewritten for performance or clarity
- identify the intended output grain before aggregating
- use subqueries to protect grouped logic from accidental row multiplication
