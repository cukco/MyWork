do $$
    declare
        id_give int :=1;
        id_get int:=2;
        amount numeric(15,2) :=100000;
        balance_give numeric(15,2);
    begin
        UPDATE accounts SET balance = balance - amount WHERE account_id = id_give;
        UPDATE accounts SET balance = balance + amount WHERE account_id = id_get;

        select balance into balance_give from accounts
        where account_id=id_give;

        if(balance_give<0) then
            raise notice 'Không đủ tiền';
        rollback;
        end if;
        commit;
    end;
$$;


