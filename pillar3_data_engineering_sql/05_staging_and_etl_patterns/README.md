# 05: Staging & ETL Patterns

## Focus

This chapter practices moving data from raw input into clean, modeled tables.

The goal is to think in pipeline steps: land raw data, inspect it, clean it, validate it, and promote it.

## Drill Prompt Design

1. Create a raw staging table where every incoming column is stored as text.
2. Insert messy raw rows into staging, including duplicates and invalid values.
3. Build a SELECT that trims strings and normalizes casing.
4. Convert text dates and numeric strings into typed values.
5. Separate valid rows from invalid rows.
6. Deduplicate staging rows using a business key.
7. Insert clean rows from staging into a final table.
8. Record rejected rows in an error table with a rejection reason.
9. Run a full load inside a transaction and roll back if validation fails.
10. Create a repeatable load pattern: truncate staging, load raw, validate, promote.

## Concepts To Practice

- Raw staging tables
- Clean target tables
- Type casting
- Deduplication
- Rejection handling
- Load validation
- Repeatable ETL scripts
- Staging-to-final promotion
