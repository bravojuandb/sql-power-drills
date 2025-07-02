/*

“Top 5 Highest Salaries (All Departments)”

Question:
Write a query to return the first name, last name, department, and salary
of the top 5 highest-paid employees, regardless of department.
Sort results by salary descending.


*/

SELECT first_name, last_name, department, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
