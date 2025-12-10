use joinscocept;

create table Employee(emp_id int not null,emp_name varchar(50),dept_id int,salary int);
select *  from Employee;

insert into Employee values (1,"John",101,50000),
(2,"Emma",101,65000),(3,"Raj",102,45000),(4,"Meera",103,70000),
(5,"Ravi",102,48000),(6,"Naina",103,52000),(7,"Alex",101,58000);

create table Department(dept_id int,dept_name varchar(20));

select *  from Department;

insert into Department values (101,"Sales"),(102,"Marketing"),(103,"Finance");

#1 Display employee names with their department name

select e.emp_name,d.dept_name
from  Employee e
right join Department d on e.dept_id=d.dept_id;

# 2 List all employees including those with no matching department.

select e.emp_name,d.dept_name
from Employee e
left join Department d on e.dept_id=d.dept_id;

# 3 List all departments even if there are no employees.

select d.dept_name
from Department d
right join Employee e on d.dept_id=e.dept_id;

# 4 Show employees from the Sales department.

select d.dept_name,e.emp_name
from Employee e
left join Department d on e.dept_id=d.dept_id
where dept_name = 'sales';

# 5 Find the top 3 highest paid employees.

select e.emp_name,e.salary
from Employee e
left join Department d on e.dept_id=d.dept_id
order by salary DESC LIMIT 3;

# 6 Find employees earning more than 50,000 from Marketing.

select e.emp_name,d.dept_name,e.salary
from Employee e
left join Department d on e.dept_id=d.dept_id
where d.dept_name = 'marketing' and e.salary > 50000;

# 7 Count employees in each department

select d.dept_name ,
count(e.emp_name) as total_employees 
from Department d
left join Employee e on d.dept_id=e.dept_id
group by d.dept_name;

# 8 Show departments having more than 2 employees.

select d.dept_name,
count(e.dept_id) as Total_eployee
from Department d
left join Employee e on d.dept_id=e.dept_id
group by d.dept_name having count(e.dept_id) > 2;

# 9 Show highest salary in each department.

select d.dept_name,
		max(e.salary) as highest_salary
from Department d
left join Employee e on d.dept_id=e.dept_id
group by d.dept_name;

# 10 Show employees whose salary is above department average.

   select e.emp_name,e.salary,d.dept_name
   from Employee e
   left join Department d on e.dept_id=d.dept_id
   where e.salary > (select avg(e.salary) from Employee e group by d.dept_name);
 

# 11 Show employees and their departments sorted by department name.

 select e.emp_name,d.dept_name
 from Employee e
 left join Department d on e.dept_id=d.dept_id
 order by d.dept_name asc;
 
 # 12 List the 2 lowest-paid employees with department names.
 
 select e.emp_name,e.salary
 from  Employee e
 left join Department d on e.dept_id=d.dept_id 
 order by e.salary asc limit 2;
 
 # 13 Show total salary expenditure per department.
 
 select d.dept_name,
          sum(e.salary) as total_salary_expenditure
 from Department d
 Left join Employee e on e.dept_id=d.dept_id
 group by d.dept_name;
 
 # 14 Show departments where the total salary spent is more than 150,000.
 
select d.dept_name,
sum(e.salary) as total_salary
from Department d
left join Employee e on d.dept_id=e.dept_id
group by d.dept_name having sum(e.salary) > 150000;

# 15 Show employees who belong to departments starting with 'S'.
select e.emp_name, d.dept_name
from Employee e
left join Department d on e.dept_id=d.dept_id
where d.dept_name like 'S%';

# 16 Find employees whose salary is the highest in their department.

select d.dept_name, e.emp_name,e.salary
from Employee e
left join Department d on e.dept_id=d.dept_id
where e.salary = ( 
select max(e1.salary)
from Employee e1
where e1.dept_id=e.dept_id
);

# 17 Show employees and departments sorted by salary descending.

select  e.emp_name , d.dept_name, e.salary
from Employee e
left join Department d on e.dept_id=d.dept_id
order by e.salary desc;

# 18 Count how many employees earn above 50,000 per department

select d.dept_name,
count(e.dept_id) as total_employee_above_50k
from Employee e 
right join Department d on e.dept_id=d.dept_id
where e.salary > 50000
group by d.dept_name;

# 19 Show employee name, department, and salary for employees between 45,000 and 60,000.

select e.emp_name, d.dept_name, e.salary
from Employee e
left join Department d on e.dept_id=d.dept_id
where e.salary between 45000 and 60000;

# 20  Find departments with no employees.

select d.dept_name
from Department d
left join Employee e on d.dept_id = e.dept_id
where e.dept_id is null;



