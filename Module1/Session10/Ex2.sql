create or replace function check_credit_limit()
returns trigger as $$
    declare
        f_limit numeric(15,2);
    begin
        select COALESCE(credit_limit) into f_limit from customers
        where id=new.customer_id;

        if f_limit < new.order_amount then
            raise exception 'Xảy ra lỗi';
        end if;
        return new;
    end;
$$ language plpgsql;

create trigger trg_check_credit
    before insert on orders
    for each row
    execute function check_credit_limit();

insert into orders(customer_id, order_amount) VALUES
    (1,5000000000);