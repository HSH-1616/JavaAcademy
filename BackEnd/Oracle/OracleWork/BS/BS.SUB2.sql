SELECT * FROM DEPARTMENT;

--1
SELECT EMP_NAME, DEPT_TITLE, SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부';

--2
SELECT EMP_NAME, DEPT_TITLE, MAX(SALARY) FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부'
GROUP BY DEPT_CODE