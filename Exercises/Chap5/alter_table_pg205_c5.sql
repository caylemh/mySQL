use caylems_list;

CREATE TABLE `projekts` (
  `number` int(11) NOT NULL default '0',
  `descriptionofproj` varchar(50) default NULL,
  `contractoronjob` varchar(10) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('1','outside house painting','Murphy');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('2','kitchen remodel','Valdez');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('3','wood floor installation','Keller');
INSERT INTO `projekts` (`number`,`descriptionofproj`,`contractoronjob`) VALUES ('4','roofing','Jackson');

alter table projekts
rename to projects_list;

alter table projects_list
add column proj_id int not null auto_increment first,
add primary key (proj_id);

alter table projects_list
rename column descriptionofproj to improvements;

alter table projects_list
add column start_date date not null after proj_id;

alter table projects_list
add column cost_estimate dec(10,2) not null after start_date;

alter table projects_list
rename column contractoronjob to contractor;

alter table projects_list
add column contractor_contact int(10) not null;


select proj_id,start_date,contractor,contractor_contact,improvements,cost_estimate from projects_list;


