insert into members (full_name, email, phone_number, dob, address, status, date_joined) values
('nguyen van a', 'vana@gmail.com', '0901234567', '1995-05-10', '123 le loi, hcm', 'active', '2023-01-15'),
('tran thi b', 'thib@gmail.com', '0907654321', '1998-11-20', '456 nguyen hue, hn', 'active', '2023-02-10'),
('le van c', 'vanc@gmail.com', '0911223344', '2000-01-01', '789 cach mang thang 8, dn', 'inactive', '2023-05-20');

insert into category (category_name, description) values
('tieu thuyet', 'cac tac pham van hoc hu cau'),
('khoa hoc', 'sach ve kien thuc khoa hoc tu nhien'),
('ngoai ngu', 'sach hoc tieng anh, nhat, han');

insert into authors (full_name, profile) values
('ngo tat to', 'nha van hien thuc phe phan viet nam'),
('nam cao', 'nha van lon cua van hoc hien thuc'),
('stephen hawking', 'nha vat ly ly thuyet nguoi anh');

insert into books (isbn, title, release_year, publisher, status, category_id) values
('9781234567890', 'tat den', 1937, 'nxb van hoc', 10, 1),
('9780987654321', 'chi pheo', 1941, 'nxb doi moi', 5, 1),
('9781112223334', 'luoc su thoi gian', 1988, 'nxb tre', 3, 2);

insert into author_details (author_id, book_id) values
(1, 1),
(2, 2),
(3, 3);

insert into borrowers_slip (borrow_day, due_date, real_due_date, member_id) values
('2023-10-01', '2023-10-15', '2023-10-14', 1),
('2023-10-05', '2023-10-20', null, 2);

insert into slip_details (slip_id, book_id, amount) values
(1, 1, 1),
(2, 2, 1),
(2, 3, 1);