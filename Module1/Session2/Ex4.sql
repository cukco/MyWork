create database ElearningDB;

create schema elearning;

create table Students(
                         student_id serial primary key,
                         first_name varchar(50) not null,
                         last_name varchar(50) not null,
                         email text not null unique
);

create table Instructors(
                            instructor_id serial primary key ,
                            first_name varchar(50) not null,
                            last_name varchar(50) not null,
                            email text not null unique
);

create table Courses(
                        course_id serial primary key,
                        course_name varchar(100) not null,
                        instructor_id int,
                        foreign key (instructor_id) references Instructors(instructor_id)
);

create table enrollments(
                            enrollment_id serial primary key,
                            student_id int,
                            course_id int,
                            enroll_date date not null,
                            foreign key (student_id) references students(student_id),
                            foreign key (course_id) references  courses(course_id)
);

create table Assignments(
                            assignment_id serial primary key,
                            course_id int,
                            title varchar(100) not null,
                            due_date date not null,
                            foreign key (course_id) references Courses(course_id)
);

create table Submissions(
                            submission_id serial primary key,
                            assignment_id int,
                            student_id int,
                            submission_date date not null,
                            grade float check(grade<=100 and grade>=0),
                            foreign key (assignment_id) references Assignments(assignment_id),
                            foreign key (student_id) references Students(student_id)
);