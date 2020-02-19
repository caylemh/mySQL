#Pg 447 Exercises
SELECT title FROM job_listings WHERE salary = (SELECT
MAX(salary) FROM job_listings);

SELECT title FROM job_listings ORDER
BY salary DESC LIMIT 1;

#subqueries just make it easier to understand.

SELECT mc.first_name, mc.last_name FROM my_contacts mc
NATURAL JOIN job_current jc WHERE jc.salary > (SELECT
AVG(salary) FROM job_current);

#Sorry but I'm definitely not going to try and use subqueries here...Complicated.