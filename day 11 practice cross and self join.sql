-- cross join
use kunal;
select * from t1 cross join t2;
select count(*) from t1 cross join t2;

-- use have to display all possible actress and language
use sakila;
select * from actor;
select * from language;
select a.first_name  ,l.name 
from actor a cross join language l;

-- you have to see all country with all city
 select  c.country, ci.city
from country c cross join city ci group by c.country,ci.city;																																																																																																																																																																																																																;

-- selef join => its use only 1 tabele and that colum and relted to hsi 
-- self join is use to combine records of same table
-- syntex of sel join=>
select * from employee1 e1
inner join employee1 e2 on e1.eid=e2.manager_id;

select * from employee1;

select emp.eid , emp.ename, emp.manager_id , manager.eid, 
manager.ename
from employee1 as emp 
join employee1 as manager on emp.manager_id=manager.eid;

-- you have to display list of staff memebrs and
-- thier manager use customer table for that 
-- you have to find the customer leaving in the same city