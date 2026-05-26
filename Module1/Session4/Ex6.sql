update books
set price=price*1.1 where publish_year>=2021 and price< 200000;

update books
set stock=0 where stock is null;

select *from books
where category='AI' or category='CNTT'
    and price between 100000 and 250000
order by price desc, title asc ;

select *from books
where title ilike '%học%';

select category from books
group by category
having count(*) filter (where publish_year<2020) >0;

select *from books
order by id
    limit 2 offset 1;