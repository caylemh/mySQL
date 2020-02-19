
# return the first and last name of people who have 3 interests #
select mc.last_name, mc.first_name
from my_contacts_id mc
where
3 = (select count(*) from contact_interest
where contact_id = mc.contact_id);

# find people who are currently not listed in the job_current table (NOT EXISTS) #
select mc.last_name, mc.first_name, mc.email
from my_contacts_id mc
where not exists
(select * from job_current jc
where mc.contact_id = jc.contact_id);

# Find people who show up at least once in the contact_interest table (EXISTS) #
select mc.last_name, mc.first_name, mc.email
from my_contacts_id mc
where exists
(select * from contact_interest ci
where mc.contact_id = ci.contact_id);
