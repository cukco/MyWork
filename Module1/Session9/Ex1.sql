create index idx_customerid on orders(customer_id);

explain analyse  SELECT * FROM Orders WHERE customer_id =3400000;