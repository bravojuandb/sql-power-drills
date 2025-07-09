/* Find the names (first and last) of all employees
in the Engineering department who earn more than 85.000

- filter by engineering department
- filter by salary > 85.000
*/

SELECT first_name, last_name, salary
FROM employees
WHERE department = 'Engineering'
  AND salary > 85000;

