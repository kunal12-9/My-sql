use sakila;
with recursive cte as 
(select 1 as num union all
select num + 1 from cte where num < 6
)
select * from cte;

with recursive factorial_cte(n, fact) as 
(
    select 1, 1 union all
    select n + 1, fact * (n + 1) from factorial_cte
    where n < 5
)
select fact 
from factorial_cte
where n = 5;

use regex1;

drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;
with recursive cte as
(
    select employee_id, name, manager_id, 1 as levels
    from employees as e where manager_id is null
    union
    select etemp.employee_id, etemp.name, etemp.manager_id, levels+1
    from employees as etemp join cte 
    where etemp.manager_id = cte.employee_id
)
select * from cte;

-- select e1.name,e2.name,e1.employee_id as employee ,
-- e2.employee_id as manager from employees as e1 join employees as e2
-- on e1.employee_id=e2.employee_id;

-- what is views why we use views 
-- views vs cte
-- materilised view vs non materisled view