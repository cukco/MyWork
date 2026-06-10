create or replace function f_log()
returns trigger as $$
    begin
        if(tg_op='INSERT') then
            insert into customers_log(customer_id, operation, new_data, changed_by) VALUES
            (new.id,tg_op,to_jsonb(new),current_user);
            return new;
        elsif(tg_op='DELETE') then
            insert into customers_log(customer_id, operation, old_data, changed_by) VALUES
            (old.id,tg_op,to_jsonb(old),current_user);
            return old;
        elsif(tg_op='UPDATE') then
            insert into customers_log(customer_id, operation,old_data, new_data, changed_by) VALUES
            (new.id,tg_op,to_jsonb(old),to_jsonb(new),current_user);

            return new;
        end if;
        return null;
    end;
$$ language plpgsql;

create trigger t_log
    after update or delete or insert on customers
    for each row
    execute function f_log();

insert into customers(name, email, phone, address) values
    ('Đinh Văn Việt','vietxxyy@gmail.com','08888888','Hà Nội');

delete from customers
where id=1;
