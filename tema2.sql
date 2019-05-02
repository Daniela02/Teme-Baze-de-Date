/*
Tema 2 - Sandu Daniela Teodora - 235
*/
--Partea I
--1
select count(*) 
from employees
where upper(last_name) like 'K%';

--2
select employee_id, last_name, first_name
from employees
where salary = (select min(salary)
                from employees);
    
--3
select distinct employee_id, last_name
from employees 
where  employee_id in (select distinct manager_id 
                        from employees
                        where department_id=30)
order by 2;
                        
--4
select e.employee_id, e.last_name, e.first_name, f.subalterni
from employees e
join (select count(*)  subalterni, manager_id
    from employees
    group by manager_id) f
on e.employee_id=f.manager_id;

--5
select e.employee_id, e.last_name, e.first_name
from employees e
where e.last_name in (select last_name from employees where e.employee_id!=employee_id)
order by 2;

--6
select distinct d.department_id, d.department_name
from departments d
join employees e on e.department_id=d.department_id
join jobs j on j.job_id=e.job_id
group by d.department_id, d.department_name
having count(distinct e.job_id) >= 2
order by 1;
                        
--Partea II
--7
select p.prod_id, count(o.ord_num) Cantitate
from orders_tbl o
join products_tbl p on o.prod_id=p.prod_id
where lower(p.prod_desc) like '%plastic%'
group by  p.prod_id;

--8
select emp_id "ID", last_name || ' ' || first_name "NUME", 'ANGAJAT' tip
from employee_tbl
union
select cust_id, cust_name, 'CLIENT'
from customer_tbl;

--9
select distinct p.prod_desc
from products_tbl p
join orders_tbl o on p.prod_id=o.prod_id
where o.sales_rep in (select sales_rep 
                        from orders_tbl
                        join products_tbl using(prod_id)
                        where length(prod_desc) - length(replace(prod_desc, ' ', '')) + 1 >= 2 and regexp_like(prod_desc, '\w+\sP.+'));
                        
--10
select c.cust_name
from customer_tbl c
join orders_tbl o on o.cust_id=c.cust_id
where extract(day from o.ord_date)=17;

--11
select e.last_name, e.first_name, nvl(f.salary,0) salary, nvl(f.bonus,0) bonus
from employee_tbl e
join employee_pay_tbl f on f.emp_id=e.emp_id
where (f.salary>=17*f.bonus and f.salary<=32000) or (f.salary<17*f.bonus and f.bonus<=32000);

--12
select e.last_name || ' ' || e.first_name nume, a.qty cantitate
from employee_tbl e
left outer join (select sales_rep, sum(qty) qty
        from orders_tbl
        group by sales_rep) a on  sales_rep=e.emp_id
where a.qty>=50;

--13
select e.last_name , e.first_name nume, f.salary, o.ord_date
from employee_tbl e
full join employee_pay_tbl f on e.emp_id=f.emp_id
full join orders_tbl o on o.sales_rep=e.emp_id
group by e.last_name, e.first_name, f.salary
having count(ord_num) >= 2;

--14
select prod_id "ID"
from products_tbl
where cost>=(select avg(cost)
                from products_tbl);
                
--15
select e.last_name, e.first_name, f.salary, f.bonus, (select sum(bonus) 
                                                    from employee_pay_tbl) bonus_total, (select sum(salary) 
                                                                                        from employee_pay_tbl) salary_total
from employee_tbl e
full join employee_pay_tbl f on e.emp_id=f.emp_id;

--16
select distinct e.city
from employee_tbl e
full join orders_tbl o on e.emp_id=o.sales_rep
having count(ord_num) = 
    (select max(count(ord_num))
     from orders_tbl
     group by sales_rep);
                                        
--17
select e.emp_id, e.last_name, sum(decode(lower(extract(month from o.ord_date)),
                               9, 1,0)) septembrie,
                               sum(decode(lower(extract(month from o.ord_date)),
                               10, 1,0)) octombrie
from employee_tbl e
full join orders_tbl o on o.sales_rep=e.emp_id
group by e.emp_id, e.last_name;

--18
select c.cust_name, c.cust_city
from customer_tbl c
left outer join orders_tbl o on c.cust_id=o. cust_id
where regexp_like(c.cust_zip,'[0-9].+')
group by c.cust_name, c.cust_city
having count(o.ord_num) = 0;
    
--19
select distinct e.emp_id, e.last_name || ' ' || e.first_name nume, e.city, c.cust_id, c.cust_name, c.cust_city
from employee_tbl e
join orders_tbl o on o.sales_rep=e.emp_id
join customer_tbl c on c.cust_id=o.cust_id;

--20
select avg(nvl(salary,0)) medie
from employee_pay_tbl;

--21
/*
Cererea de la punctul a este corecta, dar cererea de la punctul b acceseaza tabelul employee_id care nu exista, deci nu este corecta.
*/
--a
SELECT CUST_ID, CUST_NAME
FROM CUSTOMER_TBL
WHERE CUST_ID =
(SELECT CUST_ID
FROM ORDERS_TBL
WHERE ORD_NUM = '16C17');
--b
SELECT EMP_ID, SALARY
FROM EMPLOYEE_PAY_TBL
WHERE SALARY BETWEEN '20000'
AND (SELECT SALARY
FROM EMPLOYEE_ID --nu exista tabelul employee_id
WHERE SALARY = '40000');

--22
select e.last_name, f.pay_rate
from employee_tbl e
full join employee_pay_tbl f on e.emp_id=f.emp_id
where f.pay_rate>(select max(g.pay_rate)
                    from employee_pay_tbl g
                    full join employee_tbl s on g.emp_id=s.emp_id
                    where lower(s.last_name) like ('%ll%'));