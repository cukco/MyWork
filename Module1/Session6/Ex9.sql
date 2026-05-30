select name, sum(price*quantity) as total_sales from product
inner join orderdetail on product.id = orderdetail.product_id
group by name;

select category, avg(price*quantity) from product
inner join orderdetail on product.id = orderdetail.product_id
group by category;

select category, avg(price*quantity) from product
inner join orderdetail on product.id = orderdetail.product_id
group by category
having avg(price*quantity) > 20000000;


select name from product
inner join orderdetail on product.id = orderdetail.product_id
group by name
having sum(price*quantity) >(
    select avg(total_sales) from (
        select sum(price*quantity) as total_sales from product
        inner join orderdetail on product.id = orderdetail.product_id
        group by name
));

select name,quantity from product
left join orderdetail on product.id = orderdetail.product_id;



