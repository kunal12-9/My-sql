select database();

use sakila;

select database();

show databases;

show tables;

select * from actor;

select actor_id, first_name from actor;

select actor_id, actor_id*10, first_name from actor;

describe actor;

select * from actor where actor_id=2;

select * from actor where actor_id=5;

select * from actor where first_name='ED';

select * from actor where first_name='ED' and actor_id>100;

select * from actor where first_name='ED' or actor_id>100;

select * from actor where actor_id>10 and actor_id<25;

-- between  oprator between oprator between lower and higher

select * from actor where  actor_id between 11 and 24;

select first_name from actor where actor_id=5;

select * from actor where  actor_id between 2 and 5;

select * from actor where  actor_id in(2,5,7000000);

-- like => pattern par kaam karega 

select * from actor where first_name='NICK';

select * from actor where first_name='N';


-- agar chrecter aage ho
select * from actor where first_name like 'N%';

--- if charecter piche ho
select * from actor where first_name like '%T';

select * from actor where first_name like 'S%T';

select * from actor where first_name like 'ED%';

-- _underscore [only one charecter]

select * from actor where first_name like 'E_';

select * from actor where first_name like '__';

select * from actor where first_name like '_A%';

select * from actor where actor_id in (3,5,7);



select * from actor where first_name like '%NN%';

select * from actor where last_name like '%S__';

select * from actor where first_name like '_____';

select * from actor where first_name like '_A%T%H__';


select first_name from actor where first_name like '_VR';

select first_name , last_name from actor where first_name like '__' and last_name = '%s__';

select * from actor where first_name like "__"









