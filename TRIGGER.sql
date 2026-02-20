-- =====================================================
-- TRIGGER PRACTICE COMPLETE FILE
-- =====================================================

-- =====================================================
-- 1️ INVENTORY + SALES TRIGGER
-- =====================================================

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT
);

INSERT INTO inventory (product_id, product_name, quantity) VALUES
(1, 'Product A', 100),
(2, 'Product B', 150),
(3, 'Product C', 200);

CREATE TABLE sales2 (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    amount DECIMAL(10, 2),
    sale_date DATE,
    quantity_sold INT
);

DELIMITER //

CREATE TRIGGER after_sales_insert 
AFTER INSERT ON sales2 
FOR EACH ROW 
BEGIN 
    UPDATE inventory 
    SET quantity = quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

SELECT * FROM sales2;
SELECT * FROM inventory;
SHOW TRIGGERS;

INSERT INTO sales2 (product_id, amount, sale_date, quantity_sold) VALUES
(1, 50.00, '2024-07-01', 10);

DROP TRIGGER IF EXISTS after_sales_insert; 

-- =====================================================
-- 2️ EMPLOYEE DELETE LOG
-- =====================================================

CREATE TABLE employees8 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO employees8 (emp_id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'IT'),
(3, 'Charlie', 'Finance');

CREATE TABLE deleted_employees_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    deleted_at DATETIME
);

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees8
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees_log(emp_id, name, department, deleted_at)
    VALUES (OLD.emp_id, OLD.name, OLD.department, NOW());
END //

DELIMITER ;

SELECT * FROM employees8;

DELETE FROM employees8 WHERE emp_id = 2;

SELECT * FROM deleted_employees_log;

-- =====================================================
-- 3️ STUDENT INSERT LOG
-- =====================================================

CREATE TABLE student5(st_id int,name varchar(50),grade varchar(15));

INSERT INTO student5(st_id,name,grade) 
VALUES (1,"Vinit","A");

CREATE TABLE student_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    st_id INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(100)
);

DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON student5
FOR EACH ROW
BEGIN
    INSERT INTO student_log (st_id, action)
    VALUES (NEW.st_id, 'Student record inserted');
END //

DELIMITER ;

INSERT INTO student5(st_id, name, grade)
VALUES (2, 'Amit', 'B');

SELECT * FROM student5;
SELECT * FROM student_log;

-- =====================================================
-- 4️ EMPLOYEES9 SALARY AUTO CALCULATION
-- =====================================================

CREATE TABLE employees9 (
    employee_id INT,
    name VARCHAR(50),
    hourly_pay INT
);

INSERT INTO employees9(employee_id, name, hourly_pay) 
VALUES 
(1, "Ria", 1000),
(2, "Raj", 2000),
(3, "Ajay", 3000);

SELECT * FROM employees9;

ALTER TABLE employees9
ADD COLUMN salary DECIMAL(10,2) AFTER hourly_pay;

SELECT * FROM employees;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees9
SET salary = hourly_pay * 2080;

SELECT * FROM employees9;

DELIMITER //

CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees9
FOR EACH ROW
BEGIN 
    SET NEW.salary = (NEW.hourly_pay * 2080);
END//

DELIMITER ;

SHOW TRIGGERS;

SELECT * FROM employees9;

UPDATE employees9
SET hourly_pay = 50
WHERE employee_id = 1;

SELECT * FROM employees9;

UPDATE employees9
SET hourly_pay = hourly_pay + 1;

SELECT * FROM employees9;

-- =====================================================
-- 5️ EMPLOYEE MASTER TABLE
-- =====================================================

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

-- 1 BEFORE INSERT Trigger – Set Default Salary

DELIMITER ##

CREATE TRIGGER set_default_salary
BEFORE INSERT ON employee
FOR EACH ROW
SET NEW.salary=ifnull(NEW.salary,1000);
END ##

DELIMITER ;

INSERT INTO employee VALUES (1, 'Amit', NULL);

SELECT * FROM employee;

CREATE TABLE student (
    sid INT PRIMARY KEY,
    name VARCHAR(50)
);

-- 2 AFTER INSERT Trigger – Log New Records

CREATE TABLE student4 (
    sid INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE student_log1 (
    message VARCHAR(100),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER log_student2
AFTER INSERT ON student4
FOR EACH ROW
BEGIN 
    INSERT INTO student_log1 (message) 
    VALUES ('New student added');
END //

DELIMITER ;

DROP TRIGGER log_student2;

INSERT INTO student4 VALUES(1,"Ria");

USE school;

SELECT * FROM student4;
SELECT * FROM student_log1;

-- 3 BEFORE UPDATE – Prevent Salary Reduction

DELIMITER $$

CREATE TRIGGER salary_prevent_cut 
BEFORE UPDATE ON employee 
FOR EACH ROW 
BEGIN 
  IF NEW.salary<OLD.salary THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT ='salary reduction not allowed';
  END IF;
END $$

DELIMITER ;

INSERT INTO employee VALUES(2,"Rohan",50000);

SELECT * FROM employee;

UPDATE employee
SET salary=100000
WHERE emp_id =1;

SELECT * FROM employee;

UPDATE employee
SET salary=15000
WHERE emp_id =2;

-- 4 AFTER DELETE – Backup Deleted Records

CREATE TABLE emp_backup LIKE employee;

DELIMITER $$

CREATE TRIGGER backup_emp
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO emp_backup (emp_id, name, salary)
    VALUES (OLD.emp_id, OLD.name, OLD.salary);
END$$

DELIMITER ;

DELETE FROM employee
WHERE emp_id=1;

SELECT * FROM emp_backup;

-- 5 BEFORE INSERT – Auto Capitalize Name 

DELIMITER $$

CREATE TRIGGER cap_name
BEFORE INSERT ON student4
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END$$

DELIMITER ; 

SELECT * FROM student4;

INSERT INTO student4 VALUES(2,"komal");

SELECT * FROM student4;

-- 6 AFTER UPDATE – Audit Salary Changes 

CREATE TABLE salary_audit (
    emp_id INT,
    old_salary INT,
    new_salary INT
);

SELECT * FROM salary_audit;

DELIMITER $$

CREATE TRIGGER audit_salary
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit (emp_id, old_salary, new_salary)
    VALUES (OLD.emp_id, OLD.salary, NEW.salary);
END$$

DELIMITER ;

SELECT * FROM salary_audit;
SELECT * FROM employee;

INSERT INTO employee VALUES(3,"shubham",52000);

UPDATE employee
SET salary = 65000
WHERE emp_id=3;

SELECT * FROM salary_audit;

-- 7 BEFORE INSERT – Validate Age 

CREATE TABLE person (
    pid INT,
    age INT
);

DELIMITER $$

CREATE TRIGGER check_age
BEFORE INSERT ON person
FOR EACH ROW
BEGIN
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '50000'
        SET MESSAGE_TEXT = 'Invalid age';
    END IF;
END$$

DELIMITER ;

INSERT INTO person VALUES(1,20);
INSERT INTO person VALUES(1,15);

SELECT * FROM person;

-- 8 AFTER INSERT – Update Total Count 

CREATE TABLE orders (
    oid INT
);

CREATE TABLE order_count (
    total INT
);

INSERT INTO order_count VALUES (0); 

DELIMITER $$

CREATE TRIGGER inc_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE order_count
    SET total = total + 1;
END$$

DELIMITER ;

SET sql_safe_updates=0;

INSERT INTO orders VALUES(1);
INSERT INTO orders VALUES(2),(3),(4),(5);

SELECT * FROM orders;
SELECT * FROM order_count;

-- 9 BEFORE DELETE – Prevent Deletion of Admin 

CREATE TABLE users (
    uid INT,
    role VARCHAR(20)
);

INSERT INTO users VALUES
(1,"scroll"),
(2,"views"),
(4,"screening");

DELIMITER $$

CREATE TRIGGER no_admin_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF OLD.role = 'Admin' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Admin cannot be deleted';
    END IF;
END$$

DELIMITER ;

INSERT INTO users VALUES(5,"Admin");

SELECT * FROM users;

DELETE FROM users WHERE uid=2;
DELETE FROM users WHERE role="Admin";

-- 10 AFTER INSERT – Maintain Account Balance 

CREATE TABLE transactions (
    amount INT
);

CREATE TABLE account (
    balance INT
);

INSERT INTO account VALUES (1000);

DELIMITER $$

CREATE TRIGGER update_balance
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    UPDATE account
    SET balance = balance + NEW.amount;
END$$

DELIMITER ;

INSERT INTO transactions VALUES(1900);

SELECT * FROM transactions;
SELECT * FROM account;

-- =====================================================
-- 11 BEFORE UPDATE – Auto Update Modified Date
-- =====================================================

CREATE TABLE product (
    pid INT,
    modified DATETIME
); 

INSERT INTO product VALUES(1,'2024-03-11');

-- Trigger

DELIMITER $$

CREATE TRIGGER update_date
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    SET NEW.modified = NOW();
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS update_date;

INSERT INTO product VALUES(4,'2025-03-12');

UPDATE product 
SET modified="2026-01-10";

SELECT * FROM product; 

-- =====================================================
-- 12 AFTER DELETE – Reduce Stock 
-- =====================================================

CREATE TABLE stock (
    quantity INT
);

CREATE TABLE sales3 (
    qty INT
);

INSERT INTO stock VALUES(25);

INSERT INTO sales3 VALUES(15);

-- Trigger

DELIMITER $$

CREATE TRIGGER reduce_stock
AFTER DELETE ON sales3
FOR EACH ROW
BEGIN
    UPDATE stock
    SET quantity = quantity - OLD.qty;
END$$

DELIMITER ;

INSERT INTO stock VALUES(155);

INSERT INTO sales3 VALUES(23);

SELECT * FROM stock;  

SELECT * FROM sales3;

DELETE FROM sales3 WHERE qty=15;

SET sql_safe_updates=0;

-- =====================================================
-- 13 BEFORE INSERT – Avoid Duplicate Email
-- =====================================================

CREATE TABLE customer (
    email VARCHAR(50)
);

INSERT INTO customer VALUES("xyz@gmail.com");

-- Trigger

DELIMITER $$

CREATE TRIGGER unique_email
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM customer WHERE email = NEW.email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email already exists';
    END IF;
END$$

DELIMITER ; 

INSERT INTO customer VALUES("xyz@gmail.com");

SELECT * FROM customer;

-- =====================================================
-- 14 AFTER UPDATE – Log Status Change
-- =====================================================

CREATE TABLE task (
    status VARCHAR(20)
);

CREATE TABLE task_log (
    message VARCHAR(100)
); 

INSERT INTO task VALUES("GOOD");

-- Trigger

DELIMITER $$

CREATE TRIGGER log_status
AFTER UPDATE ON task
FOR EACH ROW
BEGIN
    INSERT INTO task_log (message) 
    VALUES ('Task status updated');
END$$

DELIMITER ;

INSERT INTO task VALUES ("Excellent");

UPDATE task 
SET status='bad'
WHERE status='good';

SELECT * FROM task;
SELECT * FROM task_log;

-- =====================================================
-- 15 BEFORE INSERT – Auto Generate ID
-- =====================================================

CREATE TABLE dept (
    did INT,
    name VARCHAR(20)
); 

-- Trigger

DELIMITER $$

CREATE TRIGGER auto_dept_id
BEFORE INSERT ON dept
FOR EACH ROW
BEGIN
    SET NEW.did = (SELECT IFNULL(MAX(did), 0) + 1 FROM dept);
END$$

DELIMITER ;

INSERT INTO dept VALUES(1,"Shubham");

INSERT INTO dept (name) 
VALUES ("nand");

SELECT * FROM dept;

-- =====================================================
-- 16 AFTER INSERT – Update Average Salary Table
-- =====================================================

CREATE TABLE avg_salary (
    avg_sal FLOAT
); 

-- Trigger

DELIMITER $$

CREATE TRIGGER update_avg
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    UPDATE avg_salary
    SET avg_sal = (SELECT AVG(salary) FROM employee);
END$$

DELIMITER ; 

SELECT * FROM employee;

INSERT INTO avg_salary VALUES (0);
 
INSERT INTO employee VALUES(4,"Ragini",75000);

SELECT * FROM avg_salary;

-- =====================================================
-- 17 BEFORE UPDATE – Prevent Negative Quantity
-- =====================================================

CREATE TABLE inventory2 (
    qty INT
);

-- Trigger

DELIMITER $$

CREATE TRIGGER no_negative_qty
BEFORE UPDATE ON inventory2
FOR EACH ROW
BEGIN
    IF NEW.qty < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Negative quantity not allowed';
    END IF;
END$$

DELIMITER ;

INSERT INTO inventory2 VALUES(-5);

INSERT INTO inventory2 VALUES(24);

UPDATE inventory2 
SET qty = -6
WHERE qty=24;

DELIMITER $$

CREATE TRIGGER no_negative_qty_insert
BEFORE INSERT ON inventory2
FOR EACH ROW
BEGIN
    IF NEW.qty < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Negative quantity not allowed';
    END IF;
END$$

DELIMITER ;

INSERT INTO inventory2 VALUES(-8);

SELECT * FROM inventory2;

-- =====================================================
-- 18 AFTER DELETE – Maintain Delete Log
-- =====================================================

CREATE TABLE delete_log (
    info VARCHAR(100)
);

-- Trigger

DELIMITER $$

CREATE TRIGGER log_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO delete_log (info) 
    VALUES ('Employee deleted');
END$$

DELIMITER ;

INSERT INTO employee VALUES(1,"Arya",55800);

INSERT INTO employee VALUES(8,"Sanaya",55800);

DELETE FROM employee WHERE emp_id=8;

SELECT * FROM delete_log;

-- =====================================================
-- 19 BEFORE INSERT – Auto Set Joining Date
-- =====================================================

CREATE TABLE staff (
    join_date DATE
); 

-- Trigger

DELIMITER $$

CREATE TRIGGER set_join_date
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
    SET NEW.join_date = CURDATE();
END$$

DELIMITER ; 

INSERT INTO staff VALUES (NULL);

INSERT INTO staff VALUES ('2024-05-01');

SELECT * FROM staff;

-- =====================================================
-- 20 AFTER UPDATE – Count Updates 
-- =====================================================

CREATE TABLE update_counter (
    cnt INT
);

INSERT INTO update_counter VALUES (0);

Trigger

DELIMITER $$

CREATE TRIGGER count_updates
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    UPDATE update_counter
    SET cnt = cnt + 1;
END$$

DELIMITER ; 

INSERT INTO employee VALUES(7,"Chandani",65600);

SELECT * FROM update_counter;

UPDATE employee 
SET salary=78000
WHERE emp_id=7;

SELECT * FROM update_counter;

-- =====================================================
-- END OF COMPLETE PRACTICE TRIGGER
-- =====================================================