use caylems_list;

CREATE TABLE `hooptie` (
  `color` varchar(20) default NULL,
  `year` varchar(4) default NULL,
  `make` varchar(20) default NULL,
  `mo` varchar(20) default NULL,
  `howmuch` float(10,3) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES ('silver','1998','Porsche','Boxter','17992.539');
INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES (NULL,'2000','Jaguar','XJ','15995.000');
INSERT INTO `hooptie` (`color`,`year`,`make`,`mo`,`howmuch`) VALUES ('red','2002','Cadillac','Escalade','40215.898');

select * from hooptie;
desc hooptie;

alter table hooptie
rename to car_table;

alter table car_table
add column car_id int not null auto_increment first,
add primary key (car_id);

alter table car_table
add column VIN varchar(30) not null after car_id,
change column mo model varchar(20);

select * from car_table;
desc car_table;

alter table car_table
change column howmuch price float(10,2);

alter table car_table
modify column model varchar(20) after make;

update car_table
set VIN = 'RNKLK66N33G213481'
where car_id = 1;

update car_table
set VIN = 'SAEDA44B175B04113'
where car_id = 2;

update car_table
set VIN = '3GYK63NT2G280668'
where car_id = 3;

select * from car_table;