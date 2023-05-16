SELECT * FROM DBA_USERS;
SELECT * FROM TAB;

-- DATABASE����ϱ�
-- 1. ����� ������ ������(SYSTEM) �������� ��������
--     - �����ڷ� �����ؼ� ������ɾ �̿���.
-- 2. ������ ������ DATABASE�� �̿��ϱ� ���ؼ��� ���Ѻο� ����� �Ѵ�.
--    - �����ڷ� �����ؼ� ���� �ο���ɾ �̿�
--    - �ο����� : �����Ҽ��ִ� ����(CONNECT), ����� �� �ִ� ����(RESOURCE)

-- ���������ϴ� ��ɾ�
-- CREATE USER ����ڰ����� IDENTIFIED BY ��й�ȣ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-- 18C�������� ����ڰ����� ##�� �ٿ��� �����ؾ� �Ѵ�.
-- ##�Ⱥ��� �� �ְ� �����ϱ�
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- DB�� ��ϵǾ� �ִ� ����� ��ȸ�ϱ�
SELECT * FROM DBA_USERS;

-- ����ڸ� �����ϴ���� ������ ������ DB�� �̿��� �� ����.
-- ����ڿ��� ���Ѻο��ϱ�
-- GRANT ���� or ��(����) TO ����ڰ�����
GRANT CONNECT TO BS;
-- ���̺��� �̿��� �� �ִ� ������ �ο��ϱ�
GRANT RESOURCE TO BS;

GRANT CONNECT, RESOURCE TO BS;

-- BS�������� SQL�� �����غ���
SELECT * FROM TAB; --�������� �̿��ϰ� �ִ� ���̺��� ��ȸ�ϴ� ��ɾ�
CREATE TABLE TEST(
    TEST VARCHAR2(200)
);

-- USER01/USER01��� ������ �����ϰ� �����ϰ� �Ʒ� ��ɾ� �����ϱ�
--CREATE TABLE USER01(
-- AGE NUMBER
--); 

CREATE USER USER01 IDENTIFIED BY USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT RESOURCE, CONNECT TO USER01;

CREATE TABLE USER01 (
    AGE NUMBER
);

SELECT * FROM TAB;
SELECT * FROM BS.TEST;
SELECT * FROM USER01.USER01;

-- �⺻�ǽ� DB�� ���� �˾ƺ���.
-- ���, �μ�, ��å, �ٹ���, �޿�����, �ٹ����� ����
-- ������̺��� ����Ȯ���ϱ�
SELECT * FROM EMPLOYEE;
-- �μ����̺��� ����Ȯ���ϱ�
SELECT * FROM DEPARTMENT;
-- ��å�� ���� ����Ȯ���ϱ�
SELECT * FROM JOB;
-- �μ��� �ٹ���
SELECT * FROM LOCATION;
-- �ٹ����� ����������
SELECT * FROM NATIONAL;
-- �޿�����
SELECT * FROM SAL_GRADE;

-- SELECT���� Ȱ���ϱ�
-- �⺻����
-- SELECT �÷���,�÷���.... OR *
-- FROM ���̺��;

-- SELECT���� �̿��ؼ� EMPLOYEE���̺� ��ȸ�ϱ�
SELECT EMP_NAME, EMP_NO, EMAIL, PHONE
FROM EMPLOYEE;
-- SELECT���� �̿��ؼ� EMPLOYEE���̺��� ��ü �÷� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE;

-- ��ü ����� �̸�, ����, ���ʽ� �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE;

-- ��� ������ Ȯ���Ҷ��� SELECT���� �̿���.
-- SELECT���� �̿��ؼ� �������ó���ϱ�
-- +,-,*,/(��Ģ����) -> �ǿ����� ���ͷ�, �÷���
SELECT 10+20, 10-20, 20/3, 5*4
FROM DUAL;

-- ���ͷ�, �÷� ����
-- ��ü����� �޿��� 100 ���ϱ�
SELECT EMP_NAME, SALARY+100, SALARY
FROM EMPLOYEE;

-- �÷�, �÷� ����
SELECT EMP_NAME, SALARY+BONUS
FROM EMPLOYEE;
-- NULL���� ������ �Ұ����ϴ� -> ����� ������ NULL�� ��µ�.
SELECT SALARY, BONUS
FROM EMPLOYEE;

-- ��������� �������� �����ϴ�.
-- ����Ŭ���� ���ڿ� ���ͷ��� ''�� ����Ѵ�.
SELECT '���� ���ɸ���'+100
FROM DUAL;

SELECT EMP_NAME, SALARY, BONUS, 10+30
FROM EMPLOYEE;

-- ������̺���  �����, �μ��ڵ�, ����, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY, SALARY*12
FROM EMPLOYEE;
-- ������̺���  �����, �μ��ڵ�, ����, ���ʽ��� ���Ե� ���� ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_CODE, SALARY, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;

-- ���̺� �����ϴ� �÷��� ��ȸ�� �����ϴ�
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE;
--SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;
-- ��ȸ�� �÷��� ��Ī�� �ο��� �� �ִ�. -> �����÷��� ���� ���
-- AS ���� ����Ѵ�.
-- ��) SELECT EMP_NAME AS ����� FROM EMPLOYEE
SELECT EMP_NAME AS �����, SALARY AS ����, EMAIL AS �̸���
FROM EMPLOYEE;
-- AS �� �����ϰ� ����� �ο��� �� �ִ�.
SELECT EMP_NAME �����, SALARY ����, EMAIL �̸���
FROM EMPLOYEE;

-- ��Ī�� ����, Ư����ȣ�� �����ϴ�?
SELECT EMP_NAME AS "�� �� ��", SALARY AS "$��$��"
FROM EMPLOYEE;


-- ��ȸ�Ǵ� �������� �ߺ��� �������ִ� ��ɾ� : DISTINCT
-- �÷��� �տ� ���, SELECT���� �� �տ� �ۼ�
-- SELECT DISTINCT �÷���[,�÷���...] FROM ���̺��
SELECT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-- SELECT EMP_NAME, DISTINCT DEPT_CODE FROM EMEPLOYEE;
SELECT DISTINCT DEPT_CODE, EMP_NAME FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;

-- ����Ŭ���� ���ڿ��� �������ִ� ������ -> ||
SELECT '����'+'���ִ�' 
FROM DUAL;

SELECT '����'||'������ FEAT ����'
FROM DUAL;
-- || ������ �÷��� ���ļ� ����Ҷ��� ����Ѵ�.
SELECT EMP_NAME||EMP_NO||EMAIL AS INFO
FROM EMPLOYEE;
SELECT EMP_NAME||SALARY||BONUS
FROM EMPLOYEE;

SELECT EMP_NAME||'���� ������ '||SALARY||' ���ʽ�'||BONUS
FROM EMPLOYEE;

-- ���ϴ� ROW(DATA)�� ����ϱ�
-- ������ ���ǿ� �´� �����͸� ��������
-- WHERE ���ǽ� �̿��Ѵ�.
-- �����
-- SELECT �÷�, �÷�...... OR *
-- FROM ���̺��
-- WHERE ���ǽ�

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D9';
-- ��� �� ������ 200�����̻��� ����� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE SALARY>=2000000;

-- ��� �� ��å�� J2�� �ƴ� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE != 'J2';

-- �������� �񱳿��� ó���ϱ�
-- ��� �� �μ��� D5�̰� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- ��� �� �μ��� D5�̰ų� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR SALARY>=3000000;

SELECT * 
FROM EMPLOYEE
WHERE 1=2;

-- ��¥�� ��Һ��ϱ�
-- ��¥�� ��Һ��Ҷ��� ���ڷ� ��, ���ڿ� ������ ������.
-- �⺻���� ��¥�� ǥ���ϴ� ���ڿ� ���� : YY/MM/DD -> 'YY/MM/DD'
SELECT HIRE_DATE 
FROM EMPLOYEE;
-- �Ի����� 2000�� 01�� 01�� ������ ����� �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01';

-- �Ի����� 95�� 01�� 01�������� ����� ��ü���� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE < '95/01/01';

-- Ư�� ������ �ִ� ���� ��ȸ�ϱ�
-- ��� �� ���� 200�����̻� 300���� ���� ������ �޴� ����� �����, ����, ���ʽ�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY <=3000000;
-- ����� �Ի����� 00��01��01���� 02��12��31�� ������ ��� ��ü ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE>='00/01/01' AND HIRE_DATE<='02/12/31';

-- ������ ���� ��ȸ�Ҷ� BETWEEN AND ������ �̿��ϱ�
-- �÷��� BETWEEN �� AND �� ;
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '00/01/01' AND '02/12/31' AND DEPT_CODE ='D9';

-- LIKE������ �̿��ϱ�
-- �˻��� ���ڿ� �������� �˻��ϴ� ��� -> �κ���ġ, ���Կ���, ���ϴ� ���ڿ����ϰ˻�
-- ���ڿ� ������ ��Ÿ���� ��ȣ
-- % : ���ڰ� 0���̻� �ƹ����ڳ� ����Ҷ� ���
-- ��)  %��% : �� o, �Ѱ�, �ΰ�, �θ���, �Ѱ��ٸ�, �������� -> ���� ���ԵǾ��ִ� ���ڿ�
--      %�� : ������ ������ ��
--      ��% : ������ �����ϴ� ��
-- _ : ���ڰ� 1�� �ƹ����ڳ� ����Ҷ� ���
-- ��) _��_ : �߰��� ���� �ִ� ������
--    _�� : ������ ������ �α���
--    ��_ : ������ �����ϴ� �α���
--    _��% : �α��� �̻��� �ι�°�ڸ��� ���� �����ϴ� ����
-- �÷��� LIKE '����';

-- ��� �� �������� ���� ����� �̸�, ����, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��__';

-- �̸��� �ּҿ� yo�� �����ϰ� �ִ� ����� �����, �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL 
FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';

-- �̸����ּҿ� j�� �����ϰ� �������� ���� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '��__'; 

-- LIKE�� ��ġ���� �ʴ� ��� ã��
-- NOT����������
-- �达�� �ƴ� ����� ã��
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';

-- �̸����ּҿ� _�ձ��ڰ� 3������ ����� ����� �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___*_%' ESCAPE '*';

-- NULL���� ��ȸ�ϱ�
-- NULL -> ������, �ƹ��ǹ̾��� �� -> ������ �Ұ���
-- ����Ŭ�� �����ϴ� NULL�񱳿����ڸ� ���
-- IS NULL, IS NOT NULL
-- ���ʽ��� ���� �ʴ� �����ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
--WHERE BONUS='(null)';
WHERE BONUS IS NULL;

-- ���ʽ��� �ް��ִ� ����� �̸�, ���ʽ��� ��ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


-- ��ȸ�� �÷����� NULL�϶� ��ü�ϱ�
-- NVL(�÷���,��ü��)�Լ��� �̿�
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE,'����') AS DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;
--CREATE TABLE NAMETEST(
--    NAME2 VARCHAR2(200),
--    AGE NUMBER
--);
--
--INSERT INTO NAMETEST VALUES('������', 19);
--
--SELECT * FROM NAMETEST
--WHERE NAME2 NOT LIKE '%��%' OR NAME2 IS NULL;
--
--DROP TABLE NAMETEST;

-- ���߰� ������ϱ�
-- IN / NOT IN : �������� ���� OR�� �����ؼ� ������Ҷ� ����ϴ� ������
-- ��� �� �μ��ڵ尡 D5,D6,D7,D8��  ������ϱ�
SELECT * 
FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6' OR DEPT_CODE='D7' OR DEPT_CODE='D8';
WHERE DEPT_CODE NOT IN ('D5','D6','D7','D8');

-- ����������
--SELECT EMP_NAME, DEPT_CODE
--FROM EMPLOYEE
--WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���' OR DEPT_TITLE LIKE '%�ؿ�%');

-- ������ �켱����
-- ��å�� J7�̰ų�  J2�� ��� �� �޿��� 200�����̻��� ����� ��ȸ�ϱ�
-- �̸�, ����, ��å�ڵ�
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J2') AND SALARY>=2000000;

--SCOTT/TIGER ������ ���� �� SCOTT_EN ���̺� �߰�

-- 1. ����Ŭ�� ��ġ�Ѵ�. 
-- 2. SQLDEVELOPER���� Ǭ�� -> EXE���� ����
-- 3. SYSTEM���� ���ӻ����ϱ� ->> DBA
-- 4. BS/BS ���� ����, ���� �ο�
-- 5. BS���� �����ϱ� 
-- 6. BS�������� BS.sql ��ũ��Ʈ�����ϱ�
-- 7. BS�������� �۾��ϱ�
-- 8. system�������� ����
-- 9. scott/tiger���� ���� �� ���Ѻο�
-- 10. scott���� ����
-- 11. scott �������� scott_en.sql���� ����

-- ���ó�¥�� ����� �� ���� 
--SYSDATE
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE-10 FROM DUAL;
SELECT SYSDATE-HIRE_DATE
FROM EMPLOYEE;


-- ����Ŭ���� �����ϴ� �Լ��� ���� �˾ƺ���
-- �������Լ� : ���̺��� ��� �࿡ ����� ��ȯ�Ǵ� �Լ�
--              ����, ����, ��¥, ����ȯ, �����Լ�(����Ȱ��)
-- �׷��Լ� : ���̺� �Ѱ��� ����� ��ȯ�Ǵ� �Լ�
--           �հ� ��� ���� �ִ밪 �ּҰ�

-- ������ �Լ� Ȱ���ϱ�
-- ����ϴ� ��ġ
-- SELECT���� �÷��� �ۼ��ϴ� �κ�, WHERE��
-- INSERT, UPDATE, DELETE������ ����� ����

-- ���ڿ��Լ��� ���� �˾ƺ���
-- ���ڿ��� ó���ϴ� ���
-- LENGTH : �������÷��̳�, ���ͷ����� ���� ���̸� ������ִ� �Լ�
-- LENGTH('���ڿ�'||�÷���) -> ���ڿ��� ������ ���
SELECT LENGTH('���� ������ ������!')
FROM DUAL;
SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- �̸����� 16���� �̻��� ����� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

-- LENGTHB : �����ϴ� BYTE�� ���
-- EXPRESS�������� �ѱ��� 3BYTE�� ������. ENTERPRISE���������� 2BYTE
SELECT LENGTHB('ABCD'), LENGTHB('������')
FROM EMPLOYEE;

-- INSTR : JAVA�� INDEXOF�� ������ �����.
-- INSTR('���ڿ�'||�÷�,'ã�� ����'[,������ġ ,ã����°(Ƚ��])
SELECT INSTR('GD��ī����','GD'), INSTR('GD��ī����','��'), INSTR('GD��ī����','��')
FROM DUAL;

SELECT EMAIL, INSTR(EMAIL,'j')
FROM EMPLOYEE;

-- EMAIL�ּҿ� j�� ���ԵǾ��ִ� ���ã��
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE INSTR(EMAIL,'j')>0;

SELECT INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD'),
       INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',3),
       INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',-1),
       INSTR('GD��ī���� GD������ GD���ǻ� GDȭ����','GD',1,3)
FROM DUAL;

-- ������̺��� @�� ��ġ�� ã��
SELECT EMP_NAME, EMAIL, INSTR(EMAIL,'@')
FROM EMPLOYEE;

-- LPAD/RPAD : ���ڿ��� ���̰� ������ ���̸�ŭ ���� �ʾ����� ������� ä���ִ� �Լ�
-- LPAD/RPAD(���ڿ�||�÷�,�ִ����,��ü����)
SELECT LPAD('������',10,'*'),RPAD('������',10,'@'), LPAD('������',10)
FROM DUAL;

SELECT EMAIL, RPAD(EMAIL,20,'#')
FROM EMPLOYEE;

-- LTRIM/RTRIM : ������ �����ϴ� �Լ�, Ư�����ڸ� �����ؼ� ����
-- LTRIM/RTRIM('���ڿ�'||�÷�[,'Ư������'])
SELECT '      ����', LTRIM('      ����'), RTRIM('     ����     '), RTRIM('    ��   ��    ')
FROM DUAL;
-- Ư�����ڸ� �����ؼ� ������ �� �ִ�.
SELECT '����2222', RTRIM('����2222','2'), RTRIM('����22122','2'),
        RTRIM('����22122','12')
FROM DUAL;

-- TRIM : ���ʿ� �ִ� ���� �����ϴ� �Լ�, �⺻ : ����, �����ϸ� �������� ����(�ѱ��ڸ�)
-- TRIM(���ڿ�||�÷�)
-- TRIM(LEADING||TRAILING||BOTH '�����ҹ���' FROM ���ڿ�||�÷���)

SELECT '     ������     ', TRIM('     ������     '),
        'ZZZZZZ��¡��ZZZZZ', TRIM('Z' FROM 'ZZZZZZ��¡��ZZZZZ'),
        TRIM(LEADING 'Z' FROM 'ZZZZZZ��¡��ZZZZZ'),
        TRIM(TRAILING 'Z' FROM 'ZZZZZZ��¡��ZZZZZ'),
        TRIM(BOTH 'Z' FROM 'ZZZZZZ��¡��ZZZZZ')
FROM EMPLOYEE;


-- SUBSTR : ���ڿ��� �߶󳻴±�� * JAVA SUBSTRING�޼ҵ�� ����
-- SUBSTR(���ڿ�||�÷���,�����ε�����ȣ[,����])
SELECT SUBSTR('SHOWMETHEMONEY',5),SUBSTR('SHOWMETHEMONEY',5,2),
        SUBSTR('SHOWMETHEMONEY',INSTR('SHOWMETHEMONEY','MONEY')),
        SUBSTR('SHOWMETHEMONEY',-5,2)
FROM DUAL;

-- ����� �̸��Ͽ��� ���̵𰪸� ����ϱ�
-- ���̵� 7�����̻��� ����� ��ȸ
SELECT EMP_NAME,EMAIL, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)
FROM EMPLOYEE 
--WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;
WHERE EMAIL LIKE '_______@%';
-- ����� ������ ǥ���ϴ� ��ȣ�� ����ϱ�
-- ���ڻ���� ��ȸ
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO,8,1)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN (2,4);

-- �����ڸ� ó���ϴ� �Լ� : UPPPER, LOWER, INITCAP
SELECT UPPER('Welcome to oRACLE worLd'),
    LOWER('Welcome to oRACLE worLd'),
    INITCAP('Welcome to oRACLE worLd')
FROM DUAL;

-- CONCAT : ���ڿ��� �������ִ� �Լ�
-- ||�����ڿ� ����
SELECT EMP_NAME||EMAIL, CONCAT(EMP_NAME, EMAIL)
    ,CONCAT(CONCAT(EMP_NAME, EMAIL),SALARY)
FROM EMPLOYEE;

-- REPLACE : �����(�÷�)���� �������ڸ� ã�Ƽ� Ư�����ڷ� �����ϴ� ��
-- REPLACE(���ڿ�||�÷���,'ã������','��ü����')
SELECT EMAIL, REPLACE(EMAIL,'BS','GD')
FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMAIL=REPLACE(EMAIL,'BS','GD');
--SELECT EMAIL FROM EMPLOYEE;
--ROLLBACK;

-- REVERSE : ���ڿ��� ���ٷ� ������ִ� ���
SELECT EMAIL, REVERSE(EMAIL), EMP_NAME, REVERSE(EMP_NAME),REVERSE(REVERSE(EMP_NAME))
FROM EMPLOYEE;

-- TRANSLATE : ��Ī�Ǵ� ���ڷ� �������ִ� �Լ�
SELECT TRANSLATE('010-3644-6259','0123456789','�����̻�����ĥ�ȱ�')
FROM DUAL;


-- ����ó���Լ�
-- ABS : ���밪�� ó���ϴ� �Լ�
SELECT ABS(-10), ABS(10)
FROM DUAL;

-- MOD :  �������� ���ϴ� �Լ� * �ڹ��� %�����ڿ� ������ �Լ�
SELECT MOD(3,2)
FROM DUAL;

SELECT E.*, MOD(SALARY,3)
FROM EMPLOYEE E;

-- �Ҽ����� ó���ϴ� �Լ�
-- ROUND : �Ҽ����� �ݿø��ϴ� �Լ�
-- ROUND(����||�÷���[,�ڸ���])
SELECT 126.567, ROUND(126.567), ROUND(126.467), ROUND(126.567,2)
FROM DUAL;

--���ʽ��� ������ ���ޱ��ϱ�
SELECT EMP_NAME,SALARY, SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03)
        ,ROUND(SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03))
FROM EMPLOYEE;

-- FLOOR : �Ҽ����ڸ� ����
SELECT 126.567, FLOOR(126.567) --FLOOR(126.567,2)
FROM DUAL;

--TRUNC : �Ҽ����ڸ� ���� �ڸ����� ����
SELECT 126.567, TRUNC(126.567), TRUNC(126.567,2), TRUNC(126.567,-2),
        TRUNC(2123456.32,-2)
FROM DUAL;

-- CEIL : �Ҽ��� �ø�
SELECT 126.567, CEIL(126.567), CEIL(126.111)
FROM EMPLOYEE;

-- ��¥ó���Լ� �̿��ϱ�
-- ����Ŭ���� ��¥�� ����Ҷ��� �ΰ��� ����� ����
-- 1. SYSDATE����� -> ��¥ ��/��/�� ���� ��¥(����Ŭ�� ��ġ�Ǿ��ִ� ��ǻ���� ��¥)�� �������.
-- 2. SYSTIMESTAMP����� -> ��¥+�ð����� �������
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

-- ��¥�� �������ó���� ������, +,- ���� ���� -> �ϼ��� ����, �߰���.
SELECT SYSDATE, SYSDATE-2, SYSDATE+3, SYSDATE+30
FROM DUAL;

-- NEXT_DAY : �Ű������� ���޹��� ���� �� ���� ����� ���� ��¥ ���
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��'), NEXT_DAY(SYSDATE,'������')--, NEXT_DAY(SYSDATE,'MONDAY')
FROM DUAL;
-- LOCALE�� ���� ������ ����
SELECT * FROM V$NLS_PARAMETERS;
ALTER SESSION SET NLS_LANGUAGE='KOREAN';
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MON'), NEXT_DAY(SYSDATE,'TUESDAY')
FROM DUAL;

-- LASY_DAY : �״��� ���������� ���
SELECT SYSDATE, LAST_DAY(SYSDATE), LAST_DAY(SYSDATE+30)
FROM DUAL;

-- ADD_MONTHS : �������� ���ϴ� �Լ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE,10)
FROM DUAL;

-- MONTHS_BETWEEN : �ΰ��� ��¥�� �޾Ƽ� �γ�¥�� �������� ������ִ� �Լ�
SELECT FLOOR(MONTHS_BETWEEN('23/08/17',SYSDATE))
FROM DUAL;

-- ��¥�� �⵵, ��, ���ڸ� ���� ����� �� �ִ� �Լ�
-- EXTRACT(YEAR||MONTH||DAY FROM ��¥) : ���ڷ� �������.
-- ���糯¥�� ��, ��, �� ����ϱ�
SELECT EXTRACT(YEAR FROM SYSDATE) AS ��, EXTRACT(MONTH FROM SYSDATE) AS ��, EXTRACT(DAY FROM SYSDATE) AS ��
FROM DUAL;

-- ��� �� 12���� �Ի��� ������� ���Ͻÿ�
SELECT *
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12;

SELECT EXTRACT(DAY FROM HIRE_DATE)+100
FROM EMPLOYEE;

-- ���úη� ���ֿ�����...... �����... �ٽ� ��������....�Ф� ����񹫱Ⱓ�� 1��6����,
-- �������ڸ� ���ϰ�, ���������� �Դ� «���(�Ϸ缼��)�� ���ϱ�
SELECT ADD_MONTHS(SYSDATE,18) AS ������, (ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS «���
FROM DUAL;

-- ����ȯ �Լ�
-- ����Ŭ������ �ڵ�����ȯ�� �� �۵��� ��.
-- ����Ŭ �����͸� �����ϴ� Ÿ���� ����
-- ���� : CHAR, VARCHAR2, NCHAR, NVARCHAR2 -> JAVA String�� ����
-- ���� : NUMBER
-- ��¥ : DATE, TIMESTAMP

-- TO_CHAR : ����, ��¥�� ���������� �������ִ� �Լ�
-- ��¥�� ���������� �����ϱ�
-- ��¥���� ��ȣ�� ǥ���ؼ� ���������� ������ �Ѵ�.
-- Y : ��, M : ��, D : ��, H : ��, MI : ��, SS : ��
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YY.MM.DD'),TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH24:MI:SS')
FROM EMPLOYEE;

-- ���ڸ� ���������� �����ϱ�
-- ���Ͽ� ���缭 ��ȯ -> �ڸ����� ��� ǥ������ ����
-- 0 : ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ���� ������, ���� ���� �ڸ��� 0�� ǥ���ϴ� ����
-- 9 : ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ���� ������, ���� ���� �ڸ��� �����ϴ� ����
-- ��ȭ�� ǥ���ϰ� �������� L�� ǥ��
SELECT 1234567, TO_CHAR(1234567,'000,000,000'), TO_CHAR(1234567,'999,999,999'),
        TO_CHAR(500,'L999,999')
FROM DUAL;
SELECT 180.5, TO_CHAR(180.5,'000,000.00'), TO_CHAR(180.5,'FM999,999.00') AS Ű
FROM DUAL;


-- ������ ��ȭǥ���ϰ� ,�� �����ؼ� ����ϰ� �Ի����� 0000.00.00���� ����ϱ�
SELECT EMP_NAME, SALARY, TO_CHAR(SALARY,'FML999,999,999') AS �޿�, TO_CHAR(HIRE_DATE,'YYYY.MM.DD') AS �Ի���
FROM EMPLOYEE;

-- ���������� �����ϱ�
-- TO_NUMBER�Լ��� �̿�
-- ���ڸ� ���������� �����ϱ�
SELECT 1000000+1000000,TO_NUMBER('1,000,000','999,999,999')+1000000,
    TO_CHAR(TO_NUMBER('1,000,000','999,999,999')+1000000,'FML999,999,999')
FROM DUAL;

-- ��¥������ �����ϱ�
-- ���ڸ� ��¥�� ����
-- ���ڿ��� ��¥�� ����
SELECT TO_DATE('23/12/25','YY/MM/DD')-SYSDATE, TO_DATE('241225','YYMMDD'),
    TO_DATE('25-12-25','YY-MM-DD')
FROM DUAL;

SELECT TO_DATE(20230405,'YYYYMMDD'), TO_DATE(230505,'YYMMDD'), TO_DATE(TO_CHAR(000224,'000000'),'YYMMDD')
FROM DUAL;


-- NULL���� ó�����ִ� �Լ�
-- NVL�Լ� : NVL(�÷�,��ü��)
-- NVL2�Լ� : NVL2(�÷�, NULL�ƴҶ�, NULL�϶�)
SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE,'����'), NVL2(DEPT_CODE,'����','����')
FROM EMPLOYEE;


-- ���ǿ� ���� ����� ���� �������ִ� �Լ�
-- 1. DECODE
-- DECODE(�÷���||���ڿ�,'����','��ü��','����2','��ü��2',.....)
-- �ֹι�ȣ���� 8��°�ڸ��� ���� 1�̸� ����, 2�̸� ���ڸ� ����ϴ� �����÷��߰��ϱ�
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','����','2','����') AS GENDER
FROM EMPLOYEE
WHERE GENDER='����';

-- �� ��å�ڵ��� ��Ī�� ����ϱ�
-- J1 ��ǥ, J2 �λ���, J3 ����, J4 ����
SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE,'J1','��ǥ','J2','�λ���','J3','����','J4','����','���') AS ��å
FROM EMPLOYEE;
-- 2. CASE WHEN THEN ELSE
-- CASE
--     WHEN ���ǽ� THEN ���೻��
--     WHEN ���ǽ� THEN ���೻��
--     WHEN ���ǽ� THEN ���೻��
--     ELSE ���೻��
-- END

SELECT EMP_NAME, JOB_CODE,
        CASE 
            WHEN JOB_CODE = 'J1' THEN '��ǥ'
            WHEN JOB_CODE = 'J2' THEN '�λ���'
            WHEN JOB_CODE = 'J3' THEN '����'
            WHEN JOB_CODE = 'J4' THEN '����'
--            ELSE '���'
        END AS ��å,
        CASE JOB_CODE
            WHEN 'J1' THEN '��ǥ'
            WHEN 'J2' THEN '�λ���'
        END
FROM EMPLOYEE;
        
--������ �������� ��׿����ڿ� �߰������� �׿ܸ� ������ ����ϱ�
-- ������ 400���� �̻��̸� ���
-- ������ 400�̸� 300�̻��̸� �߰�������
-- �������� �׿ܸ� ����ϴ� �����÷������
-- �̸�, ����, ���

SELECT EMP_NAME, SALARY, 
    CASE 
        WHEN SALARY>=4000000 THEN '���'
        WHEN SALARY>=3000000 THEN '�߰�'
        ELSE '�׿�'
    END AS ���
FROM EMPLOYEE;    

-- ������̺��� ���糪�̸� ���ϱ�
SELECT EMP_NAME, EMP_NO,EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY'))||'��' AS YY��,
    EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))||'��' AS RR��,
    EXTRACT(YEAR FROM SYSDATE)-(
        TO_NUMBER(SUBSTR(EMP_NO,1,2))+
        CASE 
            WHEN SUBSTR(EMP_NO,8,1) IN (1,2) THEN 1900
            WHEN SUBSTR(EMP_NO,8,1) IN (3,4) THEN 2000
        END
    ) AS ��
FROM EMPLOYEE;

-- RR�� �⵵�� ����Ҷ� 
--����⵵       �Է³⵵     ���⵵
--00~49         00~49       ������
--00~49         50~99       ������
--50~99         00~49       ��������
--50~99         50~99       ������
insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('252','�����','320808-4123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');
SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET EMP_NO='320808-1123341' WHERE EMP_ID='252';
COMMIT;

-- �׷��Լ� Ȱ���ϱ�
-- ���̺��� �����Ϳ� ���� �����ϴ� �Լ��� �հ�, ���, ����, �ִ밪, �ּҰ��� ���ϴ� �Լ�
-- �׷��Լ��� ����� �⺻������ �Ѱ��� ���� ������
-- �߰� �÷��� �����ϴ°��� ����
-- ����
-- SUM : ���̺��� Ư���÷��� ���� ���� -> SUM(�÷�(NUMBER))
-- AVG : ���̺��� Ư���÷��� ���� ��� -> AVG(�÷�(NUMBER))
-- COUNT : ���̺��� �����ͼ�(ROW��) -> COUNT(*||�÷�)
-- MIN : ���̺��� Ư���÷��� ���� �ּҰ� -> MIN(�÷���)
-- MAX : ���̺��� Ư���÷��� ���� �ִ밪 -> MAX(�÷���)

-- ����� ������ ���հ踦 ���غ���
SELECT TO_CHAR(SUM(SALARY),'FML999,999,999') FROM EMPLOYEE;

-- D5�μ��� ������ ���հ踦 ���غ���
SELECT SUM(SALARY) 
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--SELECT SUM(EMP_NAME)
--FROM EMPLOYEE;

-- J3����� �޿� �հ踦 ���Ͻÿ�
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE JOB_CODE='J3';

-- ��ձ��ϱ� AVG�Լ�
-- ��ü����� ���� ��ձ��ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE;
-- D5�� �޿� ����� ���ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE 
WHERE DEPT_CODE='D5';

-- D5�μ��� �޿��հ�� ��ձ��ϱ�
SELECT SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE 
WHERE DEPT_CODE='D5';

-- NULL���� ���ؼ��� ��� ó���� �ɱ�? -> NULL���� ������ �����ع���
SELECT SUM(BONUS),AVG(BONUS),AVG(NVL(BONUS,0))
FROM EMPLOYEE;

-- ���̺��� �����ͼ� Ȯ���ϱ�
SELECT COUNT(*),COUNT(DEPT_CODE), COUNT(BONUS)
FROM EMPLOYEE;


-- D6�μ��� �ο� ��ȸ�ϼ���
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';

-- 400���� �̻� ������ �޴� ��� ����?
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY>=4000000;
-- D5�μ����� ���ʽ��� �ް� �ִ� ����� ����?
SELECT COUNT(BONUS) 
FROM EMPLOYEE
WHERE DEPT_CODE='D5'; --AND BONUS IS NOT NULL;

-- �μ��� D6, D5, D7�� ����� ��, �޿�, �հ�, ����� ��ȸ�ϼ���
SELECT COUNT(*) AS �����, SUM(SALARY) AS �޿��հ�, AVG(SALARY) AS �޿����
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D7');

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

-- GROUP BY �� Ȱ���ϱ�
--  �׷��Լ��� ��������� Ư���������� �÷����� ��� ó���ϴ� �� -> ���� �׷캰 �׷��Լ��� ����� ��µ�.
-- SELECT �÷�
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���[,�÷���,�÷���,...]]
-- [ORDERY BY �÷���]

-- �μ��� �޿� �հ踦 ���Ͻÿ�
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- ��å�� �޿��� �հ�, ����� ���Ͻÿ�
SELECT JOB_CODE, SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- �μ��� ����� ���ϱ�
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- GROUP BY ������ �ټ��� �÷��� ���� �� �ִ�.
SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- GROUP BY�� ����� ������ WHERE�� ����� �����ϴ�.
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;

-- �μ��� �ο��� 3���̻��� �μ��� ����ϱ�
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
--WHERE COUNT(*) >=3
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 3;

-- ��å�� �ο����� 3���̻��� ��å ����ϱ�
SELECT JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*)>=3;

-- ��ձ޿��� 300���� �̻��� �μ�����ϱ�
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000 AND COUNT(*)>=4;
-- �Ŵ����� �����ϴ� ����� 2���̻��� �Ŵ������̵� ����ϱ�
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING COUNT(*)>=2;

-- ����, ������ �޿� ����� ���ϰ� �ο����� ���ϱ�
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','��','3','��','2','��','4','��') AS ����, AVG(SALARY), COUNT(*) 
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','��','3','��','2','��','4','��');

-- �� �׷캰 ����� �� ���踦 �ѹ��� ������ִ� �Լ�
-- ROLLUP(), CUBE()
-- GROUP BY ROLLUP(�÷���)
-- GROUP BY CUBE(�÷���)
--�μ��� �޿��հ�� ���հ踦 ��ȸ�ϴ� ����
SELECT SUM(SALARY)
FROM EMPLOYEE;
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE);

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
--GROUP BY ROLLUP(JOB_CODE);
GROUP BY CUBE(JOB_CODE);

-- ROLLUP,CUBE�Լ��� �μ��� �Ѱ��̻��� �÷��� ���� �� �ִ�.
-- ROLLUP : �ΰ��̻��� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ��÷��� �Ұ�, ��ü �Ѱ�
-- CUBE : �ΰ��̻� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ��÷��� �Ұ�, �ι�° �μ��÷��� �Ұ�, ��ü �Ѱ�

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- �μ���, ��å��, �ѻ���� �ѹ��� ��ȸ�ϱ�
SELECT DEPT_CODE, JOB_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- GOURPING�Լ��� �̿��ϸ� ������ ����� ���� �б�ó���� �� �� �ִ�.
-- ROLLUP, CUBE�� ����� ROW�� ���� �б�ó��
-- GROUPING�Լ��� �����ϸ� ROLLUP, CUBE�� ����� ROW 1�� ��ȯ �ƴϸ� 0�� ��ȯ
SELECT DEPT_CODE, JOB_CODE, COUNT(*),
    CASE
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '�μ����ο�'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '��å���ο�'
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=0 THEN '�μ�_��å�ο�'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '���ο�'
    END AS ���
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- ���̺��� ��ȸ�� ������ �����ϱ�
-- ORDER BY ������ �����.
-- SELECT �÷���.....
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���]
-- [HAVING ���ǽ�]
-- [ORDER BY �÷��� [���Ĺ��(DESC(����),ASC(����, DEFAULT)]]

-- �̸��� �������� �����ϱ�
SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME;

SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME DESC;

-- ������ ����������� ����������� �����ϱ�
-- �̸�, �޿�, ���ʽ�
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
ORDER BY SALARY DESC;

--�μ��ڵ带 �������� �������� �����ϰ� ���� ������ ������ ������������ �����ϱ�
SELECT *
FROM EMPLOYEE
ORDER BY DEPT_CODE ASC, SALARY DESC, EMP_NAME ASC;

-- ���������� NULL���� ���� ó��
--BONUS�� ���� �޴� ������� ����ϱ�
SELECT *
FROM EMPLOYEE
--ORDER BY BONUS DESC;--NULL�� ���� ���� ����Ѵ�.
--ORDER BY BONUS ASC;--NULL�� ���� ���߿� ����Ѵ�.
--�ɼ��� �����ؼ� NULL�� �����ġ�� ������ �� �ִ�.
--ORDER BY BONUS DESC NULLS LAST;
ORDER BY BONUS ASC NULLS FIRST;


-- ORDER BY �������� ��Ī�� ����� �� ����
SELECT EMP_NAME, SALARY AS ����, BONUS
FROM EMPLOYEE
--WHERE ���� >300000
ORDER BY ����;

-- SELECT���� �̿��ؼ� �����͸� ��ȸ�ϸ� RESULT SET�� ��µǴµ� 
-- RESULT SET�� ��µǴ� �÷����� �ڵ����� INDEX��ȣ�� 1���� �ο��� ��.
SELECT *
FROM EMPLOYEE
ORDER BY 2;

-- ���տ�����
-- �������� SELECT���� �Ѱ��� ���(RESULT SET)���� ������ִ� ��
-- ù��° SELECT���� �÷�����  ���� SELECT���� �÷����� ���ƾ� �Ѵ�.
-- �� �÷��� ������ Ÿ�Ե� �����ؾ� �Ѵ�.

-- UNION : �ΰ��̻��� SELECT���� ��ġ�� ������
-- SELECT �� UNION SELECT��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

--�� SELECT���� �÷��� ���� �ٸ��� �ȵȴ�.
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
--SELECT EMP_ID, EMP_NAME, SALARY, BONUS
--FROM EMPLOYEE
--WHERE SALARY>3000000;
-- �ΰ��� SELECT���� �÷��� Ÿ�Ե� ������Ѵ�.
SELECT EMP_ID, EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- �ٸ� ���̺� �ִ� �����͸� ��ġ��
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
UNION
SELECT DEPT_ID,DEPT_TITLE, 10
FROM DEPARTMENT;


SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
UNION 
SELECT JOB_CODE, JOB_NAME
FROM JOB
MINUS
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D7');


-- GROUPING SET
-- ���� GROUP BY ���� �ִ� ������ �ϳ��� �ۼ��ϰ� ���ִ� ���
-- �μ�, ��å, �Ŵ����� �޿����
SELECT  DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE, MANAGER_ID;
-- �μ�, ��å�� �޿����
SELECT  DEPT_CODE, JOB_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;
-- �μ�, �Ŵ����� �޿����
SELECT  DEPT_CODE, MANAGER_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,MANAGER_ID;


SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY), 10+20
FROM EMPLOYEE
GROUP BY GROUPING 
        SETS((DEPT_CODE,JOB_CODE,MANAGER_ID),(DEPT_CODE,JOB_CODE),(DEPT_CODE,MANAGER_ID));
        
-- JOIN�� ���� �˾ƺ���
-- �ΰ��̻��� ���̺��� Ư���÷��� �������� �������ִ� ���
-- JOIN�� �� ������ ����
-- 1. INNER JOIN : ���صǴ� ���� ��ġ�ϴ� ROW�� �������� JOIN
-- 2. OUTER JOIN : ���صǴ� ���� ��ġ���� ���� ROW�� �������� JOIN * ������ �ʿ�

-- JOIN�� �ۼ��ϴ� ��� 2����
-- 1. ����Ŭ ���ι�� : , �� WHERE�� �ۼ�
-- 2. ANSI ǥ�� ���ι�� : JOIN, ON||USING ���� ����ؼ� �ۼ�

-- EMPLOYEE���̺�� DEPARTMENT���̺� JOIN�ϱ�
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- ����Ŭ������� JOIN�ϱ�
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;

-- ANSI ǥ������ JOIN�ϱ�
SELECT * 
FROM EMPLOYEE 
    JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;
        
-- ����� ���� �����, �̸���, ��ȭ��ȣ, �μ����� ��ȸ�ϱ�    
SELECT EMP_NAME, EMAIL, PHONE, DEPT_TITLE
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
    
-- JOIN �������� WHERE�� ����ϱ�
-- �μ��� �Ѻι��� ��� �����, ����, ���ʽ�, �μ��� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, DEPT_TITLE
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���';
-- JOIN ������ GROUP BY �� ����ϱ�
-- �μ��� ��ձ޿��� ����ϱ� �μ���, ��ձ޿�
SELECT DEPT_TITLE,AVG(SALARY)
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000;

-- JOIN�Ҷ� �����̵Ǵ� �÷����� �ߺ��ȴٸ� �ݵ�� ��Ī�� �ۼ��ؾ��Ѵ�.
-- �����, �޿�, ���ʽ�, ��å���� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
    JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE E.JOB_CODE='J3';
    
-- �ߺ��Ǵ� �÷������� ������ ���� USING�� �̿��� �� �ִ�.
SELECT *
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE='J3';

SELECT * FROM JOB;    

-- ��å�� ������ ����� �̸�, ��å��, ��å�ڵ�, ������ ��ȸ�ϼ���
SELECT EMP_NAME,JOB_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME='����';

SELECT *
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_CODE IS NULL;
    
-- OUTER JOIN����ϱ�
-- �÷��� ���� ���Ϻ񱳸� ������ ���� ROW�� ������ִ� JOIN
-- ������ �Ǵ� ���̺�(��� �����͸� �����)�� ����������Ѵ�.
-- LEFT OUTER JOIN : JOIN�� �������� ���ʿ� �ִ� ���̺��� �������� ����
-- RIGHT OUTER JOIN : JOIN�� �������� �����ʿ� �ִ� ���̺��� �������� ����
-- ��ġ�Ǵ� ROW�� ���� ��� ��� �÷��� NULL�� ǥ����.
SELECT *
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

SELECT *
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- CROSS JOIN : ��� ROW�� �������ִ� JOIN
SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 1;

-- SELF JOIN : �Ѱ��� ���̺� �ٸ� �÷��� ���� ������ �ִ� �÷��� �ִ� ��� �� �ΰ� �÷��� �̿��ؼ� JOIN
SELECT * FROM EMPLOYEE;
-- �Ŵ����� �ִ� ����� �̸�, �Ŵ��� ���̵�, �Ŵ��� �����ȣ, �Ŵ��� �̸� ��ȸ
SELECT E.EMP_NAME,E.MANAGER_ID,M.EMP_ID,M.EMP_NAME
FROM EMPLOYEE E
    JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;
-- ����̸�, �Ŵ������̵�, �Ŵ��������ȣ, �Ŵ��� �̸� ��ȸ
-- �Ŵ����� ������ ������ ����ϱ�
SELECT E.EMP_NAME,NVL(E.MANAGER_ID,'����'),NVL(M.EMP_ID,'����'),NVL(M.EMP_NAME,'����')
FROM EMPLOYEE E
   RIGHT OUTER JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;
SELECT * FROM EMPLOYEE;

-- �������� ����񱳸� �ؼ� ó����. ON �÷���=�÷���
-- �񵿵����ο� ���� �˾ƺ���
-- ������ ���̺��� �������� �������Ѵ�.
SELECT * FROM SAL_GRADE;
SELECT *
FROM EMPLOYEE 
    JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;
-- ȸ����� ����Ʈ����, ��ǰ���(����), ��� ���� ���� ȸ�����

-- ���������� �� �� �ִ�.
-- �����̻��� ���̺��� �����ؼ� ����ϱ�
-- ����� �����, ��å��, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE
FROM DEPARTMENT
    JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
    JOIN JOB USING(JOB_CODE);
-- ����� �����, �μ���, ��å��, �ٹ�����(LOCALNAME) ��ȸ�ϱ�
-- �μ����� ������ ���, �ٹ������� ������ ���߷��� ����ϱ�
SELECT EMP_NAME,DEPT_TITLE, JOB_NAME, LOCAL_NAME
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;
    
-- �������� : SELECT�� �ȿ� SELECT���� �ϳ� �� �ִ� �������� ����.
-- ���������� �ݵ�� ()�ȿ� �ۼ��� �ؾ��Ѵ�.
-- �����ػ���� ������ �޿��� �ް��ִ� ����� ��ȸ�ϱ�
SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������';
SELECT * 
FROM EMPLOYEE
WHERE SALARY=2000000;

SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������');

-- D5�μ��� ��ձ޿����� ���� �޴� ������ϱ�
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5');

-- 1. �����༭������
-- �������� SELECT���� ����� 1����, 1������ ��
-- �÷�, WHERE���� �񱳴�� ��
-- ������� �޿� ��պ��� ���� �޿��� �޴� ����� �̸�, �޿�, �μ��ڵ带 ����ϱ�
SELECT EMP_NAME, SALARY, DEPT_CODE,(SELECT AVG(SALARY) FROM EMPLOYEE) AS AVG
FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

-- �μ��� �ѹ����� ����� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���');

SELECT * 
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���';

-- ��å�� ������ ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAME='����');


-- 2. ������ ��������
-- ���������� ����� �Ѱ��� �ټ� ��(ROW)�� ���� ��
-- ��å�� ����, ������ ����� ��ȸ�ϱ�
SELECT JOB_CODE 
FROM JOB
WHERE JOB_NAME IN ('����','����');

SELECT *
FROM EMPLOYEE
WHERE JOB_CODE NOT IN (SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('����','����'));

-- �����࿡ ���� ��Һ��ϱ�
-- >=, >, <, <=
SELECT *
FROM EMPLOYEE;
-- WHERE SALARY >=(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));
-- ANY : OR�� ROW�� ����
-- ALL : AND�� ROW�� ����
-- �÷� >(=) ANY(��������) :  ������ ���������� ��� �� �ϳ��� ũ�� �� ->  ������ ���������� ��� �� �ּҰ����� ũ�� ��
-- �÷� <(=) ANY(��������) : ������ ���������� ��� �� �ϳ��� ������ �� -> ������ ���������� ��� �� �ִ밪���� ������ ��

SELECT *
FROM EMPLOYEE
--WHERE SALARY >= ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5','D6'));
WHERE SALARY >=(SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN ('D5','D6'));

-- �÷� >(=) ALL(��������) : ������ ���������� ����� ��� Ŭ�� �� - > ������ ���������� ��� �� �ִ밪���� ũ�� ��
-- �÷� <(=) ALL(��������) : ������ ���������� ����� ��� ������ �� -> ������ ���������� ��� �� �ּҰ����� ������ ��
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));
WHERE SALARY < (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));

-- 2000�� 1��1�� ���� �Ի��� �� 2000�� 1�� 1�� ���� �Ի��� ��� �� ���� ���� �޴� ������� �޿��� ���� �޴� �����
-- �����, �޿�, ��ȸ�ϱ�
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01' 
    -- AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE HIRE_DATE >'00/01/01');
    AND SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE HIRE_DATE>'00/01/01');

-- ���߿� �������� : ���� �ټ�, ���� 1���� ������
-- ������ ������� �����μ�, ���� ���޿� �ش��ϴ� ��� ��ȸ�ϱ�
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2';

SELECT *
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
--    AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
--    AND ENT_YN='N';
WHERE (DEPT_CODE, JOB_CODE) 
    IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
    AND ENT_YN='N';

-- ����������̸鼭 �޿��� 200������ ����� �ִٰ� �Ѵ�.
-- �׻���� �̸�, �μ���, �޿� ����ϱ�
SELECT DEPT_CODE, SALARY 
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='���������' AND SALARY =2000000;  

SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, SALARY 
                                FROM EMPLOYEE 
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='���������' AND SALARY =2000000);

--������ ���߿� ��������
-- ����� �ѹ����̰� 300���� �̻� ������ �޴� ���
SELECT DEPT_CODE, SALARY
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000;

SELECT * 
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, SALARY
                                FROM EMPLOYEE
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000);

-- ������, ��������߿� ���������� �÷����� �����������.
-- WHERE, FROM���� ���(INLINE VIEW)
SELECT (SELECT DEPT_CODE
                                FROM EMPLOYEE
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000) AS TEST
FROM DUAL;

SELECT *
FROM EMPLOYEE CROSS JOIN (SELECT DEPT_CODE
        FROM EMPLOYEE
           JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
             WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000);



SELECT EMP_NAME
FROM EMPLOYEE;


-- ��� ��������
-- ���������� �����Ҷ� ���������� ���� ������ ����ϰ� ����
-- ���������� ���� ���������� ����� ������ �ְ�, ���������� ����� ���������� ����� ������ �ִ� ������
-- ������ ���� �μ��� ������� ��ȸ�� �ϱ�
-- �����, �μ��ڵ�, �����
SELECT EMP_NAME, DEPT_CODE,(SELECT COUNT(*) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS �����
FROM EMPLOYEE E;

-- WHERE�� ����������� �̿��ϱ�
-- EXISTS(��������) : ���������� ����� 1�� �̻��̸� TRUE, 0���̸� FALSE

SELECT *
FROM EMPLOYEE E
--WHERE EXISTS(SELECT DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE='D9');
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- �ּұ޿��� �޴� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
--WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEE);
WHERE NOT EXISTS(SELECT SALARY FROM EMPLOYEE WHERE SALARY>E.SALARY);


-- ��� ����� �����ȣ, �̸�, �Ŵ������̵�, �Ŵ��� �̸� ��ȸ�ϱ�
-- ���������� Ǯ���
SELECT EMP_ID, EMP_NAME,MANAGER_ID,
    (SELECT EMP_NAME FROM EMPLOYEE WHERE E.MANAGER_ID=EMP_ID) AS MANAGER_NAME
FROM EMPLOYEE E;

-- ����� �̸�, �޿�, �μ���, �ҼӺμ��޿���� ��ȸ�ϱ�
SELECT EMP_NAME,SALARY,DEPT_TITLE,
    TO_CHAR(FLOOR((SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.DEPT_CODE=DEPT_CODE)),'FML999,999,999') 
    AS �ҼӺμ����
FROM EMPLOYEE E
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- ������ J1�� �ƴ� ����߿��� �ڽ��� �μ��� ��� �޿����� �޿��� ���� �޴� ��� ��ȸ�ϱ�
SELECT * 
FROM EMPLOYEE E
WHERE JOB_CODE != 'J1' 
    AND SALARY<(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.DEPT_CODE=DEPT_CODE);

-- �ڽ��� ���� ������ ��ձ޿����� ���� �޴� ������ �̸�, ��å��, �޿��� ��ȸ�ϱ�
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
    JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
    WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.JOB_CODE=JOB_CODE);


-- FROM ���� ���������̿��ϱ�
-- INLINE VIEW
-- FROM���� ����ϴ� ���������� ��κ� ��������߿��������� ���
-- RESULT SET�� �ϳ��� ���̺�ó�� ����ϰ� �ϴ� ��
-- �����÷��� �����ϰ� �ְų�, JOIN�� ����� SELECT���� ���
-- VIEW : INLINE VIEW, STORED VIEW

-- EMPLOYEE���̺� ����(��, ��)�� �߰��ؼ� ����ϱ�
SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') AS GENDER
FROM EMPLOYEE E;

--������ ���ڸ� ����ϱ�
SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') AS GENDER
FROM EMPLOYEE E
WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��')='��';

-- INLINE VIEW�̿��ϱ�
SELECT * 
FROM (
    SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') AS GENDER
    FROM EMPLOYEE E
)WHERE GENDER='��';

-- JOIN,���տ����� Ȱ��������
SELECT *
FROM (
    SELECT * 
    FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB USING(JOB_CODE)
) 
WHERE DEPT_TITLE='�ѹ���' AND JOB_NAME='�λ���';

SELECT T.*, T.SALARY*12 AS ����
FROM (SELECT E.*,D.*,
        (SELECT TRUNC(AVG(SALARY),-1) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS DEPT_SAL_AVG
        FROM EMPLOYEE E
        LEFT JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID) T
WHERE DEPT_SAL_AVG>3000000;

SELECT E.*,D.*,
        (SELECT TRUNC(AVG(SALARY),-1) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS DEPT_SAL_AVG
        FROM EMPLOYEE E
        LEFT JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
WHERE DEPT_SAL_VAG>3000000;

-- ���տ������̿��ϱ�
SELECT * 
FROM (SELECT EMP_ID AS CODE, EMP_NAME AS TITLE
    FROM EMPLOYEE
    UNION
    SELECT DEPT_ID, DEPT_TITLE
    FROM DEPARTMENT
    UNION
    SELECT JOB_CODE, JOB_NAME
    FROM JOB
) 
WHERE CODE LIKE '%1%';

--SELECT *
--    FROM (
--        SELECT ROWNUM AS RNUM,E.*
--            FROM (
--                SELECT * FROM EMPLOYEE)E
--                );

-- ROW�� ������ ���ϰ� ����ϱ�
-- TOP-N����ϱ�
SELECT * FROM EMPLOYEE;
-- �޿��� ���� �޴� ��� 1~3������ ����ϱ�
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- 1. ����Ŭ�� �����ϴ� �����÷� ROWNUM�� �̿��ϱ�
SELECT ROWNUM, E.* 
FROM EMPLOYEE E
WHERE ROWNUM BETWEEN 1 AND 3
ORDER BY SALARY DESC;
-- SELECT���� �����Ҷ����� ROWNUM�� ������ ��,
SELECT ROWNUM,T.*
FROM(
    SELECT ROWNUM AS INNERNUM,E.*
    FROM EMPLOYEE E
    ORDER BY SALARY DESC
)T
WHERE ROWNUM<=3;

-- 5~10 ���� ���ϱ�
SELECT * 
FROM(
    SELECT ROWNUM AS RNUM,T.* 
    FROM (SELECT * 
            FROM EMPLOYEE 
            ORDER BY SALARY DESC) T)
WHERE RNUM BETWEEN 5 AND 10;        

-- 2. RANK OVER()�Լ� �̿��ϱ�
SELECT *
 FROM (
        SELECT EMP_NAME, SALARY, 
            RANK() OVER(ORDER BY SALARY DESC) AS NUM,
            DENSE_RANK() OVER(ORDER BY SALARY DESC) AS NUM2
        FROM EMPLOYEE
    )
WHERE NUM BETWEEN 5 AND 10;


-- ��ձ޿��� ���� �޴� �μ� 3�� ����ϱ� 
SELECT *
FROM(
    SELECT ROWNUM AS RNUM, RANK() OVER(ORDER BY SAL_AVG DESC) AS SAL_ORDER, D.*
    FROM (
        SELECT DEPT_TITLE, AVG(SALARY) AS SAL_AVG
        FROM DEPARTMENT
            JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
            GROUP BY DEPT_TITLE
        ORDER BY SAL_AVG DESC
    ) D
)
WHERE SAL_ORDER <= 3;
    
WITH TOPN_SAL AS(SELECT EMP_NAME, SALARY FROM EMPLOYEE
                ORDER BY SALARY DESC)
SELECT ROWNUM AS RNUM, EMP_NAME, SALARY
FROM TOPN_SAL;

-- DDL�� ���� �˾ƺ���
-- ������ ���Ǿ��� ����Ŭ���� ����ϴ� ��ü�� ����, ����, �����ϴ� ��ɾ�
-- ���� : CREATE ������Ʈ�� ....
-- ���� : ALTER ������Ʈ�� .....
-- ���� : DROP ������Ʈ�� ....

-- ���̺��� �����ϴ� ������� �˾ƺ���...
-- ���̺���� : �����͸� ������ �� �ִ� ������ �����ϴ� ��
-- ���̺��� �����ϱ� ���ؼ��� ��������� Ȯ���ϴµ� Ȯ���Ҷ� TYPE�� �ʿ�
-- ����Ŭ�� �����ϴ� Ÿ���� ���־��� Ÿ�Կ� ���� �˾ƺ���.
-- ������Ÿ�� : CHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB
-- ������Ÿ�� : NUMBER
-- ��¥��Ÿ�� : DATA, TIMESTAMP

-- ������Ÿ�Կ� ���� �˾ƺ���
-- CHAR(����) : ������ ���ڿ� ����Ÿ������ ���̸�ŭ ������ Ȯ���ϰ� �����Ѵ�. * �ִ� 2000����Ʈ���尡��
-- VARCHAR2(����) : ������ ���ڿ� ����Ÿ������ ����Ǵ� �����͸�ŭ ����Ȯ���ϰ� �����Ѵ�. * �ִ� 4000����Ʈ���尡��
CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6),
    C NCHAR(6),
    D NVARCHAR2(6)
);

SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('����','����','����','����');
INSERT INTO TBL_STR VALUES('����','����','����','�����ٶ󸶹ٻ�');
INSERT INTO TBL_STR VALUES(1234,'����','����','�����ٶ󸶹�');
SELECT LENGTH(A),LENGTH(B),LENGTH(C),LENGTH(D)
FROM TBL_STR;


-- ������ �ڷ���
-- NUMBER : �Ǽ�, ���� ��� ������ ������.
-- ������
-- NUMBER : �⺻��
-- NUMBER(PRECISION, SCALE) : ������ ��������
--   PRECISION : ǥ���� �� �ִ� ��ü �ڸ���(1~38)
--   SCALE : �Ҽ��������� �ڸ���(-84 ~ 127)
CREATE TABLE TBL_NUM(
    A NUMBER,
    B NUMBER(5),
    C NUMBER(5,1),
    D NUMBER(5,-2)
);
SELECT * FROM TBL_NUM;
INSERT INTO TBL_NUM VALUES(1234.567,1234.567,1234.567,1234.567);
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,0,0);
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,1234.123,0);
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,1234.123,1234567);
INSERT INTO TBL_NUM VALUES('1234.567','1234.567','1234.567','1234.567');
INSERT INTO TBL_NUM VALUES('1234.����','1234.567','1234.567','1234.567');
-- ��¥
-- DATE, TIMESTAMP
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    TODAY TIMESTAMP
);

SELECT * FROM TBL_DATE;
INSERT INTO TBL_DATE VALUES('98/08/03','98/01/26 15:30:30');
INSERT INTO TBL_DATE VALUES(TO_DATE('98/08/03','RR/MM/DD'),
        TO_TIMESTAMP('98/01/26 15:30:30','RR/MM/DD HH24:MI:SS'));
        
CREATE TABLE TBL_STR2(
    TESTSTR CLOB,
    TESTVARCHAR VARCHAR2(4000),
    TESTVARCHAR2 CHAR(4000)
);
DROP TABLE TBL_STR2;
SELECT * FROM TBL_STR2;
INSERT INTO TBL_STR2 VALUES('ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3',
'ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3
ALDKFJEWOIAJFSDKLJFAEIFJ1231RKDJASV./12ADOIKJVA13/3');

-- �⺻���̺� �ۼ��ϱ�
-- CREATE TABLE ���̺�� ��)BOARD_COMMENT ( �÷��� �ڷ���(����), �÷���2 �ڷ���....);
-- ȸ���� �����ϴ� ���̺� �����
-- �̸� : ����, ȸ����ȣ:����||����, ���̵�:����, �н�����:����, �̸���:����, ����:����, �����:��¥
CREATE TABLE MEMBER(
    MEMBER_NAME VARCHAR2(20),
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(15),
    MEMBER_PWD VARCHAR2(20),
    EMAIL VARCHAR2(30),
    AGE NUMBER,
    ENROLL_DATE DATE
);
SELECT * FROM MEMBER;
-- ������ ���̺��� �÷��� ����(COMMENT)�ۼ��ϱ�
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ���̸� �ּ�2�����̻� ����';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵� �ּ� 4�����̻�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ �ּ� 8�����̻�';

SELECT * 
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='MEMBER';

-- ���̺� Ŀ��Ʈ �ۼ��ϱ�
COMMENT ON TABLE MEMBER IS 'ȸ����������';
SELECT *
FROM USER_TAB_COMMENTS;

-- ���̺��� �� �÷��� ����Ǵ� �������� Ư���� ���� ���������� ������ �� �ִ�.
-- ����Ŭ�� �����ϴ� ��������
-- NOT NULL(C) : ������ �÷��� NULL���� ������� �ʴ� �� * DEFAULT���� NULLABLE
-- UNIQUE(U) : ������ �÷��� �ߺ����� ������� �ʴ� ��
-- PRIMARY KEY(P)/PK : ������(ROW) �����ϴ� �÷��� �����ϴ� �������� -> NOT NULL, UNIQUE�������� ����
                --      �Ϲ������� �Ѱ����̺� �Ѱ� PK�� ����
--                      �ټ��÷��� ������ ���� �ִ�(����Ű)
-- FOREGIN KEY(R) : ������ �÷��� ���� �ٸ� ���̺��� ������ �÷��� �ִ� ���� �����ϰ� �ϴ� �������� 
--                  �ٸ����̺� ������ �÷��� �ߺ��� ������ �ȵ�!(UNIQUE���������̳� PK���������� ������ �÷�)
-- CHECK(C) : ������ �÷��� ������ ���� �����ϱ� ���� �������� * ���, ������ ����

-- ���̺� ������ ���������� Ȯ���ϴ� ��ɾ�
SELECT * 
FROM USER_CONSTRAINTS;
SELECT *
FROM USER_CONS_COLUMNS;

SELECT C.CONSTRAINT_NAME,CONSTRAINT_TYPE, C.TABLE_NAME, SEARCH_CONDITION,COLUMN_NAME
FROM USER_CONSTRAINTS C
    JOIN USER_CONS_COLUMNS CC ON C.CONSTRAINT_NAME=CC.CONSTRAINT_NAME;


-- ���̺� �������� �����ϱ�
-- �������� �����ϴ� ��� 2����
-- 1. ���̺� ������ ���ÿ� �����ϱ�
--    1) �÷��������� ����
--        ��) CREATE TABLE ���̺��( �÷��� �ڷ��� ��������, �÷���2 �ڷ��� ��������,....)
--    2) ���̺������� ����
--        ��) CREATE TABLE ���̺��( �÷��� �ڷ���, �÷���2 �ڷ���, �������Ǽ���....)
-- 2. ������ ���̺� �������� �߰��ϱ� -> ALTER��ɾ��̿�

-- NOT NULL �������Ǽ����ϱ�
-- �÷����������� ������ ����
CREATE TABLE BASIC_MEMBER(
  MEMBER_NO NUMBER,
  MEMBER_ID VARCHAR2(20),
  MEMBER_PWD VARCHAR2(20),
  MEMBER_NAME VARCHAR2(10),
  MEMBER_AGE NUMBER
);
-- ���������� �������������� ��� �÷����� NULL���� ����Ѵ�
INSERT INTO BASIC_MEMBER VALUES(NULL,NULL,NULL,NULL,NULL);
SELECT * FROM BASIC_MEMBER;
-- ID, PASSWORD�� NULL�� ����ϸ� �ȵǴ� �÷�
CREATE TABLE NN_MEMBER(
    MEMBER_NO NUMBER,
  MEMBER_ID VARCHAR2(20) NOT NULL,
  MEMBER_PWD VARCHAR2(20) NOT NULL,
  MEMBER_NAME VARCHAR2(10),
  MEMBER_AGE NUMBER
);
SELECT * FROM NN_MEMBER;
INSERT INTO NN_MEMBER VALUES(NULL,'ADMIN','1234',NULL,NULL);

CREATE TABLE NN_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
--  NOT NULL(MEMBER_NO) ���̺������� ���� �Ұ����ϴ�.
);

-- UNIQUE��������
-- �÷��� �����Ѱ��� �����ؾ��Ҷ� ���
SELECT * FROM BASIC_MEMBER;
INSERT INTO BASIC_MEMBER VALUES(1,'ADMIN','1234','������',48);
INSERT INTO BASIC_MEMBER VALUES(2,'ADMIN','3333','����1',31);

CREATE TABLE NQ_MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
SELECT * FROM NQ_MEMBER;
INSERT INTO NQ_MEMBER VALUES('1','ADMIN','1234','������',44);
INSERT INTO NQ_MEMBER VALUES(2,'ADMIN','1234','����1',33);

-- NULL���� ���� ó���� ���???
INSERT INTO NQ_MEMBER VALUES(3,NULL,'1234','����2',22);
SELECT * FROM NQ_MEMBER;
INSERT INTO NQ_MEMBER VALUES(4,NULL,'4444','����3',11);
-- NULL���� ������� �������� ���������� �߰��ϸ�ȴ�.
CREATE TABLE NQ_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
SELECT * FROM NQ_MEMBER2;
INSERT INTO NQ_MEMBER2 VALUES(1,NULL,'1234','������',44);
INSERT INTO NQ_MEMBER2 VALUES(1,'ADMIN','1234','������',44);
INSERT INTO NQ_MEMBER2 VALUES(2,'ADMIN','2222','����2',22);

-- UNIQUE���������� ���̺��������� ������ ����
CREATE TABLE NQ_MEMBER3(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID)-- �ټ��� �÷��� UNIQUE���������� �����Ҷ� ���
);
INSERT INTO NQ_MEMBER3 VALUES(1,'ADMIN','1234','������',45);
INSERT INTO NQ_MEMBER3 VALUES(2,'ADMIN','2222','������',45);

-- �ټ��÷��� UNIQUE�������� �����ϱ�
-- �ټ��÷��� ���� ��ġ�ؾ� �ߺ������� �ν� -> �����÷��� �ϳ��� �׷����� ����
CREATE TABLE NQ_MEMBER4(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID,MEMBER_NAME)
);
INSERT INTO NQ_MEMBER4 VALUES(1,'ADMIN','1234','������',44);
SELECT * FROM NQ_MEMBER4;
INSERT INTO NQ_MEMBER4 VALUES(2,'ADMIN','3333','����1',33);
INSERT INTO NQ_MEMBER4 VALUES(4,'ADMIN','4444','������',24);

-- PRIMARY KEY �����ϱ�
-- ������ ���̺��� �÷� �� �������� �ߺ����� ����, NULL���� ������� ������ �� �÷��� ����
-- PK�� �÷��� �����ؼ� Ȱ�� -> IDX, STUDETNO, PRODUCTNO, BOARDNO
-- ����Ǵ� ������ �� �ϳ��� ���� ����
-- PK�� �����ϸ� �ڵ����� UNIQUE, NOT NULL��������, INDEX�� �ο���.
CREATE TABLE PK_MEMBER(
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
INSERT INTO PK_MEMBER VALUES(NULL,'ADMIN','1234','������',44);
INSERT INTO PK_MEMBER VALUES(1,'ADMIN','1234','������',44);
INSERT INTO PK_MEMBER VALUES(1,'USER01','2222','����1',22);
SELECT * FROM PK_MEMBER;

SELECT * FROM PK_MEMBER WHERE MEMBER_NO=1;

-- PK ���̺������� ������ ����
CREATE TABLE PK_MEMBER1(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    PRIMARY KEY(MEMBER_NO)
);
INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','������',44);
INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','������',44);
-- PRIMARY KEY�� �ټ��÷��� ������ �� �ִ�. -> ����Ű
-- ���̺� �������� ����
CREATE TABLE PK_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    PRIMARY KEY(MEMBER_NO, MEMBER_ID)
);
DROP TABLE PK_MEMBER2;
INSERT INTO PK_MEMBER2 VALUES(1,'USER01','1111','����1',33);
INSERT INTO PK_MEMBER2 VALUES(2,'USER01','2222','����2',22);
INSERT INTO PK_MEMBER2 VALUES(1,'USER02','2222','����2',22);
INSERT INTO PK_MEMBER2 VALUES(NULL,'USER02','3333','����3',33);
INSERT INTO PK_MEMBER2 VALUES(3,NULL,'3333','����3',33);
SELECT * FROM PK_MEMBER2;

-- �������̺�, ��ٱ��� ���̺� � ����Ű�� ������ �� �ִ�.
CREATE TABLE CART(
    MEMBER_ID VARCHAR2(20),
    PRODUCT_NO NUMBER,
    BUY_DATE DATE,
    STOCK NUMBER,
    PRIMARY KEY(MEMBER_ID,PRODUCT_NO, BUY_DATE)
);

-- FOREIGN KEY �������� �����ϱ�
-- �ٸ����̺� �ִ� �����͸� ������ ����ϴ°�(����)
-- �������踦 �����ϸ� �θ�(�����Ǵ����̺�)-�ڽ�(�����ϴ����̺�)���谡 ������ ��.
-- FK���������� �ڽ����̺� ����
-- FK���������� �����ϴ� �÷��� UNIQUE���������̳� PK���������� �����Ǿ��־�� �Ѵ�.
CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200),
    BOARD_CONTENT VARCHAR2(3000),
    BOARD_WRITER VARCHAR2(10) NOT NULL,
    BOARD_DATE DATE
);

CREATE TABLE BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO)
);

INSERT INTO BOARD VALUES(1, '�ù�',NULL,'������',SYSDATE);
SELECT * FROM BOARD;
INSERT INTO BOARD VALUES(2, '���̾�...','�ʹ��ϼ���!!!','���α�',SYSDATE);
INSERT INTO BOARD VALUES(3, '������ ���� �ݿ���','�ݿ����ε� �����ҽð�.....����','���ֿ�',SYSDATE);

INSERT INTO BOARD_COMMENT VALUES(1,'�� �����!!!','������',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(2,'�� �׷��ǵ��� �������','�ּ�',SYSDATE,2);

INSERT INTO BOARD_COMMENT VALUES(3,'�� �׷��ǵ��� �������','�ּ�',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(4,'ȣȣȣ �ݿ��� ��ܿ�!','������',SYSDATE,3);

SELECT * 
FROM BOARD
    JOIN BOARD_COMMENT ON BOARD_NO=BOARD_REF;
    
-- FK�� ������ �÷��� NULL??? ����ȴ�. �������� ��������
-- NOT NULL���������� �����ؾ��Ѵ�.
INSERT INTO BOARD_COMMENT VALUES(5,'NULL����?','�ּ�',SYSDATE,NULL);
SELECT * FROM BOARD_COMMENT;

-- FK�� �����ؼ� ���̺� ���谡 ������ �Ǹ� �����ǰ�� �ִ� �θ����̺���
-- ROW�� �Ժη� ������ �� ����.
DELETE FROM BOARD WHERE BOARD_NO=2;

SELECT * FROM BOARD;

-- FK�����Ҷ� ������ ���� �ɼ��� ������ �� �ִ�.
-- ON DELETE SET NULL : �����÷��� NULL������ ���� * �����÷��� NOT NULL���������� ������ �ȵȴ�.
-- ON DELETE CASCADE : �����Ǵ� �θ����Ͱ� �����Ǹ� ���� ��������


CREATE TABLE BOARD_COMMENT2(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    --BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE SET NULL
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);

INSERT INTO BOARD VALUES(1,'�ù�',NULL,'������',SYSDATE);
INSERT INTO BOARD_COMMENT2 VALUES(6,'SET NULL','������',SYSDATE,1);
SELECT * FROM BOARD_COMMENT2;
DELETE FROM BOARD WHERE BOARD_NO=1;
DROP TABLE BOARD_COMMENT2;

-- �������踦 �����Ҷ� ����̵Ǵ� �÷����� �ݵ�� UNIQUE, PK���������� �����Ǿ��־���Ѵ�.
CREATE TABLE FK_TEST(
    FK_NO NUMBER,
    PARENT_NAME VARCHAR2(20), --REFERENCES BASIC_MEMBER(MEMBER_ID)
    FOREIGN KEY(PARENT_NAME) REFERENCES NQ_MEMBER2(MEMBER_ID)
);
-- FK�� �Ѱ��� ���̺� ���� �ټ� �÷��� ������ �� ����
-- FK�����ϴ� �÷��� �����ϴ� �÷��� Ÿ��, ����(��Ŀ�� �������)�� ��ġ�ؾ��Ѵ�.

-- CHECK��������
-- �÷��� ������ ���� ������ �� �ְ� �ϴ� ��������
-- �÷��������� ����
CREATE TABLE PERSON(
    NAME VARCHAR2(20),
    AGE NUMBER CHECK(AGE > 0) NOT NULL,
    GENDER VARCHAR2(5) CHECK(GENDER IN('��','��'))
);
INSERT INTO PERSON VALUES('������',19,'��');
INSERT INTO PERSON VALUES('������',19,'��');

-- ���̺� ������ DEFAULT���� ������ �� ����
-- DEFAULT����� ���
CREATE TABLE DEFAULT_TEST(
    TEST_NO NUMBER PRIMARY KEY,
    TEST_DATE DATE DEFAULT SYSDATE,
    TEST_DATA VARCHAR2(20) DEFAULT '�⺻��'
);
INSERT INTO DEFAULT_TEST VALUES(1,DEFAULT,DEFAULT);
INSERT INTO DEFAULT_TEST VALUES(2,'23/02/04','������');
INSERT INTO DEFAULT_TEST(TEST_NO) VALUES(3);
SELECT * FROM DEFAULT_TEST;

-- ���༳���� �̸������ϱ�
-- �⺻������� ���������� �����ϸ� SYS00000���� �ڵ����� ������,
CREATE TABLE MEMBER_TEST(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_ID_UQ UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_PWD_NN NOT NULL,
    CONSTRAINT COMPOSE_UQ UNIQUE(MEMBER_NO,MEMBER_ID)
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='MEMBER_TEST';

-- ���̺��� �����Ҷ� SELECT���� �̿��� �� �ִ�.
-- ���̺� ���� ����
CREATE TABLE EMP_COPY
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP_COPY;
DESC EMP_COPY;

CREATE TABLE EMP_SAL
AS SELECT E.*,D.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS SAL_DEPT_AVG
FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_ID=DEPT_CODE;
SELECT * FROM EMP_SAL;

CREATE TABLE EMP_SAL2
AS SELECT E.*,D.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS SAL_DEPT_AVG
    FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_ID=DEPT_CODE WHERE 1=2;
SELECT * FROM EMP_SAL2;
DESC EMP_SAL2;

--TEST_MEMBER ���̺�
--MEMBER_CODE(NUMBER) - �⺻Ű						-- ȸ�������ڵ� 
--MEMBER_ID (varchar2(20) ) - �ߺ�����, NULL�� ������	-- ȸ�� ���̵�
--MEMBER_PWD (char(20)) - NULL �� ������					-- ȸ�� ��й�ȣ
--MEMBER_NAME(nchar(10)) - �⺻�� '�ƹ���'				-- ȸ�� �̸�
--MEMBER_ADDR (char(50)) - NULL�� ������					-- ȸ�� ������
--GENDER (varchar2(5)) - '��' Ȥ�� '��'�θ� �Է� ����				-- ����
--PHONE(varchar2(20)) - NULL �� ������ 					-- ȸ�� ����ó
--HEIGHT(NUMBER(5,2) - 130�̻��� ���� �Է°���           -- ȸ��Ű

CREATE TABLE TEST_MEMBER(
    MEMBER_CODE NUMBER CONSTRAINT PK_MEMBER_CODE PRIMARY KEY,
    MEMBER_ID varchar2(20) UNIQUE NOT NULL,
    MEMBER_PWD char(20) NOT NULL,
    MEMBER_NAME nchar(10) DEFAULT '�ƹ���',
    MEMBER_ADDR char(50) NOT NULL,
    GENDER varchar2(5) CHECK( GENDER  IN ('��','��')),				
    PHONE varchar2(20) NOT NULL,					
    HEIGHT NUMBER(5,2) CHECK( HEIGHT>=130)
);
COMMENT ON COLUMN TEST_MEMBER.MEMBER_CODE IS 'ȸ�������ڵ�';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_ID IS 'ȸ�� ���̵�';
-- ȸ�� ��й�ȣ
-- ȸ�� �̸�
-- ȸ�� ������
-- ����
-- ȸ�� ����ó
-- ȸ��Ű

-- DML������ ���� �˾ƺ���
-- ���̺� ����Ǵ� �����͸� �ٷ�� ��ɾ�
-- INSERT : ���̺� ������(ROW)�߰��ϴ� ��ɾ�
-- UPDATE : ���̺� �ִ� �������� Ư���÷��� �����ϴ� ��ɾ�
-- DELETE : ���̺� �ִ� Ư��ROW�� �����ϴ� ��ɾ�

-- INSERT�� Ȱ���ϱ�
-- 1. ��ü�÷��� ���� �����ϱ�
-- INSERT INTO ���̺�� VALUES(�÷��� ������ ��,�÷��� ������ ��,�÷��� ������ ��...)
--  * ���̺� ����� �÷����� �����ؾ��Ѵ�.
-- 2. Ư���÷��� ��� ���� �����ϱ�
-- INSERT INTO ���̺��(Ư���÷�,Ư���÷�...) VALUES(Ư���÷��� �����Ұ�,Ư���÷��� �����Ұ�,....)
--  * ������ �÷��� ���� VALUES�� �ִ� ���� ���ƾ���.
--  * �������� ���� �÷��� ���� NULL���Ե�. ����! ������ �÷��� NOT NULL���������� ������ �ȵȴ�.

CREATE TABLE TEMP_DEPT
AS SELECT * FROM DEPARTMENT WHERE 1=0;
SELECT * FROM TEMP_DEPT;

INSERT INTO TEMP_DEPT VALUES('D0','�ڹ�','L1');

INSERT INTO TEMP_DEPT VALUES('D1','����Ŭ',TO_NUMBER('10'));

--�÷��� �����ؼ� ���� �����ϱ�
DESC TEMP_DEPT;
INSERT INTO TEMP_DEPT(DEPT_ID,LOCATION_ID) VALUES('D2','L3');
SELECT * FROM TEMP_DEPT;
INSERT INTO TEMP_DEPT(DEPT_ID) VALUES('D3');
CREATE TABLE TESTINSERT(
    TESTNO NUMBER PRIMARY KEY,
    TESTCONTENT VARCHAR2(200) DEFAULT 'TEST' NOT NULL 
);
INSERT INTO TESTINSERT(TESTNO) VALUES(1);

INSERT INTO TESTINSERT VALUES(2,'12314');


-- SELECT���� �̿��ؼ� �� �����ϱ�
CREATE TABLE INSERT_SUB
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID WHERE 1=2;

SELECT * FROM INSERT_SUB;
INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE SALARY>=3000000
);
SELECT * FROM INSERT_SUB;
-- EMPLOYEE���̺��� �μ��� D6�� ������� INSERT_SUB�� �����ϱ�
INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE DEPT_CODE='D6');
SELECT * FROM INSERT_SUB;

-- ������ �÷��� SELECT������ ������ �����ϱ�
INSERT INTO INSERT_SUB(EMP_ID,EMP_NAME)(SELECT EMP_ID,EMP_NAME FROM EMPLOYEE);

-- INSERT ALL
-- SELECT���� �̿��ؼ� �ΰ� �̻��� ���̺� ���� ������ ���
CREATE TABLE EMP_HIRE_DATE
AS SELECT EMP_ID, EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID,EMP_NAME,MANAGER_ID FROM EMPLOYEE WHERE 1=0;

INSERT ALL
INTO EMP_HIRE_DATE VALUES(EMP_ID, EMP_NAME, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME,MANAGER_ID)
SELECT EMP_ID, EMP_NAME, HIRE_DATE,MANAGER_ID
FROM EMPLOYEE;

SELECT * FROM EMP_HIRE_DATE;
SELECT * FROM EMP_MANAGER;

-- INSERT ALL �� ���Ǹ��缭 �����Ű��
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

-- EMPLOYEE���̺��� 00�� ���� �Ի��ڴ� EMP_OLD�� ����, ���� �Ի��ڴ� EMP_NEW�� �����ϱ�
INSERT ALL
    WHEN HIRE_DATE<'00/01/01' THEN INTO EMP_OLD VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    WHEN HIRE_DATE>='00/01/01' THEN INTO EMP_NEW VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
SELECT EMP_ID,EMP_NAME,HIRE_DATE
FROM EMPLOYEE;

-- UPDATE�� ������ �����Ͽ�... ��...��....��???? FALSE
-- UPDATE�� Ȱ���ϱ�
-- UPDATE ���̺�� SET �������÷���=�����Ұ�,�������÷���=�����Ұ�...[WHERE ����]
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY, BONUS
FROM EMPLOYEE;
SELECT * FROM EMP_SALARY;
-- �������� �޿��� 300�������� �����ϱ�
UPDATE EMP_SALARY SET SALARY=3000000 WHERE EMP_NAME='������';
-- �ټ��÷����� ������ ���� , �����ؼ� �����Ѵ�.
UPDATE EMP_SALARY SET SALARY=2500000,BONUS=0.5 WHERE EMP_NAME='������';
-- �ټ��� ROW �� �÷��� �����ϱ�
-- �μ��� D5�� ����� �޿��� 100000������ �߰��ϱ�
UPDATE EMP_SALARY SET SALARY=SALARY+100000 WHERE DEPT_CODE='D5';
SELECT * FROM EMP_SALARY WHERE DEPT_CODE='D5';

-- �������� ���� ����� �޿��� 50���� �ø��� ���ʴ� 0.4�����ϱ�
UPDATE EMP_SALARY SET SALARY=SALARY+500000, BONUS=0.4 WHERE EMP_NAME LIKE '��%';

-- ������ ��������!!! �ݵ�� WHERE�� �ۼ��ؼ� Ÿ���� ��Ȯ�ϰ� �����ؾ��Ѵ�.
-- WHERE�� �ۼ����� ������ ��üROW�� �����Ǵ� �����ؾ��Ѵ�.
UPDATE EMP_SALARY SET EMP_NAME='������';
SELECT * FROM EMP_SALARY;
ROLLBACK;


-- UPDATE������ SELECT�� Ȱ���ϱ�
-- ������ �μ�,���ʽ��� �ɺ����� �����ϰ� ��������
UPDATE EMP_SALARY 
SET DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='�ɺ���'),
    BONUS=(SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME='�ɺ���')
WHERE EMP_NAME='����';
SELECT * FROM EMP_SALARY WHERE EMP_NAME IN('����','�ɺ���');

ROLLBACK;
UPDATE EMP_SALARY
SET (DEPT_CODE,BONUS) = (SELECT DEPT_CODE,BONUS FROM EMPLOYEE WHERE EMP_NAME='�ɺ���')
WHERE EMP_NAME='����';

-- DELETE Ȱ���ϱ�
-- ���̺��� ROW�� �����ϴ� ��ɾ�
-- DELETE FROM ���̺�� [WHERE ���ǽ�]
-- D9�μ����� �����ϱ�
DELETE FROM EMP_SALARY WHERE DEPT_CODE='D9';
SELECT * FROM EMP_SALARY;
ROLLBACK;
DELETE FROM EMP_SALARY;

--TRUNCATE ���� -> ROLLBACK
TRUNCATE TABLE EMP_SALARY;

-- DDL(ALTER, DROP)
-- ALTER : ����Ŭ�� ���ǵǾ��ִ� OBJECT�� �����Ҷ� ����ϴ� ��ɾ�
-- ALTER TABLE :���̺� ���ǵǾ��ִ� �÷�, ���������� �����Ҷ� ���
CREATE TABLE TBL_USERALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
SELECT * FROM TBL_USERALTER;
-- ������ TBL_USERALTER���̺� �÷��� �߰��ϱ�
-- ALTER TABLE ���̺�� ADD (�÷��� �ڷ��� [��������])
ALTER TABLE TBL_USERALTER ADD (USER_NAME VARCHAR2(20));
DESC TBL_USERALTER;
INSERT INTO TBL_USERALTER VALUES(1,'ADMIN','1234','������');

-- ���̺� �����Ͱ� �ִ� ���¿��� �÷��� �߰��ϸ�?? �����ұ�??
ALTER TABLE TBL_USERALTER ADD(NICKNAME VARCHAR2(30));
SELECT * FROM TBL_USERALTER;

-- �̸��� �ּ� �߰��Ҷ� NOT NULL �������Ǽ���
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(40) DEFAULT '�̼���' NOT NULL);
ALTER TABLE TBL_USERALTER ADD(GENDER VARCHAR2(10) CONSTRAINT GENDER_CK CHECK (GENDER IN('��','��')));
INSERT INTO TBL_USERALTER VALUES(2,'USER01','USER01','����1','����','USERO1@USER01.COM','��');

-- �������� �߰��ϱ�
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� �������Ǽ���
ALTER TABLE TBL_USERALTER ADD CONSTRAINT USERID_UQ UNIQUE(USER_ID);
INSERT INTO TBL_USERALTER VALUES(3,'USER02','USER02','����2','����2','USERO2@USER02.COM','��');

-- NOT NULL���������� �̹� �÷��� NULLABLE�� ������ �Ǿ��ֱ� ������ ADD�� �ƴ� MODIFY�������� ������Ѵ�.
INSERT INTO TBL_USERALTER VALUES(4,'USER03',NULL,'����2','����2','USERO2@USER02.COM','��');
DELETE FROM TBL_USERALTER WHERE USER_NO=4;
--ALTER TABLE TBL_USERALTER ADD CONSTRAINT PASSWORD_NN NOT NULL;
ALTER TABLE TBL_USERALTER MODIFY USER_PWD CONSTRAINT USER_PWD_NN NOT NULL;

-- �÷������ϱ� -> �÷��� Ÿ��, ũ�⸦ �����ϴ°�
-- ALTER TABLE ���̺�� MODIFY �÷��� �ڷ���
DESC TBL_USERALTER;
ALTER TABLE TBL_USERALTER MODIFY GENDER CHAR(10);

-- �������� �����ϱ� 
ALTER TABLE TBL_USERALTER
MODIFY USER_PWD CONSTRAINT USER_PWD_UQ UNIQUE;

-- �÷��� �����ϱ�
-- ALTER TABLE ���̺�� RENAME COLUMN �÷��� TO ���÷���
ALTER TABLE TBL_USERALTER RENAME COLUMN USER_ID TO USERID;
DESC TBL_USERALTER;

-- �������Ǹ� �����ϱ�
-- ALTER TABLE ���̺�� RENAME CONSTRAINT �������Ǹ� TO ���������Ǹ�
ALTER TABLE TBL_USERALTER RENAME CONSTRAINT SYS_C007406 TO USERALTER_PK;

-- �÷������ϱ�
-- ALTER TABLE ���̺�� DROP COLUMN �÷���;
ALTER TABLE TBL_USERALTER DROP COLUMN EMAIL;
DESC TBL_USERALTER;

-- �������ǻ����ϱ�
-- ALTER TABLE ���̺�� DROP CONSTARINT �������Ǹ�;
ALTER TABLE TBL_USERALTER DROP CONSTRAINT USERALTER_PK;


-- ���̺� �����ϱ�
DROP TABLE TBL_USERALTER;
SELECT * FROM TBL_USERALTER;
-- ���̺��� �����Ҷ� FK���������� �����Ǿ��ִٸ� �⺻������ ������ �Ұ�����.
CREATE TABLE EMP_COPY 
AS SELECT * FROM EMPLOYEE;
ALTER TABLE EMP_COPY ADD CONSTRAINT EMP_ID_PK PRIMARY KEY(EMP_ID);
DROP TABLE TBL_FKTEST;
CREATE TABLE TBL_FKTEST(
    EMP_ID VARCHAR2(20) CONSTRAINT FK_EMPID REFERENCES EMP_COPY(EMP_ID),
    CONTENT VARCHAR2(20)
);

INSERT INTO TBL_FKTEST VALUES('200','200�̾�');
INSERT INTO TBL_FKTEST VALUES('201','201�̾�');
INSERT INTO TBL_FKTEST VALUES('202','202�̾�');
SELECT * FROM TBL_FKTEST;
DROP TABLE EMP_COPY;
-- �ɼ��� �����ؼ� ������ �� �ִ�.
DROP TABLE EMP_COPY CASCADE CONSTRAINT;

-- DCL�� ���ؾ˾ƺ���. -> SYSTEM������ ����
-- ������� ���Ѱ����ϴ� ��ɾ�.
-- GRANT ����, ���� TO ����ڰ�����
-- ���� : CREATE VIEW, CREATE TABLE, INSERT, SELECT, UPDATE ���
-- ����(ROLE) : ������ ����
-- �� ����(ROLE)�� �ο��� ���� Ȯ���ϱ�
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='RESOURCE';
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='CONNECT';

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER QWER IDENTIFIED BY QWER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT CONNECT TO QWER;

-- BS������ ���̺��� ��ȸ�� �� �ִ� ���� �ο��ϱ�
GRANT SELECT ON BS.EMPLOYEE TO QWER;
GRANT UPDATE ON BS.EMPLOYEE TO QWER;
--GRANT SELECT ON BS. TO QWER;

-- ����ȸ���ϱ�
-- REVOKE ���� || ROLE FROM ����ڰ�����
REVOKE UPDATE ON BS.EMPLOYEE FROM QWER;

-- ROLE�����
CREATE ROLE MYROLE;
GRANT CREATE TABLE, CREATE VIEW TO MYROLE;

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='MYROLE';
GRANT MYROLE TO QWER;

-- TCL : Ʈ�������� ��Ʈ���ϴ� ��ɾ�
-- COMMIT : ���ݱ��� ������ ��������(DML)��ɾ ��� DB�� ����
-- ROLLBACK : ���ݱ��� ������ ��������(DML)��ɾ ��� ���
-- Ʈ������ : �ϳ��� �۾����� �Ѱ� ����
-- Ʈ�������� ���Ǵ� ��ɾ� : DML(INSERT, UPDATE, DELETE)

INSERT INTO JOB VALUES('J0','����');
SELECT * FROM JOB;
COMMIT;

-- ORACLE���� �����ϴ� OBJECTȰ���ϱ�
-- USER, TABLE, VIEW, SEQUENCE, INDEX, SYNONYM, FUNCTION, PROCEDURE, PACKAGE ���
CREATE TABLE EMP_M1
AS SELECT * FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT * FROM EMPLOYEE WHERE JOB_CODE='J4';

INSERT INTO EMP_M2 VALUES(999,'���ο�','561014-123456','KWACK@DF.COM','01021314123','D5','J1','S1',90000,0.5,
    NULL,SYSDATE,DEFAULT,DEFAULT);
UPDATE EMP_M2 SET SALARY=0;
COMMIT;
SELECT * FROM EMP_M1;
SELECT * FROM EMP_M2;

MERGE INTO EMP_M1 USING EMP_M2 ON(EMP_M1.EMP_ID=EMP_M2.EMP_ID)
WHEN MATCHED THEN
    UPDATE SET
        EMP_M1.SALARY=EMP_M2.SALARY
WHEN NOT MATCHED THEN
    INSERT VALUES(EMP_M2.EMP_ID,EMP_M2.EMP_NAME,EMP_M2.EMP_NO,EMP_M2.EMAIL,EMP_M2.PHONE,
        EMP_M2.DEPT_CODE,EMP_M2.JOB_CODE,EMP_M2.SAL_LEVEL,EMP_M2.SALARY,EMP_M2.BONUS,
        EMP_M2.MANAGER_ID,
        EMP_M2.HIRE_DATE,EMP_M2.ENT_DATE,EMP_M2.ENT_YN);
        
SELECT * FROM EMP_M1;        

-- view�� ���� �˾ƺ���
-- SELECT���� ��� RESULT SET�� �ϳ��� ���̺�ó�� Ȱ���ϰ��ϴ°�
-- STORED VIEW �����ϱ�
-- CREATE [�ɼ�] VIEW VIEW��Ī AS SELECT��
CREATE VIEW V_EMP
AS SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- VIEW�� ������ ������ �ο��ؾ���.
-- SYSTEM / SYS AS SYSDBA�������� �ο��� �Ѵ�
GRANT CREATE VIEW TO BS;

CREATE OR REPLACE VIEW V_EMP
AS SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
-- ������ VIEW���̺� �̿��ϱ�
SELECT * FROM V_EMP;


-- �μ���, ��å�� �޿��� ����� ���ϴ� SELECT��
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;
SELECT JOB_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY JOB_CODE;

SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE
UNION
SELECT JOB_CODE,AVG(SALARY) FROM EMPLOYEE GROUP BY JOB_CODE;

CREATE VIEW V_AVG_DEPTJOB
AS 
SELECT DEPT_CODE, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE GROUP BY ROLLUP(DEPT_CODE)
UNION
SELECT JOB_CODE,AVG(SALARY) FROM EMPLOYEE GROUP BY ROLLUP(JOB_CODE);

SELECT * FROM V_AVG_DEPTJOB
WHERE AVG_SALARY>=3000000 AND DEPT_CODE IS NOT NULL;


-- VIEW���̺� ��ȸ
SELECT * FROM USER_VIEWS;

-- VIEW�� Ư¡
-- DML������ ����� �����ϴ�??
-- �������̺�� ����Ǿ��ִ� �÷��� �����Ҷ��� ����, �����÷��� ������ �Ұ����ϴ�.
SELECT * FROM V_EMP;
UPDATE V_EMP SET EMP_NAME='���ֿ�' WHERE EMP_NAME='������';
UPDATE V_EMP SET SALARY=100 WHERE EMP_NAME='���ֿ�';
UPDATE V_EMP SET DEPT_TITLE='TEST' WHERE DEPT_CODE='D1';
SELECT * FROM EMPLOYEE;
UPDATE V_AVG_DEPTJOB SET AVG_SALARY=1000000;

-- ���� ���̺�� ������� VIEW�� ISNERT�� ������.
-- -> VIEW���� ���� ������ �̿ܿ� �÷����� NULL���� ������. -> NOT NULL���������� �����Ǹ� �ȵȴ�.
CREATE VIEW V_EMPTEST
AS SELECT EMP_ID, EMP_NO, EMP_NAME, EMAIL, PHONE, JOB_CODE, SAL_LEVEL FROM EMPLOYEE;
--SELECT DEPT_CODE FROM V_EMPTEST;
INSERT INTO V_EMPTEST VALUES('997','981011-1234123','ȫ�浿','HONG@HONG.COM','12341234','J1','S1');
-- JOIN�� ����� VIEW�� INSERT�� �Ұ�����.
-- JOIN, UNION����� VIEW�� �Է��� �Ұ�����.
INSERT INTO V_EMP VALUES('996','ȫ�浿','980110-1234567','HONG@HONG.COM','12345','D5','J1'
    ,'S1',100,0.2,206,SYSDATE,NULL,'N','D0','�Ǵ�','L3');
SELECT * FROM V_EMP;

-- DELETE���� �����ϴ�?
DELETE FROM V_EMPTEST WHERE EMP_ID='997';
SELECT * FROM EMPLOYEE;
DELETE FROM V_EMP WHERE EMP_NAME='�����';


-- VIEW������ ����� �� �ִ� �ɼ�
-- 1. OR REPLACE : �ߺ��Ǵ� VIEW�̸��� ������ ����⸦ ���ִ� �ɼ�.
-- * OBJECT��Ī�� �ߺ��� �Ұ����ϴ�.
CREATE OR REPLACE VIEW V_EMP
AS SELECT * FROM EMPLOYEE;
SELECT * FROM V_EMP;

-- FORCE/NOFORCE : ���� ���̺��� ���������ʾƵ� VIEW������ ���ְ� ���ִ� �ɼ�.
SELECT * FROM TT;
DROP VIEW V_TT;
CREATE FORCE VIEW V_TT
AS SELECT * FROM TT;
SELECT * FROM V_TT;

CREATE TABLE TT(
    TTNO NUMBER,
    TTNAME VARCHAR2(200)
);

-- WITH CHECK OPTION : SELECT���� WHERE���� ����� �÷��� �������� ���ϰ� ����� �ɼ�.
CREATE OR REPLACE VIEW V_CHECK
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' WITH CHECK OPTION;
SELECT * FROM V_CHECK;
UPDATE V_CHECK SET EMP_NAME='������' WHERE EMP_NAME='������';
ROLLBACK;

-- WITH READ ONLY : VIEW���̺��� ������ �Ұ����ϰ� �ϴ� �ɼ� -> �б�����
CREATE OR REPLACE VIEW V_CHECK
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' WITH READ ONLY;


-- SEQUENCE�� ���� �˾ƺ���
-- �ڵ���ȣ �߱����ִ� ��ü
-- �⺻ SEQUENCE�����ϱ�
-- CREATE SEQUENCE �������̸� [�ɼǵ�];
-- �⺻���� �����ϸ� ��ȣ�� 1���� 1�� �����ؼ� �߱�����
-- 1. SEQUENCE��ȣ�� �߱��Ϸ��� ��������.NEXTVAL�� �����Ѵ�.
CREATE SEQUENCE SEQ_BASIC;
SELECT SEQ_BASIC.NEXTVAL FROM DUAL;
-- SEQEUNCE�� �ߺ������ʴ� ���ڸ� �߱����ֱ� ������ ���̺��� PK�÷��� ������ ���� ����Ѵ�.
SELECT * FROM BOARD;
DESC BOARD;
INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'ù��°�Խñ�','ù��°','������',SYSDATE);


-- ���� SEQUENCE���� Ȯ���ϱ�
-- ������.CURRVAL�� �̿��Ѵ�.
SELECT SEQ_BASIC.CURRVAL FROM DUAL;
SELECT SEQ_BASIC.NEXTVAL FROM DUAL;

SELECT * FROM BOARD;
CREATE TABLE ATTACHMENT(
    ATTACH_NO NUMBER PRIMARY KEY,
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO),
    FILENAME VARCHAR2(200) NOT NULL
);
INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'÷�����ϰԽñ�','÷�������ִ�','������',SYSDATE);
INSERT INTO ATTACHMENT VALUES(1,SEQ_BASIC.CURRVAL,'������.PNG');
INSERT INTO ATTACHMENT VALUES(2,SEQ_BASIC.CURRVAL,'������2.PNG');
SELECT * FROM BOARD;
SELECT * FROM ATTACHMENT;
SELECT * FROM BOARD JOIN ATTACHMENT ON BOARD_NO=BOARD_REF;


-- SEQUENCE�ɼǰ� Ȱ���ϱ�
-- START WITH ���� : ������ ���ں��� ���� DEFAULT 1
-- INCREMENT BY ���� : �����ϴ� ������ �ǹ� DEFAULT 1 
-- MAXVALUE ���� : �ִ밪�� ����
-- MINVALUE ���� : �ּҰ��� ����
-- CYCLE/NOCYCLE : ��ȣ�� ��ȯ���� ���� �����ϴ°� * MAXVALUE,MINVALUE�� �����Ǿ��־���Ѵ�.
-- CACHE : �̸���ȣ�� �����ϴ� ��� DEFAULT 20 
SELECT * FROM USER_SEQUENCES;
CREATE SEQUENCE SEQ_01
START WITH 100;
SELECT SEQ_01.NEXTVAL FROM DUAL;
CREATE SEQUENCE SEQ_02
START WITH 100
INCREMENT BY 10;
SELECT SEQ_02.NEXTVAL FROM DUAL;

CREATE SEQUENCE SEQ_03
START WITH 100
INCREMENT BY -50
MAXVALUE 200
MINVALUE 0;
SELECT SEQ_03.NEXTVAL FROM DUAL;
CREATE SEQUENCE SEQ_04
START WITH 100
INCREMENT BY 50
MAXVALUE 200
MINVALUE 0
CYCLE
NOCACHE;
SELECT SEQ_04.NEXTVAL FROM DUAL;

-- 1. CURRVAL�� ȣ���Ϸ��� ���� SESSION�ȿ��� NEXTVAL�� �ѹ��̶� ȣ���ϰ� ȣ���ؾ��Ѵ�.
CREATE SEQUENCE SEQ_05;
SELECT SEQ_05.NEXTVAL, SEQ_05.CURRVAL FROM DUAL;

-- 2. SEQUNCE�� ���� �߰��ؼ� PK������ �� �� �ִ�.
-- p_001, M_001
SELECT 'P_'||LPAD(SEQ_05.NEXTVAL,4,'0') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||'_'||SEQ_05.NEXTVAL FROM DUAL;


-- ����Ŭ���� �����ϴ� SELECT�� 
-- ����������, �� ���̺��� �����ִ� ROW�� ��� ����� �� �ְ� ���ִ� ������ -> ROW������ �����ִ� �ڷ�� �����ؼ� ���
-- �Ŵ����� �����ؼ� ����ϱ�
SELECT LEVEL, EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
    START WITH EMP_ID=200
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    
SELECT LEVEL||' '||LPAD(' ',(LEVEL-1)*5,' ')||EMP_NAME||NVL2(MANAGER_ID,'('||MANAGER_ID||')','') AS ������
FROM EMPLOYEE
    START WITH EMP_ID=200
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    

-- PL/SQL������ ���� �˾ƺ���
-- PL/SQL������ ����ϴ� ���
-- 1. �͸����� �̿��ϱ� -> BEGIN ~ END;/ ������ ����ϴ� �� * ������ �Ұ�����.
-- 2. PROCEDURE, FUNCTION��ü�� �����ؼ� �̿� ->  OBJECT�ȿ� �ۼ��� PL/SQL * ������ OBJECT������ ������ ����

-- �͸��
-- PL/SQL������ ũ�� 3������ ������
-- [�����] : DECLARE���� ��� ����, ����� ����
--              ���������� : ������ Ÿ��(�⺻Ÿ��, ����Ÿ��, ROWTYPE, TABLE, RECODE);
-- [�����] : BEGIN �����ۼ�  END;/ ���ǹ�, �ݺ��� �� ������ ���뿡 ���� �ۼ��ϴ� ����
-- [����ó����] : ó���� ���ܰ� ������ �ۼ��ϴ� ����
SET SERVEROUTPUT ON;
-- ��ũ��Ʈ ���â�� ������ ����� �� �ִ�.

BEGIN
    DBMS_OUTPUT.PUT_LINE('�ȳ� ���� ù PL/SQL����');
END;
/

-- ����Ȱ���ϱ�
-- ������ DECLARE�κп� ������ �ڷ��� �������� ����
-- �ڷ����� ����
-- �⺻�ڷ��� : ����Ŭ���� �����ϴ� TYPE�� (NUMBER, VARCAHR2, CHAR, DATE......)
-- �������ڷ��� : ���̺��� Ư���÷��� ������ Ÿ���� �ҷ��� ���
-- ROWTYPE : ���̺��� �Ѱ� ROW�� ������ �� �ִ� Ÿ��
-- Ÿ���� �����ؼ� Ȱ��
-- TABLETYPE : �ڹ��� �迭�� ����� Ÿ�� -> �ε�����ȣ�� �ְ�, �Ѱ�Ÿ�Ը� ������ ����
-- RECORDE : �ڹ��� Ŭ������ ����� Ÿ�� -> ��������� �ְ�, �ټ�Ÿ���� ���尡��


-- �⺻�ڷ��� ����� �̿��ϱ�
DECLARE
    V_EMPNO VARCHAR2(20);
    V_EMPNAME VARCHAR2(15);
    V_AGE NUMBER := 19;
BEGIN
    V_EMPNO:='010224-1234567';
    V_EMPNAME:='������';
    DBMS_OUTPUT.PUT_LINE(V_EMPNO);
    DBMS_OUTPUT.PUT_LINE(V_EMPNAME);
    DBMS_OUTPUT.PUT_LINE(V_AGE);
END;
/

-- �������ڷ����̿��ϱ�
DECLARE 
    V_EMPID EMPLOYEE.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    V_EMPID:='200';
    V_SALARY := 1000000;
    DBMS_OUTPUT.PUT_LINE(V_EMPID||' : '||V_SALARY);
    --SQL���� �����Ͽ� ó���ϱ�
    SELECT EMP_ID, SALARY
    INTO V_EMPID,V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMPID;
    DBMS_OUTPUT.PUT_LINE(V_EMPID||' '||V_SALARY);   
END;
/

-- ROWTYPE
DECLARE
    V_EMP EMPLOYEE%ROWTYPE;
    V_DEPT DEPARTMENT%ROWTYPE;
BEGIN
    SELECT *
    INTO V_EMP
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    -- ROWTYPE�� �� �÷��� ����Ϸ��� .�����ڸ� �̿��ؼ� �÷������� �����Ѵ�.
    DBMS_OUTPUT.PUT_LINE(V_EMP.EMP_ID||' '||V_EMP.EMP_NAME||' '||V_EMP.SALARY||' '||V_EMP.BONUS);
    SELECT * 
    INTO V_DEPT
    FROM DEPARTMENT
    WHERE DEPT_ID=V_EMP.DEPT_CODE;
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPT_ID||' '||V_DEPT.DEPT_TITLE||' '||V_DEPT.LOCATION_ID);
    
END;
/
-- �����ؼ� ����ϴ� Ÿ��    
-- ���̺�Ÿ��
DECLARE
    TYPE EMP_ID_TABLE IS TALE OF EMPLOYEE.EMP_ID%TYPEB 
    INDEX BY BINARY_INTEGER;
    -- ������ Ÿ��
    MYTABLE_ID EMP_ID_TABLE;
    I BINARY_INTEGER := 0;
BEGIN
    MYTABLE_ID(1):='100';
    MYTABLE_ID(2):='200';
    MYTABLE_ID(3):='300';
    DBMS_OUTPUT.PUT_LINE(MYTABLE_ID(1));
    DBMS_OUTPUT.PUT_LINE(MYTABLE_ID(2));
    DBMS_OUTPUT.PUT_LINE(MYTABLE_ID(3));
    
    FOR K IN (SELECT EMP_ID FROM EMPLOYEE) LOOP
        I:=I+1;
        MYTABLE_ID(I):=K.EMP_ID;
    END LOOP;
    FOR J IN 1..I LOOP
        DBMS_OUTPUT.PUT_LINE(MYTABLE_ID(J));
    END LOOP;        
END;
/

-- RECORDŸ��Ȱ���ϱ�
-- Ŭ������ ���� 
DECLARE
    TYPE MYRECORD IS RECORD(
        ID EMPLOYEE.EMP_ID%TYPE,
        NAME EMPLOYEE.EMP_NAME%TYPE,
        DEPTTITLE DEPARTMENT.DEPT_TITLE%TYPE,
        JOBNAME JOB.JOB_NAME%TYPE
    );
    
    MYDATA MYRECORD;
BEGIN
    SELECT EMP_ID,EMP_NAME, DEPT_TITLE, JOB_NAME
    INTO MYDATA
    FROM EMPLOYEE 
        JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB USING(JOB_CODE)
    WHERE EMP_NAME='&�����';
    DBMS_OUTPUT.PUT_LINE(MYDATA.ID||MYDATA.NAME||MYDATA.DEPTTITLE||MYDATA.JOBNAME);
END;
/

-- PL/SQL�������� ���ǹ� Ȱ���ϱ�
-- IF�� Ȱ��
-- IF ���ǽ�  
--  THEN : ���ǽ��� TRUE�϶� THEN�� �ִ� ������ �����. 
-- END IF;

DECLARE
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    
    IF V_SALARY>3000000
        THEN DBMS_OUTPUT.PUT_LINE('���� �����ó׿�!');    
    END IF;   
END;
/

-- IF 
--  THEN ���౸��
--  ELSE ���౸��
-- END IF;

DECLARE
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME='&�����';
    IF V_SALARY>3000000
        THEN DBMS_OUTPUT.PUT_LINE('���̹����ó׿�!');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('�����̽ó׿�!');
    END IF;
END;
/
CREATE TABLE HIGH_SAL(
    EMP_ID VARCHAR2(20) REFERENCES EMPLOYEE(EMP_ID),
    SALARY NUMBER
);

CREATE TABLE LOWSAL(
    EMP_ID VARCHAR2(20) REFERENCES EMPLOYEE(EMP_ID),
    SALARY NUMBER
);

DECLARE
    EMPID EMPLOYEE.EMP_ID%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID,SALARY
    INTO EMPID,SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME='&�����';
    
    IF SALARY>3000000
        THEN   INSERT INTO HIGH_SAL VALUES(EMPID,SALARY);
    ELSE 
        INSERT INTO LOWSAL VALUES(EMPID,SALARY);
    END IF;
--    COMMIT;
END;
/

SELECT * FROM HIGH_SAL;
SELECT * FROM LOWSAL;

-- IF ���ǽ� THEN ELSIF ���ǽ� THEN ELSE END IF;
CREATE TABLE MSGTEST(
    EMP_ID VARCHAR2(20) REFERENCES EMPLOYEE(EMP_ID),
    MSG VARCHAR2(100)
);

DECLARE
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE;
    V_JOBCODE EMPLOYEE.JOB_CODE%TYPE;
    MSG VARCHAR2(100);
BEGIN
    SELECT EMP_ID, JOB_CODE 
    INTO V_EMP_ID,V_JOBCODE
    FROM EMPLOYEE
    WHERE EMP_ID='&�����ȣ';
    
    IF V_JOBCODE='J1'
        THEN MSG := '��ǥ�̻�';
    ELSIF V_JOBCODE IN ('J2','J3','J4')
        THEN MSG := '�ӿ�';
    ELSE MSG := '���';
    END IF;
    INSERT INTO MSGTEST VALUES(V_EMP_ID,MSG);
    COMMIT;

END;
/
SELECT * FROM MSGTEST JOIN EMPLOYEE USING(EMP_ID);


-- CASE�� �̿��ϱ�
DECLARE
    NUM NUMBER;
BEGIN
    NUM:='&��';
    CASE 
        WHEN NUM>10
            THEN DBMS_OUTPUT.PUT_LINE('10�ʰ�');
        WHEN NUM>5
            THEN DBMS_OUTPUT.PUT_LINE('10~5���̰�');
        ELSE DBMS_OUTPUT.PUT_LINE('5������ ���Դϴ�.');
    END CASE;
END;
/

-- �ݺ�������ϱ�
-- �⺻�ݺ��� LOOP���� �̿�
-- FOR, WHILE���� ����.
DECLARE
    NUM NUMBER := 1;
    RNDNUM NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
        -- ����Ŭ���� ������ ����ϱ�
        RNDNUM:=FLOOR(DBMS_RANDOM.VALUE(1,10));
        DBMS_OUTPUT.PUT_LINE(RNDNUM);
        INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'����'||RNDNUM,'CONTENT'||RNDNUM,'�ۼ���'||RNDNUM,SYSDATE);
        NUM:=NUM+1;
        IF NUM>100
            THEN EXIT; --BREAK���� ����
        END IF;            
    END LOOP;
    COMMIT;
END;
/
SELECT * FROM BOARD;

-- WHILE��
-- WHILE ���ǹ� LOOP
--  ���౸��
-- END LOOP;

DECLARE
    NUM NUMBER :=1;
BEGIN
    WHILE NUM<=10 LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
        NUM:=NUM+1;
    END LOOP;
END;
/

-- FOR ���� IN ����(����..��) LOOP
-- END LOOP;

BEGIN
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
-- FOR ���� IN (SELECT��) LOOP
-- END LOOP;
BEGIN 
    FOR EMP IN (SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') AS GENDER FROM EMPLOYEE E) LOOP
        DBMS_OUTPUT.PUT_LINE(EMP.EMP_ID||EMP.EMP_NAME||EMP.SALARY||EMP.DEPT_CODE||EMP.JOB_CODE||EMP.GENDER);
        IF EMP.SALARY>3000000
            THEN INSERT INTO HIGH_SAL VALUES(EMP.EMP_ID,EMP.SALARY);
        ELSE INSERT INTO LOWSAL VALUES(EMP.EMP_ID,EMP.SALARY);
        END IF;
        COMMIT;
    END LOOP;
END;
/
SELECT * FROM HIGH_SAL;
SELECT * FROM LOWSAL;

-- PL/SQL���������ϰ� ����ϱ�
-- PROCEDURE, FUNCTION
-- PROCEDURE
-- CREATE PROCEDURE ���ν�����
-- IS
-- ��������(�ʿ��ϴٸ�...)
-- BEGIN
--  ������ ����
-- END;
-- /
-- ����� ���ν��� �����ϱ�
-- EXEC ���ν�����
CREATE TABLE EMP_DEL
AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP_DEL;
CREATE OR REPLACE PROCEDURE EMP_DEL_PRO
IS
BEGIN
    DELETE FROM EMP_DEL;
    COMMIT;
END;
/
EXEC EMP_DEL_PRO;
SELECT * FROM EMP_DEL;
CREATE OR REPLACE PROCEDURE EMP_INSERT
IS 
BEGIN
    FOR EMP IN (SELECT * FROM EMPLOYEE) LOOP
        INSERT INTO EMP_DEL 
        VALUES(EMP.EMP_ID, EMP.EMP_NAME, EMP.EMP_NO,EMP.EMAIL, EMP.PHONE,
                EMP.DEPT_CODE,EMP.JOB_CODE,EMP.SAL_LEVEL,EMP.SALARY, EMP.BONUS,
                EMP.MANAGER_ID,EMP.HIRE_DATE,EMP.ENT_DATE,EMP.ENT_YN);
    END LOOP;
    COMMIT;
END;
/
EXEC EMP_INSERT;
SELECT * FROM EMP_DEL;
EXEC EMP_DEL_PRO;

--create or replace PROCEDURE session_kill
--is
--begin
--    FOR data in (select * from V$SESSION where type='USER' and status in ('ACTIVE','INACTIVE') and not audsid = userenv('sessionid')) loop
--        EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION '''|| data.sid ||',' || data.serial# ||''''; 
--    end loop;
--end;
--/

-- ���ν����� �Ű����� Ȱ���ϱ�
-- IN�Ű����� : ���ν�������ÿ� �ʿ��� �����͸� �޴� �Ű����� * �Ϲ����� �Ű�����
-- OUT�Ű����� :  ȣ���� ������ ������ ������ �����͸� �������ִ� �Ű������� ������.

CREATE OR REPLACE PROCEDURE PRO_SELECT_EMP(V_EMPID IN EMPLOYEE.EMP_ID%TYPE,V_EMPNAME OUT EMPLOYEE.EMP_NAME%TYPE)
IS
    TEST VARCHAR2(20);
BEGIN
    SELECT EMP_NAME
    INTO V_EMPNAME
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMPID;
END;
/

-- ������������
VAR EMP_NAME VARCHAR2(20);
PRINT EMP_NAME;
EXEC PRO_SELECT_EMP(201,:EMP_NAME);
PRINT EMP_NAME;


-- FUNCTION ������Ʈ
-- �Լ� : �Ű�����, ���ϰ��� ���´�.
-- SELECT�� ���ο��� ������.
-- CREATE FUNCTION �Լ���([�Ű���������])
-- RETURN ����Ÿ��
-- IS 
-- [��������]
-- BEGIN
--  ������ ����
-- END;
-- /
-- �Ű������� ���� ���ڿ��� ���̸� ��ȯ���ִ� �Լ�
CREATE OR REPLACE FUNCTION MYFUNC(V_STR VARCHAR2)
RETURN NUMBER
IS
    V_RESULT NUMBER;
BEGIN
    SELECT LENGTH(V_STR) 
    INTO V_RESULT
    FROM DUAL;
    RETURN V_RESULT;
END;
/

SELECT MYFUNC('������')
FROM DUAL;
SELECT MYFUNC(EMAIL)
FROM EMPLOYEE;

-- �Ű������� EMP_ID�� �޾Ƽ� ������ ������ִ� �Լ��� �����
CREATE OR REPLACE FUNCTION SAL_YEAR(V_EMPID EMPLOYEE.EMP_ID%TYPE)
RETURN NUMBER
IS
    V_RESULT NUMBER;
BEGIN
    SELECT SALARY*12
    INTO V_RESULT
    FROM EMPLOYEE
    WHERE EMP_ID=V_EMPID;
    --V_RESULT:=MYFUNC(V_EMPID);
    RETURN V_RESULT;
    
END;
/
SELECT SAL_YEAR(200) FROM DUAL;
SELECT EMP_NAME, SALARY,BONUS, SAL_YEAR(EMP_ID) AS ����
FROM EMPLOYEE;

DECLARE
    V_RESULT NUMBER;
BEGIN
    V_RESULT:=SAL_YEAR('&���');
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;
/

-- ���Ի���� �߰��Ǹ� ���Ի���� �Ի��Ͽ����ϴ� ����ϴ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- Ʈ���� ����� �����Է��Ѱ�, �������� ���� ����� �� ����
    -- INSERT : ���ο(0), ������(X) 
    -- UPDATE : ���ο(O), ������(O)
    -- DELETE : ���ο(X), ������(O)
    -- ���ο : :NEW.�÷���
    -- ������ :  :OLD.�÷���
    DBMS_OUTPUT.PUT_LINE('���Ի�� '||:NEW.EMP_NAME||'���� �Ի��Ͽ����ϴ�');
END;
/
INSERT INTO EMPLOYEE VALUES('993','�ּ�','970105-1234567','CHOI@CHOIK.COM','01012341234','D3','J1',
    'S1',10,0.5,200,SYSDATE,NULL,DEFAULT);

--Ʈ���ŷ� �������ϱ�
CREATE TABLE TBL_PRODUCT(
    PCODE NUMBER PRIMARY KEY,
    PNAME VARCHAR2(20) NOT NULL,
    BRAND VARCHAR2(20),
    PRICE NUMBER CHECK(PRICE>0),
    STOCK NUMBER DEFAULT 0    
);

CREATE SEQUENCE SEQ_PRO;
CREATE TABLE TBL_PROIO(
    IOCODE NUMBER PRIMARY KEY,
    PCODE NUMBER REFERENCES TBL_PRODUCT(PCODE),
    IODATE DATE,
    AMOUNT NUMBER CHECK(AMOUNT>0),
    STATUS VARCHAR2(10) CHECK(STATUS IN('�԰�','���'))    
);

CREATE SEQUENCE SEQ_PROIO;

SELECT * FROM TBL_PRODUCT;
SEELCT * FROM TBL_PROIO;
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'����ι�','�������ι�',80000000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'�ƺ�����','����',2800000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'������','�Ｚ',1300000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'�����е�','����',1600000,DEFAULT);
SELECT * FROM TBL_PRODUCT;
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,1,SYSDATE,10,'�԰�');
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,2,SYSDATE,7,'�԰�');
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,2,SYSDATE,3,'���');

SELECT * FROM TBL_PROIO;
SELECT * FROM TBL_PRODUCT;

DELETE FROM TBL_PROIO;
COMMIT;

CREATE OR REPLACE TRIGGER TRG_PRODUCT
AFTER INSERT ON TBL_PROIO
FOR EACH ROW
BEGIN
    IF :NEW.STATUS='�԰�'
        THEN UPDATE TBL_PRODUCT SET STOCK=STOCK+:NEW.AMOUNT 
        WHERE : NEW.PCODE=PCODE;
    ELSIF : NEW.STATUS='���'
        THEN UPDATE TBL_PRODUCT SET STOCK=STOCK-:NEW.AMOUNT
        WHERE : NEW.PCODE=PCODE;
    END IF;
END;
/

CREATE USER student IDENTIFIED BY student DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT RESOURCE, CONNECT TO student;




















    
    






























        
        
        
        
        
        





















































































