use kunal;
-- Employees table
create table employees1 (
    emp_id int primary key,
    emp_name varchar(50),
    dept_id int,
    salary int,
    manager_id int
);
create table department1(
    dept_id int primary key,
    dept_name varchar(50)
);
insert into department1 values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');
insert into employees1 values
(101, 'Kunal', 2, 60000, 105),
(102, 'Ravi', 2, 45000, 101),
(103, 'Neha', 1, 50000, 104),
(104, 'Priya', 1, 70000, null),
(105, 'Amit', 3, 80000, null),
(106, 'Vikas', 3, 40000, 105),
(107, 'Meena', 4, 55000, 108),
(108, 'Rahul', 4, 90000, null);
select * from employees1;
select * from department1;
select e.emp_name, d.dept_name from employees1 as e 
join department1 as d on e.dept_id=d.dept_id;

-- 2
select e.emp_name, d.dept_name from employees1 as e 
left join department1 as d on e.dept_id=d.dept_id;

-- 4
select e1.emp_name as employee , e2.emp_name as manager
from employees1 as e1 join employees1 as e2 
on e1.emp_id=e2.manager_id;


-- 5
select * from employees1;
select * from department1;
select e.emp_name,d.dept_name from employees1 as e
join department1 as d on e.dept_id=d.dept_id 
where dept_name='it';
with kk as(select * from department1 where dept_name='it')
select e.emp_name,kk.dept_id,kk.dept_name from kk  join employees1 as e on e.dept_id=kk.dept_id;
-- 6
select * from employees1;
select * from department1;
-- Q10. Find employees who earn more than the average salary of their department
select e.emp_name,e.salary,e.dept_id from employees1 as e where e.salary>
(select avg(salary) from employees1 e2 where e.dept_id=e2.dept_id);
with abc as(select dept_id , avg(salary)as dsalary from employees1 group by dept_id)
select e.emp_name,e.salary,a.dsalary from employees1 e join abc a where e.dept_id=a.dept_id 
and e.salary>a.dsalary; 
with abc as (
    select dept_id, avg(salary) as avg_salary
    from employees1
    group by dept_id
)select e.emp_name, e.salary, e.dept_id, a.avg_salary
from employees1 e
join abc a
on e.dept_id = a.dept_id
where e.salary > a.avg_salary;

select * from employees1;
select * from department1;
-- Find employees who are the highest paid in their department -- corelated
select e.emp_name,e.salary,e.dept_id,e.emp_id from employees1  e 
where e.salary=
(select max(e2.salary) from employees1 e2 where e.dept_id=e2.dept_id);
-- by solve joins
select e1.emp_id, e1.emp_name, e1.salary, e1.dept_id
from employees1 e1 left join employees1 e2
    on e1.dept_id = e2.dept_id and e1.salary < e2.salary 
    where e2.emp_id is null;


