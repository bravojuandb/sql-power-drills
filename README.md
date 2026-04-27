# sql-power-drills

<table>
  <tr>
    <td width="50%" valign="top">
      Καλλίστη ἁρμονίη<br>
      ἀφανὴς<br>
      φανερῆς ἀρείων.<br><br>
      <strong>— Ἡράκλειτος</strong>
    </td>
    <td width="50%" valign="top">
      <em>The finest harmony<br>
      is the hidden,<br>
      better than the visible.</em><br><br>
      <strong>— Heraclitus</strong>
    </td>
  </tr>
</table>

## Overview

`sql-power-drills` is a structured SQL practice repository designed to build skill through repetition, progression, and deliberate problem solving.

The goal is not only to learn syntax, but to develop the habits used in real analytical work: reading table grain, choosing the right query pattern, and writing SQL that stays correct as questions become more complex.

The repository is organized into learning pillars. Each pillar uses a specific environment and focuses on a different layer of SQL development.

## Who This Is For

This repository is intended for:

- learners building confidence with SQL through repeated practice
- analysts who want more structure than isolated tutorial exercises
- SQL users moving from basic query writing into analytical and multi-step problem solving

## Start Here

1. Choose a pillar based on the skill you want to practice.
2. Follow that pillar's setup instructions and load the required dataset.
3. Open the first drill in the chapter you want to work on and run it locally.

## Repository Structure

```bash
sql-power-drills/
├── pillar1_query_fluency/
├── pillar2_analytical_sql/
│   ├── 00_datasets/
│   ├── 01_subqueries/
│   │   ├── core_subqueries/
│   │   └── aggregation_subqueries/
│   ├── 02_ctes/
│   ├── 03_window_functions/
│   ├── 04_conditional_logic/
│   ├── 05_multi_joins/
│   └── 06_applied_analytical_patterns/
│       ├── cohort_analysis/
│       └── top_n_per_group/
├── pillar3_data_engineering_sql/
│   ├── 00_datasets/
│   ├── 01_ddl_schema_design/
│   ├── 02_insert_update_delete/
│   ├── 03_transactions/
│   ├── 04_upserts_and_merge/
│   ├── 05_staging_and_etl_patterns/
│   ├── 06_constraints_and_data_quality/
│   └── 07_indexes_and_performance_basics/
└── README.md
```

## Pillars

### [Pillar 1: Query Fluency](pillar1_query_fluency/README.md) ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)

This is simple core `SQL fluency` through short drills built to make query writing fast, correct, and comfortable.

Topics include `SELECT`, `WHERE`, `ORDER BY`, aggregations, joins, and `NULL` handling.

This pillar uses the [Chinook database](https://github.com/lerocha/chinook-database) with [SQLite](https://sqlite.org/index.html).

### [Pillar 2: Analytical SQL](pillar2_analytical_sql/README.md) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)

It focuses on `analytical SQL`: breaking business questions into layers, controlling row grain, and composing multi-step logic that remains readable.

The chapter sequence moves from foundational analytical patterns to more applied ones:

- `01_subqueries` introduces scalar, set, existence, correlated, and aggregation-safe subqueries
- `02_ctes` focuses on naming intermediate steps and structuring multi-stage transformations
- `03_window_functions` focuses on ranking, running totals, moving averages, and row-to-row comparison
- `04_conditional_logic` focuses on `CASE`, bucketing, flags, and conditional aggregates
- `05_multi_joins` focuses on dimension enrichment and preserving grain across multi-hop joins
- `06_applied_analytical_patterns` combines earlier skills into cohort analysis, top-N per group, latest-row logic, retention, and period-over-period analysis

This pillar is designed primarily for PostgreSQL using the [Northwind SQL dataset](pillar2_analytical_sql/00_datasets/northwind.sql).

PostgreSQL is the recommended engine for this pillar because it better supports the analytical patterns practiced here.

You can run the queries with `psql` or a GUI such as `pgAdmin`. Setup instructions are available in [the PostgreSQL dataset guide](pillar2_analytical_sql/00_datasets/README.md).

### [Pillar 3: Data Engineering SQL](pillar3_data_engineering_sql/README.md) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)

The focus here is `operational SQL` and `data engineering SQL`: creating schemas, changing data safely, managing transactions, loading staged data, enforcing quality rules, and understanding basic performance tradeoffs.

Unlike Pillar 2, which uses the prebuilt Northwind dataset for analysis practice, Pillar 3 is meant to be practiced by creating and evolving your own database objects from scratch, including tables, relationships, constraints, and data changes.

The chapter sequence moves from structural database work to reliable data movement:

- `01_ddl_schema_design` introduces tables, column types, keys, defaults, and schema evolution
- `02_insert_update_delete` focuses on safe data changes and preview-before-write habits
- `03_transactions` focuses on grouping changes, rollback, savepoints, and recovery
- `04_upserts_and_merge` focuses on idempotent loads and source-to-target synchronization
- `05_staging_and_etl_patterns` focuses on raw staging, cleaning, deduplication, and promotion
- `06_constraints_and_data_quality` focuses on protecting tables with constraints and validation queries
- `07_indexes_and_performance_basics` focuses on lookup patterns, query plans, and indexing tradeoffs

This pillar is designed primarily for PostgreSQL because it supports the operational SQL patterns practiced here, including transactions, constraints, indexes, `INSERT ... ON CONFLICT`, and `MERGE`.

## Current Status

- `Pillar 1` is the lightweight entry point for core query practice.
- `Pillar 2` is actively being expanded, with `01_subqueries`, `02_ctes` and `05_multi_joins` currently the most developed chapters.
- `Pillar 3` currently contains the data engineering SQL structure and planned drill prompts.

## Roadmap

Future expansions may include orchestration, cloud storage, warehouse modeling, pipeline architecture, and more advanced performance tuning.
