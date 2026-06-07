--part1--
create or replace view vw_active_jobs as
select *from jobs where status='OPEN';

--part2--
create or replace view vw_company_jobs as
select title,company_name from jobs
                                   inner join employers on jobs.employer_id = employers.employer_id;

--part3--
create or replace view vw_application_review as
select full_name, title, applications.status from users
                                                      inner join candidates on users.user_id = candidates.user_id
                                                      inner join applications on candidates.candidate_id = applications.candidate_id
                                                      inner join jobs on applications.job_id = jobs.job_id;

--part4--
create or replace view vw_review as
select company_name, count(application_id) from employers
                                                    inner join jobs on employers.employer_id = jobs.employer_id
                                                    inner join applications on  jobs.job_id = applications.job_id
group by company_name;

select *from vw_review;

--part5--
CREATE OR REPLACE FUNCTION
    log_job_update()
    RETURNS TRIGGER AS $$
BEGIN
INSERT INTO audit_logs(table_name, action, record_id)
VALUES
    ('jobs', 'UPDATE', OLD.job_id);
RETURN NEW;
END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_jobs_audit
    AFTER UPDATE
    ON jobs
    FOR EACH ROW
    EXECUTE FUNCTION log_job_update();

--part6--
CREATE OR REPLACE FUNCTION
    job_update()
    RETURNS TRIGGER AS $$
BEGIN
            new.updated_at=current_timestamp;
return new;
END;
$$ LANGUAGE plpgsql;

create trigger trg_jobs
    before update on jobs
    for each row
    execute function job_update();

--part7--
CREATE OR REPLACE FUNCTION
    check_salary()
    RETURNS TRIGGER AS $$
BEGIN
            if new.salary_min > new.salary_max then
                raise exception 'Lỗi cmm rồi';
end if;
return new;
END;
$$ LANGUAGE plpgsql;

create trigger checkkk
    before insert or update on jobs
                         for each row
                         execute function check_salary();

--part8--
CREATE OR REPLACE FUNCTION
    check_status()
    RETURNS TRIGGER AS $$
BEGIN
    if(new.status='CLOSED') then
        if exists(
            select 1
            from applications
            where status='PENDING' and job_id=new.id
        ) then
            raise exception 'Error';
end if;
end if;
return new;
END;
$$ LANGUAGE plpgsql;

create trigger checkss
    before update on jobs
    for each row
    when ( old.status is distinct from new.status and new.status='CLOSED')
execute function check_status();


