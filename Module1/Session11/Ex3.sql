do $$
    declare
        name text :='Nguyen Van A';
        product1_id int :=1;
        product2_id int :=2;
        product1_quantity int :=2;
        product2_quantity int :=1;
        product1_price numeric(15,2);
        product2_price numeric(15,2);
        orderx_id int:=3;
    begin
        update products
        set stock=stock-product1_quantity where product_id=product1_id;

        update products
        set stock=stock-product2_quantity where product_id=product2_id;

        if(select stock from products where product_id=product1_id) <0 then
            raise notice 'Không đủ hàng cho sản phẩm %',
                (select product_name from products where product_id=product1_id);
            rollback;
        elsif (select stock from products where product_id=product2_id) <0 then
            raise notice 'Không đủ hàng cho sản phẩm %',
                (select product_name from products where product_id=product2_id);
            rollback;
        else
            select price into product1_price from products
            where product_id=product1_id;

            select price into product2_price from products
            where product_id=product2_id;

            insert into orders(customer_name, total_amount) VALUES
            (name,product1_price*product1_quantity+product2_price*product2_quantity);

            insert into order_items(order_id, product_id, quantity, subtotal) VALUES
            (orderx_id,product1_id,product1_quantity,product1_price*product1_quantity),
            (orderx_id,product2_id,product2_quantity,product2_price*product2_quantity);

            commit;
        end if;
    end;
$$;