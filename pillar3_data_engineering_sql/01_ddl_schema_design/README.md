# 01: DDL & Schema Design

## Focus

This chapter practices defining and changing database structures.

The goal is to become comfortable with SQL that shapes the database itself: tables, columns, data types, keys, defaults, and relationships.

## Drill Prompt Design

1. Create a `customers` table with an integer primary key, required name fields, and a created timestamp.
2. Create an `orders` table connected to `customers` through a foreign key.
3. Add a new nullable column to an existing table without breaking existing rows.
4. Add a default value to a status column and insert rows that rely on the default.
5. Rename a column while preserving the existing data.
6. Change a column type safely after checking the current values.
7. Create a lookup table and connect it to a fact-like table.
8. Drop a temporary practice table after confirming it is not referenced.
9. Design a table for an incoming raw feed where all values arrive as text.
10. Design a clean final table for the same feed using stricter types.

## Concepts To Practice

- `CREATE TABLE`
- `ALTER TABLE`
- `DROP TABLE`
- Primary keys
- Foreign keys
- Defaults
- Nullable vs required columns
- Raw tables vs clean modeled tables
