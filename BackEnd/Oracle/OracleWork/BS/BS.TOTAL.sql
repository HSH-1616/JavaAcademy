--1
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='���������';

--2
SELECT EMP_NAME,DEPT_CODE,((SALARY+(SALARY*BONUS))*12) FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='���������' 
AND ((SALARY+(SALARY*BONUS))*12)=
(SELECT MAX(((SALARY+(SALARY*BONUS))*12))FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='���������');

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
SELECT EMP_NAME, DEPT_CODE, SALARY, SAL_LEVEL, JOB_CODE FROM  EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE D WHERE E.JOB_CODE=D.JOB_CODE);

--5
SELECT NVL(DEPT_TITLE,'����'),TO_CHAR(AVG(SALARY),'L999,999,999') FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
GROUP BY DEPT_TITLE
HAVING AVG(SALARY) >2200000;

--6
SELECT*FROM JOB;
SELECT EMP_NAME,JOB_NAME,DEPT_TITLE,(SALARY+(SALARY*NVL(BONUS,0)))*12 ���� FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE SUBSTR(EMP_NO,8,1)=2 
AND (SALARY+(SALARY*NVL(BONUS,0)))*12<(SELECT AVG(SALARY+(SALARY*NVL(BONUS,0)))*12 FROM EMPLOYEE D 
WHERE E.JOB_CODE=D.JOB_CODE);
