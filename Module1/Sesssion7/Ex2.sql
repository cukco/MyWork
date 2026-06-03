create view v_order_summary as
select full_name, total_amount,
       order_date from orders
inner join customer on orders.customer_id = customer.customer_id;

select *from v_order_summary;

create view v_order as
select *from orders
where total_amount>=1000000 with check option;

select *from v_order;

update v_order
set total_amount=2300000 where id=2;

create view v_monthly_sales as
select distinct extract(month from order_date),sum(total_amount) from orders
group by extract(month from order_date);

drop view v_monthly_sales;

-- DROP VIEW chỉ xoá định nghĩa trong hệ thống, không xoá gì trong dữ liệu gốc
-- DROP MATERIALIZED VIEW xoá bảng MV thực sự, cả index của MV đó trên ổ cứng