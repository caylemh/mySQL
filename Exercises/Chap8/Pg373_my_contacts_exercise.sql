use contacts_list;

# Two queries, each with a different join, to get the matching records from my_contacts and contact_interest. #

select *
from my_contacts_id mc
inner join
contact_interest ci
on mc.contact_id = ci.contact_id;

select *
from my_contacts_id
natural join
contact_interest;

# Query to return all possible combinations of rows from contact_seeking and seeking. #

select *
from contact_seeking cs
cross join
seeking s;

# List the professions of people in the my_contacts table, but without any duplicates and in alphabetical order. #

select mc.first_name, mc.last_name, p.profession
from my_contacts_id mc
natural join
profession p
order by profession;

