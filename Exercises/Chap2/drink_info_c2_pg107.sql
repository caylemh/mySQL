use drinks;

SELECT drink_name FROM drink_info
WHERE calories between 30 and 60;

SELECT drink_name FROM drink_info
WHERE calories < 30 OR calories > 60;

SELECT drink_name FROM drink_info
WHERE drink_name between 'g' and 'p';

SELECT drink_name FROM drink_info
WHERE calories between 60 and 30;    # No Result, as order matters.