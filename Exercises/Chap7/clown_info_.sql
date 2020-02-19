use clown_list;
drop table clown_info;
drop table clown_info_1;

# Create the general table
CREATE TABLE `clown_info` (
 `name` varchar(50) default NULL,
 `last_seen` varchar(50) default NULL,
 `appearance` varchar(50) default NULL,
 `activities` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO clown_info VALUES ('Elsie', 'Cherry Hill Senior Center', 'F, red hair, green dress, huge feet', 'balloons, little car');
INSERT INTO clown_info VALUES ('Pickles', 'Jack Green\'s party', 'M, orange hair, blue suit, huge feet','mime');
INSERT INTO clown_info VALUES ('Snuggles' ,'Ball?Mart' ,'F, yellow shirt, baggy red pants', 'horn, umbrella');
INSERT INTO clown_info VALUES ('Mr. Hobo' ,'Party for Eric Gray' ,'M, cigar, black hair', 'tiny hat violin');
INSERT INTO clown_info VALUES ('Clarabelle' ,'Belmont Senior Center' ,'F, pink hair, huge flower, blue dress', 'yelling, dancing');
INSERT INTO clown_info VALUES ('Scooter', 'Oakland Hospital' ,'M, blue hair, red suit, huge nose', 'balloons'); 
INSERT INTO clown_info VALUES ('Zippo' ,'Millstone Mall', 'F, orange suit, baggy pants', 'dancing'); 
INSERT INTO clown_info VALUES ('Babe', 'Earl’s Autos' ,'F, all pink and sparkly', 'balancing, little car');
INSERT INTO clown_info VALUES ('Bonzo' ,'','M, in drag, polka dotted dress', 'singing, dancing');
INSERT INTO clown_info VALUES ('Sniffles' ,'Tracy\'s', 'M, green and purple suit, pointy nose',''); 

# Creating the new gender column
alter table clown_info
add gender char(1) after name;

# Populating the 'gender' column and deleting the gender value from the 'appearance' column
update clown_info set
gender = substring(appearance,1,1),
appearance = substr(appearance,3);

# Create new 'clown info' table inserting values from old into new clown_info
create table clown_info_1 (
		id int not null auto_increment primary key,
        name varchar(50),
        gender char(1),
        description varchar(50)
	);
    
insert into clown_info_1 (name,gender,description)
select name,gender,appearance from clown_info;

# Creating the 'activities' table and importing the values from the 'clown_info' table
create table activities (
	activity_id int not null auto_increment primary key,
    activity varchar(50) not null default ''
    );
    
insert into activities (activity)
select activities from clown_info;

# Creating the 'location' table nd importing the values from the 'clown_info' table
create table location (
	location_id int not null auto_increment primary key,
    location varchar(50) not null default ''
);

insert into location (location)
select last_seen from clown_info;

# Creating the junction tables and foreign keys for the 'activities' and 'location tables'
create table info_activities (
	id int not null,
    activity_id int not null,
    primary key(id, activity_id),
	constraint info_activities_cl1_fk foreign key (id) references clown_info_1(id),
    constraint info_activities_a_fk foreign key (activity_id) references activities(activity_id)
);

create table info_location (
	id int not null,
    location_id int not null,
    date_when date not null default '0000-00-00',
    primary key (id, location_id),
    constraint info_location_cl1_fk foreign key (id) references clown_info_1(id),
    constraint info_location_l_fk foreign key (location_id) references location(location_id)
);

# Populating the 'info_acivities' table
insert into info_activities values (1,1);
insert into info_activities values (2,2);
insert into info_activities values (3,3);
insert into info_activities values (4,4);
insert into info_activities values (5,5);
insert into info_activities values (6,6);
insert into info_activities values (7,7);
insert into info_activities values (8,8);
insert into info_activities values (9,9);
insert into info_activities values (10,10);
insert into info_activities values (10,3);


# Populating the 'info_location' table
insert into info_location(id,location_id) values (1,1);
insert into info_location(id,location_id) values (2,2);
insert into info_location(id,location_id) values (3,3);
insert into info_location(id,location_id) values (4,4);
insert into info_location(id,location_id) values (5,5);
insert into info_location(id,location_id) values (6,6);
insert into info_location(id,location_id) values (7,7);
insert into info_location(id,location_id) values (8,8);
insert into info_location(id,location_id) values (9,9);
insert into info_location(id,location_id) values (10,10);
insert into info_location(id,location_id) values (4,8);
insert into info_location(id,location_id) values (4,7);

