CREATE TABLE Customers (
  customer_id INT IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address TEXT NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
INSERT INTO Customers ( name, address, email, password)
VALUES ( 'Customer 1', '123 Main St, Cityville', 'customer1@example.com', 'hashed_password'),
       ( 'Customer 2', '456 Oak St, Townsville', 'customer2@example.com', 'hashed_password')
SELECT * FROM Customers



CREATE TABLE Orders (
  order_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date TIMESTAMP NOT NULL,
  status VARCHAR(50) NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders (order_date, status, total_amount)
VALUES ( '20240202143045', 'Pending', 29.99),
       ( '2022020393045', 'Shipped', 79.98);
SELECT * FROM Orders



CREATE TABLE Carts(
  cart_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  created_date TIMESTAMP NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

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

CREATE TABLE PaymentMethods (
  payment_method_id INT IDENTITY PRIMARY KEY,
  customer_id INT NOT NULL,
  card_number VARCHAR(16) NOT NULL,
  expiry_date DATE NOT NULL,
  cvv VARCHAR(4) NOT NULL,
  is_default TINYINT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Products (
  product_id INT IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity_in_stock INT NOT NULL
);

CREATE TABLE OrderDetails (
  order_detail_id INT IDENTITY PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews(
  review_id INT IDENTITY PRIMARY KEY,
  product_id INT,
  customer_id INT,
  rating INT,
  comment TEXT,
  review_date TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE CartItems (
  cart_item_id INT IDENTITY PRIMARY KEY,
  cart_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (cart_id) REFERENCES Carts(cart_id)
);

CREATE TABLE Categories (
  category_id INT IDENTITY PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE ProductCategories (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);