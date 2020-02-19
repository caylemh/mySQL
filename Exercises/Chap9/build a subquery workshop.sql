# Build a subquery workshop
# 1.
	select AVG(salary) 
	from job_current 
	where title = 'Web Developer';

# 2.
	select mc.last_name, mc.first_name, jc.salary
    from my_contacts_id mc
    natural join
    job_current jc
    where title = 'Web Developer';
    
# 3.
	select mc.last_name, mc.first_name, jc.salary,
    jc.salary-(select AVG(salary)
    from job_current
    where title = 'Web Developer')
    from my_contacts_id mc
    natural join
    job_current jc
    where title = 'Web Developer';
