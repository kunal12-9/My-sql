use regexregex;
-- 1. Employee Hierarchy & Department Performance
-- Department Table
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
-- Insert Employees
INSERT INTO Employees (emp_id, emp_name, manager_id, salary, dept_id) VALUES
(101, 'Alice', NULL, 90000, 3), -- Alice is IT Head
(102, 'Bob', 101, 60000, 3), -- Bob reports to Alice
(103, 'Charlie', 101, 55000, 3), -- Charlie reports to Alice
(104, 'David', 102, 40000, 3), -- David reports to Bob
(105, 'Eve', NULL, 80000, 2), -- Eve is Finance Head
(106, 'Frank', 105, 50000, 2), -- Frank reports to Eve
(107, 'Grace', NULL, 75000, 1), -- Grace is HR Head
(108, 'Heidi', 107, 45000, 1), -- Heidi reports to Grace
(109, 'Ivan', NULL, 70000, 4), -- Ivan is Marketing Head
(110, 'Judy', 109, 48000, 4); -- Judy reports to Ivan

-- 2. Find each employee’s manager (if any).
-- 3. Calculate average salary per department.

-- 4. Find employees who earn more than the average salary of their department.
-- 5. Show each employee with manager name, department, and whether they earn
-- above their department average.
-- 6. Find the highest-paid employee(s) in each department using a subquery
select * from employees;

-- 2. Find each employee’s manager (if any).
select * from department;
select * from employees;
select e.emp_name ,m.emp_name 
from employees e left join employees m on e.manager_id = m.emp_id;

-- 3. Calculate average salary per department. 
select * from department;
select * from employees;
select d.dept_name, avg(e.salary) 
from employees e join departments d on e.dept_id = d.dept_id group by d.dept_name;

-- 4 Find employees who earn more than the average salary of their department.
select e.emp_name,e.salary from employees e
where e.salary >(select avg(e2.salary) from employees e2 where e2.dept_id = e.dept_id);

-- 5. Show each employee with manager name, department, and whether they earn
-- above their department average.
select * from department;
select * from employees;
-- select e1.emp_name as employee, e2.emp_name as manager,d.dept_name from employees  e1  join employees as e2 on e1.emp_id=e2.manager_id
-- join department as d on e1.dept_id=d.dept_id
-- (select avg(salary) from epmloyee where e1.empid_;
select e1.emp_name as employee,e2.emp_name as manager,d.dept_name as department,e1.salary,(select avg(salary) 
from employees where dept_id = e1.dept_id) as dept_avg_salary from employees e1 join employees e2  on e1.manager_id = e2.emp_id
join departments d on e1.dept_id = d.dept_id;

-- 6. Find the highest-paid employee(s) in each department using a subquery
select * from department;
select * from employees;
select e.emp_id, e.emp_name, e.salary, d.dept_name
from employees e join departments d on e.dept_id = d.dept_id
where e.salary = (select max(salary) from employees where dept_id = e.dept_id);

-- 7 Find the departments where the average salary is higher than the overall company average salary.
select * from employees;
select * from department;
select d.dept_name,avg(e.salary) from department as d join employees as e on d.dept_id=e.dept_id
group by d.dept_name having avg(e.salary)>(select avg(salary) from employees);