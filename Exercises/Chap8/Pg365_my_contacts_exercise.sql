use contacts_list;

# Returns the email addresses and professions of each person in my_contacts. #

select mc.email, p.profession
from my_contacts_id as mc
inner join
profession as p
on mc.prof_id = p.prof_id;

# Query that returns the first name, last name, and status each person in my_contacts. #

select mc.first_name, mc.last_name, s.status
from my_contacts_id as mc
inner join
status as s
on mc.status_id = s.status_id;

# Query that returns the first name, last name, and state of each person in my_contacts. #

select mc.first_name, mc.last_name, z.state
from my_contacts_id as mc
inner join
zip_code as z
on mc.zip_code = z.zip_code;

