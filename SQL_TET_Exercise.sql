CREATE TABLE Customers (
  customer_id INT IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address TEXT NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
INSERT INTO Customers ( customer_name, address, email, password)
VALUES ( 'Customer 1', '123 Main St, Cityville', 'customer1@example.com', 'hashed_password'),
       ( 'Customer 2', '456 Oak St, Townsville', 'customer2@example.com', 'hashed_password'),
	   ( 'Customer 3', '456 Oak St, Townsville', 'customer2@example.com', 'hashed_password'),
	   ( 'Customer 4', '456 Oak St, Townsville', 'customer2@example.com', 'hashed_password')
SELECT * FROM Customers



CREATE TABLE Orders (
  order_id INT IDENTITY(1,1) PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  status VARCHAR(50) NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders (customer_id ,order_date, status, total_amount)
VALUES (1, '2024-02-02 14:30:45', 'Pending', 29.99),
       (2, '2024-02-03 9:30:45', 'Shipped', 79.98);
SELECT * FROM Orders



CREATE TABLE Carts(
  cart_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  created_date DATETIME NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Carts(customer_id ,created_date)
VALUES (1, '2024-02-02 14:30:45'),
       (2, '2024-02-03 9:30:45');
SELECT * FROM Carts



CREATE TABLE Addresses (
  address_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  zip_code VARCHAR(20) NOT NULL,
  country VARCHAR(100) NOT NULL,
  is_default TINYINT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Addresses (customer_id, street, city, state, zip_code,country,is_default)
VALUES ( 1,'789 Pine St', 'Villagetown', 'Province', '12345','Country',1),
       ( 2, '101 Maple Ave', 'Cityburg', 'State', '67890','Country',1);
SELECT * FROM Addresses



CREATE TABLE PaymentMethods (
  payment_method_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  card_number VARCHAR(16) NOT NULL,
  expiry_date DATE NOT NULL,
  cvv VARCHAR(4) NOT NULL,
  is_default TINYINT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO PaymentMethods(customer_id, card_number, expiry_date, cvv, is_default)
VALUES (1,'234','2025-12-31','123','1'),
       (2,'678','2024-12-31','456','1');
	   SELECT * FROM PaymentMethods



CREATE TABLE Products (
  product_id INT IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity_in_stock INT NOT NULL
);
INSERT INTO Products ( product_name, description, price, quantity_in_stock)
VALUES ( N'Product 1', N'Description for Product 1', 29.99, 100),
       ( N'Product 2', N'Description for Product 2', 39.99, 75),
	   ( N'Product 3', N'Description for Product 2', 39.99, 75),
	   ( N'Product 4', N'Description for Product 2', 39.99, 75);
	   SELECT * FROM Products

CREATE TABLE OrderDetails (
  order_detail_id INT IDENTITY PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO OrderDetails ( order_id, product_id, quantity, price)
VALUES ( 1, 1, 2, 59.98),
       ( 2, 2, 1, 39.99);
	   SELECT * FROM OrderDetails

	   

CREATE TABLE Reviews(
  review_id INT IDENTITY PRIMARY KEY,
  product_id INT,
  customer_id INT,
  rating INT,
  comment TEXT,
  review_date DATETIME,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Reviews (product_id, customer_id, rating, comment, review_date)
VALUES ( 1, 1, 5, N'Great product!','2024-02-02 14:30:45'),
       ( 2, 2, 5, N'Good quality','2023-02-02 14:30:45'),
	   ( 2, 4, 4, N'Good quality','2022-02-02 14:30:45'),
	   ( 1, 3, 5, N'Excellent quality','2021-02-02 14:30:45');
	   SELECT *FROM Reviews


CREATE TABLE CartItems (
  cart_item_id INT IDENTITY PRIMARY KEY,
  cart_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (cart_id) REFERENCES Carts(cart_id)
);
INSERT INTO CartItems (cart_id, product_id, quantity)
VALUES (1, 1, 3),
       (2, 2, 1);
	    SELECT * FROM CartItems



CREATE TABLE Categories (
  category_id INT IDENTITY PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);
INSERT INTO Categories ( category_name, description)
VALUES ( N'Electronics', N'Electronic products'),
       ( N'Clothing', N'Clothing items');
	   SELECT * FROM Categories




CREATE TABLE ProductCategories (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
INSERT INTO ProductCategories (product_id, category_id)
VALUES (1, 1),
       (2, 2);
	   SELECT *FROM ProductCategories



SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM Carts
SELECT * FROM Addresses
SELECT * FROM PaymentMethods
SELECT * FROM Products
SELECT * FROM OrderDetails
SELECT * FROM CartItems
SELECT * FROM Categories
SELECT *FROM ProductCategories
SELECT *FROM Reviews

/*2. Lấy thông tin của tất cả sản phẩm bao gồm tên, giá và số lượng trong kho.*/
SELECT  Products.product_name ,Products.price, Products.quantity_in_stock
FROM Products

/*3. Lấy chi tiết về sản phẩm trong mỗi đơn đặt hàng, bao gồm tên sản phẩm, số lượng và giá.*/
SELECT  OrderDetails.order_id ,Products.product_name, OrderDetails.quantity, OrderDetails.price
FROM OrderDetails
INNER JOIN
Products
ON OrderDetails.product_id = Products.product_id

/*4. Liệt kê tất cả khách hàng đã đặt hàng, bao gồm tên và địa chỉ email của họ.*/
SELECT Customers.customer_name, Customers.email
FROM Customers

/*5. Lấy các đánh giá cho một sản phẩm cụ thể, bao gồm tên của khách hàng, xếp hạng và bình luận.*/
EXEC sp_rename 'Customers.name', 'customer_name';
SELECT  Customers.customer_name ,Reviews.rating, Reviews.comment
FROM Reviews
INNER JOIN
Customers
ON Reviews.customer_id = Customers.customer_id

/*6. Lấy tên của khách hàng đã đánh giá sản phẩm, cùng với tên sản phẩm và xếp hạng.*/
EXEC sp_rename 'Products.name', 'product_name';
SELECT Customers.customer_name, Products.product_name , Reviews.rating
FROM Customers
INNER JOIN
Reviews
ON Customers.customer_id = Reviews.product_id 
INNER JOIN
Products
ON Products.product_id = Reviews.customer_id 

   
/*7. Xác định địa chỉ mặc định cho tất cả khách hàng trong cơ sở dữ liệu.*/
SELECT  Customers.customer_name ,Addresses.street, Addresses.city, Addresses.state, Addresses.zip_code, Addresses.country
FROM Addresses
INNER JOIN
Customers
ON Addresses.customer_id = Customers.customer_id

/*8. Liệt kê các sản phẩm trong một danh mục cụ thể, bao gồm tên và giá.*/
SELECT  Products.product_name ,Products.price
FROM Products

/*9. Lấy tên của khách hàng và ngày đặt hàng cho tất cả các đơn đặt hàng đã giao hàng.*/
SELECT Customers.customer_name, Orders.order_date
FROM Customers
INNER JOIN
Orders
ON Customers.customer_id = Orders.customer_id

/*10. Hiển thị đánh giá của sản phẩm 'Product 1' với xếp hạng là 5.*/
SELECT * FROM Reviews
WHERE rating = '5'and product_id = '1'
      