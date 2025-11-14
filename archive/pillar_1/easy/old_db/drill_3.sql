/*

“Recent Engineering Hires”

Question:
Write a query to list the first and last names, hire date, 
and salary of employees in the Engineering department
who were hired after January 1st, 2020.
Order the results by hire date ascending.

*/

SELECT first_name, last_name, hire_date, salary
FROM EMPLOYEES
WHERE hire_date > '2020-01-01'
	AND department = 'Engineering'
ORDER BY hire_date ASC;
