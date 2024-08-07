CREATE TABLE department (
dep_id INT IDENTITY PRIMARY KEY,
dep_name VARCHAR(20),
dep_location VARCHAR(15)
);
CREATE TABLE employees (
emp_id INT IDENTITY PRIMARY KEY,
emp_name VARCHAR(15),
job_name VARCHAR(10),
manager_id INT,
hire_date DATE,
salary  DECIMAL (10,2),
commission DECIMAL (7,2),
dep_id INT FOREIGN KEY REFERENCES department(dep_id)
);
CREATE TABLE salary_grade (
grade INT IDENTITY PRIMARY KEY,
min_salary INT,
max_salary INT
);