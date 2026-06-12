create or replace procedure trans(
    id_account int,
    amount_t numeric(15,2)
) language plpgsql as $$
    declare
        t_balance numeric(15,2);
    begin
        select balance into t_balance from accounts
        where account_id=id_account
        for update;

        if( t_balance is null) then
            raise exception 'Không có tài khoản';
        end if;

        if(t_balance<amount_t) then
            raise exception 'Không đủ tiền';
        else
            update accounts
            set balance=balance-amount_t where account_id=id_account;

            insert into transactions(account_id, amount, trans_type) VALUES
            (id_account,amount_t,'WITHDRAW');
        end if;
        exception
        when others then
            raise notice 'Lỗi %',SQLERRM;
    end;
$$;

call trans(2,500000);