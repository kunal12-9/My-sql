select * from customer order by address_id asc ;
select * from customer order by address_id desc ;
select * from payment order by rental_id asc;

-- group by
select staff_id , sum(amount) from payment group by 
staff_id; 

-- 

select customer_id, count(payment_id) from payment where customer_id>3 
group by customer_id;

select customer_id, count(payment_id) from payment  
group by customer_id having count(payment_id)>30;

select avg(quantity) 


-- ans1. select product_name, avg (quantity_sold) from sales 
-- group by product_name;
-- ans.2-- select region, count(distnict(product)) from sales
-- -- from sales group by region;
ans3
-- select region, product_name, count(transiction)
 -- from sales group by region, product_name;
