create database sqlpractice;
use sqlpractice;
create table departments (
    dept_id int primary key,
    dept_name varchar(50)
);

insert into departments values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    dept_id int,
    salary int,
    manager_id int,
    foreign key (dept_id) references departments(dept_id)
);

insert into employees values
(101, 'Kunal', 2, 60000, 105),
(102, 'Ravi', 2, 45000, 101),
(103, 'Neha', 1, 50000, 104),
(104, 'Priya', 1, 70000, null),
(105, 'Amit', 3, 80000, null),
(106, 'Vikas', 3, 40000, 105),
(107, 'Meena', 4, 55000, 108),
(108, 'Rahul', 4, 90000, null);

select * from departments;
select * from employees;
-- Find employees whose salary is greater than the average salary of all employees.
select emp_name,salary from employees where salary>
(select avg(salary) from employees);
-- Find employees who earn the highest salary in their department (correlated).
use sqlpractice;
-- 1 st of corelated
select e.emp_name,d.dept_id,e.salary from  employees e 
join departments d on e.dept_id=d.dept_id
where e.salary>
(select avg(salary) from employees e2 where e2.dept_id=e.dept_id);
-- 2nd way if colrelated
select e.emp_name,d.dept_id,e.salary from  employees e 
join departments d on e.dept_id=d.dept_id
where e.salary>
(select avg(salary) from employees e2 where e2.dept_id=e.dept_id);
-- select e1.empid,e1.empname,e1.deptid,e1.salary
-- from employees as e1
-- where e1.salary >
-- (select avg(salary) from employees as e2 where e1.deptid=e2.deptid);

select max(count(emp_id)),d.dept_name from employees as e join departments as d on d.dept_id=e.dept_id
group by d.dept_name;
-- Show employees whose salary is greater than their manager’s salary (correlated).
-- Display each manager’s name and the number of employees reporting to them.
select * from employees;
select e1.emp_name, e2.emp_name as manager ,count(e1.emp_id)
from employees e1 join employees e2 on e1.manager_id=e2.emp_id
group by e2.emp_name,e1.emp_name;


-- select m.emp_name as manager, count(e.emp_id) as total_employees
-- from employees e
-- join employees m on e.manager_id = m.emp_id
-- group by m.emp_name;

create table sales (
    sale_id int primary key,
    emp_id int,
    department varchar(50),
    amount int,
    sale_date date
);

insert into sales values
(1, 101, 'IT', 5000, '2024-01-01'),
(2, 102, 'HR', 3000, '2024-01-02'),
(3, 103, 'Finance', 7000, '2024-01-03'),
(4, 101, 'IT', 6000, '2024-01-04'),
(5, 104, 'HR', 2000, '2024-01-05'),
(6, 105, 'Finance', 8000, '2024-01-06'),
(7, 103, 'Finance', 6500, '2024-01-07'),
(8, 102, 'HR', 4000, '2024-01-08');
use sqlpractice;
select * from sales;
-- Show each employee’s sales along with the total sales of their department.
select *,sum(amount) over(partition by department) from sales;
-- Display each employee’s sales and the average sales of their department.
select *, avg(amount) over(partition by department) from sales; 
-- For all sales, generate a cumulative total in the order of sale_date.
select *,sum(amount) over(),
sum(amount) over ( order by sale_id desc) from sales;
-- Rank employees based on the highest sale amount across all departments.
select *, row_number() over( order by amount desc) from sales;
use sakila;
select * from payment;
select*, sum(amount) over(),
row_number() over(partition by customer_id order by amount desc)
from payment limit 10;
select *, dense_rank()  over(order by amount desc) from payment;

use sqlpractice;CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10,2),
    dept_id INT
);
INSERT INTO employees2 (emp_id, emp_name, manager_id, salary, dept_id) VALUES
(1, 'Alice', NULL, 70000, 1),   -- CEO (no manager)
(2, 'Bob', 1, 50000, 1),
(3, 'Charlie', 1, 60000, 2),
(4, 'David', 2, 45000, 1),
(5, 'Eva', 2, 40000, 1);
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id;
--
SELECT DISTINCT m.emp_name AS Manager
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id;

SELECT e.emp_name AS Employee
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Bob';
SELECT e.emp_name AS Employee, m.emp_name AS Manager, mm.emp_name AS Top_Manager
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
JOIN employees mm ON m.manager_id = mm.emp_id;
