CREATE TABLE `black_book` (
  `date_name` varchar(20) default NULL,
   `rating` varchar(20) default NULL
) ENGINE = MyISAM DEFAULT CHARSET = latin1;

INSERT INTO black_book
VALUES ('Alex','innovative'),
('James','boring'),
('Ian','fabulous'),
('Boris','ho hum'),
('Melvin','plebian'),
('Eric','pathetic'),
('Anthony','delightful'),
('Sammy','pretty good'),
('Ivan','dismal'),
('Vic','ridiculous');

select date_name from black_book
WHERE rating IN (
'innovative','fabulous','delightful','pretty good'
);

select date_name,rating from black_book
WHERE rating NOT IN ( 
'innovative','fabulous','delightful','pretty good'
);

select date_name from black_book
where not date_name like 'A%'
and not date_name like 'b%';
