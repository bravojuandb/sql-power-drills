# 07: Indexes & Performance Basics

## Focus

This chapter practices the basics of indexing and query plan inspection.

The goal is not deep database tuning yet. The goal is to understand why indexes exist, when they help, and what tradeoffs they introduce.

## Drill Prompt Design

1. Run a filtered lookup query before adding an index.
2. Create an index on a frequently filtered column.
3. Compare the query plan before and after creating the index.
4. Create a composite index for a two-column filter.
5. Test whether column order matters in a composite index.
6. Create an index that supports a foreign key lookup.
7. Identify a query where an index is not useful because too many rows match.
8. Drop an unused practice index.
9. Compare insert speed conceptually before and after adding several indexes.
10. Use `EXPLAIN` to describe how PostgreSQL plans a query.

## Concepts To Practice

- `CREATE INDEX`
- `DROP INDEX`
- Single-column indexes
- Composite indexes
- Selectivity
- Lookup patterns
- `EXPLAIN`
- Read/write tradeoffs
