
create database university_professors
create table university_professors(
first_name varchar(50),
last_name varchar(50),
university varchar(50),
university_shortname varchar(10),
university_city varchar(20),
function_ varchar(100),
organization varchar(100),
organization_sector varchar(80)
);
Insert into dbo.university_professors(
         first_name,
		 last_name,
		 university,
		 university_shortname,
		 university_city,
		 function_,
		 organization,
		 organization_sector
)
values( 'Karl',
        'Abrere',
		'ETH L ausanne',
		'EPF',
		'Lausanne',
		'Chair main of L3S Advisory Board',
		'L3S Advisory Board',
		'Education & research'
);
Insert into dbo.university_professors(
         first_name,
		 last_name,
		 university,
		 university_shortname,
		 university_city,
		 function_,
		 organization,
		 organization_sector
)
values( 'Karl',
        'Abrere',
		'ETH L ausanne',
		'EPF',
		'Lausanne',
		'Member Conseil of Zeno-Karl Schindler Foundation',
		'Zeno-Karl Schindler Foundation',
		'Education & research'
);
Insert into dbo.university_professors(
         first_name,
		 last_name,
		 university,
		 university_shortname,
		 university_city,
		 function_,
		 organization,
		 organization_sector
)
values( 'Karl',
        'Abrere',
		'ETH L ausanne',
		'EPF',
		'Lausanne',
		'Member of Conseil Fondation IDIAP',
		'Fondation IDIAP',
		'Education & research'
);
create table professors (
first_name varchar(10),
last_name varchar (50),
university_shortname varchar(100)
);
insert into dbo.professors (
          first_name,
		  last_name,
		  university_shortname
)
select  first_name ,last_name, university_shortname
from university_professors
create table employees(
id Int identity primary key,

name varchar (100),
phone varchar(10),
address varchar(50)
)
insert into employees values 
('LongLee','0123456789','HN'),
('LongLee','0123456789','HN'),
('LongLee','0123456789','HN')
alter table employees
add email varchar(30);
/*sua kieu du lieu */
alter table employees
alter column email text;
CREATE TABLE customers (
  id int identity PRIMARY KEY,
  customer_name VARCHAR NOT NULL
);

ALTER TABLE customers 
ADD  fax VARCHAR,
 email VARCHAR;
 /*add column*/
 alter table employees
 add dob datetime;
 /*change type of column*/
 alter table employees
 alter column dob text;
 /*rename column*/
 exec sp_RENAME 'employees.email', 'gmail','column'
 CREATE Table order_details(
 order_id int identity primary key,
 product_it int,
 quantity int,
 unit_price float
);
exec sp_RENAME 'order_details.unit_price','old_price','COLUMN'
alter table order_details
add percentage int;
select order_id , quantity from order_details;