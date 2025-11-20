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