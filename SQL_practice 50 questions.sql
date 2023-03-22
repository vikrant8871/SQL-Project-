use ORG; 

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATE,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
	VALUES

        (001, 'Monika', 'Arora', 100000, '2020-02-14', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2011-06-14', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2020-02-14', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2020-02-14', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2011-06-14', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2011-06-14', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2021-01-14', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2011-04-14', 'Admin');

select*from Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '2020-02-16'),
		(002, 3000, '2011-06-16'),
		(003, 4000, '2020-02-16'),
		(001, 4500, '2020-02-16'),
		(002, 3500, '2011-06-16');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20'),
 (002, 'Executive', '2016-06-11'),
 (008, 'Executive', '2016-06-11'),
 (005, 'Manager', '2016-06-11'),
 (004, 'Asst. Manager', '2016-06-11'),
 (007, 'Executive', '2016-06-11'),
 (006, 'Lead', '2016-06-11'),
 (003, 'Lead', '2016-06-11');

select*from Worker; 
select*from Bonus;
select*from Title;

--Q.1 Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select FIRST_NAME as WORKER_NAME from Worker;

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select UPPER(FIRST_NAME) as WORKER_NAME  from Worker;

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select DISTINCT(DEPARTMENT) from Worker;

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select substring(FIRST_NAME,1,3) as worker_name from Worker;

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select INSTR(FIRST_NAME,BINARY'A') from Worker where FIRST_NAME='Amitabh';
SELECT*FROM Worker

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

SELECT RTRIM(FIRST_NAME) FROM Worker;

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

SELECT LTRIM(DEPARTMENT) AS DEPA FROM Worker;

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

SELECT DISTINCT(LEN(DEPARTMENT)) FROM Worker ;

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

SELECT REPLACE(FIRST_NAME ,'a','A') FROM Worker;

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME,'',LAST_NAME) AS FULLNAME FROM Worker;

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM Worker ORDER BY FIRST_NAME;

--Q-12. Write an SQL query to print all Worker details from the Worker table order by Worker Ascending and DEPARTMENT Descending.

SELECT * FROM Worker ORDER BY DEPARTMENT DESC;

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul','Satish');

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul','Satish');

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM Worker WHERE DEPARTMENT='Admin';

SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM Worker WHERE FIRST_NAME LIKE '%_____h';

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT * FROM  Worker WHERE SALARY BETWEEN 100000 and 500000;

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

SELECT * FROM  Worker WHERE YEAR(JOINING_DATE)=2020 AND MONTH(JOINING_DATE)=2;

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(WORKER_ID) FROM Worker WHERE DEPARTMENT='Admin';
select count(*) FROM Worker WHERE DEPARTMENT='Admin';

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT FIRST_NAME , SALARY FROM  Worker WHERE SALARY >=50000 AND SALARY<=100000;

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS WORKER_NAME , SALARY FROM  Worker WHERE
WORKER_ID IN (SELECT WORKER_ID FROM Worker WHERE SALARY BETWEEN 50000 AND 100000);

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT COUNT(WORKER_ID) AS NUMBE_OF_WORKER , DEPARTMENT FROM Worker GROUP BY (DEPARTMENT) ORDER BY (NUMBE_OF_WORKER) DESC;

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT * FROM Title;
SELECT * FROM Worker;

SELECT W.FIRST_NAME , T.WORKER_TITLE ,W.WORKER_ID FROM Worker W INNER JOIN  Title T ON W.WORKER_ID=T.WORKER_REF_ID WHERE WORKER_TITLE='Manager'; 

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT COUNT(*) ,WORKER_TITLE,AFFECTED_FROM FROM Title GROUP BY WORKER_TITLE,AFFECTED_FROM HAVING COUNT(*)>1;


--Q-26. Write an SQL query to show only odd rows from a table.

select * from Worker;

select COUNT(WORKER_ID) ,FIRST_NAME,SALARY FROM Worker GROUP BY FIRST_NAME,SALARY HAVING COUNT(WORKER_ID) > 2;

--Q-27. Write an SQL query to show only even rows from a table.

--Q-28. Write an SQL query to clone a new table from another table.

SELECT * INTO WORKERCLONE FROM Worker;
SELECT*FROM WORKERCLONE;

--Q-29. Write an SQL query to fetch intersecting records of two tables.

(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WORKERCLONE);


SELECT * FROM Bonus;

SELECT W.JOINING_DATE,W.FIRST_NAME,W.DEPARTMENT , B.BONUS_DATE,B.BONUS_AMOUNT ,B.WORKER_REF_ID FROM Bonus B INNER JOIN Worker W
ON W.WORKER_ID=B.WORKER_REF_ID;

--Q-30. Write an SQL query to show records from one table that another table does not have.

SELECT * FROM Worker
MINUS
SELECT * FROM Title;

--Q-31. Write an SQL query to show the current date and time.

SELECT GETDATE();

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP 4 * FROM Worker;
SELECT TOP 6 * FROM Title;
SELECT TOP 3 * FROM Bonus;

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker;

SELECT DISTINCT TOP 1 * FROM Worker WHERE SALARY IN (SELECT DISTINCT TOP 5 SALARY FROM Worker ORDER BY SALARY DESC ) ORDER BY SALARY ASC;

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

select * from Worker W1 where 5 =  (select count(distinct(W2.salary)) from Worker W2 where W2.salary>=W1.salary);

--Q-35. Write an SQL query to fetch the list of employees with the same salary.

select * from Worker;

select distinct W.WORKER_ID , W.First_NAME , W.SALARY , W1.DEPARTMENT FROM Worker W ,Worker W1 WHERE W.SALARY=W1.SALARY AND W.WORKER_ID!=W1.WORKER_ID;

--Q-36. Write an SQL query to show the second highest salary from a table.

SELECT * FROM Worker W1 WHERE 2 = (SELECT COUNT(DISTINCT(W2.SALARY)) FROM Worker W2  WHERE W2.SALARY>=W1.SALARY);

Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

--Q-37. Write an SQL query to show one row twice in results from a table.

SELECT W.FIRST_NAME,W.SALARY ,W.DEPARTMENT FROM Worker W WHERE W.DEPARTMENT='HR'
UNION ALL
SELECT W1.FIRST_NAME,W1.SALARY ,W1.DEPARTMENT FROM Worker W1 WHERE W1.DEPARTMENT='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.

SELECT * FROM Worker
INTERSECT
SELECT * FROM WORKERCLONE;

--Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM Worker WHERE WORKER_ID<=(SELECT COUNT(WORKER_ID)/2 FROM Worker);

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.

SELECT COUNT(WORKER_ID) , DEPARTMENT FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID)<5;

--Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT COUNT(WORKER_ID) , DEPARTMENT FROM Worker GROUP BY DEPARTMENT ;

--Q-42. Write an SQL query to show the last record from a table.

SELECT * FROM Worker WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker);

--Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker);

--Q-44. Write an SQL query to fetch the last five records from a table.

SELECT TOP 5* FROM Worker WHERE WORKER_ID IN (SELECT FIRST_NAME ,COUNT(WORKER_ID) FROM Worker GROUP BY FIRST_NAME  ORDER BY WORKER_ID DESC);

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from (SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;


 SELECT W.DEPARTMENT,W.FIRST_NAME,W.SALARY FROM (SELECT DEPARTMENT , MAX(SALARY) AS TOTOAL  FROM Worker GROUP  BY DEPARTMENT) AS SUBQ INNER JOIN 
 Worker W ON SUBQ.DEPARTMENT=W.DEPARTMENT AND SUBQ.TOTOAL =W.SALARY;

create table entries(
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(20));

insert into entries
values
('A','Banglore','A@gamil.com',1,'CPU'),
('A','Banglore','A1@gamil.com',1,'CPU'),
('A','Banglore','A2@gamil.com',2,'DESKTOP'),
('B','Banglore','B@gamil.com',2,'DESKTOP'),
('B','Banglore','B1@gamil.com',2,'DESKTOP'),
('B','Banglore','B2@gamil.com',1,'MONITOR');

SELECT * FROM entries;

SELECT name , count(floor) as total_visits ,  max(floor) as most_visit_floor,max(resources) as R from entries group by name
Intersect
select resources , max(resources) as R from entries group by resources;
