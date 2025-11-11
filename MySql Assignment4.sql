 create database company;
 use company;
 create table employees(id INT AUTO_INCREMENT PRIMARY KEY,
 name varchar(100),
 position varchar(100),
 salary decimal(10,2),
 date_of_joining date
 );
 
 select * from employees;
 
 insert into employees(name,position,salary,date_of_joining) values("John Doe","Manager",55000.00,"2020-01-15"),
("Jane Smith","Developer",48000.00,"2019-07-10"),
("Alice Johnson","Designer",45000.00,"2021-03-22"),
("Bob Brown","Developer",50000.00,"2018-11-01");

 select * from employees;
 
 select * from employees where position='Developer';
 
 SELECT id, name FROM employees WHERE name = 'Alice Johnson';
 UPDATE employees
SET salary = 46000.00
WHERE id = 3;
select * from employees;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM employees
WHERE name = 'Bob Brown';
 select * from employees;
 
 SELECT *
FROM employees
WHERE salary > 48000;

ALTER TABLE employees ADD COLUMN email VARCHAR(55);
 select * from employees;
 
 UPDATE employees
SET email = 'john.doe@company.com'
WHERE name = 'John Doe';
select * from employees;

SELECT name, salary FROM employees;

SELECT COUNT(*) AS total_employees
FROM employees
WHERE date_of_joining > '2020-01-01';

SELECT * FROM employees
ORDER BY salary DESC;

ALTER TABLE employees DROP COLUMN email;
select * from employees;

SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;








