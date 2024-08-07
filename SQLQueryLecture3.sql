create table users(
user_id int identity primary key,
email varchar(100),
name varchar(50)
)
create table oders(
oder_no int identity primary key,
product_sku int,
user_id int foreign key references users(user_id)
)
insert into users values
('sql@gmail.com','sadio'),
('sql@gmail.com','sadio1'),
('sql@gmail.com','sadio2'),
('sql@gmail.com','sadio3'),
('sql@gmail.com','sadio4'),
('sql@gmail.com','sadio5')
select*from users
insert into oders(product_sku,user_id)
values
(10,3),
(20,2),
(30,1),
(40,4),
(50,6),
(60,5),
(70,7)
select*from oders
select * from users
CREATE TABLE employees1 (
    id int identity PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    birth_date DATE CHECK (birth_date > '1900-01-01'),
    joined_date DATE ,
    salary NUMERIC CHECK(salary > 0),
	constraint CHK_employess1 CHECK ( joined_date > birth_date)
);
insert into employees1 values
('john','doe','19700201','19820709',10000);
select*from employees1
CREATE TABLE employees2 (
    id SMALLINT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    joined_date DATE,
    salary NUMERIC,
	constraint CHK_employess2 CHECK ( joined_date > birth_date),
	constraint CHK_employee CHECK ( salary > 0)
);
/*THEM DIEU KIEN RANG BUOC BEN NGOAI TABLE
ALTER TABLE employees
ADD CONSTRAINT chk_birthdate CHECK ( birth_date < '1900-01-01' ),
ADD CONSTRAINT chk_joineddate CHECK ( joined_date < birth_date ),
ADD CONSTRAINT chk_salary CHECK ( salary < 0 );*/
