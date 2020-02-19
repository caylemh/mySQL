CREATE DATABASE gregs_list;

USE gregs_list;

CREATE TABLE doughnut_list
(
doughnut_name VARCHAR(10),
doughnut_type VARCHAR(6)
);

CREATE TABLE my_contacts
(
last_name VARCHAR(30),
first_name VARCHAR(20),
email VARCHAR(50),
birthday DATE,
profession VARCHAR(50),
location VARCHAR(50),
status VARCHAR(20),
interests VARCHAR(100),
seeking VARCHAR(100)
);

insert into my_contacts
values (
	'Harris',
    'Caylem',
    'caylemh@gmail.com',
    '1983-01-31',
    'Developer',
    'Woodmead, JHB',
    'Online',
    'Photography',
    'Vacation'
);
