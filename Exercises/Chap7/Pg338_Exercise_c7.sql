use job_list;
drop table seeking;
drop table contact_seeking, contact_interest;

# Creating the original 'my_contacts' table with data
CREATE TABLE `my_contacts` (
  `last_name` varchar(30) ,
  `first_name` varchar(20) ,
  `email` varchar(50) ,
  `gender` char(1),
  `birthday` date ,
  `profession` varchar(50),
  `location` varchar(50),
  `status` varchar(20),
  `interests` varchar(100),
  `seeking` varchar(100)
);

INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Anderson','Jillian','jill_anderson@ \nbreakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto, CA','single','kayaking, reptiles','relationship, friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kenton','Leo','lkenton@starbuzzcoffee.com','M','1974-01-10','Manager','San Francisco, CA','divorced','women','women to date');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('McGavin','Darrin',' captainlove@headfirsttheater.com','M','1966-01-23','Cruise Ship Captain','San Diego, CA','single','sailing, fishing, yachting','women for casual relationships');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Franklin','Joe','joe_franklin@leapinlimos.com','M','1977-04-28','Software Sales','Dallas, TX','married','fishing, drinking','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Hamilton','Jamie','dontbother@starbuzzcoffee.com','F','1964-09-10','System Administrator','Princeton, NJ','married','RPG','nothing');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Chevrolet','Maurice','bookman4u@objectville.net','M','1962-07-01','Bookshop Owner','Mountain View, CA','married','collecting books, scuba diving','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Kroger','Renee','poorrenee@mightygumball.net','F','1976-12-03','Unemployed','San Francisco, CA','divorced','cooking','employment');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Mendoza','Angelina','angelina@starbuzzcoffee.com','F','1979-08-19','UNIX Sysadmin','San Francisco, CA','married','acting, dancing','new job');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Murphy','Donald','padraic@tikibeanlounge.com','M','1967-01-23','Computer Programmer','New York City, NY','committed relationsh','RPG, anime','friends');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`,`profession`,`location`,`status`,`interests`,`seeking`) VALUES ('Spatner','John','jpoet@objectville.net','M','1963-04-18','Salesman','Woodstock, NY','married','poetry, screenwriting','nothing');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Toth','Anne','Anne_Toth@leapinlimos.com','F','1969-11-18', 'Artist','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Manson','Anne','am86@objectville.net','F','1977-08-09', 'Baker','Seattle, WA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Hardy','Anne','anneh@b0tt0msup.com','F','1963-04-18', 'Teacher','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Parker','Anne','annep@starbuzzcoffee.com','F','1983-01-10', 'Student','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Blunt','Anne','anneblunt@breakneckpizza.com','F','1959-10-09', 'Web Designer','San Fran, CA');
INSERT INTO `my_contacts` (`last_name`,`first_name`,`email`,`gender`,`birthday`, `profession`,`location`) VALUES ('Jacobs','Anne','anne99@objectville.net','F','1968-02-05', 'Computer Programmer','San Jose, CA');

# Adding the other interest columns
alter table my_contacts
add column interest1 varchar(20) after interests,
add column interest2 varchar(20) after interest1,
add column interest3 varchar(20) after interest2;

#Seperating the 'interest' column into single 'interest' values for colimns nterest1, interest2 and interest3
update my_contacts set
interest1 = substring_index(interests,',',1),
interests = substr(interests, length(interest1)+3),
interest2 = substring_index(interests,',',1),
interests = substr(interests, length(interest2)+3),
interest3 = interests;

# Deleting the old 'interests' column
alter table my_contacts
drop column interests;

# Normalising the location column in to 'location' and 'state'
alter table my_contacts
add column state char(2) not null after location;

update my_contacts set
location = substring_index(location,',',1),
state = right(location,2);

# Creating all the other tables
CREATE TABLE `profession` (
  `prof_id` int NOT NULL AUTO_INCREMENT,
  `profession` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prof_id`)
);

# Inserting profession values i the 'my_contacts' table to the 'profession' table
insert into profession (profession)
select profession from my_contacts
group by profession
order by profession;

CREATE TABLE `seeking` (
  `seeking_id` int NOT NULL AUTO_INCREMENT,
  `seeking` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seeking_id`)
);

# Inserting seeking values into the 'seeking' table
insert into seeking(seeking)
select (select substring_index(seeking,',',1)) from my_contacts where seeking<>''
group by seeking
order by seeking;

CREATE TABLE `zip_code` (
  `zip_code` int NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`zip_code`)
);

# Inserting location values in to the 'zip_code' table
insert into zip_code (city, state)
select location, state from my_contacts
group by location
order by location;

CREATE TABLE `status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
);

# Inserting status values into the 'status' table
insert into status (status)
select status from my_contacts where status <>''
group by status
order by status;

CREATE TABLE `interests` (
  `int_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `interest` varchar(100) DEFAULT NULL
);

/* Inserting the 'Interest' values (interest2, interest2 & interest3) values from the 'my_contacts' 
# into the new 'interests' table with no duplicates. */
insert into interests(interest)
	select interest1 from my_contacts where interest1<>''
	union
	select interest2 from my_contacts where interest2<>''
	union
	select interest3 from my_contacts where interest3<>''
    order by interest1;

CREATE TABLE `my_contacts_id` (
  `contact_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `last_name` varchar(30) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `prof_id` int NOT NULL,
  `zip_code` int NOT NULL,
  `status_id` int NOT NULL
  );
  
  # Populating my_contacts_id table

insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Anderson','Jillian',NULL,'jill_anderson@breakneckpizza.com','F','1980-09-05',12,1,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Blunt','Anne',NULL,'anneblunt@breakneckpizza.com','F','1959-10-09',15,7,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Chevrolet','Maurice',NULL,'bookman4u@objectville.net','M','1962-07-01',3,2,4);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Franklin','Joe',NULL,'joe_franklin@leapinlimos.com','M','1977-04-28',8,1,4);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Hamilton','Jamie',	NULL,'dontbother@starbuzzcoffee.com','F','1964-09-10',10,5,4);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Hardy','Anne',	NULL,'anneh@b0tt0msup.com','F',	'1963-04-18',11,7,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Jacobs','Anne',NULL,'anne99@objectville.net','F','1968-02-05',4,9,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Kenton','Leo',NULL,'lkenton@starbuzzcoffee.com','M','1974-01-10',6,8,3);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Kroger','Renee',NULL,'poorrenee@mightygumball.net','F','1976-12-03',13,8,3);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Manson','Anne',NULL,'am86@objectville.net','F','1977-08-09',2,10,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('McGavin','Darrin',NULL	,'captainlove@headfirsttheater.com','M','1966-01-23',5,6,5);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Mendoza','Angelina',NULL,'angelina@starbuzzcoffee.com','F','1979-08-19',14,8,4);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Murphy','Donald',NULL,'padraic@tikibeanlounge.com','M','1967-01-23',4,3,2);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Parker','Anne',NULL,'annep@starbuzzcoffee.com','F','1983-01-10',9,7,1);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Spatner','John',NULL,'jpoet@objectville.net','M','1963-04-18',7,11,4);
insert into my_contacts_id (last_name,first_name,phone,email,gender,birthday,prof_id,zip_code,status_id) 
values ('Toth','Anne',NULL,'Anne_Toth@leapinlimos.com','F','1969-11-18',1,7,1);

# Add foreign keys and contraints
alter table my_contacts_id
add constraint my_contacts_id_profession_fk foreign key (prof_id) references profession(prof_id);

alter table my_contacts_id
add constraint my_contacts_id_zip_code_fk foreign key (zip_code) references zip_code(zip_code);

alter table my_contacts_id
add constraint my_contacts_id_status_fk foreign key (status_id) references `status`(status_id);

# Create the junction tables
CREATE TABLE `contact_interest` (
  `contact_id` int NOT NULL,
  `interest_id` int NOT NULL,
  PRIMARY KEY (`contact_id`,`interest_id`),
  CONSTRAINT `contact_interest_my_contacts_id_fk` FOREIGN KEY (`contact_id`) REFERENCES `my_contacts_id` (`contact_id`),
  CONSTRAINT `contact_interest_interests_fk` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`int_id`)
);

CREATE TABLE `contact_seeking` (
  `contact_id` int NOT NULL,
  `seeking_id` int NOT NULL,
  PRIMARY KEY (`contact_id`,`seeking_id`),
  CONSTRAINT `contact_seeking_my_contacts_id` FOREIGN KEY (`contact_id`) REFERENCES `my_contacts_id` (`contact_id`),
  CONSTRAINT `contact_seeking_seeking_fk` FOREIGN KEY (`seeking_id`) REFERENCES `seeking` (`seeking_id`)
);

