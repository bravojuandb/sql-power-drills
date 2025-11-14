## Pillar 1: Query Fluency (The Grammar of SQL)

### Selection
**Concepts:**  
SELECT · DISTINCT · Aliases  
**Purpose:** Extract the right columns and shape the output.

**Drills:**  
1. Select customer names and countries (with aliases).  
2. List all unique billing countries.  
3. Return track names and durations, renaming columns cleanly.

---

### Filtering
**Concepts:**  
WHERE · BETWEEN · IN · LIKE · AND/OR  
**Purpose:** Target specific subsets of data by conditions.

**Drills:**  
1. Find all invoices from 2012.  
2. Select customers from Spain or Germany using `IN`.  
3. Return tracks whose name contains “Love” using `LIKE`.

---

### Ordering
**Concepts:**  
ORDER BY · LIMIT  
**Purpose:** Sort results and control their size.

**Drills:**  
1. Show the 10 most expensive tracks.  
2. List the 5 most recent invoices.  
3. Order artists alphabetically by name.

---

### Aggregations
**Concepts:**  
COUNT · SUM · AVG · MIN · MAX · GROUP BY · HAVING  
**Purpose:** Compute summaries, totals, and grouped metrics.

**Drills:**  
1. Count how many customers exist per country.  
2. Total invoice amounts per customer.  
3. Return genres with more than 50 tracks (HAVING).

---

### Joins
**Concepts:**  
INNER JOIN · LEFT JOIN  
**Purpose:** Combine related data across tables.

**Drills:**  
1. Join invoices with customers to display who bought what.  
2. Show each track with its genre name.  
3. List invoices and the employee who handled them (employee → customer → invoice chain).

---

### Null Handling
**Concepts:**  
IS NULL · COALESCE  
**Purpose:** Detect and manage missing or optional values safely.

**Drills:**  
1. Find invoices without a billing state (IS NULL).  
2. Replace null postal codes with “Unknown” using COALESCE.  
3. Show customers with or without a company name (company can be NULL).

---
