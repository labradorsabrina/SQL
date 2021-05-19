--Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
  FROM TDH03812.EMPLOYEES
  WHERE address LIKE '%Elgin,IL%';

--Retrieve all employees who were born during the 1970's.
SELECT *
FROM TDH03812.EMPLOYEES
WHERE b_date like '197%';

--Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
FROM TDH03812.EMPLOYEES
WHERE salary between 60000 AND 70000;

--Retrieve a list of employees ordered by department ID
SELECT *
FROM TDH03812.EMPLOYEES
ORDER BY dep_id;

--Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT *
FROM TDH03812.EMPLOYEES
ORDER BY dep_id desc, l_name desc;

--Use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

--For each department ID retrieve the number of employees in the department.
SELECT dep_id, count(l_name) as Num_Employees
FROM EMPLOYEES
GROUP BY dep_id;

--For each department retrieve the number of employees in the department, and the average employee salary in the department.
SELECT dep_id, count(l_name) as "Num_Employees", avg(salary) as "Avg_Salary"
FROM EMPLOYEES
GROUP BY dep_id;

--Now order the result set by Average Salary.
SELECT dep_id, count(l_name) as Num_Employees, avg(salary) as Avg_Salary
FROM EMPLOYEES
GROUP BY dep_id
ORDER BY Avg_Salary;

--limit the result to departments with fewer than 4 employees
SELECT dep_id, COUNT(*) as Num_Employees, AVG(salary) as Avg_Salary
FROM EMPLOYEES
GROUP BY dep_id
HAVING count(*) < 4
ORDER BY Avg_Salary;