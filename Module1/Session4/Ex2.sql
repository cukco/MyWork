insert into products(id, name, category, price, stock) VALUES
    (6,'Điều hòa Panasonic',  'Home Appliances', 400.00,  10);

update products
set stock=7 where name='Laptop Dell';

delete from products
where stock=0;

select *from products
order by price asc;

select *from products
where price between 100 and 1000;

select *from products
where name like '%LG%' or name like '%Samsung%';

select *from products
order by price desc
    limit 2 offset 1
