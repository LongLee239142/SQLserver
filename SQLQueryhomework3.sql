create table products(
product_id int IDENTITY PRIMARY KEY,
product_name varchar(50) NOT NULL,
price decimal(10,2) CHECK (price >=0) not null,
manufacturer varchar(50),
stock_quantity int Check (stock_quantity >=0),
release_date date
);
insert into products values
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('name','5','directer','3','20240107'),
('','5','directer','3','20240107')
select*from products
create table orders(
order_id int IDENTITY PRIMARY KEY,
customer_name varchar(50) NOT NULL,
total_amount  DECIMAL(10,2) NOT NULL,
product_id int foreign key references products(product_id),
quantity int CHECK (quantity >0),
order_status bit
);
insert into orders values
('John','8','5','3','2'),
('John','8','10','3','-2'),
('John','8','24','3','-2')

select*from orders