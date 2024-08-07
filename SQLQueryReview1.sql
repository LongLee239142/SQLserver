--Q1. Database Creation
CREATE DATABASE ProductManagementSystem
USE ProductManagementSystem


-- Q2 Table Creation 
CREATE TABLE tblUser (
    UserID INT NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
);
CREATE TABLE tblOrder (
    OrderID INT NOT NULL,
    UserID INT NOT NULL,
	OrderDate DATETIME,
);
CREATE TABLE tblProduct (
    ProductID INT NOT NULL,
    ProductName NVARCHAR(50),
    Quantity INT,
    Price MONEY,
	Description NTEXT,
);
CREATE TABLE tblOrderDetail (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,
    Price MONEY ,
);



--Q3. Index Creation and Table Alternation :
--1.Create a clustered index on the UserID column in the tblUser table:
CREATE CLUSTERED INDEX CI_tblUser_UserID ON tblUser (UserID);
--2.Drop the clustered index you have created above:
DROP INDEX CI_tblUser_UserID ON tblUser;
--3.Alter table tblUser, add new column [BirthDate] with datatype DATETIME 
ALTER TABLE tblUser
ADD BirthDate DATETIME;


--Q4.Constraints
-- 1.Primary Key on "UserID" in table "tblUser":
ALTER TABLE tblUser ADD CONSTRAINT PK_tblUser_UserID PRIMARY KEY (UserID);
-- 2.Primary Key on "OrderID" in table "tblOrder":
ALTER TABLE tblOrder ADD CONSTRAINT PK_tblOrder_OrderID PRIMARY KEY (OrderID);
-- 3.Foreign Key on "UserID" in table "tblOrder" referencing "UserID" in table "tblUser":
ALTER TABLE tblOrder ADD CONSTRAINT PK_tblOrder_UserID FOREIGN KEY (UserID) REFERENCES tblUser(UserID);
-- 4.Primary Key on "ProductID" in table "tblProduct":
ALTER TABLE tblProduct ADD CONSTRAINT PK_tblProduct_ProductID PRIMARY KEY (ProductID);
-- 5.Foreign Key on "OrderID" in table "tblOrderDetail" referencing "OrderID" in table "tblOrder":
ALTER TABLE tblOrderDetail ADD CONSTRAINT PK_tblOrderDetail_OrderID FOREIGN KEY (OrderID) REFERENCES tblOrder(OrderID);
-- 6.Foreign Key on "ProductID" in table "tblOrderDetail" referencing "ProductID" in table "tblProduct":
ALTER TABLE tblOrderDetail ADD CONSTRAINT PK_tblOrderDetail_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct(ProductID);
-- 7.Default
ALTER TABLE tblOrder
ADD CONSTRAINT DE_tblOrder_OrderDate DEFAULT GETDATE() FOR OrderDate;
-- 8.Check constraint on "OrderDate" in table "tblOrder" with a range from 2000-01-01 to current date:
ALTER TABLE tblOrder ADD CONSTRAINT CK_tblOrder_OrderDate CHECK (OrderDate > '2000-01-01' AND OrderDate < GETDATE());
-- 9.Unique
ALTER TABLE tblUser
ADD CONSTRAINT UN_tblUser_UserName UNIQUE (UserName);



--Q5.Inserting Data 
INSERT INTO tblUser(UserID, UserName , BirthDate)
VALUES
    (1, 'stevejobs', CONVERT(DATETIME, CAST('1996-08-28' AS DATETIME), 113)),
    (2, 'billgates', CONVERT(DATETIME, CAST('1998-06-18' AS DATETIME), 113)),
    (3, 'larry', CONVERT(DATETIME, CAST('1997-05-25' AS DATETIME), 113)),
    (4, 'mark', CONVERT(DATETIME, CAST('1984-03-27' AS DATETIME), 113)),
    (5, 'dell', '1955-08-15'),
    (6, 'eric', '1955-07-28');

INSERT INTO tblOrder (OrderID, UserID, OrderDate)
VALUES
    (1, 2, CONVERT(DATETIME, CAST('01/12/2002' AS DATETIME), 113)),
    (2, 3, CONVERT(DATETIME, CAST('02/03/2000' AS DATETIME), 113)),
    (3, 2, CONVERT(DATETIME, CAST('03/08/2002' AS DATETIME), 113)),
    (4, 1, CONVERT(DATETIME, CAST('12/05/2001' AS DATETIME), 113)),
    (5, 4, CONVERT(DATETIME, CAST('04/10/2002' AS DATETIME), 113)),
    (6, 6, CONVERT(DATETIME, CAST('03/08/2002' AS DATETIME), 113)),
    (7, 5, CONVERT(DATETIME, CAST('02/05/2002' AS DATETIME), 113));

INSERT INTO tblProduct (ProductID, ProductName, Quantity, Price, Description)
VALUES
    (1, 'Asus Zen', 2, 10, 'See what others can''t see. The first flat-design smartphone in the world.'),
    (2, 'BPhone', 10, 20, 'The first flat-design smartphone in the world.'),
    (3, 'iPhone', 13, 800, 'The only thing that�s changed is everything.'),
    (4, 'Xperia', 7, 80, 'The world�s first 4K smartphone.'),
	(5, 'Galaxy Note', 12, 120, 'Created to reflect your desire.');

INSERT INTO tblOrderDetail (OrderID, ProductID, Quantity, Price)
VALUES
    (1, 1, 10, 10),
    (1, 2, 4, 20),
    (2, 3, 5, 50),
    (3, 3, 6, 80),
    (4, 2, 21, 120),
    (5, 2, 122, 300);

SELECT *FROM tblUser



-- 6. Query Operations 	
-- 1.Update [Price] of all records in the table [tblProduct] with 10% discount,  where [ProductID] is equal to 3
UPDATE tblProduct
SET price = price * 0.9
WHERE ProductID = 3;
-- 2.Display all records from 4 tables tblUser, tblOrder, tblOrderDetail, tblProduct as
SELECT u.UserID, u.UserName, o.OrderID, o.OrderDate, od.Quantity, od.Price, p.ProductName
FROM tbluser u
JOIN tblOrder o ON u.UserID = o.UserID
JOIN tblOrderDetail od ON o.OrderID = od.OrderID
JOIN tblProduct p ON od.ProductID = p.ProductID;



--Q7.View (Create a view named [view_Top2Product] to display top 2 best seller product)
CREATE VIEW view_Top2Product
AS
SELECT TOP 2 p.ProductID, p.ProductName, p.Price, SUM(od.Quantity) AS TotalQuantity
FROM tblProduct p
JOIN tblOrderDetail od ON p.ProductID = od.ProductID
JOIN tblOrder o ON od.OrderID = o.OrderID
GROUP BY p.ProductID, p.ProductName, p.Price
ORDER BY TotalQuantity DESC;
SELECT * FROM view_Top2Product;

--Q8. Procedure 
-- 1.Create a procedure named [sp_TimSanPham] with parameters:
CREATE PROCEDURE sp_TimSanPham
    @GiaMua MONEY,
    @count INT OUTPUT
AS
BEGIN
    SELECT 
        ProductID, 
        ProductName, 
        Quantity, 
        Price
    FROM 
        tblProduct
    WHERE 
        Price <= @GiaMua;

    SET @count = @@ROWCOUNT;
END;

-- 2.And here is the code to execute the stored procedure with @GiaMua = 50:
DECLARE @count INT;
EXEC sp_TimSanPham @GiaMua = 50, @count = @count OUTPUT;
IF @count = 2
BEGIN
    PRINT 'Tim thay 2 san pham';
END;



--Q9.Trigger
CREATE TRIGGER TG_tblProduct_Update
ON tblProduct
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price)
    BEGIN
        IF EXISTS (SELECT 1 FROM inserted WHERE Price < 10)
        BEGIN
            RAISERROR('You don''t update price less than 10!', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;

UPDATE tblProduct
SET Price = 8
DROP TRIGGER TG_tblProduct_Update;

CREATE TRIGGER TG_tblUser_Update
ON tblUser
AFTER UPDATE
AS
BEGIN
    IF UPDATE(UserName)
    BEGIN
        RAISERROR('You don''t update the column UserName!', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
UPDATE tblUser
SET UserName = 'Longle'
where UserID = 1
SELECT*FROM tblUser