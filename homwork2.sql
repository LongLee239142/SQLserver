CREATE TABLE products(
product_id int identity primary key,
product_name varchar(50),
description text,
price int,
quantity_in_stock int,
maunfacturer varchar(50),
category varchar(20),
created_at datetime,
updated_at datetime,
is_available_BOOLEAN BIT  /*bit la kieu du lieu boolean */
);
insert into products values
('LongLee','perfect','50','2000','LongLeeGroup','import_product','20240123','20240124','3','blue'),
('LongLee','perfect','50','2000','LongLeeGroup','import_product','20240123','20240124','0','blue')

select* from products
alter table products
add color varchar(15);
exec sp_RENAME 'products.price','unit_price','column'