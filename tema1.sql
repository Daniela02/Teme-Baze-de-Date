/*
Tema 1 - Sandu Daniela Teodora - grupa 235
I.
    1. A
    2. C
    3. C
    4. C
    5. 9-mar-2009
    6. 3
    7. D
*/

--II
--1
select cust_id as "ID", cust_name as "Nume Client"
from customer_tbl
where lower(cust_state) in ('in', 'oh','mi','il') and (lower(cust_name) like 'a%' or lower(cust_name) like 'b%')
order by 2;

--2
--a
select prod_id as "ID", prod_desc as "Descriere", cost as "Cost"
from products_tbl
where cost>1 and cost<12.5;
--b
select prod_id as "ID", prod_desc as "Descriere", cost as "Cost"
from products_tbl
where cost<=1 or cost>=12.5;

--3
select first_name || '.' || last_name || '@' || 'ittech.com' as "Email Angajati"
from employee_tbl;

--4
select last_name || ', ' || first_name  as "NAME", substr(emp_id, 1,3) || '-' || substr(emp_id, 4,2) || '-' || substr(emp_id, 6,3) as "EMP_ID", 
            '('||substr(phone,1,3)||')'||substr(phone, 4,3)|| '-' ||substr(phone, 7,4) as "PHONE"
from employee_tbl;

--5
select emp_id, extract(year from date_hire) an
from employee_pay_tbl;

--6
select e.emp_id "ID", e.last_name nume, e.first_name prenume, nvl(f.salary,0) salariu, nvl(f.bonus,0) bonus
from employee_tbl e, employee_pay_tbl f
where e.emp_id=f.emp_id;

--7
select c.cust_name nume, o.ord_num "Numarul Comenzii", o.ord_date "Data Lansarii"
from customer_tbl c
join orders_tbl o on c.cust_id=o.cust_id
where lower(cust_state) like'i%';

--8
select o.ord_num "Numarul Comenzii", o.qty "Cantitate", e.last_name "Nume", e.first_name "Prenume", e.city "Oras"
from orders_tbl o
join employee_tbl e on o.sales_rep=e.emp_id;

--9
select o.ord_num "Numarul Comenzii", o.qty "Cantitate", e.last_name "Nume", e.first_name "Prenume", e.city "Oras"
from orders_tbl o
right outer join employee_tbl e on o.sales_rep=e.emp_id;

--10
select emp_id, last_name
from employee_tbl
where middle_name is null;

--11
select emp_id, nvl(salary + nvl(bonus, 0),0)
from employee_pay_tbl;

--12
--varianta 1 decode
select e.last_name, nvl(p.salary,0) salary, p.position, decode(lower(p.position), 'marketing',p.salary+p.salary*0.1, 'salesman', p.salary+p.salary*0.15, nvl(p.salary,0)) "Salariu modificat"
from employee_tbl e
join employee_pay_tbl p on e.emp_id=p.emp_id;

--varianta 2 case
select e.last_name, nvl(p.salary,0), p.position, CASE
                                            WHEN lower(p.position)='marketing' THEN p.salary+p.salary*0.1
                                            WHEN lower(p.position)='salesman' THEN  p.salary+p.salary*0.15 
                                            ELSE nvl(p.salary,0)
                                            END "Salariu modificat"
from employee_tbl e
join employee_pay_tbl p on e.emp_id=p.emp_id;
































