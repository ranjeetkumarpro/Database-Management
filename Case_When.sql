# When Case
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