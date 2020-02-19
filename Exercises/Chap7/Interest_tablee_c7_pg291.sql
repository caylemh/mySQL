CREATE TABLE interests
(
int_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
interest VARCHAR(50) NOT NULL,
contact_id INT(11) NOT NULL,
CONSTRAINT my_contacts_interests_contact_id_fk
FOREIGN KEY(contact_id)
REFERENCES my_contacts_interests(contact_id)
);

CREATE TABLE my_contacts_interests (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `interests` varchar(100) DEFAULT NULL,
  `seeking` varchar(100) DEFAULT NULL,
  `interest1` varchar(50) DEFAULT NULL,
  `interest2` varchar(50) DEFAULT NULL,
  `interest3` varchar(50) DEFAULT NULL,
  `interest4` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8


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
OR interest4 = geocaching'
) ;