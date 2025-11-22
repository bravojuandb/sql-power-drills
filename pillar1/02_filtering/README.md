# Pillar 1 — Filtering Drills  

---

## A. Simple WHERE (Single Condition)

1. All invoices with total > 10.  
2. All customers from Brazil.  
3. All tracks longer than 300000 milliseconds.  
4. Employees with title = "Sales Support Agent".  
5. Tracks where composer is NULL.

---

## B. Multiple Conditions (AND / OR)

6. Customers from Spain **and** not from Madrid.  
7. Tracks with genre_id = 1 **or** genre_id = 2.  
8. Invoices over 15 **and** from 2009.  
9. Customers from USA **or** Canada.  
10. Tracks with milliseconds < 200000 **and** bytes > 100000.

---

## C. BETWEEN

11. Invoices where total is **between** 5 and 10.  
12. Tracks with milliseconds **between** 150000 and 250000.  
13. Employee hire dates between 2002 and 2006.  
14. Invoice dates between '2009-01-01' and '2009-12-31'.  
15. Customers whose customer_id is between 10 and 30.

---

## D. IN

16. Customers from ('Spain', 'France', 'Italy').  
17. Invoices with billing country IN ('Germany', 'Austria').  
18. Tracks whose genre_id IN (1, 2, 3).  
19. Employees with employee_id IN (1, 2, 3).  
20. Tracks where composer IN ('AC/DC', 'Queen').

---

## E. LIKE (Pattern Matching)

21. Tracks whose name starts with 'A%'.  
22. Tracks whose name ends with '%Love'.  
23. Customers whose email contains '.uk'.  
24. Artists whose name contains 'the' (case-insensitive).  
25. Tracks whose composer contains 'Bach'.

---

## F. Combined Filtering Patterns

26. Tracks with name LIKE 'S%' **and** milliseconds > 200000.  
27. Customers from Canada **or** last_name LIKE 'G%'.  
28. Invoices from 2010 **and** total > 5 **and** billing_country = 'USA'.  
29. Tracks where composer LIKE '%Metal%' **or** genre_id IN (1, 7).  
30. Customers whose company IS NULL **and** country = 'USA'.

---
