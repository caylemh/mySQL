# Query that returns the email of people who have at least one interst but don't exist in the job_current table. #

select mc.email from my_contacts_id mc where 
exists
(select * from contact_interest ci where mc.contact_id = ci.contact_id)
and
not exists
(select * from job_current jc
where mc.contact_id = jc.contact_id);