CREATE TABLE products (
product_id INT IDENTITY(1,1) PRIMARY KEY ,
product_name VARCHAR(50),
quantity_in_stock INT
);

INSERT INTO products (product_name, quantity_in_stock)
VALUES
('Product A', 100),
('Product B', 200),
('Product C', 150);


CREATE PROCEDURE get_quantity_in_stock
@quantity_in_stock INT
AS
BEGIN
SELECT * FROM products WHERE quantity_in_stock = @quantity_in_stock;
END;

exec get_quantity_in_stock 200;
drop PROCEDURE get_quantity_in_stock
SELECT * FROM sys.procedures


CREATE TABLE employee_info (
     employee_id INT,
	 department_id INT,
	 salary DECIMAL(10,2)
);
INSERT INTO employee_info (employee_id, department_id, salary) VALUES
(1, 1, 50000),
(2, 1, 55000),
(3, 2, 55000),
(4, 2, 62000),
(5, 3, 48000),
(6, 3, 53000);
INSERT INTO employee_info (employee_id, department_id, salary) VALUES
(1, 1, 50000),
(2, 1, 55000),
(3, 2, 55000);

SELECT department_id, SUM(salary) AS sum_salary
FROM employee_info
GROUP BY department_id;

SELECT department_id, COUNT(department_id) AS count_id
FROM employee_info
GROUP BY department_id;



CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    order_date DATE
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date) VALUES
(1, 101, 100.50, '2023-01-15'),
(2, 102, 150.75, '2023-01-16'),
(3, 101, 80.25, '2023-01-17'),
(4, 103, 200.00, '2023-01-18'),
(5, 102, 120.00, '2023-01-19'),
(6, 101, 90.75, '2023-01-20');

SELECT * FROM orders
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(order_id) <= 2 AND SUM(total_amount) > 200;





CREATE TABLE sales_data_ (
    transaction_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    transaction_date DATE
);

INSERT INTO sales_data_ (transaction_id, customer_id, product_id, quantity, transaction_date) VALUES
(1, 101, 1, 5, '2023-01-15'),
(2, 102, 2, 3, '2023-01-15'),
(3, 101, 1, 2, '2023-01-16'),
(4, 103, 3, 4, '2023-01-16'),
(5, 102, 2, 2, '2023-01-17'),
(6, 101, 3, 1, '2023-01-17');
SELECT * FROM sales_data_
SELECT 
     customer_id,
	 transaction_date,
    SUM(quantity) AS total_quantity
FROM 
    sales_data_
GROUP BY 
    customer_id,transaction_date
HAVING 
   SUM(quantity) > 2 AND COUNT(DISTINCT transaction_date) = 1;


CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE VIEW sales_employees AS
SELECT 
    first_name,
    last_name,
    salary
FROM 
    employees
WHERE 
    department_id = 10;

SELECT * FROM sales_employees;