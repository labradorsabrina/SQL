--function that calculates the total cost of all animal rescues in the PETRESCUE table
SELECT SUM(cost)
FROM PETRESCUE;

--function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST
SELECT SUM(cost) as SUM_OF_COST
FROM PETRESCUE;

--function that displays the maximum quantity of animals rescued
SELECT MAX(quantity)
FROM PETRESCUE;

--function that displays the average cost of animals rescued
SELECT animal, AVG(cost) as AVG_COST
FROM PETRESCUE
GROUP BY animal;

--function that displays the average cost of rescuing a dog
SELECT animal, AVG(cost) as AVG_COST
FROM PETRESCUE
GROUP BY animal
HAVING animal = 'Dog';

--function that displays the rounded cost of each rescue.
SELECT ROUND(cost)
FROM PETRESCUE;

--function that displays the animal name in each rescue in uppercase.
SELECT UPPER(animal)
FROM PETRESCUE;

--function that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT UPPER(animal)
FROM PETRESCUE;

--query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query
SELECT *
FROM PETRESCUE
WHERE animal = 'Cat';

--function that displays the day of the month when cats have been rescued
SELECT animal, DAY(RESCUEDATE) as Day_Rescue
 FROM PETRESCUE;
 
 --function that displays the number of rescues on the 5th month
 SELECT SUM(QUANTITY)
 FROM PETRESCUE
 WHERE MONTH(RESCUEDATE) = 5;
 
--function that displays the number of rescues on the 14th day of the month.
 SELECT SUM(QUANTITY)
 FROM PETRESCUE
 WHERE DAY(RESCUEDATE) = 14;
 
 --Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
 SELECT (RESCUEDATE + 3 DAYS)
 FROM PETRESCUE;
 
 --function that displays the length of time the animals have been rescued; the difference between today’s date and the recue date.
 SELECT CURRENT_DATE - RESCUEDATE
 FROM PETRESCUE;