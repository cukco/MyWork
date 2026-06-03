create procedure calculate_discount(
    p_id INT,
    OUT p_final_price NUMERIC
) language plpgsql
as $$
    declare
        v_price int;
        v_discount int;
    begin
        select price into v_price from products
        where id=p_id;

        select discount_percent into v_discount from products
        where id=p_id;

        if v_price is null then
            raise notice 'Không tồn tại sản phẩm';
            p_final_price:=null;
            return;
        end if;

        if v_discount > 50 then
            v_discount:=50;
        end if;

        update products
        set price=price - price*v_discount/100 where id=p_id
        returning price into p_final_price;
        raise notice 'Cập nhật thành công';
    exception
        when others then
            raise notice 'Xảy ra lỗi: %',SQLERRM;
    rollback;
    end;
$$;

call calculate_discount(6,null);
