# Employee-SQL
# Exploring Mutliple Tables of Employee Information with SQL 

Research and analyze employees of a corporation using data modeling with ERD tables, data engineering with SQL, data analytics and visualizations with Python, Pandas, Matplotlib, and SQLAlchemy.

This is a solo project with the responsability of a data engineer at X company. The first major task is a research project on employees of the corporation from 1980s and 1990s. All that remains of the the database of employees from that period are six CSV files that we will load into a SQL database and demonstrate different ways in which SQL can be used to query data. 

## Understanding Data Relationship or Data Modeling 
It is best to explore the data using an **Entity Relationship Diagram (ERD) model** before diving into the SQL database. An ERD is a data modeling technique that graphically displays an information system's entities and the relationship between those entities. You can create entities (tables), add attributes(columns), and create relationships between those entities. 
\
\
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ERD%20Table%20for%20Employee%20SQL.png)
\
Finding relationships between these entities are defined as primary key and foreign key. A **primary key** is a index that can uniquely identify a record in the table. A **foreign key** is a field in the table that is primary key in another table. 

# Setting up the Database with SQL 
### Schema
In this project we were able to use **PostgresSQL** to create the database. Next we will create the database schema. The **schema** refers to the organization of data of how the database is constructed into tables. We have already done a version of this in the ERD diagram by adding the data type to each of the tables (columns). Lets construct the database by creating a table and adding the headers of each column. Each column represent a certain type of data type such as `VARCHAR` representing a string with variable length and `INT` representing Integer. Make sure to add this to the end of the column description to explain to the table the type of data we will be importing. We will also add primary key or foreign key just like the ERD model to specify entities relationship with one another. Lets take a look at the schema for the `employees` table. 

```
CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      VARCHAR(1) 		NOT NULL,
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);
``` 
# Data Exploration
### Query
Once the tables are created for each of the CSV files it is now time to import the information into each specific table. Next we will be exploring the database using a **query** to request information from different database tables to generate a result we are looking for. 

### Basic Selection
In SQL, query statements are comprised of a combination of clauses with the most basic type making use of `SELECT` to choose columns to display and `FROM` to identify the data source. The use of `*` denotes selecting all data.

```
select *
from employees
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/SQL-Select-All.png)

### Querying with Joins
Selecting data from two sources requires the use of the `JOIN` clause in conjunction with `FROM` and must also specify the common key from each table using `ON`. Here, instead of querying all data, we will choose select columns from each data source.

```
SELECT emp.emp_no, 
	emp.last_name, 
	emp.first_name, 
	emp.gender, 
	sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal
	ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/SQL-QuerywithJoins.png)

### Filtering Data with WHERE
When queried data needs to filtered to specific criteria, the `WHERE` clause is used to isolate the relevant information. In this example, both datetime format and logical operators are recogized by SQL to select all records from 1986.

```
SELECT * 
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/SQL-Filtering%20Data%20with%20Where.png)

### Using Join to Combine Multiple Data Sources. 
List the manager of each department with the following information: 
Find the department number, department name, the manager's employee number, last name, first name, and the start and end date of employment. 
```
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
	ON (dm.emp_no = emp.emp_no)
ORDER BY dm.fromdate;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/dept.manager.png)


Find the Department of each employee: 
```
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/dept%20of%20each%20employee.png)

### Querying String Patterns
In cases where queries require a looser definition of data to pull, SQL can also make use of Regular Expression to parse strings and return similar results. The use of `LIKE 'B%'` in the following example will return all employees named "Hercules" with last name starting with "B".

```
SELECT * 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/SQL-Query%20String%20Patterns.png)

### Aggregate Functions

Querying aggregate functions such as `SUM`, `MIN`, `MAX`, `AVG`, and `COUNT` is also supported by SQL. Here, we also introduce `GROUP BY` and `ORDER BY` to combine alike data and display the results in a sorted order. Using `2` is a short-hand for the second argument in the `SELECT` statement.

```
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC; 
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/SQL-Aggregate%20Functions.png)



Return the Employees in the Sales Department with their employee number, last and first name, and department. 
```
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/emp_in_sales.png)

Using the 'Where' Clause to include two departments. Return the Employees in the Sales and Development Department. 
```
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/sales%20and%20dev%20dept.png)

Find the frequency of similar last names within the employees data. 
```
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
```
![](https://github.com/alexgamboa1/Employee-SQL-/blob/master/ReadMe_images/count_similar_ln.png)
