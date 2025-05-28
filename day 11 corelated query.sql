use employees;
select * from employees;
select * from dept_emp;
select * from departments;
select * from salaries;

select emp.emp_no,emp.first_name,d.dept_no from employees as emp inner join dept_emp as d on emp.emp_no=d.emp_no;

select salary from salaries where salary>=all( select salary from salaries where emp_no=10001);

-- correlated subquery
select * from salaries as sal 
where salary > ( select avg(salary) from salaries as s
                  where sal.emp_no= s.emp_no);
                  