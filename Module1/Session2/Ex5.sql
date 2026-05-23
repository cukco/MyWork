create database HotelDB;

create schema hotel;

create table RoomTypes(
                          room_type_id serial primary key,
                          type_name varchar(50) not null unique,
                          price_per_night numeric(10,2) check(price_per_night>0),
                          max_capacity int check(max_capacity>0)
);

create table Rooms(
                      room_id serial primary key,
                      room_number varchar(10) not null unique,
                      room_type_id int,
                      status varchar(20) CHECK (status IN ('Available','Occupied','Maintenance')),
                      foreign key (room_type_id) references RoomTypes(room_type_id)
);

create table Customers(
                          customer_id serial primary key,
                          full_name varchar(100) not null,
                          email varchar(100) unique not null,
                          phone varchar(15) not null
);

create table Bookings(
                         booking_id serial primary key,
                         customer_id int,
                         room_id int,
                         check_in date not null,
                         check_out date not null ,
                         status varchar(20) CHECK (status IN ('Pending','Confirmed','Cancelled')),
                         foreign key (customer_id) references Customers(customer_id),
                         foreign key (room_id) references Rooms(room_id)
);

create table Payments(
                         payment_id serial primary key,
                         booking_id int,
                         amount numeric(10,2) check(amount>0),
                         payment_date date not null,
                         method varchar(20) CHECK (method IN ('Credit Card','Cash','Bank Transfer'))
);