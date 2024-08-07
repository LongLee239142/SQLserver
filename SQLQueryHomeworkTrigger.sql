USE university_db

CREATE TABLE products(
     product_id INT PRIMARY KEY,
	 product_name VARCHAR(50),
	 quantity_in_stock INT
);

CREATE TABLE orders(
     order_id INT PRIMARY KEY,
	 product_id INT FOREIGN KEY REFERENCES products,
	 quantity_ordered INT,
	 order_date DATE
);

CREATE TRIGGER update_quantity_in_stock
ON orders
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i WHERE i.quantity_ordered > (SELECT p.quantity_in_stock FROM products p WHERE i.product_id = p.product_id))
	BEGIN
        RAISERROR('Quantity ordered exceeds quantity in stock.', 16, 1);
		ROLLBACK TRANSACTION;
	END
    ELSE
	BEGIN
        UPDATE p
        SET quantity_in_stock = p.quantity_in_stock - i.quantity_ordered
        FROM inserted i
        INNER JOIN products p ON i.product_id = p.product_id;
    END
END;

INSERT INTO products( product_id,product_name ,quantity_in_stock) VALUES
   (1, 'Bumester', 3),
   (2, 'Hamakadon', 4),
   (3, 'Maklenvison', 16);

INSERT INTO orders(order_id,product_id,quantity_ordered) VALUES
  (1,3,4);
SELECT *FROM products
SELECT *FROM orders


