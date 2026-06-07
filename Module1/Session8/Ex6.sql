create or replace procedure calculate_bonus(
    p_emp_id INT,
    p_percent NUMERIC,
    out p_bonus NUMERIC
) language plpgsql
as $$
    declare
        p_salary int;
    begin
        select salary into p_salary from employees
        where id=p_emp_id;

        if p_salary is null then
            raise exception 'Employee not found';
        end if;

        if p_percent<=0 then
            p_bonus:=0;
        else
            p_bonus:=p_salary * p_percent / 100;
            update employees
            set bonus=p_bonus where id=p_emp_id;
        end if;
    exception
        when others then
        raise notice 'Xảy ra lỗi: %',SQLERRM;
        rollback;
    end;
$$;

call calculate_bonus(3,50,null);