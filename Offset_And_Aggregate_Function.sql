## OFFSET
select * from personal limit 3,3;
 
 select * from personal limit 3,2;
 
 select * from personal limit 4,2;
 
 select * from personal limit 5,2;
 
 select * from personal limit 0,2;
 
 
 create table personal1(id int, name varchar(40), percantage int, age int, gender varchar(1), phone varchar(12), city varchar(20));
 
 use school;
 
 select * from personal1;
 
 insert into personal1(id, name, percantage, age, gender, phone, city) values
 (1, "ram kumar", 45, 19, "M", "456556", "agara"),
 (2, "Sarita kumari" ,55, 22, "F", "565557", "delhi"),
 (3, "Salman khjan", 62, 20, "M", "565666", "agara"),
 (4, "juhi chawala", 47, 18, "F", "676777", "Bhopal"),
 (5, "Anil Kapoor", 74, 22,"M", "788767", "agara"),
 (6, "john Abraham", 64, 21, "M", "7687678", "Delhi"),
 (7, "Shahid kapoor", 52, 20, "M", "676777", "agara");
 
 ## Aggregate Functions

 select count(name) from personal1;
 
 select count(*) from personal1;
 
 select max(percantage) from personal1;
 
select min(percantage) from personal1;

select sum(percantage) from personal1;

select avg(percantage) from personal1;

select count(distinct city) from personal1;