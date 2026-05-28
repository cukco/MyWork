select e.emp_name as "Tên nhân viên",
       d.dept_name as "Phòng ban",
       e.salary as "Lương"
from employees e
inner join departments d on e.dept_id = d.dept_id;

select sum(salary) as "quỹ lương",
       avg(salary) as "lương tb",
       min(salary) as "lương thấp nhất",
       max(salary) as "lương cao nhất",
       count(emp_id) as "Số nhân viên"
from employees;

select departments.dept_name,avg(employees.salary) from departments
inner join employees on departments.dept_id = employees.dept_id
group by departments.dept_name
having avg(employees.salary)>15000000;

select projects.project_name,
       departments.dept_name,
       employees.emp_name from projects
inner join departments on projects.dept_id = departments.dept_id
inner join employees on departments.dept_id = employees.dept_id;

select emp_name,dept_name from employees
inner join departments on employees.dept_id = departments.dept_id
where salary in(
    select max(employees.salary) from employees
    group by dept_id
);
