-- select * from customer;
-- select * from payment;
use kunal;
-- union => its remove duplicate and get into single result like 1,1=> 1,2,2,2,=2
select * from t1
union select * from t2;

-- union all => its not remove duplicate
select * from t1
union all select * from t2;

use sakila;
select * from customer
union select * from payment;

-- full join=> its not support directly in my sql if we want use that we using the union or union all 
-- if use union its eemove dulicate rturn only unique records 
-- if use union all its return all the records
use kunal;
select t1.id from t1
left join t2 on t1.id=t2.id
union 
select t2.id from t1
right join t2 on t1.id=t2.id;

select t1.id from t1
left join t2 on t1.id=t2.id
union all
select t2.id from t1
right join t2 on t1.id=t2.id;
