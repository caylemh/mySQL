create table my_names 
(
	nameId int not null auto_increment,
	first_name varchar(10) default null,
    last_name varchar(10) default null,
    primary key(nameID)
);

insert into my_names (nameId, first_name, last_name)
values(null,'Caylem','Harris');

insert into my_names (nameId, first_name, last_name)
values(null,'Tatenda','Kumbula');

insert into my_names (nameId, first_name, last_name)
values(null,'Ruben','Kritzinger');

insert into my_names (first_name, last_name)
values(null,'Juan','Du Toit');

INSERT INTO my_names (first_name, last_name)
VALUES ('Marcia', 'Brady');

INSERT INTO my_names (first_name, last_name)
VALUES ('Jan', 'Brady');

INSERT INTO my_names (first_name, last_name)
VALUES ('Bobby', 'Brady');

INSERT INTO my_names (first_name, last_name)
VALUES ('Cindy', 'Brady');

INSERT INTO my_names (first_name, last_name)
VALUES ('Peter', 'Brady');
