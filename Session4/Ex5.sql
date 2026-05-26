delete from employees;

delete from employees
where id not in (
    select min(id) from employees
    group by full_name,department,position
);

select *from employees;

update employees
set salary=salary*1.1 where department='IT' and salary<18000000;

update employees
set bonus=5000000 where bonus is null;

select *from employees
where department='IT' or department='HR' and join_year>2020
    and bonus+salary>15000000;

select *from employees
order by bonus+salary desc
    limit 3;

select *from employees
where full_name like 'Nguyễn%' or full_name like '%Hân';

select department, count(*) filter (where bonus is null) as member from employees
group by department
having count(*) filter (where bonus is null)>0;

select *from employees
where join_year between 2019 and 2022;

