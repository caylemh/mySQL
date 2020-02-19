use drinks;

SELECT drink_name, amount1 from easy_drinks
WHERE amount1 >= 1.5;

SELECT drink_name, ice FROM drink_info
WHERE ice = 'n';

SELECT drink_name, calories FROM drink_info
WHERE calories > 20;

SELECT drink_name FROM easy_drinks
WHERE main between 'p' and 't';

SELECT drink_name, calories FROM drink_info
WHERE calories > 0;

SELECT drink_name, carbs FROM drink_info
WHERE carbs > 3 OR carbs < 5;

use caylems_list;

SELECT date_name from black_book
WHERE date_name not between 'A' and 'C';