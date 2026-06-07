create or replace procedure update_employee_status(
    p_emp_id INT,
    out p_status TEXT
) language plpgsql
as $$
    declare
        v_salary numeric(10,2);
    begin
        select salary into v_salary from employees
        where id=p_emp_id;

        if v_salary is null then
            raise exception 'Employee not found';
        end if;

        if v_salary < 5000 then
            p_status:='Junior';
        elsif v_salary between 5000 and 10000 then
            p_status:='Mid-level';
        else
            p_status:='Senior';
        end if;
    exception
        when others then
            raise notice 'Xảy ra lỗi: %',SQLERRM;
            rollback;
    end;
$$;

call update_employee_status(9,null);
