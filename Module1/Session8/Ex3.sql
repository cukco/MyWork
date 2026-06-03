create or replace procedure adjust_salary(
    p_emp_id INT,
    OUT p_new_salary NUMERIC
) language plpgsql
as $$
    declare
        v_emp_lv int;
        v_rate numeric;
    begin
        select job_level into v_emp_lv from employees
        where emp_id=p_emp_id;

        if v_emp_lv is null then
            raise notice 'Nhân viên không tồn tại';
            p_new_salary:=null;
        end if;

        case v_emp_lv
            when 1 then v_rate:=1.05;
            when 2 then v_rate:=1.10;
            when 3 then v_rate:=1.15;
        else v_rate:=null;
        end case;

        if v_rate is null then
            if v_emp_lv is not null then
                raise notice 'Nhân viên out trình';
                p_new_salary:=null;
        end if;
        else
            update employees
            set salary=salary*v_rate where emp_id=p_emp_id
            returning salary into p_new_salary;
            raise notice 'Tăng lương thành công';
        end if;

    exception
        when others then
            raise notice 'Xảy ra lỗi: %',SQLERRM;
        rollback;
    end;
$$;
call adjust_salary(5, NULL);
