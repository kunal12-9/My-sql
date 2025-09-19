USE KUNAL2;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Kunal', 10, 50000, NULL),
(2, 'Aman', 10, 60000, 1),
(3, 'Ravi', 20, 55000, 1),
(4, 'Neha', 20, 70000, 3),
(5, 'Pooja', 30, 45000, 3),
(6, 'Arjun', 30, 40000, 2);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

-- 10 Find total salary department-wise, but also display departments with no employees (LEFT JOIN + GROUP BY + SUM).
select sum(e.salary),dept_id from employees as e left join departments as d
on e.department_id=d.dept_id group by dept_id;
-- 9 Show each department name and total employees, but only for departments having more than 1 employee (JOIN + GROUP BY + HAVING).
select d.dept_name,count(e.emp_id) from employees as e join departments as d
on d.dept_id=e.department_id group by d.dept_name having count(emp_id)>1;
select * from employees;
-- 8Show each manager name with average salary of their team (SELF JOIN + GROUP BY + AVG).
select e.emp_name, d.emp_name as manager,
       avg(d.salary) as managersalary
from employees e 
join employees as d 
on e.emp_id = d.manager_id
group by d.emp_name,e.emp_name;
select * from employees;
select * from departments;
-- 7 Show department name and minimum salary in each department.
select d.dept_name,min(e.salary) from employees as e join departments as d
on e.department_id=d.dept_id group by d.dept_name;
use kunal2;
with abc as (select department_id, min(salary) as min_salary from employees
    group by department_id
)select d.dept_name, abc.min_salary
from departments d
join abc on abc.department_id = d.dept_id;

-- Q6. Find each department’s highest salary using JOIN + GROUP BY + MAX.
select d.dept_name,max(e.salary) from employees as e join departments as d
on e.department_id=d.dept_id group by d.dept_name;

-- Q5. Show manager name and total number of employees reporting to them (SELF JOIN + GROUP BY).
select  d.emp_name as manager, count(e.emp_id) 
from employees as e join employees as d on e.manager_id=d.emp_id
group by manager;

-- windows function practice
use sakila;
select * from payment;
select *, sum(amount) over(partition by customer_id) ,
row_number()  over(partition by customer_id order by payment_id)  
from payment;

-- row_number
select *, row_number() over()from employeesales; 
select *, row_number() over(partition by department)
from employeesales;

-- rank()
select *, rank() over() from employeesales;
select *, rank() over(order by saleamount) from employeesales;
select *, rank() over(partition by department,employeename
order by saleamount desc) from employeesales;

-- dense rank
select *, dense_rank() over(partition by department
order by saleamount desc) from employeesales;
use kunal2;
-- 4Find departments where total salary expense is greater than 1,00,000 (INNER JOIN + GROUP BY + HAVING).
select * from employees;
select * from departments;
select d.dept_name ,sum(e.salary) from employees e join departments d 
on e.department_id=d.dept_id group by d.dept_name having sum(e.salary)>100000;

-- Q3. Show department name and number of employees working in each department (LEFT JOIN + COUNT).
select count(e.emp_name) ,d.dept_name from employees e left join departments d 
on e.department_id=d.dept_id group by d.dept_name;

--  Q2. Find each department’s average salary (INNER JOIN with group by)
select d.dept_name,avg(e.salary) from employees e join departments d 
on e.department_id=d.dept_id group by d.dept_name;

-- Q1. Show each department name and total salary of employees in that department.
select d.dept_name,sum(e.salary) from employees as e
join departments d on e.department_id=d.dept_id group by d.dept_name;

