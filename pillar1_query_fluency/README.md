# Pillar 1: Query Fluency (The Grammar of SQL)

These are the building blocks of Pillar 1:  

## 1. Selection 

Core skills:
- `SELECT`
- `DISTINCT`
- Column aliases

---

## 2. Filtering  

Core skills:
- `WHERE`
- `AND` / `OR`
- `BETWEEN`
- `IN`
- `LIKE`
- Comparison operators

---

## 3. Ordering

Core skills:
- `ORDER BY`
- `ASC` / `DESC`
- `LIMIT`

---

### 4. Aggregations

Core skills:
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `HAVING`
---

## 5. Joins

Core skills:
- `INNER JOIN`
- `LEFT JOIN`

---

## 6. NULL Logic
Core skills:
- `IS NULL`
- `IS NOT NULL`
- `COALESCE`

---

## Folder Structure

Levels of organization:

- **Level 1:** Pillar folder → a major learning domain  
- **Level 2:** Subcategories (Selection, Filtering, Ordering…) → building blocks  
- **Level 3:** Drills (`drill01.sql` … `drill30.sql`) → atomic exercises  

```bash
pillar1/
├── 00_datasets/
│   └── Chinook.sqlite
│
├── 01_selection/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 02_filtering/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 03_ordering/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 04_aggregations/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 05_joins/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
├── 06_null_logic/
│   ├── drill01.sql
│   ├── drill02.sql
│   ├── ...
│   ├── drill30.sql
│   └── README.md
│
└── README.md