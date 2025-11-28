# Pillar 2: Analytical SQL (Thinking in Layers)

## Folder structure

Levels of organization:

- **Level 1:** Pillar folder → a major learning domain  
- **Level 2:** Subcategories (Selection, Filtering, Ordering…) → building blocks  
- **Level 3:** Drills (`drill01.sql` … `drill30.sql`) → atomic exercises  

```bash
pillar2_analytical_sql/
├── 00_datasets/
│   └── ----------------
│
├── 01_subqueries/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 02_ctes/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 03_window_functions/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 04_conditional_logic/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 05_multi_joins/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 06_cohort/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
├── 07_top_n/
│   ├── drill01.sql
│   ├── ...
│   ├── drill30.sql
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


