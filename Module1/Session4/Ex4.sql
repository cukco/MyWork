insert into products(id, name, category, price, stock, manufacturer) values
    ('8','Chuột không dây Logitech M170','Phụ kiện',300000,20,'Logitech');

update products
set price=price*1.1 where manufacturer= 'Apple';

delete from products
where stock=0;

select *from products
where price between 1000000 and 30000000;

delete from products
where stock is null;

select distinct manufacturer from products;

select *from products
order by price desc,name asc;

select *from products
where name ilike '%laptop%';

select *from products
order by  price desc
limit 2;