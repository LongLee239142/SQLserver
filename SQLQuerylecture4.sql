create table reserved_nicknamess(
id varchar(20),
nickname varchar (50)
);
insert into reserved_nicknamess (id, nickname) values
('1','alex2020'),
('123','qwuerty1'),
('id021','trungduyen0220'),
('id1','alex1990x')
select*from reserved_nicknamess
update reserved_nicknamess set nickname = concat('rename - ',nickname)
where len(nickname) <> 8



create table affiliations (
first_name varchar(50),
last_name varchar(50),
function_ varchar (50),
organization_id varchar(50),
professor_id varchar(50) null
);
INSERT INTO affiliations values
('Anastasia','Ailamaki','Consulting on data mgmt','S2P Lion',''),
('Cesla','Amarelle','Mandat','Nationalrat',''),
('Christoph','Aebi','NA','SWAN Isotopen AG',''),
('Daniel','Aebersold','NA','Berner Radium-Stiftung',''),
('Daniel','Aebersold','NA','Janser Krebs-Stiftung','')
select*from affiliations
create table professors (
id INT,
first_name varchar(50),
last_name varchar(50),
university_shortname varchar (5)
);
INSERT INTO professors values
('5','Daniel','Aebersold','UBE'),
('7','Christoph','Aebi','UBE'),
('10','Anastasia','Ailamaki','UBE'),
('11','Cesla','Amarelle','UBE')
update affiliations set professor_id = professors.id
from professors
where 
affiliations.first_name = professors.first_name and affiliations.last_name = professors.last_name
/*drop -> all  off table
delete -> record with condition*/


