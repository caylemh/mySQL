use contacts_list;
set sql_safe_updates=0;

insert into interests (interest)
select interests from my_contacts
group by interests
order by interests;

insert into profession (profession)
select profession from my_contacts
group by profession
order by profession;

insert into interests (interest)
values ('yachting');

insert into my_contacts_id (last_name, first_name, email, gender, birthday,prof_id,zip_code,status_id)
select last_name, first_name, email, gender, birthday,1,1,1
from my_contacts
group by last_name
order by last_name;

insert into zip_code (city, state)
select location, state from my_contacts
group by location
order by location;

insert into seeking(seeking)
values ('women to date');

alter table zip_code
modify column state varchar(4);

select * from interests;
select * from profession;
select * from status;
select * from zip_code group by city order by city;
select * from my_contacts_id;

update my_contacts_id
set prof_id = 1, zip_code = 7, status_id = 1
where contact_id = 16;

insert into contact_seeking (contact_id, seeking_id)
values (15,4);

SELECT mc.last_name,
mc.first_name,
p.profession
FROM my_contacts_id AS mc
INNER JOIN
profession AS p
ON mc.prof_id = p.prof_id;