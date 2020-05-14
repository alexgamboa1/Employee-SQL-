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


-- List employees who were hired in 1986.
select * from employees;

SELECT * FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select * from dept_manager;
select * from departments;
select * from departments;

SELECT dm.dept_no,
	d.dept_name, 
	dm.emp_no,
	emp.last_name,
	emp.first_name, 
	dm.from_date, 
	dm.to_date
FROM dept_manager AS dm
INNER JOIN departments as d
	ON (dm.dept_no = d.dept_no)
INNER JOIN employees as emp
	ON (dm.emp_no = emp.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, 
	emp.last_name, 
	emp.first_name,
	d.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de     --
	ON (emp.emp_no = de.emp_no)
INNER JOIN departments AS d
	ON (d.dept_no = de.dept_no)
ORDER BY emp.emp_no;
	
-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
















