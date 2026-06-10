create or replace function f_check()
returns trigger as $$
    declare
        f_stock int;
    begin
        if(tg_op='INSERT') then
            select stock into f_stock from products
            where id=new.product_id;

            if(f_stock < new.quantity) then
                raise exception 'Không đủ hàng';
            end if;

            update products
            set stock=stock-new.quantity where id=new.product_id;
            return new;
        elsif(tg_op='UPDATE') then
            select stock into f_stock from products
            where id=new.product_id;

            if(f_stock < new.quantity - old.quantity) then
                raise exception 'Không đủ hàng';
            end if;

            update products
            set stock=stock-new.quantity+old.quantity where id=new.product_id;
            return new;
        elsif(tg_op='DELETE') then
            update products
            set stock=stock+old.quantity where id=old.product_id;
            return new;
        end if;
        return null;
    end;
$$ language plpgsql;

create trigger t_check
    after update or delete or insert on orders
    for each row
    execute function f_check();

delete from orders
where id=2;

insert into orders(product_id, quantity) VALUES
    (3,10);