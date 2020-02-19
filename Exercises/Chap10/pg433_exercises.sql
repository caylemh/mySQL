drop table clown_boss;

#PG433 Exercise
select cl1.name,cl2.name as boss
from clown_info cl1
inner join
clown_info_1 cl2
on cl1.boss_id = cl2.id;


