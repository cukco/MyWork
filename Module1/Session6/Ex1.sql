insert into Product(id,name,category,price,stock) values
('Laptop Dell XPS', 'Electronics', 1500.00, 10),
('iPhone 15 Pro', 'Electronics', 1100.00, 25),
('Bàn phím cơ AKKO', 'Electronics', 85.50, 50),
('Tủ lạnh Samsung', 'Appliances', 600.00, 5),
('Lò vi sóng Sharp', 'Appliances', 120.00, 15);

select *from Product;

select *from Product
order by price desc
limit 3;

select *from Product
where category='Điện tử' and price<10000000;

select *from Product
order by stock asc;



