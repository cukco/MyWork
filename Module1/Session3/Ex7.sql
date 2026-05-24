create schema sales;

create table products (
                          product_id serial primary key,
                          product_name varchar(255),
                          price numeric(10, 2),
                          stock_quantity int
);

create table orders (
                        order_id serial primary key,
                        order_date date default current_date,
                        member_id int references library.members(member_id)
);

create table orderdetails (
                              order_detail_id serial primary key,
                              order_id int references orders(order_id),
                              product_id int references products(product_id),
                              quantity int
);