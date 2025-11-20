use school;
create table employees5(emp_id int primary key , first_name varchar(50),
last_name varchar(50), department varchar(20), salary int , hire_date date);
select * from employees5;
alter table employees5 modify salary decimal(10,2);
insert into employees5 values(1, "john","doe","IT",60000.00,"2019-01-10"),
(2,"jane", "smith", "HR",55000.00,"2018-03-05"),
(3,"emily","jones","IT", 62000.00,"2020-07-23"),
(4,"michael","brown","Finance",70000.00,"2016-05-14"),
(5,"sarah","davis","Finance",69000.00,"2017-11-18"),
(6,"david","johnson","HR",48000.00,"2021-09-10");

 #1 Find the average salary of employees5 in each department
 select department, avg(salary) as average_salary
 from employees5 group by department;

#2 Find the total number of employees5 hired after 2019
select count(*) as total_employees_hire_after_2019
from employees5 where hire_date > '2019-12-31';

#3 List the departments and the total salary of all employees5 in each department, ordered by the total salary. 
select department, sum(salary) as Total_salary from employees5
group by department order by Total_salary DESC;

#4 Find the highest salary in the Finance department
 select max(salary) as Highest_salary
 from employees5 where department = 'Finance';
 
#5 Get the top 3 highest-paid employees5. 
select first_name,last_name,department,salary
from employees5 order by salary DESC LIMIT 3;

#6 Find the department with the minimum average salary.
select department, avg(salary) as Minimum_salary
from employees5 group by department order by minimum_salary ASC LIMIT 1;

#7  Display the total number of employees5 in each department, ordered by the number of employees.
select department, count(*) as Total_sale
from employees5 group by department order by Total_sale DESC;

#8 Find the average salary of employees5 who were hired before 2020  
select avg(salary) as average_salary_before_2020
from employees5 where hire_date < '2020-01-01';

#9  List the names of employees5 in the IT department ordered by hire date, with the most recently hired employees first. 
select first_name,last_name,hire_date from employees5 where department = 'IT' 
order by hire_date DESC;

#10 Find the sum of salaries for all employees5 hired after January 1, 2019, ordered by salary.
select first_name,last_name,salary,hire_date from employees5
where hire_date > '2019-01-01' order by salary DESC;
SELECT SUM(salary) AS total_salary_after_2019
FROM employees5 WHERE hire_date > '2019-01-01';

#11  Get the employee5 with the lowest salary in the HR department.
 SELECT first_name,last_name,department,salary
FROM employees5 WHERE department = 'HR'
ORDER BY salary ASC LIMIT 1;

#12 Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
select department, sum(salary) as Total_salary
from employees5 group by department order by Total_salary DESC limit 2;

#13 List all employees hired after 2018, ordered by salary, and show only the first 4 employees5. 
SELECT first_name,last_name,department,salary,hire_date
FROM employees5 WHERE hire_date > '2018-12-31'
ORDER BY salary DESC LIMIT 4;

#14  Find the highest salary in the IT department, but limit the results to the top 1 result.
SELECT first_name,last_name,department,salary
FROM employees5 WHERE department = 'IT'
ORDER BY salary DESC LIMIT 1;

#15 Get the average salary of employees5 in each department and list only departments with an average salary greater than $60,000.
SELECT department, AVG(salary) AS average_salary
FROM employees5 GROUP BY department
HAVING AVG(salary) > 60000;
