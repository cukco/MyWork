create index idx_email on users using hash(email);

explain analyse select * FROM Users WHERE email = 'example@example.com';