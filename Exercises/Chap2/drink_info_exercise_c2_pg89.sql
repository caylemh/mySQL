SELECT drink_name, cost FROM drink_info
WHERE ice = 'Y' AND color = 'yellow' AND calories > 33;

SELECT drink_name, color, carbs FROM drink_info
WHERE carbs <= 4;

SELECT drink_name, cost, calories FROM drink_info
WHERE calories >= 80;

SELECT drink_name, color, ice FROM drink_info
WHERE calories = 171 OR calories = 50;