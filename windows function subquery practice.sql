create database kunal2;
use kunal2;
create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(50),
    salary decimal(10,2)
);

create table sales (
    sale_id int primary key,
    emp_id int,
    sale_amount decimal(10,2),
    sale_date date
);

-- employees table
insert into employees (emp_id, emp_name, department, salary) values
(1, 'Amit', 'HR', 4500),
(2, 'Neha', 'HR', 5200),
(3, 'Ravi', 'IT', 6000),
(4, 'Kunal', 'IT', 7500),
(5, 'Pooja', 'Finance', 6800),
(6, 'Arjun', 'Finance', 7200),
(7, 'Meera', 'Sales', 4000),
(8, 'Sohan', 'Sales', 5000);

-- sales table
insert into sales (sale_id, emp_id, sale_amount, sale_date) values
(101, 3, 2000, '2025-01-10'),
(102, 3, 3500, '2025-01-15'),
(103, 4, 5000, '2025-01-20'),
(104, 5, 4000, '2025-02-05'),
(105, 6, 6000, '2025-02-10'),
(106, 7, 1500, '2025-02-15'),
(107, 8, 2500, '2025-02-18'),
(108, 8, 3000, '2025-02-25');
select * from employees;
select * from sales;
-- 1 Find each employee’s salary and their rank within the company based on salary.
-- emnp salary,rank slaary
select emp_id,sale_amount, dense_rank() over(partition by emp_id) from sales;
select emp_id,emp_name,department,salary,
    dense_rank() over (order by salary desc) as salary_rank
from employees;

-- 2.Show each employee’s salary and the difference from department’s average salary.
select emp_name,salary, avg(salary) over(partition by department),avg(salary) over(partition by department)
- salary from employees;

-- 3 List each sale with cumulative total per employee (order by sale_date)
select * from employees;
select * from sales;
select emp_id,sale_amount, sum(sale_amount) over(partition by emp_id order by sale_id)
from sales; 
select * from employees;
select * from sales;
-- 4 Show each employee’s salary and the lag (previous salary) in descending salary order
select *, lag(salary) over(order by salary desc)
from employees;

select *, lead(salary,1) over(order by salary desc)
from employees;



-- 5) Employee rank based on salary (already done before)
select emp_name,salary, dense_rank() over(order by salary desc) from employees;