use caylems_list;
SET SQL_SAFE_UPDATES = 0;

insert into drink_info
values ('Kiss on the Lips',5.5,42.5,'purple','Y',170);

delete from drink_info
where drink_name = 'Kiss on the Lips' and calories = 171;

insert into drink_info
values ('Kiss on the Lips',5.5,42.5,'purple','Y',170);

update drink_info
set
color = 'gold'
where color = 'yellow';

select * from drink_info;

use caylems_list;

UPDATE clown_info
SET last_seen = 'Tracy\'s'
WHERE name = 'Mr. Hobo'
AND last_seen = 'Dickson Park';

UPDATE clown_info
SET last_seen = 'Tracy\'s'
WHERE name = 'Mr. Hobo'
AND last_seen = 'Party for Eric Gray';

UPDATE clown_info
SET activities = 'singing'
WHERE name = 'Zippo';

UPDATE clown_info
SET appearance = 'baggy blue pants'
WHERE name = 'Snuggles';

UPDATE clown_info
SET activities = 'Climbing into tiny car'
WHERE name = 'Sniffles';

UPDATE clown_info
SET last_seen = 'Party for Eric Gray'
WHERE name = 'Mr. Hobo';
