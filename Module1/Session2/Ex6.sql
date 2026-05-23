create database EcommerceDB;

create schema shop;

create table users (
                       user_id serial primary key,
                       username varchar(50) unique not null,
                       email varchar(100) unique not null,
                       password varchar(100) not null,
                       role varchar(20) check (role in ('Customer', 'Admin'))
);

create table categories (
                            category_id serial primary key,
                            category_name varchar(100) unique not null
);

create table products (
                          product_id serial primary key,
                          product_name varchar(100) not null,
                          price numeric(10,2) check (price > 0),
                          stock int check (stock >= 0),
                          category_id int references categories(category_id)
);

create table orders (
                        order_id serial primary key,
                        user_id int references users(user_id),
                        order_date date not null,
                        status varchar(20) check (status in ('pending', 'shipped', 'delivered', 'cancelled'))
);

create table orderdetails (
                              order_detail_id serial primary key,
                              order_id int references orders(order_id),
                              product_id int references products(product_id),
                              quantity int check (quantity > 0),
                              price_each numeric(10,2) check (price_each > 0)
);

create table payments (
                          payment_id serial primary key,
                          order_id int references orders(order_id),
                          amount numeric(10,2) check (amount >= 0),
                          payment_date date not null,
                          method varchar(30) check (method in ('credit card', 'momo', 'bank transfer', 'cash'))
);
