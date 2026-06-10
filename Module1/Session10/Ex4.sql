create or replace function f_check()
returns trigger as $$
    declare
        f_quantity int;
    begin
        if(tg_op='INSERT') then
            select stock into f_quantity from products
            where id=new.product_id;
            if(f_quantity < new.quantity) then
                raise exception 'Không đủ hàng';
            end if;

            update products set stock = stock-new.quantity where id=new.product_id ;
            return new;
        elsif (tg_op='UPDATE') then
            select stock into f_quantity from products
            where id=new.product_id;

            if(f_quantity < new.quantity - old.quantity) then
                raise exception 'Không đủ hàng';
            end if;

            update products set stock = stock-new.quantity+old.quantity where id=new.product_id ;
            return new;
        elsif (tg_op='DELETE') then
            update products set stock = stock+old.quantity where id=old.product_id ;

            return old;
            return null;
        end if;
    end;
$$ language plpgsql;

create trigger t_check
    after delete or update or insert on orders
    for each row
    execute function f_check();

insert into orders(product_id, quantity) values
    (2,20);

delete from orders
where id=10;

