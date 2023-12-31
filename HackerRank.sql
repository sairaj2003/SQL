1) Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
  SELECT COUNT(city) - COUNT(DISTINCT city)as diff from station;

-------------------------------------------------------------------------------------------------------------------------------------

2) uery the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.


SELECT city,length(city) as name_length
FROM station
order by name_length,city
LIMIT 1;

SELECT city,length(city) as name_length
FROM station
order by name_length DESC,city
LIMIT 1;                                  --LIMIT 1 is used for retriving only first element


-------------------------------------------------------------------------------------------------------------------------------------


3) Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
	
	select distinct CITY from STATION where CITY rlike "^[aeiou]";

/*WHERE CITY RLIKE "^[aeiou]": This is the filtering condition for the query. It uses the RLIKE operator (which stands for "regular expression LIKE") to match city names that follow a specific pattern:

"^": Anchors the regular expression to the beginning of the string.*/


-------------------------------------------------------------------------------------------------------------------------------------

4) Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.


SELECT DISTINCT city 
FROM station
WHERE city RLIKE "[aeiou]$";            -- $: Anchors the regular expression to the end of the string.




-------------------------------------------------------------------------------------------------------------------------------------

5) Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT city 
FROM station
WHERE city RLIKE "^[aeiou].*[aeiou]$";
 
 /*
 WHERE CITY RLIKE "^[aeiouAEIOU].*[aeiouAEIOU]$" is the filtering condition. The RLIKE operator is used to match city names that follow a specific pattern:
^[aeiouAEIOU]: Matches a vowel (a, e, i, o, or u) as the first character of the city name.
.*: Matches any sequence of characters (zero or more) in between the first and last vowels.
[aeiouAEIOU]$: Matches a vowel (a, e, i, o, or u) as the last character of the city name.
 */



-------------------------------------------------------------------------------------------------------------------------------------


6) Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station
WHERE city NOT RLIKE "^[aeiou]"; 


 -------------------------------------------------------------------------------------------------------------------------------------

7) Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station
WHERE city NOT RLIKE "[aeiou]$";


-------------------------------------------------------------------------------------------------------------------------------------
8) Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station
WHERE city NOT RLIKE "^[aeiou]" 
OR 
city NOT RLIKE"[aeiou]$";


-------------------------------------------------------------------------------------------------------------------------------------

9) Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three
	characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

	SELECT Name FROM STUDENTS
	WHERE Marks > 75 
	ORDER BY RIGHT(Name,3),ID;
/*
RDER BY RIGHT(Name, 3), ID: This orders the results first by the last three characters of the "Name" column 
(using the RIGHT function to extract the rightmost characters), and then by the "ID" column in ascending order.
*/

-------------------------------------------------------------------------------------------------------------------------------------

10) Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
	
	SELECT name FROM employee 
	ORDER BY name;


-------------------------------------------------------------------------------------------------------------------------------------

11) Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than  months. Sort your result by 
	ascending employee_id.

	SELECT name FROM employee 
	WHERE salary >2000 
	AND 
	months < 10
	ORDER BY employee_id;


-------------------------------------------------------------------------------------------------------------------------------------
12) Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.

	SELECT ROUND(MAX(LAT_N), 4) 
	FROM STATION
	WHERE LAT_N < 137.2345;

-------------------------------------------------------------------------------------------------------------------------------------
13) Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to  decimal places.
	SELECT ROUND(LONG_W,4) FROM STATION
	WHERE LAT_N < 137.2345
	ORDER BY LAT_N DESC
	LIMIT 1;

-------------------------------------------------------------------------------------------------------------------------------------
14) Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . Round your answer to  decimal places.

	SELECT ROUND(LAT_N,4) FROM station
	WHERE LAT_N > 38.7780
	ORDER BY LAT_N 
	LIMIT 1;

-------------------------------------------------------------------------------------------------------------------------------------
15)Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 . Round your answer to  decimal places.

	SELECT ROUND(LONG_W,4) FROM station 
	WHERE LAT_N > 38.7780
	ORDER BY LAT_N 
	LIMIT 1;

-------------------------------------------------------------------------------------------------------------------------------------

16) Consider p1(a,b) and p2(c,d) to be two points on a 2D plane.

 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.


	SELECT ROUND(ABS(c-a) + ABS(d-b),4)
	FROM
	(SELECT MIN(LAT_N) AS a, MIN(LONG_W) AS b, MAX(LAT_N) AS c ,MAX(LONG_W) AS d FROM station)
	AS POINTS;


-------------------------------------------------------------------------------------------------------------------------------------
17) Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

	SELECT 
	  CASE 
	    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
	    WHEN A = B AND B = C THEN 'Equilateral'
	    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
	    ELSE 'Scalene'
	  END AS typeoftriangle
	FROM TRIANGLES;

-------------------------------------------------------------------------------------------------------------------------------------

18)
