create database UniversityDB;

create schema university;

create table students(
                         student_id serial primary key,
                         first_name varchar(50) not null,
                         last_name varchar(50) not null,
                         birth_date date,
                         email text not null unique
);

create table courses(
                        course_id serial primary key,
                        course_name varchar(100) not null,
                        credits int
);

create table enrollments(
                            enrollment_id serial primary key,
                            student_id int,
                            course_id int,
                            enroll_date date,
                            foreign key (student_id) references students(student_id),
                            foreign key (course_id) references  courses(course_id)
);

alter table students
    add check( extract(year from students.birth_date)>18);

drop table enrollments;
drop table students;
drop table courses;