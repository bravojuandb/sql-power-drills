<h1 align="center">sql-power-drills</h1>

<p align="center">
  Καλλίστη ἁρμονίη ἀφανὴς φανερῆς ἀρείων<br>
  <em>The finest harmony is the hidden, better than the visible.</em><br>
  <sub>— Heraclitus</sub>
</p>

## Overview

`sql-power-drills` is a personal SQL practice repository. The goal is not only to learn syntax, but to build the habits of real analytical work: reading table grain, choosing the right query pattern, and writing SQL that stays correct as questions get more complex.

It has two parts:

- **[Business questions](business_questions/README.md)**: the main ongoing practice. One stakeholder-style question per session, organized by date and level.
- **Pillars**: a topic-based curriculum of short drills, used for targeted practice and as reference.

## Business Questions

Each session answers one business question on the Northwind dataset (PostgreSQL): the question is proposed, solved in pgAdmin, reviewed, and recorded in a dated file. The first submitted solution is kept unedited next to the final version, so the gap between them is the record of progress.

See [`business_questions/README.md`](business_questions/README.md) for the session workflow, levels and file naming.

## Pillars

| Pillar | Focus | Engine and dataset | Status |
|--------|-------|--------------------|--------|
| [1: Query Fluency](pillar1_query_fluency/README.md) | `SELECT`, `WHERE`, `ORDER BY`, aggregations, joins, `NULL` handling | ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white) [Chinook](https://github.com/lerocha/chinook-database) | 6 chapters, about 30 drills each |
| [2: Analytical SQL](pillar2_analytical_sql/README.md) | Subqueries, CTEs, window functions, conditional logic, multi-joins, applied patterns | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white) Northwind | `01` and `02` solved; `03` and `05` in progress; `04` and `06` planned |
| [3: Data Engineering SQL](pillar3_data_engineering_sql/README.md) | DDL, data changes, transactions, upserts, staging, constraints, indexes | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white) your own schemas | `01` and `02` started, mostly unsolved prompts; `03` to `07` planned |

Each pillar README lists its chapters, how to run the drills, and its current status. To practice a topic, pick the pillar, load its dataset, and open the first drill of the chapter.

## Repository Structure

```bash
sql-power-drills/
├── business_questions/            # dated business question sessions (Northwind, PostgreSQL)
├── pillar1_query_fluency/         # core query drills (Chinook, SQLite)
├── pillar2_analytical_sql/        # analytical drills (Northwind, PostgreSQL)
├── pillar3_data_engineering_sql/  # schema, data change and pipeline drills (PostgreSQL)
├── archive/                       # older exercises, kept for history and not maintained
└── README.md
```

## Setup

- **Northwind on PostgreSQL** (business questions and Pillar 2): follow the [dataset guide](pillar2_analytical_sql/00_datasets/README.md), then run queries with `psql` or a GUI such as pgAdmin.
- **Chinook on SQLite** (Pillar 1): the database file and its table reference are in [`pillar1_query_fluency/00_datasets/`](pillar1_query_fluency/00_datasets/README.md).
- **Pillar 3** has no shared dataset: you create and evolve your own tables in a disposable local database, as described in its [README](pillar3_data_engineering_sql/README.md).
