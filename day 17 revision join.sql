use sakila;
create table product(id int, pname varchar(20),
amount int);
insert into product values(10,"laptop",199),
(11,"TV",200), (12,"watch",300);

create table orderss(oid int,location varchar(20),
productid int);
insert into orderss values(888,"jaipur",10),
(889,"pune",11), (890,"himachal",15),(891,"j&k",10);

select * from product;
select * from orderss;
-- inner join
select p.id,p.pname,p.amount,o.productid
,o.oid,o.location from product as p
join orderss as o where p.id=o.productid;
-- syntex inner join
-- select col,colum2 from table name join table2name condtions

select o.oid,o.location,p.pname from orderss as o join product as p
on o.productid=p.id;

-- left join
select o.oid,o.location,p.pname,o.productid
 from orderss as o 
left join product as p
on o.productid=p.id;

select o.oid,o.location,p.pname,o.productid
 from product as p 
left join orderss as o
on o.productid=p.id;

use sakila;
select * from actor;
select * from film_actor;
