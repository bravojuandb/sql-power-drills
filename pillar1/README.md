## Pillar 1: Query Fluency (The Grammar of SQL)

By the end of this round I should be able to:  

- Write joins without checking documentation.
- Build grouped aggregations with HAVING.
- Handle nulls correctly.
- Combine filters with logical operators.
- Sort and limit results.
- Read schema and understand relationships.


### Selection  

*SELECT · DISTINCT · Aliases*  

1. Select customer names and countries (with aliases).  
2. List all unique billing countries.  
3. Return track names and durations, renaming columns cleanly.

---

### Filtering  

*WHERE · BETWEEN · IN · LIKE · AND/OR*  

1. Find all invoices from 2012.  
2. Select customers from Spain or Germany using `IN`.  
3. Return tracks whose name contains “Love” using `LIKE`.

---

### Ordering

*ORDER BY · LIMIT*  

1. Show the 10 most expensive tracks.  
2. List the 5 most recent invoices.  
3. Order artists alphabetically by name.

---

### Aggregations

*COUNT · SUM · AVG · MIN · MAX · GROUP BY · HAVING*  

1. Count how many customers exist per country.  
2. Total invoice amounts per customer.  
3. Return genres with more than 50 tracks (HAVING).

---

### Joins

I*NNER JOIN · LEFT JOIN*  

1. Join invoices with customers to display who bought what.  
2. Show each track with its genre name.  
3. List invoices and the employee who handled them (employee → customer → invoice chain).

---

### Null Handling

*IS NULL · COALESCE*  

1. Find invoices without a billing state (IS NULL).  
2. Replace null postal codes with “Unknown” using COALESCE.  
3. Show customers with or without a company name (company can be NULL).

---
