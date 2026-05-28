select customer_name as "Tên khách",
       order_date as "Ngày đặt",
       total_amount as "Tổng tiền"
from customers
inner join orders on customers.customer_id = orders.customer_id;

select sum(total_amount) as "Tổng doanh thu",
       avg(total_amount) as "Trung bình giá trị đơn hàng",
       max(total_amount) as "Đơn hàng lớn nhất",
       min(total_amount) as "Đơn hàng nhỏ nhất",
       count(order_id) as "Số lượng đơn hàng "
from orders;

select city,sum(total_amount) as  total_revenue from customers
inner join orders on customers.customer_id = orders.customer_id
group by city
having sum(total_amount) >10000;

select order_items.product_name,order_items.quantity,order_items.price,
       customers.customer_name,orders.order_date from order_items
inner join orders on order_items.order_id = orders.order_id
inner join customers on orders.customer_id = customers.customer_id;

select customers.customer_name from customers
inner join orders on customers.customer_id = orders.customer_id
group by customer_name, orders.customer_id
having sum(total_amount) = (
    select sum(total_amount) from orders
    group by orders.customer_id
    order by sum(total_amount) desc
    limit 1
);

