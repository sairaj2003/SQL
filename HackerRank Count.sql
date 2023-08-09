1) Query a count of the number of cities in CITY having a Population larger than 100000.

SELECT COUNT(name) FROM city
WHERE population > 100000;


-----------------------------------------------------------------------------------------------------
2) Query the average population of all cities in CITY where District is California.
  SELECT AVG(population) FROM city
  WHERE district='California';

-----------------------------------------------------------------------------------------------------
3) Query the average population for all cities in CITY, rounded down to the nearest integer.
  SELECT ROUND(AVG(population)) FROM city;

-----------------------------------------------------------------------------------------------------
4) Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(population) FROM city
WHERE countrycode='JPN';

-----------------------------------------------------------------------------------------------------
5) Query the difference between the maximum and minimum populations in CITY.

SELECT (MAX(population) -MIN(population)) FROM city; 

-----------------------------------------------------------------------------------------------------
6) amantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's '0' key was broken until after completing the calculation. 
  She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.Write a query calculating the amount of error 
  (i.e.: actual - mislead average monthly salaries), and round it up to the next integer.

    SELECT CEIL(AVG(salary) - AVG(REPLACE(salary,'0','')))
    FROM employees;
    
/*
    The ROUND function is used to round a numeric value to a specified number of decimal places or to the nearest integer.
    
    The CEIL function, also known as the ceiling function, rounds a numeric value up to the next higher integer.
    It always rounds up the value, regardless of the value of the fractional part.
*/

----------------------------------------------------------------------------------------------------- 
7) 
