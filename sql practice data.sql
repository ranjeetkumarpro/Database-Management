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

## SELECT

select * from personal;
Select name,age from personal;
Select name as St_Name,age as St_Age from personal;
Select name as a, age as b from personal;

## WHERE
Select * from personal where gender="M";
Select name from personal where gender="M";

## Comparison Operators
Select * from personal where age>18;
Select * from personal where age=18;
Select * from personal where age<20;
Select * from personal where age>=18;
Select * from personal where age<=18;
Select * from personal where city="Agra";
select * from personal where city!="agara";
Select * from personal where city<>"Agra";

## Logical Operators(AND,OR,NOT)
Select * from personal where age>=18 and age<=20;
Select * from personal where age>=18 or age<=20;
Select * from personal where age<=20 and gender="M";
Select * from personal where age<=20 and gender="M" 
and city="Agra";
Select * from personal where age<=20 or city="Agra";
Select * from personal where city="Bhopal" or city="Agra";
Select * from personal where city="Bhopal" and city="Agra";
Select * from personal where (city="Bhopal" or city="Agra")
 and gender="M";
 Select * from personal where not age>=20;
 Select * from personal where not(city="Bhopal" or city="Agra");
 
 ## IN Operator(in place of multiple or)
 Select * from personal where age=18 or age=20 or age=19 or age=24;
 Select * from personal where age in (18,21);
Select * from personal where  age in (18,21,19);
Select * from personal where  age not in (18,21,19);
Select * from personal where  city in ("Delhi","Bhopal");
Select * from personal where  city not in ("Delhi","Bhopal");
Select * from personal where  id in (1,3,4);

## BETWEEN Operator
Select * from personal where age between 18 and 20;

Select * from personal where age not between 18 and 20;

Select * from personal where id between 2 and 5;

Select * from personal where id  not between 2 and 5;

Select * from personal where name between "a" and "k";

# LIKE Operator
Select * from personal where name like "s%";

Select * from personal where name like "a%";

Select * from personal where name like "ram%";

Select * from personal where name like "rm%";

Select * from personal where name like "%am%";

Select * from personal where name like "r%" OR name like "s%";

Select * from personal where name not like "r%";

Select * from personal where name like "%r";

Select * from personal where name like "%ar";

Select * from personal where phone like "%21";

Select * from personal where phone not like "%21";

Select * from personal where name like "s%n";

Select * from personal where name like "r%r";

Select * from personal where name like "_am%";

Select * from personal where name like "__m%";

Select * from personal where name like "__l%";

Select * from personal where name like "r_m%";

## REGULAR EXPRESSIONS
select * from personal where name regexp 'ra';

select * from personal where name regexp 'la';

select * from personal where name regexp 'man';

select * from personal where name regexp '^ra';

select * from personal where name regexp '^sa';

select * from personal where name regexp 'an$';

select * from personal where name regexp 'ram|kapoor|khan';

select * from personal where name regexp 'ram|poor|khan';

select * from personal where name regexp '^ram|kapoor|^khan';

select * from personal where name regexp '^ram|kapoor|khan$';

select * from personal where name regexp '[is]';

select * from personal where name regexp '[rm]';

select * from personal where name regexp '[rm]a';

select * from personal where name regexp '[rmh]a';

select * from personal where name regexp '^[rs]';

select * from personal where name regexp 'r[am]';

## ORDER BY
 select * from personal order by name;
 
 select * from personal order by name asc;
 
  select * from personal order by name desc;
  
select * from personal order by age;

select * from personal order by city;

select * from personal order by name, city;

 select * from personal where city="agara" order by name desc;
 
 ## DISTINCT
 select distinct city from personal;
 
 select distinct age from personal;
 
 select distinct age from personal order by age;
 
 select distinct city from personal order by city;
 
 ## LIMIT 
select * from personal;

select * from personal limit 3;

select * from personal limit 4;

select * from personal where city = "agara";

select * from personal where city = "agara" limit 2;

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

## Arithmetic functions

select 5+6;

select 5-6;

select 5*6;

select 5/3;

select * from personal1;

select id, name, (percantage +5) as new_percantage from personal1;

select pi();

select round(4.49);

select round(-4.49);

select round(1234.987,2);

select round(1234.987,1);

select ceil(1.23);

select floor(4.56);

select pow(2,2);

select pow(2,3);

select pow(2,4);

select sqrt(16);

select sqrt(4);

select sqrt(5);

select round(sqrt(9),2);

select rand();


select rand()*100;

select abs(-56);

select abs(-56.25);

select abs(56.25);

select sign(23);

select sign(0);

select sign(-23);

## STRING FUNCTIONS
select id, upper(name), percantage from personal1;

select id, ucase(name), percantage from personal1;

select id, lower(name), percantage from personal1;

select id, name, character_length(name),percantage from personal1;

select id, name, char_length(name),percantage from personal1;

select id, name, length(name),percantage from personal1;

select id, concat(name,age) from personal1;

select id, concat(name,"-" ,percantage) from personal1;

select concat("Ranjeet");

select concat_ws("-","Ranjeet" "Hello","class");

select concat_ws(" ","Ranjeet" "Hello","class");

select trim(      "ranjeet"       );

select position("world" in "helloworld");

select position("o" in "helloworld");

select instr("helloworld","ell");

select locate("ell","helloworld");

select locate("l","helloworld",7);

select locate("l","helloworld",10);

select substring("ranjeet kumar",5);

select substring("ranjeet kumar",3,6);

select substring("ranjeet kumar",6,3);

select mid("ranjeet kumar",-6,3);

 select substring("ranjeet kumar",-6,3);
 
 select substring_index("www.NeemaJha.net",".",1);
 
 select substring_index("www.NeemaJha.net",".",2);
 
 select substring_index("www.NeemaJha.net","e",2);
 
 select strcmp("Neema Jha","Neema");
 
  select strcmp("Neema Jha","Neema Jha");
  
   select strcmp("Neema","Neema Jha");
   
   select format(235.3568,3);
   
   select left("Neema Jha",3);
   
   select left("Neema Jha",5);
   
   select right("Neema Jha",3);
   
select rpad("Neema Jha",20,"-");
   
select rpad("Neema Jha",20,"*");
    
select lpad("Neema Jha",20,"*");
       
select rpad("Neema Jha",20,"-");
             
select replace("Neema JHa","Neema","Ms.");
     
select field("A","X","A","K");
     
select field("a","X","A","k");
     
	select field(5,0,1,2,3,4,5);
     
	select field("ram","Ram","mohan","Shyam");
          
select find_in_set("mohan","Ram,mohan,Shyam");         

 # Date Function
 
select current_date();

select curdate();

select sysdate();

select now();

select date("2025-10-14 10:09:21");

select month("2025-10-14 10:09:21");

select monthname("2025-10-14 10:09:21");

select year("2025-10-14 10:09:21");

select quarter("2025-10-14 10:09:21");

select day("2025-10-14 10:09:21");

select dayofmonth("2025-10-14 10:09:21");

select dayname("2025-10-14 10:09:21");

select dayofweek("2025-10-14 10:09:21");

select yearweek("2025-10-14 10:09:21");

select last_day("2025-10-14 10:09:21");

select extract(month from "2025-10-14 10:09:21");

select extract(year from "2025-10-14 10:09:21");

select extract(week from "2025-10-14 10:09:21");

select extract(day from "2025-10-14 10:09:21");

select extract(hour from "2025-10-14 10:09:21");

select extract(minute from "2025-10-14 10:09:21");

select extract(second from "2025-10-14 10:09:21");

select adddate("2025-10-14", interval 10 day);

select adddate("2025-10-14", interval 1 month);

select adddate("2025-10-14", interval 1 year);

select adddate("2025-10-14", interval 500 minute);

select date_add("2025-10-14", interval 10 day);

select subdate("2025-10-14", interval 1 day);

select datediff("2025-10-14", "2025-10-13");

## Time Function


select current_time();

select curtime();

select current_timestamp();

select time("2025-10-14 10:09:2021");

select hour("2025-10-14 10:09:2021");

select min("2025-10-14 10:09:2021");

use school;

select * from book1;

select * from student; 

  create table employees(
  id int primary key,
  name varchar(50),  
  depatment varchar(50),
  salary decimal(10,2),
  exptrience int
  );
  insert into employees(id,name,depatment,salary,exptrience)values
  (1,'Alice','HR',50000,5),
  (2,'Bob','Engineering',70000,8),
  (3,'Charlie','Engineering',60000,3),
  (4,'David','HR',45000,1),
  (5,'Eve','Marketing',55000,4);
  
  select id, name, exptrience,
  
  if (exptrience >= 5, 'Senior', 'Junior') As exptrience_level
  from employees;
  
 select id, name, depatment,salary,
 
  if (depatment = 'Engineering',salary*0.10, salary*0.5) As bonus
  
  from employees;
  select id,name,exptrience,salary,
  if(exptrience >= 5 and salary >= 50000, 'Eligible', 'Not Eligible') as promotion_Eligibility
  from employees;

select id, name,salary,
if(salary >(select AVG(salary) from employees), 'Above Average', 'Below Average') as
salary_level
from employees; 

  create table employees1(
  id int primary key,
  name varchar(50),  
  depatment varchar(50),
  salary int,
  gender varchar(10)
  );
 insert into employees1(id,name,depatment,salary,gender)values
  (1,'Alice','HR',50000,5),
  (2,'Bob','Engineering',70000,8),
  (3,'Charlie','Engineering',60000,3),
  (4,'David','HR',45000,1),
  (5,'Eve','Marketing',55000,4);
  create table employees2(
  id int primary key,
  name varchar(50),  
  department varchar(50),
  salary int,
  experience int,
  gender varchar(10));
 insert into employees2(id,name,department,salary,experience,gender)values
  (1,'Alice','HR',40000,3,'Female'),
  (2,'Bob','Finance',60000,6,'Male'),
  (3,'Charlie','IT',55000,4,'Male'),
  (4,'David','IT',80000,10,'Male'),
  (5,'Eve','Finance',45000,2,'Female'),
  (6,'Frank','HR',50000,7,'Male'),
  (7,'Grace','IT',30000, 1,'Female'),
  (8,'Helen','Finance',70000,9,'Female'),
  (9,'Ian','HR',65000,8,'Male'),
  (10,'Julia','IT',48000,3,'female');
  select name,salary,
  case
  when salary<70000 Then'High'
  when salary Between 40000 and 70000 Then 'Medium'
  Else'low'
  End AS Salary_Level
  from employees2;
  Select name,experience,
  case
  when experience>=8 Then 10000
  when experience>=5 then 7000
  ELSE 3000
  End As bonus
  from employees2;
  
  select name,
  CASE gender
  When'Male' Then CONCAT('Mr.',name)
  When'Female' Then CONCAT('ms.',name)
  End As titled_name
  from employees2; 
  
  select name, experience,salary,
  case
  when experience>8 And salary>60000 Then'A'
  When experience Between 5 And 8 Then 'B'
  Else'C'
  End As performance_grade
  from employees2;
  
  select name,department,
  case
  when department='IT' Then 'D01'
  when department='Finance' Then 'D02'
  when department='HR' Then 'D03'
  End As Code_in
  from employees2;
  
   select name,salary,
   case 
   when salary<40000 Then salary*1.2
   when salary Between 40000 And 60000 Then salary*1.1
   Else salary*1.05
   End as New_Salary
   from employees2;
   select * from employees2;
   select name,department,
   case
   when department in ('IT','Finance') Then 'Techinacal'
   Else 'Non Techincal'
   End As department_tech
   from employees2;

select name,salary,
   case
   when salary>(select Avg(salary) from employees2)Then 'Above company Average'
   Else'Below Company average'
   End As Compare_status
   from employees2;
   
   use company;
   select * from book2;
    #1 find total sale amount for each region.
   alter table book2 rename column quqntity to quantity;
   select region,sum(quantity * price) As Total_sale_amont
   from book2 
   group by region;
   #2 find total quantity sold by each salesperson.
   select salesperson, sum(quantity) as total_quantity_sold
   from book2
   group by salesperson;
   #3 show categories where total quantity sold is more than 30.
   select category, sum(quantity) as total_quantity_sold from book2 group by category
   having sum(quantity) > 30;
   #4 find total revenue by each category.
    select category, sum(quantity*price) as total_revenue from book2
    group by category;
    #5 find salesperson who sold total quantity mopre than 20. 
select salesperson, sum(quantity) as sold_total_quantity from book2
group by salesperson having sum(quantity)>20;
#6 find region-wise average sale price.
 select region, avg(price) as average_sale_price from book2
 group by region;
 #7 find total revenue for each salesperson and show only those having revenue above 300000.
 select salesperson, sum(quantity*price) as total_revenue from book2 
 group by salesperson having sum(quantity*price) > 300000;
  #8 find how many products each category has.
   select category, count(distinct product) as total_product from book2 
   group by category;
   #9 find total sales per month.
 select * from book2;
 
   #10 find each region's maxium sale price.
   select region, max(price) as sale_price from book2
   group by region;
  #11 find each category's average quantity sold, but show only where avg>10.
  select category, avg(quantity) as average_quantity_sold from book2
  group by category having avg(quantity)>10;
  #12 find total revenue by region and category.
  select region, category, sum(quantity*price) as total_revenue
  from book2 group by region, category order by region, category;
  use company;
  SET SQL_SAFE_UPDATES = 0;

  UPDATE book2
SET 
    sale_date = CASE sale_id
        WHEN 8 THEN '2024-02-04'
        WHEN 9 THEN '2024-04-12'
        WHEN 10 THEN '2024-04-15'
    END
WHERE sale_id IN (8, 9, 10);

Use Company;
select * from book2;
 #9 find total sales per month.
SELECT 
    MONTH(sale_date) AS month_number,
    DATE_FORMAT(sale_date, '%M') AS month_name,
    SUM(quantity * price) AS total_sales
FROM 
    book2
GROUP BY 
    MONTH(sale_date), DATE_FORMAT(sale_date, '%M')
ORDER BY 
    MONTH(sale_date);  

#13 Find How Many Sales each salesperson made in each region
select region, salesperson, count(*) As Total_sales
from book2 group by region, salesperson order by region, salesperson;

#14 Find the region where total quantity sold exceeds 20.
select region, sum(quantity) as Total_quantity
from book2 group by region having sum(quantity) > 20;

#15 Find salesperson who sold in more than one region.
select salesperson, count(distinct region) as Region_covered
from book2 group by salesperson having count(distinct region) > 1;

#16 Find category having total revenue between 200000 and 1000000.
select category, sum(quantity*price) as Total_revenue
from book2 group by category having sum(quantity*price) between 200000 and 1000000;

#17 Find top 1 category with the highest total sales.
select category, sum(quantity * price) as Highest_Total_Sale
from book2 group by category  order by Highest_Total_sale DESC limit 1;

#18 Find salesperson's average sale value per transaction.
select salesperson, avg(quantity*price) as average_sale_value
from book2 group by salesperson;

#19 Find category with minimum average price greater than 20000.
SELECT category, AVG(price) AS avg_price
FROM book2 GROUP BY category
HAVING AVG(price) > 20000
ORDER BY avg_price ASC;

#20 Find region and sales person combination where revenue > 200000.
SELECT region, salesperson,
    SUM(quantity * price) AS total_revenue
FROM  book2 GROUP BY region, salesperson
HAVING SUM(quantity * price) > 200000;



