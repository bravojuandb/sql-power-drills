/* 
Find the average salary per department 
sorted from highest to lowest average
*/

SELECT department, ROUND(AVG(salary)) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;