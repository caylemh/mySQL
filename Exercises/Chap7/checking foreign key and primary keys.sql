use job_list;

# Calling all the columns
SELECT mc.contact_id, mc.last_name,mc.first_name,mc.email,mc.gender,mc.birthday,
p.profession,
z.city, z.state,
st.status,
i.interest
FROM my_contacts_id mc
INNER JOIN profession p
INNER JOIN zip_code z
INNER JOIN `status` st
INNER JOIN interests i
ON mc.prof_id = p.prof_id and mc.status_id = st.status_id and
mc.zip_code = z.zip_code and mc.contact_id = i.int_id
order by mc.contact_id;

SELECT mc.last_name,
mc.first_name,
p.profession
FROM my_contacts_id AS mc
INNER JOIN
profession AS p
ON mc.prof_id = p.prof_id 