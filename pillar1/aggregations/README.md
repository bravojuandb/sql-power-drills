# Pillar 1 — Aggregations Drills  


## A. Basic Aggregations (No GROUP BY)

1. Count all customers.  
2. Count all tracks.  
3. Find the minimum and maximum invoice totals.  
4. Calculate the average track length (milliseconds).  
5. Sum all invoice totals.

---

## B. Aggregations with GROUP BY

6. Count customers per country.  
7. Count tracks per album.  
8. Total invoice amounts per billing country.  
9. Average track length per genre.  
10. Count tracks per media_type.

---

## C. GROUP BY (Multiple Columns)

11. Count invoices per (billing_country, billing_state).  
12. Sum invoice totals per (billing_country, billing_city).  
13. Count tracks per (album_id, composer).  
14. Average milliseconds per (genre_id, album_id).  
15. Count employees per reports_to.

---

## D. HAVING

16. Countries with more than 5 customers.  
17. Albums with more than 8 tracks.  
18. Genres whose average track length is above 250000 ms.  
19. Billing countries with total invoice revenue above 100.  
20. Media types with fewer than 20 tracks.

---

## E. Aggregations with Filtering (WHERE + GROUP BY)

21. Count invoices **from 2009** per billing country.  
22. Count tracks longer than 250000 ms per album.  
23. Sum invoice totals > 5 per billing_country.  
24. Count customers from “USA” per state.  
25. Average track length per genre for tracks composed by “AC/DC”.

---

## F. Mixed Patterns (Aggregations + HAVING + ORDER)

26. Top 5 genres by number of tracks (ORDER BY count DESC).  
27. Top 10 albums by total track milliseconds.  
28. Countries with more than 50 invoices, sorted by total revenue DESC.  
29. Artists with more than 20 tracks.  
30. Media types ordered by average file size (bytes) DESC.

