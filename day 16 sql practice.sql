select curtime(),curdate(), current_timestamp(),now();
select now(), adddate( now(),20);

-- adddate(columnname, how much day,month time add)
select now(), adddate( now(),20),
adddate( now(),interval 2 hour);
select year(now()) , dayname(now())
,month(now());
select yearweek(now());
select extract(year from now());
-- immporent date time function
-- adddate,now(),month,extract.date_formet,datediif
select datediff('2025','2024');
select now(), date_format(now(),'Year is %Y month is %M');

use sakila;
select * from payment;
select count(amount) from payment where amount=2.99;
select amount,count(amount),sum(amount)
 from payment group by amount;
select staff_id,count(amount),sum(amount)
from payment group by staff_id;
select customer_id,count(amount),sum(amount)
from payment group by customer_id;
select customer_id,count(amount),sum(amount)
from payment where customer_id>3 group by customer_id;

select customer_id,count(amount),sum(amount)
from payment where customer_id>3 group by customer_id
having sum(amount)>130;

-- i need to get that particuls]ar customer
-- and amount sepent in the month of june
-- where the total amount exceed amount 50
select * from payment;
select customer_id
,sum(amount) from payment where monthname(payment_date)='June'
 group by customer_id
 having sum(amount)>50;
-- multi group by
select customer_id, amount, count(amount), sum(amount)
from payment group by customer_id,amount;

select customer_id, amount, count(amount), sum(amount),
month(payment_date)
from payment group by customer_id,amount,month(payment_date);

-- get avg amount spented and each month by the satff id
select staff_id, avg(amount), month(payment_date)
from payment group by month(payment_date),staff_id;

