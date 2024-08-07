CREATE TABLE Actors (
  actor_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birth_year INT
);

INSERT INTO Actors (actor_id, first_name, last_name, birth_year)
VALUES
  (1, 'PENELOPE', 'GUINESS', 1998),
  (2, 'NICK', 'WAHLBERG', 2001),
  (3, 'ED', 'CHASE', 1997),
  (4, 'JENNIFER', 'DAVIS', 1985),
  (5, 'JOHNNY', 'LOLLOBRIGIDA', 1999);

SELECT * FROM Actors
WHERE birth_year BETWEEN 1997 AND 1999;



CREATE TABLE Earthquakes (
  id INT,
  date DATE,
  latitude FLOAT,
  longitude FLOAT,
  depth FLOAT,
  magnitude FLOAT,
  country VARCHAR(50)
);

INSERT INTO Earthquakes (id, date, latitude, longitude, depth, magnitude, country)
VALUES
  (1, '1960-05-22', 60.908, -38.143, 25, 9.5, 'Indonesia'),
  (2, '1964-03-28', 60.908, -73.407, 18, 9.2, 'Papua New Guinea'),
  (3, '1960-05-22', 25, -73.407, 95.982, 9.5, 'Papua New Guinea'),
  (4, '1906-08-02', 3.295, -147.33, 30, 9.1, 'Philippines');


SELECT * FROM Earthquakes;
SELECT TOP 3 *FROM Earthquakes WHERE country = 'Indonesia' OR country = 'Papua New Guinea'
ORDER BY depth desc,id;


SELECT *FROM Earthquakes 
ORDER BY id 
OFFSET 1 ROWS
FETCH NEXT 3 ROWS ONLY;





CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(255),
    department_id INT
);

INSERT INTO employees (employee_id, name, department_id)
VALUES (1, 'John Smith', 1),
       (2, 'Jane Doe', 2),
       (3, 'Bob Johnson', 1);


CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(255)
);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'IT'),
       (2, 'HR'),
       (3, 'Marketing');
SELECT *FROM employees
SELECT *FROM departments


SELECT employees.name, departments.department_name
FROM employees
INNER JOIN
departments
ON employees.department_id = departments.department_id

SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN
departments
ON employees.department_id = departments.department_id

SELECT *FROM employees
SELECT *FROM departments

SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN
departments
ON employees.department_id = departments.department_id