# Pillar 1 — Selection Drills  

---

## ✅ A. Basic Column Retrieval

1. Select all customer first names.  
2. Select track names and milliseconds.  
3. Return employee last names and titles.  
4. Select album titles.  
5. Return genre names.  

---

## ✅ B. Multiple Columns (Clean Retrieval)

6. Select customer first name, last name, and country.  
7. Return invoice date, billing address, and total.  
8. Show each track’s name, composer, and album ID.  
9. Select artist ID and artist name.  
10. Return employee first name, last name, and their reports-to manager.

---

## ✅ C. Aliases (`AS`)

11. Return customer first name AS `first`, last name AS `last`.  
12. Select track name AS `track_name`, milliseconds AS `duration_ms`.  
13. Show invoice total AS `amount`, invoice_date AS `date`.  
14. Select employee last name AS `employee`, title AS `role`.  
15. Return artist name AS `artist`, artist_id AS `id`.

---

## ✅ D. DISTINCT

16. List all distinct customer countries.  
17. List all distinct billing cities.  
18. Return all distinct composers from the tracks table.  
19. List distinct genres.  
20. List distinct album IDs present in the tracks table.

---

## ✅ E. Combined Selection + Distinct + Aliases

21. Distinct customer countries AS `country`.  
22. Distinct composers AS `composer`.  
23. Distinct invoice billing countries AS `billing_country`.  
24. Distinct employee titles AS `role`.  
25. Distinct track media types AS `media`.

---

## ✅ F. Slightly Applied (Still Pure Selection)

26. Select the 10 longest tracks (name + milliseconds).  
27. Select the 10 shortest tracks (name + milliseconds).  
28. Show customer full names as `full_name` (first || ' ' || last).  
29. Show track name + calculated seconds (milliseconds/1000).  
30. Return invoice total + 20% tax (calculated column) AS `with_tax`.
