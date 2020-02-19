use gregs_list;

alter table my_contacts
drop column Phone;

alter table my_contacts
add column Phone int(10) NOT NULL after email;


