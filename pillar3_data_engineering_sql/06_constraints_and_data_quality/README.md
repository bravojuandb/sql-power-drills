# 06: Constraints & Data Quality

## Focus

This chapter practices using the database to protect data quality.

The goal is to understand which rules belong in constraints and which rules are better checked with validation queries.

## Drill Prompt Design

1. Add a NOT NULL constraint after finding and fixing existing NULL values.
2. Add a UNIQUE constraint to protect a natural key.
3. Add a CHECK constraint for a positive numeric value.
4. Add a CHECK constraint for an allowed status list.
5. Add a foreign key and test what happens with invalid references.
6. Find rows that would fail a planned constraint before adding it.
7. Write a validation query that checks for duplicate business keys.
8. Write a validation query that checks for orphan records.
9. Write a validation query that checks whether totals reconcile between tables.
10. Create a simple data quality report with pass/fail flags.

## Concepts To Practice

- `NOT NULL`
- `UNIQUE`
- `CHECK`
- Foreign keys
- Orphan detection
- Duplicate detection
- Reconciliation checks
- Constraint-first thinking
