use contacts_list;

create table my_union as
select title from job_current union
select title from job_desired union
select title from job_listings;

# Exercise Pg441
create table my_union1 as
select contact_id from job_current union
select salary from job_listings;
# The resulting UNION will have a datatype of decimal.

desc my_union1; 
# decimal(12,2) the previous answer was right.

