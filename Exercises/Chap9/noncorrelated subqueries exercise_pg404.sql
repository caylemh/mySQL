# List title for jobs that earn salaries equal to the highest salary in the job_listings table. #

select title from job_listings
where salary = (select max(salary) from job_listings);

# List the first and last name of people with a salary greater than the average salary. #
select mc.first_name, mc.last_name, jc.salary
from my_contacts_id mc natural join job_current jc
where jc.salary > (select avg(salary) from job_current);

# Find all Web Designers who have the same zip code as any job_listings for web designers. #
select mc.first_name, mc.last_name, mc.phone from my_contacts_id mc 
natural join job_current jc where jc.title ='web designer' and mc.zip_code
in (select zip from job_listings where title = 'web designer');

# Select everyone who lives in the same zip code as the person with the highest current salary.
select mc.first_name, mc.last_name from my_contacts_id mc
where zip_code in (select mc.zip_code from my_contacts_id mc
natural join job_current jc
where jc.salary = (select max(salary) from job_current));

