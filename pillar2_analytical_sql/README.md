# Pillar 2: Analytical SQL (Thinking in Layers)

## How to run

1. Check if PostgreSQL is installed:
```
psql --version
```
2. Create a database for the Northwind dataset:
```
createdb northwind
```
3. Load the dataset:
```
psql -d northwind -f pillar2_analytical_sql/00_datasets/northwind.sql
```
4. Open a PostgreSQL session:
```
psql -d northwind
```

5. Check if the database loaded by listing the relations:
```
\dt
```
6. Run any SQL file from inside `psql`:
```
\i pillar2_analytical_sql/01_subqueries/core_subqueries/drill01.sql
```
7. Exit `psql`:
``` 
\q
``` 

## Folder structure

The folder structure is intentionally layered to reflect analytical thinking and progressive SQL complexity:  

- **First level:** Pillar folder → a major domain (Analytical SQL)
- **Second level:** Chapters → major analytical patterns (`subqueries`, `ctes`, `window_functions`, etc.)
- **Third level:** Drills (`drill01.sql` … `drillXX.sql`) → atomic query exercises when implemented  

Each chapter has a dedicated `README.md` that explains its focus, tables used, drill progression, and expected output shapes.
Some chapters already include SQL drill files, while others currently contain the chapter scaffold and planned drill sequence.


```bash
pillar2_analytical_sql/
├── 00_datasets/
│   ├── northwind.sql
│   └── README.md
│
├── 01_subqueries/
│   ├── README.md
│   ├── core_subqueries/
│   │   ├── drill01.sql
│   │   ├── ...
│   │   └── drill09.sql
│   ├── aggregation_subqueries/
│   │   ├── drill01.sql
│   │   ├── ...
│   │   ├── drill10.sql
│   │   └── README.md
│
├── 02_ctes/
│   ├── drill01.sql
│   ├── ...
│   ├── drill12.sql
│   └── README.md
│
├── 03_window_functions/
│   └── README.md
│
├── 04_conditional_logic/
│   └── README.md
│
├── 05_multi_joins/
│   └── README.md
│
├── 06_cohort/
│   └── README.md
│
├── 07_top_n/
│   └── README.md
│
├── tests/
│   └── pillar2_analytical_sql/
│
├── scripts/
│   └── check_sql.py
│
└── README.md
```

## Current Status

- `01_subqueries` is currently the most developed chapter, with drills in both `core_subqueries` and `aggregation_subqueries`.
- `02_ctes` has a full first set of drill files.
- `03_window_functions` through `07_top_n` currently have chapter README scaffolds and planned drill progressions, but not drill SQL files yet.

## Subjects Covered


**1. Subqueries**

Scalar subqueries, IN/EXISTS and correlated subqueries.

**2. Common Table Expressions (CTEs)**

WITH clauses for multi-step logic, layered transformations and reusable query blocks.

**3. Window Functions**

ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, running totals and moving averages.

**4. Conditional Logic**

CASE expressions, bucketing and conditional aggregates.

**5. Multi-Join Analytical Patterns**

Dimension enrichment, multi-hop joins and star-schema style analysis.

**6. Cohort & Time-Based Analysis**

Cohort grouping, retention logic and period-over-period comparisons.

**7. Top-N & Per-Group Analysis**

Top 1 per group, top N per category and filtering after window functions.
