--part2--
create index idx_phone on patients(phone);

create index idx_city on patients using hash(city);

create index idx_symptoms on patients using gin(symptoms);

create index idx_fee on appointments using gist(fee);

--part3--
create index idx_date on appointments(appointment_date);

cluster appointments using idx_date;

--part4--
create view v1 as
select patients.patient_id, full_name,sum(fee) from patients
inner join appointments on patients.patient_id = appointments.patient_id
group by patients.patient_id, full_name
order by sum(fee) desc limit 3;

select * from v1;

create view v2 as
select doctors.doctor_id, full_name, count(appointments.doctor_id) from doctors
inner join appointments on doctors.doctor_id = appointments.doctor_id
group by doctors.doctor_id, full_name;

select *from v2;

--part5--
CREATE VIEW v_patients_hcm AS
SELECT patient_id, full_name, city
FROM patients
WHERE city = 'TP Hồ Chí Minh' WITH CHECK OPTION;

update v_patients_hcm
set city='Phuket' where city='TP Hồ Chí Minh';

