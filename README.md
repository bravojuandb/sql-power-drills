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

## What This Repo Is

`sql-power-drills` is a structured practice repository for building SQL skills through repetition.

The goal is not just to memorize syntax, but to develop the habits and problem-solving patterns used in real data work.

The repository is intentionally split across environments I called Pillars:

- `Pillar 1` uses SQLite to keep setup light and make core query practice frictionless.
- `Pillar 2` uses PostgreSQL as the primary environment for analytical SQL.


## Current Scope

This repository is currently focused on:

```bash
sql-power-drills/
├── pillar1_query_fluency/
├── pillar2_analytical_sql/
│   ├── 00_datasets/
│   ├── 01_subqueries/
│   │   ├── drills/
│   │   └── aggregation_subqueries/
│   ├── 02_ctes/
│   ├── 03_window_functions/
│   ├── 04_conditional_logic/
│   ├── scripts/
│   └── tests/
└── README.md
```

## What Each Pillar Covers

### [Pillar 1: Query Fluency](pillar1_query_fluency/README.md) ![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)  

Build comfort with core SQL syntax through short drills focused on writing correct queries with confidence.

Topics include `SELECT`, `WHERE`, `ORDER BY`, aggregations, joins, and `NULL` handling.

This pillar uses the [Chinook database](https://github.com/lerocha/chinook-database) on [SQLite](https://sqlite.org/index.html).  

### [Pillar 2: Analytical SQL](pillar2_analytical_sql/README.md) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)

Develop analytical query thinking by breaking problems into layers and composing multi-step logic.

Topics include subqueries, CTEs, window functions, conditional logic, cohort analysis, and top-N patterns.

This pillar is designed primarily for PostgreSQL using the [Northwind SQL dataset](pillar2_analytical_sql/00_datasets/northwind.sql).  

PostgreSQL is the recommended engine for this pillar because it better supports the analytical patterns practiced here.

You can run the queries with `psql` or a GUI such as `pgAdmin`.

You can find setup instructions in [the PostgreSQL dataset guide](pillar2_analytical_sql/00_datasets/README.md).

## Planned Next Pillars

Future expansions may include data engineering SQL, performance, ETL, orchestration, cloud storage, and pipeline architecture.
