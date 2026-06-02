create view v_revenue_by_region as
select region, sum(total_amount) as total_revenue from customer
inner join orders on customer.customer_id = orders.customer_id
group by region;

select * from v_revenue_by_region
order by total_revenue desc limit 3;

create view v_revenue_above_avg as
select * from v_revenue_by_region
where total_revenue > (select avg(total_revenue) from v_revenue_by_region);
