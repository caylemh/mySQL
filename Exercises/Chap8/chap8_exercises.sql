#Pg 345 exercise
select status from my_contacts
group by status
order by status;

select profession from my_contacts
group by profession
order by profession;

-- Won't eork because of multiple values in the 'interests' column.
select interests from my_contacts
group by interests
order by interests;

select seeking from my_contacts
group by seeking
order by seeking;

#Pg 348 exercise
SELECT * FROM my_contacts;
ALTER TABLE my_contacts_interests
ADD COLUMN interest1 VARCHAR(50),
ADD COLUMN interest2 VARCHAR(50),
ADD COLUMN interest3 VARCHAR(50),
ADD COLUMN interest4 VARCHAR(50);

update my_contacts set
interest1 = substring_index(interests,',',1),
interests = substr(interests, length(interest1)+2),
interest2 = substring_index(interests,',',1),
interests = substr(interests, length(interest2)+2),
interest3 = substring_index(interests,',',1),
interests = substr(interests, length(interest3)+2),
interest4 = interests;

# CREATE, SELECT, INSERT at the same time
CREATE TABLE profession
(
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
profession varchar(20)
) AS
SELECT profession FROM my_contacts
GROUP BY profession
ORDER BY profession;


