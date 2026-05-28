select s.full_name as "Tên sinh viên",c.course_name as "Môn học",
       e.score as "Điểm" from enrollments e
inner join students s on s.student_id = e.student_id
inner join courses c on e.course_id = c.course_id;

select s.full_name as "Tên sinh viên",avg(score) as "Điểm trung bình",
       max(score) as "Điểm cao nhất",
       min(score) as "Điểm thấp nhất" from enrollments e
inner join students s on s.student_id = e.student_id
inner join courses c on e.course_id = c.course_id
group by e.student_id,s.full_name;

select c.course_name, avg(score) from courses c
inner join enrollments e on c.course_id = e.course_id
group by c.course_name
having avg(score) > 7.5;

select full_name,course_name,credit,score from enrollments
inner join students on enrollments.student_id = students.student_id
inner join courses on enrollments.course_id = courses.course_id;

select full_name from students
inner join enrollments on students.student_id = enrollments.student_id
group by full_name, enrollments.student_id
having avg(score) > (
    select avg(score) from enrollments
);

