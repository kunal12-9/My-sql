use college5;
show tables;

-- Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(101, 'Kunal', 25, 40000, 2),
(102, 'Ravi', 28, 50000, 2),
(103, 'Priya', 24, 35000, 1),
(104, 'Aman', 30, 60000, 3),
(105, 'Neha', 26, 45000, 1);

-- Q1. Find employees whose salary is greater than the average salary of their department. 
select name, salary, dept_id
from employees e
where salary > (
    select avg(salary) 
    from employees 
    where dept_id = e.dept_id);
-- q2. find employees who earn the maximum salary in their department.
select name, salary, dept_id
from employees e
where salary = (
    select max(salary) 
    from employees 
    where dept_id = e.dept_id
);

-- q3. find employees who earn the minimum salary in their department.
select name, salary, dept_id
from employees e
where salary = (
    select min(salary) 
    from employees 
    where dept_id = e.dept_id
);
-- q4. find employees whose salary is greater than at least one employee in the s
-- same department.
select name, salary, dept_id
from employees e
where salary > any (
    select salary 
    from employees 
    where dept_id = e.dept_id and emp_id <> e.emp_id
);
-- q5. find employees whose salary is less than all other employees in the same department.
select name, salary, dept_id
from employees e
where salary < all (
    select salary 
    from employees 
    where dept_id = e.dept_id and emp_id <> e.emp_id
);

