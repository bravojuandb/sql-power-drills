# Pillar 3: Data Engineering SQL (Building Reliable Data Systems)

## How to run

This pillar is designed primarily for PostgreSQL.

The drills in this pillar will focus on SQL statements that create, modify, validate, and operate data structures. Unlike analytical SQL, many exercises will change database state, so each chapter should be practiced in a disposable local database.

Recommended workflow:

1. Create a local practice database.
2. Load the chapter dataset or setup script when one is provided.
3. Run each drill inside a transaction while learning.
4. Inspect the result.
5. Commit only when the change is expected, or roll back to reset.

Example:

```sql
BEGIN;

-- run the drill statement here

ROLLBACK;
```

## Folder structure

The folder structure separates operational SQL skills from analytical query-writing skills:

- **First level:** Pillar folder -> a major domain (Data Engineering SQL)
- **Second level:** Chapters -> practical data engineering responsibilities
- **Third level:** Future drills (`drill01.sql` ... `drillXX.sql`) -> hands-on exercises when implemented

```bash
pillar3_data_engineering_sql/
├── 00_datasets/
│   └── README.md
│
├── 01_ddl_schema_design/
│   └── README.md
│
├── 02_insert_update_delete/
│   └── README.md
│
├── 03_transactions/
│   └── README.md
│
├── 04_upserts_and_merge/
│   └── README.md
│
├── 05_staging_and_etl_patterns/
│   └── README.md
│
├── 06_constraints_and_data_quality/
│   └── README.md
│
├── 07_indexes_and_performance_basics/
│   └── README.md
│
└── README.md
```

## Current Status

This pillar currently contains the chapter structure and planned drill prompts only.

No drill SQL files have been created yet.

## Subjects Covered

**1. DDL & Schema Design**

CREATE, ALTER, DROP, column types, primary keys, foreign keys, default values, and schema evolution.

**2. INSERT, UPDATE & DELETE**

Writing data safely, modifying existing records, deleting rows with clear filters, and checking row counts before changing data.

**3. Transactions**

BEGIN, COMMIT, ROLLBACK, savepoints, failure recovery, and thinking about database state as a unit of work.

**4. Upserts & MERGE**

Handling duplicate keys, refreshing existing records, inserting new records, and comparing `INSERT ... ON CONFLICT` with `MERGE`.

**5. Staging & ETL Patterns**

Loading raw data into staging tables, cleaning it, deduplicating it, and promoting it into final tables.

**6. Constraints & Data Quality**

Using NOT NULL, UNIQUE, CHECK, and foreign keys to protect data, plus validation queries for quality checks.

**7. Indexes & Performance Basics**

Creating indexes for lookup patterns, reading query plans, and understanding the write/read tradeoff of indexes.
