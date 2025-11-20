# Syntax to create database
create database school;
# Syntax to use database
use school;
# Constraints
create table student(st_id int, st_name varchar(40), st_age int);

select * from student;

 insert into student(st_id,st_name,st_age) values(1,"raj",25);
 
 insert into student(st_id,st_name,st_age) values(2,"ria",22),
 (3,"ram",18);
 
 alter table student add email varchar(30);
 
 alter table student modify email int;
 
 alter table student change email email_id varchar(30);
 
alter table student modify email_id varchar(30) after st_name;

alter table student drop column email_id;

create table personal(id int, name varchar(50), age int,   gender varchar(1), phone varchar(12), city varchar(20));

alter table personal add age int;

alter table personal add city varchar(20);
 


insert into personal(id, name, age, gender, phone, city)values
(1, "ram kumar", 19, "m", "4022155", "agara"),
(2, "sarita ktumari",  21, "f", "4034421", "delhi"),
(3, "salman khan",  20, "m", "4056221", "agara"),
(4, "juhi chawla", 18, "f", "4098708", "bhopal"),
(5, "anil kapoor",  22, "m", "4056768", "agara"),
(6, "john abraham",  21, "m", "793838", "delhi");
