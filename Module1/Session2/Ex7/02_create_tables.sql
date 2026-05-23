create table Members(
                        member_id serial primary key ,
                        full_name varchar(100) not null,
                        email varchar(50) unique ,
                        phone_number varchar(20) unique,
                        dob date,
                        address text,
                        status varchar(10) check(status in ('active','inactive') ),
                        date_joined date
);

create table Category(
                         category_id serial primary key,
                         category_name text not null,
                         description text
);

create table Books(
                      book_id serial primary key,
                      isbn varchar(13) unique not null,
                      title text,
                      release_year int,
                      publisher text,
                      status int check(status>=0),
                      category_id int,
                      foreign key (category_id) references Category(category_id)
);

create table Authors(
                        author_id serial primary key,
                        full_name varchar(100) not null,
                        profile text
);

create table Borrowers_Slip(
                               slip_id serial primary key,
                               borrow_day date default current_date,
                               due_date date not null,
                               real_due_date date,
                               member_id int,
                               foreign key (member_id) references Members(member_id)
);

create table Slip_Details(
                             slip_id int,
                             book_id int,
                             amount int not null check(amount>0),
                             foreign key (slip_id) references Borrowers_Slip(slip_id),
                             foreign key (book_id) references Books(book_id),
                             primary key (slip_id,book_id)
);

create table Author_Details(
                               author_id int,
                               book_id int,
                               foreign key (author_id) references Authors(author_id),
                               foreign key (book_id) references Books(book_id)
);
