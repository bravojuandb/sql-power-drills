# Pillar 2: Analytical SQL (Thinking in Layers)

## How to run

1. Check if SQLite is installed:
```
sqlite3 --version
```
2. If it is not installed, install it (macOS):
```
brew install sqlite
```
3. Open the Northwind database in the SQLite shell:
```
sqlite3 pillar2_analytical_sql/00_datasets/northwind.db
```
This opens an interactive SQLite session, and all commands now run against that database.

4. Check if the database loaded by listing the tables:
```
.tables
```
5. To print aligned results, run the following commands:
```
.headers on
.mode column
```
6. Run any SQL file (path is relative to where you launched sqlite3):
``` 
.read 01_subqueries/drill01.sql
``` 
7. Exit SQLite:
``` 
.quit
``` 

## Folder structure

The folder structure is intentionally layered to reflect analytical thinking and progressive SQL complexity:  

- **First level:** Pillar folder → a major domain (Analytical SQL)
- **Second level** Subcategories → building blocks (Selection, Filtering, Ordering…)
- **Third level:** Drills (`drill01.sql` … `drillXX.sql`) → atomic queries  

Dedicated README files contain the name of each query, inside the respective subcategory.  
These README files describe the intent and expected output of each drill, but do not provide solutions.


```bash
pillar2_analytical_sql/
├── 00_datasets/
│   └── northwind.db
│
├── 01_subqueries/
│   ├── drills/
│   │   ├── drill01.sql
│   │   ├── ...
│   │   └── drillXX.sql
│   ├── aggregation_subqueries/
│   │   ├── drill01.sql
│   │   ├── ...
│   │   ├── drillXX.sql
│   │   └── README.md
│   └── README.md
│
├── 02_ctes/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
│
├── 03_window_functions/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
│
├── 04_conditional_logic/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
│
├── 05_multi_joins/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
├── 06_cohort/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
├── 07_top_n/
│   ├── drill01.sql
│   ├── ...
│   ├── drillXX.sql
│   └── README.md
│
└── README.md
```

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
