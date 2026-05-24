create database LibraryDB;

create schema library;

create table books(
                       book_id serial primary key,
                       title varchar(255),
                       author varchar(255),
                       published_year int,
                       available boolean default true
);
create table members(
                         member_id serial primary key,
                         name varchar(255),
                         email varchar(255) unique,
                         join_date date default current_date
);