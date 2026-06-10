create or replace function f_check()
returns trigger as $$
    declare
    begin
        insert into employee_log(emp_name, action_time) values
        (new.name,current_timestamp);

    return new;
    end;
$$ language plpgsql;

create trigger t_check
    after update on employees
    for each row
    execute function f_check();

update employees
set name='Nguyễn Công Hưởng' where emp_id=2;