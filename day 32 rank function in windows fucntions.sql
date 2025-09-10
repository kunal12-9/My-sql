use kunal;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);
select * from employeeSales;
-- run9ng sum
select department,employeeid,saleamount, avg(saleamount) 
over(partition by department
  order by employeeid) 
from employeesales;

-- second higest slary 
select max(saleamount) from employeesales
WHERE  saleamount<
(select max(saleamount) from employeesales);

-- 3rd hiesghst salary
select max(salary) from employees
where salary<(select max(saleamount) from employeesales
WHERE  saleamount<
(select max(saleamount) from employeesales));

select * from employeessales;

-- row_nu,ber
select *, row_number() over()from employeesales; 
select *, row_number() over(partition by department)
from employeesales;

-- rank()
select *, rank() over() from employeesales;
select *, rank() over(order by saleamount) from employeesales;
select *, rank() over(partition by department,employeename
order by saleamount desc) from employeesales;

-- dense rank
select *, dense_rank() over(partition by department
order by saleamount desc) from employeesales;
 
 select*, dense_rank() over(order by saleamount desc) as 'ranks'
 from employeesales;
 
 -- cte0
 
 with denserank as(
 select *, dense_rank() over(order by saleamount desc)
 as 'ranks' from employeesales)
 select * from denserank where ranks=2;
 
 with denserank as(
 select *, dense_rank() over(partition by department
 order by saleamount desc)
 as 'ranks' from employeesales)
 select * from denserank where ranks=2;
 
 -- lead()=> agar hum koi value nhi deneg lead(columnname,value) to ye by defalut 1 raw ka data dega
 
 -- LEAD ek Window Function hai jo hume current row ke next 
 -- row ka data dikhata hai.
-- Matlab agar tum row no. 1 par ho to LEAD
-- tumhe row no. 2 ka value de dega bina join kare.
 select *, lead(saleamount,2) over() from employeesales;
 
 -- lag()=>  agar hum koi value nhi dere to ye by defalut 1 raw ka data dega
 -- bhi Window Function hai, lekin ye pichle row ka value deta hai current row me.
-- Matlab agar tum row 3 pe ho, to LAG tumhe row 2 ka value dega.
select *, lag(saleamount) over() from employeesales;
insert into employeesales values(1,'alice','Sales','2025-06-2',
'600.00');
select *, lag(saleamount) over(partition  by department
,employeename),saleamount-lag(saleamount) 
over(partition by department,employeename
order by saledate) from employeesales;
-- by employee name to ifnd 
select *, lag(saleamount) over(partition  by department
,employeename),saleamount-lag(saleamount) 
over(partition by department,employeename
order by saledate) from employeesales where employeename='alice';

select *, 
lead(saledate) over(partition by department,
employeename order by saledate) as nextdate,
datediff(lead(saledate) over(partition by department,
employeename order by saledate),saledate)
from employeesales where employeename='alice' and
 department='sales';