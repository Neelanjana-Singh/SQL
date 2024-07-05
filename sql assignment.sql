SELECT * FROM organization.employee;

INSERT INTO employee VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO employee VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO employee VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO employee VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO employee VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO employee VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO employee VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO employee VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO employee VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO employee VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO employee VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO employee VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20);
INSERT INTO employee VALUES (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20);
INSERT INTO employee VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


-- 1. Display all employee names in ascending order
SELECT ENAME FROM employee ORDER BY ENAME;

-- 2 Display all employee names, salary, commission of employees in dept 10
SELECT ENAME, SAL, COMM 
FROM employee 
WHERE DEPTNO = 10;

-- 3. Display all employees (all columns) in department 20 and 30
SELECT * FROM employee WHERE DEPTNO IN (20, 30);

-- 4. Display all the employees who are managers
SELECT * FROM employee WHERE JOB = 'MANAGER';

-- 5. Display all the employees whose salary is between 2000 and 5000
SELECT * FROM employee WHERE SAL BETWEEN 2000 AND 5000;

-- 6. Display all the employees whose commission is null
SELECT * FROM employee WHERE COMM IS NULL;

-- 7 Display employee name, salary, commission in descending order based on salary
SELECT ENAME, SAL, COMM 
FROM employee 
ORDER BY SAL DESC;

-- 8. Display emp_name, salary, commission, ctc (calculated column)
SELECT ENAME, SAL, COMM, (SAL + IFNULL(COMM, 0)) AS CTC FROM employee;

-- 9 Display average, max, min and sum of salaries of employees
SELECT AVG(SAL) AS Avg_Salary, 
       MAX(SAL) AS Max_Salary, 
       MIN(SAL) AS Min_Salary, 
       SUM(SAL) AS Total_Salary 
FROM employee;

-- 10. Display hire_date, current_date, tenure (calculated column) of the employees
SELECT  HIREDATE, curdate() AS CURRDATE ,
concat(
TIMESTAMPDIFF(YEAR,HIREDATE,curdate()),'years',
TIMESTAMPDIFF(MONTH,HIREDATE,curdate())%12, 'month'
)as TENURE
from employee;

-- 11. Display all the employees whose name starts with S
SELECT * FROM employee WHERE ENAME LIKE 'S%';

-- 12. Display unique department numbers from the employee table
SELECT DISTINCT DEPTNO FROM employee;

-- 13 Display employee's job in lower case
SELECT ENAME, LOWER(JOB) AS JOB 
FROM employee;

-- 14 Select top 3 salary earning employees (employees can be more than 3)
SELECT * 
FROM employee 
ORDER BY SAL DESC 
LIMIT 3;


-- 15. Select all clerks and managers in department 10
SELECT * FROM employee WHERE JOB IN ('CLERK', 'MANAGER') AND DEPTNO = 10;

-- 16 Display all clerks in ascending order of deptno
SELECT * 
FROM employee 
WHERE JOB = 'CLERK' 
ORDER BY DEPTNO ASC;

-- 17 Display all employees department wise
SELECT DEPTNO, ENAME 
FROM employee
ORDER BY DEPTNO ASC;

-- 18 Display how many employees are there for each job
SELECT JOB, COUNT(*) AS Employee_Count 
FROM employee 
GROUP BY JOB;

-- 19 Display what jobs are there for each department and number of employees for each job
SELECT DEPTNO, JOB, COUNT(*) AS Employee_Count 
FROM employee 
GROUP BY DEPTNO, JOB;

-- 20 Display how many employees are there for each department
SELECT DEPTNO, COUNT(*) AS Employee_Count 
FROM employee 
GROUP BY DEPTNO;

-- 21 Display the rank of each employee with respect to their salary (highest salary will be rank 1)
SELECT ENAME, SAL, 
       RANK() OVER (ORDER BY SAL DESC) AS Salary_Rank 
FROM employee;






