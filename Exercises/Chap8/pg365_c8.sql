use caylems_list;

CREATE TABLE `toys` (
  `toy_id` int(11) NOT NULL AUTO_INCREMENT,
  `toy` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`toy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1

CREATE TABLE `boys` (
  `boy_id` int(11) NOT NULL AUTO_INCREMENT,
  `boy` varchar(20) DEFAULT NULL,
  `toy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`boy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1

INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('1','Davey','3');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('2','Bobby','5');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('3','Beaver','2');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('4','Richie','1');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('6','Johnny','4');
INSERT INTO `boys` (`boy_id`,`boy`,`toy_id`) VALUES ('5','Billy','2');

INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('1','hula hoop');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('2','balsa glider');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('3','toy soldiers');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('4','harmonica');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('5','baseball cards');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('6','tinker toys');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('7','etch-a-sketch');
INSERT INTO `toys` (`toy_id`,`toy`) VALUES ('8','slinky');

SELECT t.toy, b.boy
FROM toys AS t
CROSS JOIN
boys AS b;

SELECT b.boy, t.toy
FROM boys as b
INNER JOIN
toys as t
ON b.toy_id = t.toy_id;

# The non-equijoin returns any rows that are not equal #

SELECT boys.boy, toys.toy
FROM boys
INNER JOIN
toys
ON boys.toy_id <> toys.toy_id
ORDER BY boys.boy;

SELECT boys.boy, toys.toy
FROM boys
NATURAL JOIN
toys;