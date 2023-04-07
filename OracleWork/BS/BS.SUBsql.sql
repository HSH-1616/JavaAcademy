SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM NATIONAL;
SELECT * FROM LOCATION;

--1
SELECT EMP_NAME,EMP_NO,DEPT_TITLE,JOB_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
JOIN JOB USING (JOB_CODE)
WHERE SUBSTR(EMP_NO,1,2) BETWEEN 70 AND 79 AND SUBSTR(EMP_NO,8,1)=2 AND EMP_NAME LIKE '전__';

--2
SELECT EMP_ID, EMP_NAME, SUBSTR(EXTRACT(YEAR FROM SYSDATE)-SUBSTR(EMP_NO,1,2),3,2)+1 나이,DEPT_TITLE,JOB_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
JOIN JOB USING(JOB_CODE)
WHERE SUBSTR(EXTRACT(YEAR FROM SYSDATE)-SUBSTR(EMP_NO,1,2),3,2)+1=(SELECT MIN(SUBSTR(EXTRACT(YEAR FROM SYSDATE)-SUBSTR(EMP_NO,1,2),3,2)+1) FROM EMPLOYEE);

--3
SELECT EMP_ID, EMP_NAME, JOB_NAME FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE EMP_NAME LIKE '_형%';

--4
SELECT EMP_NAME, JOB_NAME,DEPT_CODE,DEPT_TITLE FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
JOIN JOB USING(JOB_CODE)
WHERE DEPT_CODE IN('D5','D6');

--5
SELECT EMP_NAME, BONUS, DEPT_TITLE, LOCAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
WHERE BONUS IS NOT NULL;

--6
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;

--7
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
JOIN NATIONAL USING(NATIONAL_CODE)
WHERE NATIONAL_NAME IN('한국','일본');

--8
SELECT E.EMP_NAME, E.DEPT_CODE, E2.EMP_NAME FROM EMPLOYEE E
JOIN EMPLOYEE E2 ON E.DEPT_CODE=E2.DEPT_CODE
WHERE E.EMP_NAME != E2.EMP_NAME
ORDER BY 1;

--9
SELECT EMP_NAME, JOB_NAME, SALARY FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE IN('J4','J7');

--10
SELECT * FROM(SELECT EMP_NO,EMP_NAME,DEPT_TITLE,JOB_NAME,HIRE_DATE,
RANK()OVER(ORDER BY AVG(SALARY+SALARY*BONUS)*12 DESC) AS NUM
FROM EMPLOYEE 
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
)
WHERE NUM < 6;

