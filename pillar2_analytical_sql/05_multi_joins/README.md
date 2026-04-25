# Multi-Join Analytical Patterns

This chapter focuses on joining several tables without losing control of grain.
You will use multi-hop joins to enrich facts with dimensions, trace relationships
across the schema, and answer broader analytical questions without accidentally
multiplying rows.

All drills are written against the Northwind base tables used throughout Pillar 2.

---

## Folder Progression

- `warmup/` - smaller join drills for building comfort with two-table and short-path joins
- `core_multi_joins/` - the original full multi-join drill set
- `business_questions/` - scenario-style prompts focused on deciding what the business needs answered

---

## Tables Used

These drills mainly rely on:

- `customers`
- `orders`
- `order_details`
- `products`
- `categories`
- `suppliers`
- `employees`
- `shippers`

Primary join paths used throughout:

- `customers -> orders`
- `orders -> order_details`
- `order_details -> products`
- `products -> categories`
- `products -> suppliers`
- `orders -> employees`
- `orders -> shippers`

---

## Multi-Join Habits

Before solving each drill, pause and identify:

1. which table is the fact table and which tables are dimensions
2. the intended grain of the final answer
3. where row multiplication can happen across one-to-many relationships
4. whether aggregation should happen before or after the joins
5. whether a left join is needed to preserve unmatched rows

---

## Completion Criteria

- Join through the schema without losing track of the output grain
- Prevent accidental duplication in one-to-many paths
- Use distinct counting only when it truly matches the business question
- Choose inner vs left joins intentionally
- Pre-aggregate when it protects the analysis from row multiplication
