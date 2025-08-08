select * from sales;
select region, sum(quantity) as total_quantity
from sales group by region;

select region,sum(quantity) as total
from sales group by region
having t = (select max(total1) from (select(sum(quantity) from 
aales) as total1 from sales group by region)as derived);

select region, SUM(quantity) as total
from sales
group by region
having sum(quantity) = (
    select distinct total1
    from (
        select SUM(quantity) as total1
        from sales
        group by region
    ) as derived)
    limit 1;
