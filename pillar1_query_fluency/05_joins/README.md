# Pillar 1 — Joins Drills  
cd .

## A. Basic INNER JOIN (Two Tables)

1. Tracks with their album titles.  
2. Tracks with their genre names.  
3. Albums with their artist names.  
4. Invoices with their customer first_name + last_name.  
5. Invoice items with their track names.

---

## B. INNER JOIN (Three Tables)

6. Tracks → albums → artists (track + album + artist).  
7. Invoice items → tracks → albums.  
8. Invoice → customer → employee (who supported the customer).  
9. Tracks → media_type → genre.  
10. Invoice items → invoices → customers.

---

## C. LEFT JOIN (Preserving “Left” Rows)

11. Customers and their invoices (include customers with no invoices).  
12. Artists and their albums (include artists with zero albums).  
13. Albums and their tracks (include albums with no tracks).  
14. Employees and their direct reports (include employees with zero reports).  
15. Customers and their support representatives (include customers with no support rep).

---

## D. Filtering on Joins

16. Customers with at least one invoice over 10.  
17. Tracks with genre = “Rock”.  
18. Artists whose albums contain tracks over 300000 ms.  
19. Invoices from customers in Brazil.  
20. Employees whose customers are from Canada.

---

## E. Multi-Join Patterns with Conditions

21. All invoice items for Rock tracks (3-table join + filter).  
22. All customers who bought tracks from the “Metal” genre.  
23. All albums that contain tracks with composer = “AC/DC”.  
24. All invoices handled by “Nancy Edwards” (employee).  
25. All tracks purchased in 2009.

---

## F. Classic Join Scenarios (Skill Consolidation)

26. The 10 most purchased tracks (joins + GROUP BY).  
27. Total invoice revenue per customer (joins + aggregation).  
28. List employees and the number of customers they support.  
29. List artists and how many tracks belong to them.  
30. List customers and how many invoices they have (include zero, so LEFT JOIN).

