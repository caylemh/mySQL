use clown_list;

# Testing the primary and foreign keys
select ci1.id, ci1.name, ci1.gender, ci1.description, a.activity, l.location from 
clown_info_1 ci1
inner join
activities a
inner join
location l
where  ci1.id = l.location_id and ci1.id = a.activity_id;

