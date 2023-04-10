--1
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부';

--2
SELECT EMP_NAME,DEPT_CODE,((SALARY+(SALARY*BONUS))*12) FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부' 
AND ((SALARY+(SALARY*BONUS))*12)=
(SELECT MAX(((SALARY+(SALARY*BONUS))*12))FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부');

--3
SELECT EMP_ID, EMP_NAME,
(SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_ID=E.MANAGER_ID) "M" ,SALARY
FROM EMPLOYEE E
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE) 
AND (SELECT EMP_NAME FROM EMPLOYEE WHERE EMP_ID=E.MANAGER_ID) IS NOT NULL;

SELECT E.EMP_ID, E.EMP_NAME, D.EMP_NAME, E.SALARY FROM EMPLOYEE E
JOIN EMPLOYEE D ON D.EMP_ID=E.MANAGER_ID
WHERE E.SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);

--4
SELECT EMP_NAME,DEPT_CODE,SALARY,SAL_LEVEL FROM EMPLOYEE E
GROUP BY JOB_CODE
--WHERE SALARY>=(SELECT AVG(SALARY)FROM EMPLOYEE);
