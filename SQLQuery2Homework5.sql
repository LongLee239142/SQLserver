CREATE TABLE Customers (
  CustomerID INT,
  CustomerName VARCHAR(50),
  Email VARCHAR(50),
  Phone VARCHAR(15)
);

INSERT INTO Customers (CustomerID, CustomerName, Email, Phone)
VALUES
  (1, 'John Doe', 'john@email.com', '123-456-7890'),
  (2, 'Jane Smith', 'jane@email.com', '987-654-3210'),
  (3, 'Bob Johnson', 'bob@email.com', '555-123-4567');


  CREATE TABLE Orders (
  OrderID INT,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10,2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (101, 1, '2024-01-15', 150.00),
  (102, 2, '2024-01-16', 200.00),
  (103, 1, '2024-01-17', 75.50),
  (104, 3, '2024-01-18', 300.00);
  
  SELECT  Orders.OrderID ,Orders.CustomerID, Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN
Orders
ON Customers.CustomerID = Orders.CustomerID
