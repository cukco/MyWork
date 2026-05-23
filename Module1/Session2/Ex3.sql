create database SalesDB;
create schema sales;

create table Customers(
                          customer_id serial primary key,
                          first_name varchar(50) not null,
                          last_name varchar(50) not null,
                          email text unique not null,
                          phone varchar(12) unique
);

create table Products(
                         product_id serial primary key,
                         product_name varchar(100) not null,
                         price float not null,
                         stock_quantity int not null check ( stock_quantity>=0 )
);

create table Orders(
                       order_id serial primary key,
                       customer_id int,
                       order_date date not null,
                       foreign key (customer_id) references Customers(customer_id)
);

create table OrderItems(
                           order_item_id serial primary key,
                           order_id int,
                           product_id int,
                           quantity int check(quantity>0),
                           foreign key (order_id) references Orders(order_id),
                           foreign key (product_id) references Products(product_id)
)