# 02: INSERT, UPDATE & DELETE

## Focus

This chapter practices changing table data directly.

The goal is to build the habit of previewing changes before running them, using precise filters, and checking affected rows after each write.

## Drill Prompt Design

1. Insert one customer row with all required fields.
2. Insert multiple product rows in a single statement.
3. Insert rows into a target table from a SELECT query.
4. Update a single customer status by primary key.
5. Update many rows based on a clear business rule.
6. Convert blank strings into NULL values in a staging table.
7. Delete one test row by primary key.
8. Delete duplicate staging rows while preserving one copy.
9. Preview an UPDATE with SELECT before running the UPDATE.
10. Preview a DELETE with SELECT before running the DELETE.
11. Use `RETURNING` to inspect rows changed by an INSERT, UPDATE, or DELETE.
12. Compare row counts before and after a data change.

## Concepts To Practice

- `INSERT`
- `INSERT ... SELECT`
- `UPDATE`
- `DELETE`
- `RETURNING`
- Safe filters
- Row count checks
- Preview-before-write discipline
