/*Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000

/*Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000


/*Query all columns (attributes) for every row in the CITY table*/
SELECT *
FROM CITY


/*Query all columns for a city in CITY with the ID 1661*/
SELECT *
FROM CITY
WHERE ID = 1661


/*Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN'



/*Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN'



/*Query a list of CITY and STATE from the STATION table*/
SELECT CITY, STATE
FROM STATION



/*Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.*/
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0




/*Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N - N' from STATION. In other words, find the difference between the total number of CITY entries in the table and the*/
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION





/*Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;




/*Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiou]'
-- select distinct CITY from STATION where CITY RLIKE '^[AEIOU]'


/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiou]$'


/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiou]' AND CITY REGEXP '[aeiou]$'




/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou]'



/*Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[^aeiou]$'



/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou]' OR CITY REGEXP '[^aeiou]$'
-- select distinct CITY from STATION where CITY not regexp '^[auoie].*[aouie]$' order by CITY;
-- SELECT DISTINCT CITY FROM STATION WHERE UPPER(LEFT(CITY,1)) NOT IN ('A','E','I','O','U')  OR UPPER(RIGHT(CITY,1)) NOT IN ('A','E','I','O','U') ORDER BY CITY;



/*Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your 	result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou]' AND CITY REGEXP '[^aeiou]$'
-- select distinct CITY from STATION where CITY not regexp '^[aeiou]' and CITY not regexp '[aeiou]$' order by CITY;
-- select distinct CITY from STATION where CITY regexp '^[^aeiouAEIOU].*.[^aeiouAEIOU]$' order by CITY;




/*Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
SELECT Name 
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID
-- select Name from Students where Marks > 75 order by substring(Ucase(Name), -3) asc, id asc;


/*Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.*/
SELECT name
FROM Employee
ORDER BY name




/*Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.*/

SELECT name
FROM Employee
WHERE salary > 2000 and months < 10
ORDER BY employee_id




-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- - Equilateral: It's a triangle with 3 sides of equal length.
-- - Isosceles: It's a triangle with  2 sides of equal length.
-- - Scalene: It's a triangle with 3 sides of differing lengths.
-- - Not A Triangle: The given values of A, B, and C don't form a triangle.

???
SELECT (CASE WHEN 2*MAX(A, B, C) >= (A+B+C) THEN 'Not A Triangle'
	WHEN A = B AND B = C THEN 'Equilateral'
	WHEN ((A = B AND B != C) OR (A = C AND B != C) OR (C = B AND B != A)) AND 2*MAX(A, B, C) < (A+B+C)) THEN 'Isosceles'
	ELSE 'Scalene' END)
FROM TRIANGLES





-- Revising Aggregations - The Count Function
-- Query a count of the number of cities in CITY having a Population larger than 100,000.

SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000



-- Revising Aggregations - The Sum Function
-- Query the total population of all cities in CITY where District is California
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'


-- Revising Aggregations - Averages
-- Query the average population of all cities in CITY where District is California.
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'



-- Average Population
-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(POPULATION))
FROM CITY




-- Japan Population
-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN
select sum(POPULATION)
from CITY
where COUNTRYCODE = 'JPN'



-- Population Density Difference
-- Query the difference between the maximum and minimum populations in CITY
select max(POPULATION) - min(POPULATION)
from CITY



The Blunder

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

-- Write a query calculating the amount of error (i.e.:actual - miscalculated  average monthly salaries), and round it up to the next integer.

???
select avg(salary)
from EMPLOYEES



-- Top Earners
 -- employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
???
 select max(salary * months), count(salary * months)
 where ((salary * months) = max(salary * months))
 from Employee





-- Weather Observation Station 2
-- Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.
select round(sum(LAT_N), 2), round(sum(LONG_W), 2)
from STATION



-- Weather Observation Station 13
-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  4 decimal places.
select round(sum(LAT_N), 4)
from STATION
where LAT_N < 137.2345 and LAT_N > 38.7880


-- Weather Observation Station 14
-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
select round(max(LAT_N), 4)
from STATION
where LAT_N < 137.2345



-- Weather Observation Station 15
-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places
select round(LONG_W, 4)
from STATION
where LAT_N = 
	(select max(LAT_N)
	from STATION
	where LAT_N < 137.2345)

select cast(Station.long_w as Decimal(10,4)) from (select max(lat_n) as topLat from Station where lat_n < 137.2345) a, Station where a.topLat = Station.lat_n;

SELECT TOP 1 CAST(MAX(LONG_W) AS DECIMAL(28, 4))
FROM Station
GROUP BY Id
HAVING MAX(LAT_N) < 137.2345
ORDER BY MAX(LAT_N) DESC





-- The PADS
???
SELECT Concat(Name, '(', Left(Occupation, 1), ')')
FROM OCCUPATION
ORDER BY Name

-- SELECT Concat(NAME, CASE WHEN Occupation = "Doctor" THEN "(D)" WHEN Occupation = "Professor" THEN "(P)" WHEN Occupation = "Singer" THEN "(S)" WHEN Occupation = "Actor" THEN "(A)" END ) 
-- FROM OCCUPATIONS
-- ORDER BY NAME;

SELECT Concat('There are a total of ', COUNT(Name), ' ', Lower(Occupation), 's.')
FROM OCCUPATION
GROUP BY Occupation
ORDER BY COUNT(Name), Occupation






The Blunder
-- salary
SELECT avg(Salary)
FROM EMPLOYEES

-- miscalculated salary
SELECT avg(CAST(REGEXP_REPLACE(cast(Salary AS CHAR), '0', '') AS SIGNED))
FROM EMPLOYEES


SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;


