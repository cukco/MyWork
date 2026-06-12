do $$
    declare
        A_id int :=1;
        B_id int :=4;
        money numeric(15,2) := 500;
        A_balance numeric(15,2);
        B_balance numeric(15,2);
    begin
        select balance into A_balance from accounts
        where account_id=A_id
        for update;

        select balance into B_balance from accounts
        where account_id=B_id
        for update;

        if(A_balance is null) or (B_balance is null) then
            raise exception 'Tài khoản gửi/nhận không tồn tại;';
        end if;

        if (select status from accounts where account_id=A_id ) != 'ACTIVE' or
           (select status from accounts where account_id=B_id) != 'ACTIVE' then
            raise exception 'Tài khoản gửi/nhận hiện tại không hoạt động';
        end if;

        if(A_balance < money) then
            raise exception 'Tài khoản gửi hiện tại không đủ tiền';
        end if;

        update accounts
        set balance=balance-money where account_id=A_id;

        update accounts
        set balance=balance+money where account_id=B_id;

        insert into transactions(from_account, to_account, amount,status) VALUES
        (A_id,B_id,money,'SUCCESS');
    exception
        when others then
            raise notice 'Error: %', SQLERRM;
        end;
$$ language plpgsql;