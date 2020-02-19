use gregs_list;
select * from my_contacts;
desc my_contacts;
set sql_safe_updates = 0;

alter table my_contacts
add column state char(2) not null after location;

update my_contacts
set state = right(location,2);

update my_contacts
set location = substring_index(location,',',1) ;

alter table my_contacts
change column location city varchar(50);