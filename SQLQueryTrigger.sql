CREATE DATABASE lecture7
USE lecture7
CREATE TABLE Employees (
    employee_id INT IDENTITY PRIMARY KEY,
    employee_name VARCHAR(50),
    employee_salary DECIMAL(10, 2)
);

CREATE TABLE Salary_changes_log (
    log_id INT PRIMARY KEY IDENTITY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATETIME
);

CREATE TRIGGER trg_UpdateSalary
ON Employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(employee_salary)
    BEGIN
        DECLARE @employee_id INT, @old_salary DECIMAL(10,2), @new_salary DECIMAL(10,2);
		SELECT @employee_id = i.employee_id, @old_salary = d.employee_salary, @new_salary = i.employee_salary
		FROM inserted i
		INNER JOIN deleted d on i.employee_id = d.employee_id;
		
		INSERT INTO Salary_changes_log (employee_id, old_salary, new_salary, change_date)
		VALUES (@employee_id, @old_salary, @new_salary, GETDATE());
    END
END;
SELECT * FROM Employees
SELECT * FROM Salary_changes_log
INSERT INTO Employees ( employee_name, employee_salary) VALUES 
       ('JOHN','1245'),
	   ('JOHN1','1745'),
	   ('JOHN2','1345');
UPDATE Employees
SET employee_salary = 1300.00
WHERE employee_id =1;
UPDATE Employees
SET employee_salary = 1300.00
WHERE employee_id = 3;
UPDATE Employees
SET employee_salary = 2500.00
WHERE employee_id = 2 ;