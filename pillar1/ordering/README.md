# Pillar 1 — Ordering Drills  


## A. Basic ORDER BY (Ascending)

1. List customers ordered by first name.  
2. List tracks ordered by milliseconds.  
3. Order artists alphabetically by name.  
4. Order employees by hire date.  
5. Order invoices by total (smallest first).

---

## B. ORDER BY (Descending)

6. Tracks ordered by milliseconds (longest first).  
7. Invoices ordered by total (highest first).  
8. Customers ordered by last name Z → A.  
9. Employees ordered by birthdate (youngest first).  
10. Tracks ordered by bytes (largest file first).

---

## C. ORDER BY Multiple Columns

11. Customers ordered by country, then by last_name.  
12. Tracks ordered by composer, then track name.  
13. Invoices ordered by billing_country, then total descending.  
14. Employees ordered by reports_to, then first_name.  
15. Artists ordered by name length, then alphabetically.

---

## D. LIMIT

16. Show the first 5 tracks.  
17. Show the first 10 customers.  
18. Show the first 3 invoices by date.  
19. Return the first 20 artists alphabetically.  
20. Show the first 7 employees ordered by hire_date.

---

## E. ORDER BY + LIMIT (Top-N Patterns)

21. Top 10 longest tracks (name + milliseconds).  
22. Top 5 most expensive invoices.  
23. Top 15 customers alphabetically by last_name.  
24. Top 10 tracks with the largest bytes.  
25. Top 3 employees with the earliest hire_date.

---

## F. Mixed Patterns

26. Tracks with composer not null, ordered by milliseconds DESC (top 10).  
27. Customers from Brazil ordered by last_name, limit 8.  
28. Invoices from 2009 ordered by total descending, limit 5.  
29. Artists whose name contains ‘The’, ordered alphabetically, limit 12.  
30. Tracks from genre_id 1 ordered by name ASC, limit 20.

