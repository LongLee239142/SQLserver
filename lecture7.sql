USE [Lecture1(Homework1)]

CREATE TABLE Departments (
    DepartmentID INT IDENTITY (101,1) PRIMARY KEY,
    DepartmentName varchar(50)
);

INSERT INTO Departments ( DepartmentName)
VALUES
    ( 'Sales'),
    ( 'Marketing'),
    ( 'HR');
SELECT*FROM Departments



CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    Name varchar(50),
	DepartmentID INT FOREIGN KEY REFERENCES Departments
);

INSERT INTO Employees (Name, DepartmentID)
VALUES
    ( 'John', 101),
    ( 'Alice', 102),
    ( 'Bob', 101);
SELECT*FROM Employees


SELECT Name , DepartmentName
FROM Departments
FULL OUTER JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID;


INSERT INTO Employees (Name, DepartmentID)
VALUES
    ( 'Carol', 103),
    ( 'Dave', 101);
	--SELF JOIN
SELECT T1.Name AS Employee1 , T2.Name AS Employee2 , T1.DepartmentID
FROM Employees T1
JOIN Employees T2
ON T1.DepartmentID = T2.DepartmentID
Where  T1.EmployeeID < T2.EmployeeID
