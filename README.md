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
Once the tables are created for each of the CSV files it is now time to import the information into each specific table. 

Next we will be exploring the database using a **query** to request information from different database tables to generate a result we are looking for. 






