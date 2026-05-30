select c.customer_id,
       c.customer_name,
       sum(o.total_price) as total_revenue,
       count(o.customer_id) as order_count from customers c
       inner join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by c.customer_id asc;


select c.customer_id,
       c.customer_name from customers c
       inner join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having avg(total_price) > ( select avg(orders.total_price) from orders)
order by c.customer_id;


select city, sum(total_price) from customers c
inner join orders o on c.customer_id = o.customer_id
group by city
having sum(total_price)=(
    select sum(total_price) from customers c
    inner join orders o on c.customer_id = o.customer_id
    group by city
    order by sum(total_price) desc limit 1);

select customer_name, city, sum(quantity) as product_quantity,sum(total_price) as total_revenue
from customers
inner join orders on customers.customer_id = orders.customer_id
inner join order_items on orders.order_id = order_items.order_id
group by customer_name,city,customers.customer_id;
