use job_list;

SELECT mc.first_name, mc.last_name, mc.phone, jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
INNER JOIN job_listings jl
ON jc.title = jl.title;

/* INNER JOIN only returns the results when jc.title = jl.title. This is the same as the WHERE
clause and the subquery. */

# The select one seems much easier.

# Maybe