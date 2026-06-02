--Part2--
create index idx_email on customers(email);

create index idx_city on customers using hash(city);

create index idx_category on products using gin(category);

create index idx_price on products using gist(price);

--Part3--
explain analyze select *from customers
                where email is not null;

explain analyse select *from products
                where 'Electronics'=any(category);

explain analyze select *from products
                where price between 500 and 1000;

--Part4--
create index idx_orderdate on orders(order_date);

cluster orders using idx_orderdate;

--Part5--
create view v1 as
select full_name from customers
inner join orders on customers.customer_id = orders.customer_id
inner join products on orders.product_id = products.product_id
group by orders.customer_id, full_name
order by sum(quantity*price) desc limit 3;

select * from v1;

create view v2 as
select product_name, sum(quantity*price) as total_revenue from products
inner join orders on products.product_id = orders.product_id
group by product_name;

select * from v2;

--Part6--
CREATE VIEW v_customer_city AS
SELECT customer_id, full_name, city FROM customers
where city='Hà Nội' WITH CHECK OPTION;

update v_customer_city
set city='Beijing' where customer_id=1;


