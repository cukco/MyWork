select p.product_name,sum(total_price) as total_revenue  from orders o
inner join products p on o.product_id=p.product_id
group by p.product_name
having sum(total_price) = (select sum(total_price) as total_revenue from orders o
                           inner join products p on o.product_id=p.product_id
                           group by p.product_name
                           order by sum(total_price) desc limit 1);


select category,sum(orders.total_price) from products
inner join orders on orders.product_id=products.product_id
group by category
