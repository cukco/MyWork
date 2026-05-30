INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
('Nguyễn Văn An', 'IT', 2500.00, '2022-01-15'),
('Trần Thị Bình', 'HR', 1800.50, '2021-05-20'),
('Lê Hoàng Cường', 'IT', 3000.00, '2023-03-10'),
('Phạm Minh Đức', 'Sales', 2200.00, '2022-11-02'),
('Hoàng Lan Anh', 'Marketing', 1950.00, '2020-08-25'),
('Đỗ Thùy Dương', 'IT', 2700.00, '2023-06-12');

update Employee
set salary=salary*1.1 where department='IT';

delete from Employee
where salary<6000000;

select *from Employee
where full_name ilike '%An%';

select *from Employee
where hire_date between '2023-01-01' and '2023-12-31';