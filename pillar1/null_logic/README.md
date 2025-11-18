# Pillar 1 — Null Handling Drills  


## A. Detecting NULL Values (`IS NULL`)

1. Find customers whose `company` is NULL.  
2. Find invoices where `billing_state` is NULL.  
3. Find tracks where `composer` is NULL.  
4. Find employees with no `reports_to` value.  
5. Find invoice items where `unit_price` is NULL (should be none).

---

## B. Detecting Non-NULL Values (`IS NOT NULL`)

6. Customers whose `company` is NOT NULL.  
7. Tracks whose `composer` is NOT NULL.  
8. Employees who have a manager (`reports_to` IS NOT NULL).  
9. Invoices with a non-NULL billing_state.  
10. Artists whose name is NOT NULL (all rows, but practice syntax).

---

## C. COALESCE (Replacing NULLs)

11. Customers with `company` replaced by `'No Company'`.  
12. Invoices with `billing_state` replaced by `'Unknown'`.  
13. Tracks with `composer` replaced by `'No Composer'`.  
14. Employees with `reports_to` replaced by `0`.  
15. Customers with `fax` replaced by `'No Fax'`.

---

## D. COALESCE + Aliases

16. Show customers with `company` replaced and aliased as `company_name`.  
17. Replace NULL billing_state and alias as `state_fixed`.  
18. Replace composer and alias as `composer_name`.  
19. Replace employee `reports_to` and alias as `manager_id`.  
20. Replace invoice `billing_postal_code` and alias as `postal`.

---

## E. Filtering + NULL Logic

21. Customers from USA where company IS NULL.  
22. Invoices from Canada where billing_state IS NULL.  
23. Tracks longer than 200000 ms with composer IS NOT NULL.  
24. Artists with albums, even if album title is NULL (LEFT JOIN + IS NULL).  
25. Employees whose manager IS NOT NULL and title = 'Sales Support Agent'.

---

## F. NULL Logic + Joins + Aggregations

26. Count customers with NULL company.  
27. Count customers with non-NULL company.  
28. Customers with their invoices, substituting missing states with `'Unknown'`.  
29. Artists and count of tracks, replacing NULL composer values with `'N/A'`.  
30. Customers and count of invoices (LEFT JOIN), showing `'No Invoices'` when NULL.

