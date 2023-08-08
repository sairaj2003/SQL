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


