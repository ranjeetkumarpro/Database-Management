create database Subqueries;
use subqueries;

create table employee(emp_id int  not null,emp_name varchar(100),department varchar (30),salary int,manager_id int);
select * from employee;

insert into employee(emp_id,emp_name,department,salary,manager_id) values(1,"Arjun","HR",40000,null),
(2,"Neha","IT",65000,5),(3,"Rohan","IT",55000,5),(4,"Meera","Finance",70000,null),(5,"Suresh","IT",90000,4),
(6,"Alia","HR",45000,1),(7,"Karan","Finance",75000,4),(8,"Rahul","Marketing",30000,null),(9,"Priya","Marketing",35000,8),
(10,"Varun","IT",50000,5);
select*from employee;

# 1 List employees earning more than the average salary.

select emp_name,salary
from employee
where salary > (select avg(salary) from employee);

# 2 Find employees who earn the maximum salary.

select emp_name , salary
from employee
where salary = (select max(salary) from employee);

# 3 Find employees working in the same department as ‘Neha'

select emp_name,department
from employee
where department = (select department from employee where emp_name="Neha");

# 4 List employees whose salary is higher than Suresh’s salary.

select emp_name,salary
from employee 
where salary > (select salary from employee where emp_name="Suresh");

# 5 Show departments where the minimum salary is less than 40,000.

select Department
 from employee
where salary = (select min(salary) from employee group by department having min(salary) < 40000);

# 6 Find employees who do not have a manager.

select emp_name from employee 
where emp_name in (select emp_name from employee where manager_id is null);

select * from employee;

# 7 Find employees who report to the same manager as Rohan

select emp_name from employee 
where manager_id in (select manager_id from employee
 where emp_name = "Rohan");
 
 # 8 List employees in IT with salaries above the IT average.
 
 select emp_name,salary from employee 
 where salary > (select avg(salary) from employee where department = "IT");
 
 # 9 Show employees whose salary is in the bottom 3.
 
 select emp_name from employee 
 where salary in (select distinct salary from employee order by salary asc limit 3);
 select emp_name,salary from(select emp_name ,salary
 from employee order by salary asc limit 3) as t;
 
 # 10 Show employees whose salary is within the top 3.
 
 select emp_name from (select emp_name from employee order by salary desc limit 3) as t;
 
 # 11 Find employees earning more than the HR department 's average salary.
 
 select emp_name,salary from employee 
 where salary> (select avg(salary) from employee where department = "HR");
 
 # 12 List employees having the same salary as Priya.
 
 select emp_name from employee 
 where salary = (select salary  from employee where emp_name="Priya");
 
 # 13 Count employees who earn below overall average.
 
 select count(*) from employee 
 where salary < (select avg(salary) from employee );
 
 # 14 Show employees whose manager earns more than 70,000.
 
 select emp_name from employee 
 where manager_id  in ( select manager_id from employee 
 where salary > 70000);
 
 # 15.	Display employees in departments where more than 2 employees work
 
 select emp_name from employee 
 where department in (select department from employee group by department having count(*) > 2);
 
 #16.	Show departments where the average salary is above company average.
 
 select department , salary from employee 
 where salary > (select avg(salary) from employee);
 SELECT department
FROM employee GROUP BY department
HAVING AVG(salary) > ( SELECT AVG(salary) FROM employee );

 
 # 17 Find the 2nd highest salary.
 
 select salary from employee 
 where salary = (select max(salary) from employee 
 where salary < (select max(salary) from employee ));
 
 # 18 Employees with salaries greater than the average salary of their manager’s team.
 select e.emp_name,e.salary
 from employee e
 where salary>(select avg(salary) from employee where manager_id=e.manager_id group by manager_id); 
 
 
 
 # 19 Show employees who work in a department where Suresh works.
 
 select emp_name from employee 
 where department = (select department from employee 
 where emp_name = "Suresh");
 
 # 20 List employees whose manager earns the maximum salary.
 
 select emp_name from employee 
 where manager_id in (select manager_id  from employee 
 where salary = (select max(salary)  from employee));
 
 # 21 Show employees whose salaries appear more than once.
 
 SELECT emp_name FROM employee
WHERE salary IN (SELECT salary FROM employee
    GROUP BY salary HAVING COUNT(*) > 1); 
 
 #22.	List employees earning less than the minimum IT salary.
 
 select emp_name from employee 
 where salary = ( select min(salary) from employee  
 where department = "IT");
 
 #23.	Show employees with salaries higher than the Finance average salary.
 
 select emp_name, salary from employee
 where salary > (select avg(salary) from employee 
 where department = "Finance");
 
 #24.	Find employees earning exactly the 3rd highest salary.
 
 select emp_name from employee  
 where salary = (select distinct salary from employee order by salary desc limit 1 offset 2);
 
 select * from employee;
 
 #25.	List employees having salary in the same salary group as Meera’s department.
 
 select emp_name from employee
 where salary in (select distinct salary from employee 
 where department = (select department from employee 
 where emp_name = "Meera"));