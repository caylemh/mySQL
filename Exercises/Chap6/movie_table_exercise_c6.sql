select * from movie_table;
drop table movie_table;

alter table movie_table_demo
rename to movie_table;

CREATE TABLE movie_table (
`movie_id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(45) NOT NULL,
`rating` char(1) NOT NULL,
`drama` char(1) NOT NULL,
`comedy` char(1) NOT NULL,
`action` char(1) NOT NULL,
`gore` char(1) NOT NULL,
`scifi` char(1) NOT NULL,
`for_kids` char(1) NOT NULL,
`cartoon` char(1) NOT NULL,
`published` date NOT NULL,
PRIMARY KEY (`movie_id`)
) ;

INSERT INTO movie_table
(movie_id,title,rating,drama,comedy,action,gore,scifi,for_kids,cartoon,published)
VALUES
(1,"Monsters Inc.",'G','F','T','F','F','F','T','T','2002-06-03'),
(2,"The Godfather",'R','F','F','T','T','F','F','F','2001-02-05'),
(3,"Gone with the Wind",'G','T','F','F','F','F','F','F','1999-11-20'),
(4,"American Pie",'R','F','T','F','F','F','F','F','2003-04-19'),
(5,"Nightmare on Elm Street",'R','F','F','T','T','F','F','F','2003-04-19'),
(6,"Casablanca",'P','T','F','F','F','F','F','F','2001-02-05');

alter table movie_table
add column category varchar(10) default 'none' after cartoon;

UPDATE movie_table SET category = 'drama' where drama = 'T';
UPDATE movie_table SET category = 'comedy' where comedy = 'T';
UPDATE movie_table SET category = 'action' where action = 'T';
UPDATE movie_table SET category = 'horror' where gore = 'T';
UPDATE movie_table SET category = 'scifi' where scifi = 'T';
UPDATE movie_table SET category = 'family' where for_kids = 'T';
UPDATE movie_table SET category = 'family' where cartoon = 'T' AND rating = 'G';
UPDATE movie_table SET category = 'misc' where cartoon = 'T' AND rating <> 'G';

# Rather use a CASE to make all the changes with one UPDATE statement #

UPDATE movie_table
SET category =
CASE
WHEN drama = 'T' THEN 'drama'
WHEN comedy = 'T' THEN 'comedy'
WHEN action = 'T' THEN 'action'
WHEN gore = 'T' THEN 'horror'
WHEN scifi = 'T' THEN 'scifi'
WHEN for_kids = 'T' THEN 'family'
WHEN cartoon = 'T' THEN 'family'
ELSE 'misc'
END;

# Update for cartoons #

UPDATE movie_table
SET category =
CASE
WHEN cartoon = 'T' THEN 'family'WHEN drama = 'T' THEN 'drama'
WHEN comedy = 'T' THEN 'comedy'
WHEN action = 'T' THEN 'action'
WHEN gore = 'T' THEN 'horror'
WHEN scifi = 'T' THEN 'scifi'
WHEN for_kids = 'T' THEN 'family'
WHEN cartoon = 'T' and rating = 'G' THEN 'family'
ELSE 'misc'
END;

# Create R rated category entries #

UPDATE movie_table
SET category =
CASE
WHEN drama = 'T' AND rating = 'R' THEN 'drama-r'
WHEN comedy = 'T' AND rating = 'R' THEN 'comedy-r'
WHEN action = 'T' AND rating = 'R' THEN 'action-r'
WHEN gore = 'T' AND rating = 'R' THEN 'horror-r'
WHEN scifi = 'T' AND rating = 'R' THEN 'scifi-r'
WHEN category = 'misc' AND rating = 'G' THEN 'family'
END;

# Delete R rated categories #

UPDATE movie_table
SET category =
CASE
WHEN category = 'drama-r' THEN 'drama'
WHEN category = 'comedy-r' THEN 'comedy'
WHEN category = 'action-r' THEN 'action'
WHEN category = 'horror-r' THEN 'horror'
WHEN category = 'scifi-r' THEN 'scifi'
END;

# Delete T/F columns #

ALTER TABLE movie_table
DROP COLUMN drama,
DROP COLUMN comedy,
DROP COLUMN action,
DROP COLUMN gore,
DROP COLUMN scifi,
DROP COLUMN for_kids,
DROP COLUMN cartoon;

# How to ORDER your data using ASC or DESC #

SELECT * FROM movie_table
ORDER BY title DESC;

