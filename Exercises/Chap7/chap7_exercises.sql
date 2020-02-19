use gregs_list;
set sql_safe_updates=0;

# Pg 283 Exercise: Nigel's Interests
SELECT * FROM my_contacts			-- select everything from the 'my_contacts' table that matches the condition
WHERE gender = 'F'					-- he's looking for a female to date				
AND status = 'single'				-- and she's single
AND state='TX'						-- living perhaps in th state of texas
AND seeking LIKE '%single M%'		-- and she's also looking for a single person
AND birthday > '1970-08-28'			-- he's looking for someone 5 years older but also not more than 5 years younger than he is.
AND birthday < '1980-08-28'			
AND interests LIKE %animals%		-- Trying to match all nigel's interests.
AND interests LIKE %horses%
AND interests LIKE %movies%;

#Pg286 Exercise: Regis
SELECT * FROM my_contacts
WHERE gender = 'F'
AND status = 'single'
AND state='MA'
AND seeking LIKE '%single M%'
AND birthday > '1950-03-20'
AND birthday < '1960-03-20'

#Pg 287 Exercise: Regis Substring_index
SELECT * FROM my_contacts
WHERE gender = 'F'
AND status = 'single'
AND state='MA'
AND seeking LIKE '%single M%'
AND birthday > '1950-03-20'
AND birthday < '1960-03-20'
AND substring_index(interests,',',1);

#Pg 290: Altering the my_contacts table with more interest columns

alter table my_contacts
add column interest1 varchar(50),
add column interest2 varchar(50),
add column interest3 varchar(50),
add column interest4 varchar(50);

update my_contacts set
interest1 = substring_index(interests,',',1),			-- add the first interest in to interest1 column
interests = substr(interests, length(interest1)+2),		-- delete the first interest from the interests column
interest2 = substring_index(interests,',',1),			-- add the second interest in to interest2 column
interests = substr(interests, length(interest2)+2),		-- delete the second interest from the interests column
interest3 = substring_index(interests,',',1),			-- and so forth...
interests = substr(interests, length(interest3)+2),
interest4 = interests;									-- because there would only be one interest left in the ' interests' column
														-- we just make it equal to interests.
alter table my_contacts								
drop column interests;									-- since we don't need the 'interests' column any longer we can delete it

# Pg 291 Exercise
SELECT * FROM my_contacts
WHERE gender = 'F'
AND status = 'single'
AND state='MA'
AND seeking LIKE '%single M%'
AND birthday > '1950-03-20'
AND birthday < '1960-03-20'
AND
(
interest1 = 'animals'
OR interest2 = 'animals'
OR interest3 = 'animals'
OR interest4 = 'animals'
)
AND
(
interest1 = 'trading cards'
OR interest2 = 'trading cards'
OR interest3 = 'trading cards'
OR interest4 = 'trading cards'
)
AND
(
interest1 = 'geocaching'
OR interest2 = 'geocaching'
OR interest3 = 'geocaching'
OR interest4 = 'geocaching'
) ;

#Pg30 Foreign Keys exercise
CREATE TABLE interests (
int_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
interest VARCHAR(50) NOT NULL,
contact_id INT NOT NULL,
CONSTRAINT my_contacts_contact_id_fk
FOREIGN KEY (contact_id)
REFERENCES my_contacts (contact_id)
);
desc interests; 		-- the KEY field says MUL which means Multiple occurences of the same value may appear.

#Pg318 exercise
-- doughnut_type = a one to many relationship
-- activities = a many to many relationship
-- state = a one to many relationship
-- interests = a many to many relationship
-- authors = a many to many relationship
-- publisher = a one to many relationship
-- fish_species = = one to many
-- state = one to many

#Pg 327 exercise
-- 1 If the title of the book changes this will affect the copyright of that book and therefore the copyright depends on the title, so the value will change.
-- 2 The copyright would also change because you are changing the authors of the book. But the Title is not dependent on the authors but on the copyright.
-- 3 The publisher city would stay the same. Pub_id is independent of pub_city.
-- 4 The pub_city would become New York.



