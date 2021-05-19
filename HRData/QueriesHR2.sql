--Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
select * 
from employees 
where salary < AVG(salary);

--Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
select * 
from employees 
where salary < (SELECT AVG(salary) FROM employees);

--Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
from employees; 

--Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;

--Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * 
from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;

--- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * 
from employees 
where JOB_ID IN (select JOB_IDENT from jobs);
	
--- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer	
select *
from employees 
where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

--- Retrieve JOB information and list of employees who earn more than $70,000.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );
	
--- Retrieve JOB information and list of employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );

--- Retrieve JOB information and list of female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );

--- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables
select * 
from employees, jobs;

--- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * 
from employees, jobs 
where employees.JOB_ID = jobs.JOB_IDENT;

--- Redo the previous query, using shorter aliases for table names.
select * 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT;

--- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.-
select EMP_ID,F_NAME,L_NAME, JOB_TITLE 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT;

--- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT;

--- We want to retrieve the Department Name for each Employee
SELECT F_NAME, DEP_NAME 
FROM EMPLOYEES, DEPARTMENTS 
WHERE DEPT_ID_DEP = DEP_ID;
