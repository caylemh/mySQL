use gregs_list;

insert into my_contacts
VALUES
(
'Funyon',
'Steve',
'steve@onionflavoredrings.com', 
'M', '1970-04-01', 'Punk',
'Grover\'s Mill, NJ',
'Single',
'smashing the state',
'compatriots,
guitar players');

SELECT * FROM my_contacts
WHERE location = 'Grover\'s Mill, NJ';

SELECT last_name,first_name,gender FROM my_contacts
WHERE gender = 'F';

use drinks;

SELECT drink_name FROM easy_drinks
WHERE main = 'cherry juice';