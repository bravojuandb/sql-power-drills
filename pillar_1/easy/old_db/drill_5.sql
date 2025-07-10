/*

Departments with High Average Salary”

Question:
Write a query to return the names of departments where the average salary is greater than 60,000.
Return the department name and the average salary.
Sort the results by average salary descending.

*/

SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000
ORDER BY avg_salary DESC;