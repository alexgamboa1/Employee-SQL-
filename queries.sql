-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM employees;
-- Salary by employee
SELECT emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	emp.gender, 
	sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal
	ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;




















