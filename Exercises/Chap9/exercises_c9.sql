CREATE TABLE job_current
(
 contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(30) NOT NULL,
 salary int(11) NOT NULL,
 start_date DATE NOT NULL  
);

CREATE TABLE job_desired
(
contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(30) NOT NULL,
 salary_low int(11) NOT NULL,
 salary_high int(11) NOT NULL,
 available VARCHAR(20) NOT NULL,
 years_exp int(11) NOT NULL,
 FOREIGN KEY (contact_id ) REFERENCES job_current(contact_id)
);

CREATE TABLE job_listings
(
 job_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(50) NOT NULL,
 salary INT NOT NULL,
 zip INT NOT NULL,
 description VARCHAR(100)
);

insert into job_current (title, salary, start_date) values ('Web Developer',15000,'2015-06-22');
insert into job_current (title, salary, start_date) values ('Web Developer',20000,'2016-04-23');
insert into job_current (title, salary, start_date) values ('Web Developer',21000,'2017-08-13');
insert into job_current (title, salary, start_date) values ('Web Developer',23000,'2019-10-11');
insert into job_current (title, salary, start_date) values ('Systems Analyst', 30000, '2020-06-13');
insert into job_current (title, salary, start_date) values ('Java Developer', 26000, '2020-04-23');
insert into job_current (title, salary, start_date) values ('Front End Developer', 22000, '2020-05-08');
insert into job_current (title, salary, start_date) values ('IT Manager', 35000, '2019-11-03');

insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Web Developer',20000,35000,'Y',6);
insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Web Designer',20000,40000,'Y',10);
insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Hair Dresser',10000,15000,'Y',4);
insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Waiter',5000,10000,'Y',8);
insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Cook',15000,30000,'Y',15);
insert into job_desired (title, salary_low, salary_high, available, years_exp) values ('Web Developer',35000,45000,'Y',10);

insert into job_listings (title, salary, zip, description) values ('Waiter',10000,1,
'Mature Waiters (aged between 35 and 42) Needed for an upmarket restaurant called 
Kitchen Vibes in Morningside at the Wedge Shopping Center. 
Interviews will be conducted from Monday to Wednesday between 09h30 and 11h00. 
Please bring your CV with.');

# Query to select all the listings on the job_current table and the job_listings table

select title from job_current
group by title
order by title;

select title from job_listings
group by title
order by title;

# Pg383 Query to get qualified candidates from the database

select mc.last_name, mc.first_name, mc.phone
from my_contacts_id mc
natural join
job_desired jd
where jd.title = 'Web Developer'
and jd.salary_low <50000;

select mc.last_name, mc.first_name, mc.phone, jc.title
from my_contacts_id mc
natural join
job_current jc
where jc.title in ('Cook','Hairdresser','Waiter','Web Designer','Web Developer');

# Combine the two into a query with a subquery #

select mc.last_name, mc.first_name, mc.phone, jc.title
from my_contacts_id mc
natural join
job_current jc
where jc.title in (select title from job_listings);

# Pg 396 Who make the most money
select mc.first_name firstname, mc.last_name lastname, jc.salary salary
from my_contacts_id mc
natural join
job_current jc
where salary = (select max(salary) from job_current);

#Subquery as a SELECT column
SELECT mc.first_name, mc.last_name,
(SELECT state
FROM zip_code
WHERE mc.zip_code = zip_code) AS state
FROM my_contacts_id mc;

