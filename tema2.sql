/*
Tema 2 - Sandu Daniela Teodora - 235
*/
--Partea I
--1
select * 
from employees
where last_name='Grant';

--2
select employee_id, last_name, first_name
from employees
where salary = (select min(salary)
                from employees);
    
--3
select employee_id, last_name
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

--6???????
select distinct d.department_id, d.department_name
from departments d
full outer join employees e on e.department_id=d.department_id
where 2<= (select sum(count(*))
        from employees
        where department_id=d.department_id and job_id!=e.job_id
        group by job_id)
order by 1;
                        
--Partea II
--7
select o.qty
from orders_tbl o
join products_tbl p on o.prod_id=p.prod_id
where lower(p.prod_desc) like '%plastic%';

--8
select emp_id "ID", last_name || ' ' || first_name "NUME", 'ANGAJAT' tip
from employee_tbl
union
select cust_id, cust_name, 'CLIENT'
from customer_tbl;

--9
select p.prod_desc
from products_tbl p
join orders_tbl o on p.prod_id=o.prod_id
where o.sales_rep in (select f.emp_id
                        from employee_tbl f
                        join orders_tbl a on a.sales_rep=f.emp_id
                        join products_tbl q on q.prod_id=a.prod_id
                        where q.prod_desc like '% P%' and q.prod_id!=p.prod_id);
                        
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
select e.emp_id,e.last_name || ' ' || e.first_name nume, f.salary, o.ord_date
from employee_tbl e
full join employee_pay_tbl f on e.emp_id=f.emp_id
full join orders_tbl o on o.sales_rep=e.emp_id
where 2<=(select count(*)
            from orders_tbl
            where sales_rep=e.emp_id) and o.ord_date=(select max(ord_date)
                                                        from orders_tbl
                                                        where sales_rep=e.emp_id);

--14
select prod_id "ID"
from products_tbl
where cost>=(select avg(cost)
                from products_tbl);
                
--15
select e.last_name, e.first_name, f.salary, f.bonus, (select sum(bonus) 
                                                    from employee_pay_tbl) bonus_total, (select sum(salary) 
                                                                                        from employee_pay_tbl) salary
from employee_tbl e
full join employee_pay_tbl f on e.emp_id=f.emp_id;

--16?????????????
select distinct e.city
from employee_tbl e
full join orders_tbl o on e.emp_id=o.sales_rep
where (select count(*)
        from orders_tbl 
        where sales_rep=e.emp_id)=(select max(count(*))
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
select last_name || ' ' || first_name nume, city
from employee_tbl 
where (address like '0%' or
    address like '1%' or
    address like '2%' or
    address like '3%' or
    address like '4%' or
    address like '5%' or
    address like '6%' or
    address like '7%' or
    address like '8%' or
    address like '9%' ) and emp_id not in (select sales_rep from orders_tbl);
    
--19
select e.emp_id, e.last_name || ' ' || e.first_name nume, e.city, c.cust_id, c.cust_name, c.cust_city
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