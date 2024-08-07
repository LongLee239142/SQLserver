CREATE TABLE actor(
actor_id INT IDENTITY(1,2)PRIMARY KEY,
first_name varchar(100),
last_name varchar(100)
);

insert into actor (first_name, last_name)
Values('PENELOPE','GUINESS'),
('NICK','WAHLBERG')

select *from actor
select first_name+' '+last_name as full_name from actor
select concat(first_name,' ',last_name) as full_naME from actor



CREATE TABLE transactions (
    transaction_date DATE,
    amount TEXT,
    fee TEXT
);
select *from transactions
insert into transactions
values 
('20230623','500','24'),
('20230323','550','10'),
('20230423','560','40'),
('20230523','570','30'),
('20230823','300','20')
Select transaction_date,cast( cast( amount as varchar) as INT)
+cast( cast (fee as VARCHAR) as INT)  as net_amount from transactions


CREATE TABLE actor(
actor_id smallint identity primary key,
first_name varchar(50),
last_name varchar(50),
birthdate datetime
);
select * from actor
insert into actor(first_name,last_name,birthdate)
values('PENELOPE','GUINESS','1998-02-01 00:00:00'),
      ('NICK','WAHLBERG','1997-01-01 00:00:00'),
	  ('ED','CHASE','1998-02-06 00:00:00'),
	  ('JENNIFER','DAVIS','1999-12-12 00:00:00'),
	  ('JOHNNY','LOLLOBRIGIDA','2001-01-02 00:00:00')



	  Select cast( birthdate as date) from actor
	  order by birthdate desc;



SELECT *from transactions
SELECT TOP 2 *from transactions order by cast( cast( amount as varchar) as INT) asc



CREATE TABLE actor(
actor_id INT IDENTITY(1,2)PRIMARY KEY,
first_name varchar(100),
last_name varchar(100)
);

insert into actor (first_name, last_name)
Values('PENELOPE','GUINESS'),
('NICK','WAHLBERG'),
('LONG','LE'),
('NEYMAR','WAHLBERG'),
('NICK','BILL'),
('TRAN','TAN'),
('SON','HOANG'),
('NAME','WAHLBERG'),
('NICK','ANH'),
('VIET','DUC')
select * from actor
/*like without op*/
select *from actor where first_name like 'N%'

CREATE TABLE suspect
(
  id INT IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  surname VARCHAR(50),
  height INT,
  weight INT
);
INSERT INTO suspect ( name, surname, height, weight)
VALUES
  ( 'John', 'Doe', 165, 60),
  ( 'Bill', 'Green', 170, 67),
  ( 'Baelfire', 'Grehn', 172, 70),
  ( 'Bill', 'Gretan', 165, 55),
  ( 'Brendon', 'Grewn', 150, 50),
  ( 'bill', 'Green', 169, 50);
  SELECT
name, surname
FROM
suspect
WHERE 
name LIKE 'B%' 
AND
surname LIKE 'Gre_n'
AND
height <= 170;



