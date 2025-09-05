-- views=> virtual table its store a query not there result or output  why er use beacuse we reusable the query again and agian
-- iska use complex logic koeay karna 
-- for security=> if we wnateda scure data which colum we use in query in crete when view the only column can ccses that view only
use sakila;
create view temp as(
select first_name,count(*) from actor where actor_id>10
group by first_name order by count(*) desc);

-- for security example=> we see in temp 2 voiew only 2 column can be accseble we not accses new column
create view temp2 as 
( select first_name, last_name from actor);
select * from temp2;

-- ctas( create table as select)=> its 

create table factors as
(select actor_id, first_name, last_name from actor where
actor_id<7);
select * from factors;
create view temp3 as(
select first_name, last_name from factors where actor_id<5);
select * from temp3;
-- create view temp4 as(
-- update factors set first_name='kunal' where actor_id=4);
update factors set first_name='kunal' ,last_name='tailor'
where actor_id=4;
select * from factors;
create view temp5 as(
select actor_id, first_name,last_name from factors);
select * from temp5;

insert into temp5(actor_id,first_name,last_name)
values(7,'abhisek','singh');
select * from temp5;
delete from temp5 where actor_id=7;

-- nonupdatetable and updateble view
-- 1. Updatable View
-- Ye aisa view hota hai jisme hum DML operations (INSERT, UPDATE, DELETE) kar sakte hain.
-- 👉 Kab possible hai?
-- View sirf ek hi single base table par bana ho.
-- View me DISTINCT, GROUP BY, HAVING, Aggregates (SUM, AVG, COUNT) na ho.
-- View me koi calculated column na ho jo base table se direct link na rakhta ho.
-- example
-- CREATE VIEW emp_view AS
-- SELECT employee_id, name, salary
-- FROM employees;

-- 2. Non-Updatable View
-- Ye aisa view hota hai jisme DML operations allowed nahi hote.
-- 👉 Kab hota hai?
-- Jab view me DISTINCT ho
-- Jab view me GROUP BY / HAVING use hua ho
-- Jab view me Aggregate functions (SUM, AVG, COUNT) lage ho
-- Jab view JOIN ya UNION par based ho
-- ❌ Example (Non-Updatable View):
-- CREATE VIEW dept_avg_salary AS
-- SELECT department_id, AVG(salary) AS avg_sal
-- FROM employees
-- GROUP BY department_id;

-- UPDATE dept_avg_salary
-- SET avg_sal = 70000
-- WHERE department_id = 10;

-- what is diffrence bwetween cte vs views vs temprery table