# Query that returns the email addresses and professions of each person in my_contacts. #

select mc.email, p.profession
from my_contacts_id as mc
natural join
profession as p;

# Query that returns the first name, last name, and any status that each person in my_contacts is not. #

select mc.first_name, mc.last_name, s.status
from my_contacts_id as mc
inner join
status as s
on mc.status_id <> s.status_id
order by s.status;

# Query that returns the first name, last name, and state of each person in my_contacts. #

select mc.first_name, mc.last_name, z.state
from my_contacts_id as mc
natural join
zip_code as z;


