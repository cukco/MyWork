create or replace function f_change()
returns trigger as $$
    declare
    begin
        if (tg_op='INSERT') then
            insert into employees_log(employee_id, operation, new_data) values
            (new.id,tg_op,to_jsonb(new));
        elsif (tg_op='DELETE') then
            insert into employees_log(employee_id, operation, old_data) VALUES
            (old.id,tg_op,to_jsonb(old));
        elsif (tg_op='UPDATE') then
            insert into employees_log(employee_id, operation, old_data, new_data) values
            (new.id,tg_op,to_jsonb(old),to_jsonb(new));
        end if;
        return null;
    end;
$$ language plpgsql;

create trigger t_log
    after update or insert or delete on employees
    for each row
    execute function f_change();

delete from employees
where id=1;