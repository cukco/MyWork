create or replace procedure check_stock(
    p_id INT,
    p_qty INT
) language plpgsql
as $$
    declare
    v_quantity int;
    begin
        select quantity into v_quantity from inventory
        where product_id=p_id;
        if v_quantity is null then
            raise notice 'Không tồn tại hàng';
        elsif v_quantity >= p_qty then
            raise notice 'Có đủ hàng';
        else
            raise notice 'Không đủ hàng';
        end if;
    exception
        when others then
            raise notice 'Xảy ra lỗi: %',SQLERRM;
        rollback;
    end;
$$;

call check_stock(99,1000);