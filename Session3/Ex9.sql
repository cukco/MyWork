create database CompanyDB;

create table Departments(
                            department_id serial primary key,
                            department_name varchar(60) not null
);

create table Employees(
                          emp_id serial primary key,
                          name varchar(50) not null,
                          dob date not null,
                          department_id int,
                          foreign key (department_id) references Departments (department_id)
);

create table Projects(
                         project_id serial primary key,
                         project_name text not null,
                         start_date date default (current_date),
                         end_date date
);

create table EmployeeProjects(
                                 emp_id int,
                                 project_id int,
                                 status varchar(50) check(status in ('Active','Inactive','Banned')),
                                 foreign key (emp_id) references Employees(emp_id),
                                 foreign key (project_id) references Projects(project_id)
);
