create or replace function f_check()
returns trigger as $$
    declare
        current_stock int;
    begin
        select coalesce(stock) into current_stock from products
        where product_id=new.product_id;

        if (current_stock < new.quantity) then
            raise exception 'Không đủ hàng/Không có sản phẩm đó';
        end if;

        update products
        set stock=stock-new.quantity where product_id=new.product_id;
        return new;
    end;
$$ language plpgsql;

create trigger t_check
    before insert on sales
    for each row
    execute function f_check();

insert into sales(product_id, quantity) values
(3,30),
(2,50);