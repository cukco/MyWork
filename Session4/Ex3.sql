insert into students(id, full_name, birth_year, major, gpa, gender) values
    (8,'Phan Hoàng Nam',2003,'CNTT',3.8,'Nam');

update students
set gpa=3.4 where full_name='Lê Quốc Cường'

delete from students
where gpa is null;

select *from students
where major='CNTT' and gpa>=3.0
    limit 3;

select distinct major  from students;

select *from students
where major='CNTT'
order by GPA desc, full_name asc;

select *from students
where full_name like 'Nguyễn%';

select *from students
where birth_year between  2001 and 2003;
