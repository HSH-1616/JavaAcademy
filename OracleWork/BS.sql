SELECT * FROM DBA_USERS;
SELECT * FROM TAB;

--DATABASE����ϱ�
--1.����� ������ ������(SYSTEM)�������� ��������
--  -�����ڷ� �����ؼ� ������ɾ �̿���
--2.������ ������ DATABASE�� �̿��ϱ� ���ؼ��� ���Ѻο������ �Ѵ�.
--  -�����ڷ� �����ؼ� ���� �ο� ��ɾ �̿�
--  -�ο�����:�����Ҽ��ִ� ����(CONNECT) ����� �� �ִ� ����(RESOURCE)

--���� �����ϴ� ��ɾ�
--CREATE USER ����ڰ����� IDENTIFIED BY ��й�ȣ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
--18C�������� ����ڰ����� ##�� �ٿ��� �����ؾ��Ѵ�.
--##�Ⱥ��ϼ� �ְ� �����ϱ�
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--DB�� ��ϵǾ� �ִ� ����� ��ȸ�ϱ�
SELECT * FROM DBA_USERS;

--����ڸ� �����ϴ��� ������ ������ DB�� �̿��Ҽ��� ����.
--����ڿ��� ���Ѻο��ϱ�
--GRANT ���� OR ��(����) TO ����ڰ�����
GRANT CONNECT TO BS;
--���̺��� �̿��� �� �ִ� ������ �ο��ϱ�
GRANT RESOURCE TO BS;

GRANT CONNECT, RESOURCE TO BS;
--BS�������� SQL�� �����غ���
SELECT * FROM TAB; --�������� �̿��ϰ� �ִ� ���̺��� ��ȸ�ϴ� ��ɾ�

CREATE TABLE TEST(
TEST VARCHAR2(200)
);

--USER01�̶�� ������ �����ϰ� �����ϰ� �ϱ�
--CREATE TABLE USER01{
--AGE NUMBER
--};
CREATE USER USER01 IDENTIFIED BY USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

GRANT CONNECT, RESOURCE TO USER01;

CREATE TABLE USER01(
AGE NUMBER
);

SELECT * FROM TAB;
SELECT * FROM BS.TEST;
SELECT * FROM USER01.USER01;

--�⺻�ǽ�DB�� ���� �˾ƺ���.
--���, �μ�, ��å, �ٹ���, �޿�����, �ٹ����� ����
--��� ���̺��� ����Ȯ���ϱ�
SELECT * FROM EMPLOYEE;
--�μ� ���̺��� ����Ȯ���ϱ�
SELECT * FROM DEPARTMENT;
--��å�� ���� ����Ȯ���ϱ�
SELECT * FROM JOB;
--�μ��� �ٹ���
SELECT * FROM LOCATION;
--�ٹ����� ����������
SELECT * FROM NATIONAL;
--�޿�����
SELECT * FROM SAL_GRADE;

--SELCET���� Ȱ���ϱ�
--�⺻����
--SELECT �÷���,�÷���.....||*
--FROM ���̺��

--SELECT���� �̿��ؼ� EMPLOYEE���̺� ��ȸ�ϱ�
SELECT EMP_NAME, EMP_NO, EMAIL, PHONE
FROM EMPLOYEE;

--SELECT���� �̿��ؼ� EMPLOYEE���̺��� ��ü �÷� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE;

--��ü ����� �̸�, ����, ���ʽ� �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE;

--��� ������ Ȯ���Ҷ��� SELECT���� �̿���.
--SELECT���� �̿��ؼ� ������� ó���ϱ�
--+,-,*,/(��Ģ����)->�ǿ����� ���ͷ�, �÷���
SELECT 10+20,10-20,20/3,5*4
FROM DUAL;

--���ͷ�, �÷� ����
--��ü����� �޿��� 100���� ���ϱ�
SELECT EMP_NAME,SALARY+100,SALARY
FROM EMPLOYEE;

--�÷�, �÷� ����
SELECT EMP_NAME, SALARY+BONUS
FROM EMPLOYEE;

--NULL���� ������ �Ұ����ϴ� -> ����� ������ NULL�� ��µ�.
SELECT SALARY, BONUS
FROM EMPLOYEE;

--��������� �������� �����ϴ�.
--����Ŭ���� ���ڿ� ���ͷ��� ''�� ����Ѵ�.
SELECT '���� ���ɸ���'
FROM DUAL;

SELECT EMP_NAME, SALARY, BONUS,10+30
FROM EMPLOYEE;

--������̺��� �����, �μ��ڵ�, ����, ���� ��ȸ�ϱ�
--������̺��� �����, �μ��ڵ�, ����, ���ʽ��� ���Ե� ���� ��ȸ�ϱ�

SELECT EMP_NAME, DEPT_CODE, SALARY, SALARY*12
FROM EMPLOYEE;

SELECT EMP_NAME, DEPT_CODE, SALARY, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;

--���̺� �����ϴ� �÷��� ��ȸ�� �����ϴ�.
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

--��ȸ�� �÷��� ��Ī�� �ο��� �� �ִ�. -> ���� �÷��� ���� ���
--AS ���� ����Ѵ�.
--��) SELECT EMP_NAME AS ����� FROM EMPLOYEE
SELECT EMP_NAME AS �����, SALARY AS ����, EMAIL AS �̸���
FROM EMPLOYEE;

--AS�� �����ϰ� ����� �ο��� �� �ִ�.
SELECT EMP_NAME �����, SALARY ����, EMAIL �̸���
FROM EMPLOYEE;

--��Ī�� ����, Ư����ȣ�� �����ϴ�?
SELECT EMP_NAME AS "�� �� ��", SALARY AS "%��!��"
FROM EMPLOYEE;

--��ȸ�Ǵ� �������� �ߺ��� �������ִ� ��ɾ� : DISTINCT
--�÷��� �տ� ���, SELECT���� �� �տ� �ۼ�
--SELECT DISTINCT �÷���(,�÷���....) FROM ���̺�� 
SELECT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
--SELECT EMP_NAME, DINTINCT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT EMP_NAME, DEPT_CODE FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;

--����Ŭ���� ���ڿ��� �������ִ� ������
SELECT '����'+'���ִ�.'
FROM DUAL;

SELECT '����'||'������'
FROM DUAL;

--||������ �÷��� ���ļ� ����Ҷ��� ����Ѵ�.
SELECT EMP_NAME||EMP_NO||EMAIL INFO
FROM EMPLOYEE;
SELECT EMP_NAME||SALARY||BONUS
FROM EMPLOYEE;

SELECT EMP_NAME||'���� ������ '||SALARY||' ���ʽ�'||BONUS
FROM EMPLOYEE;

--���ϴ� ROW(DATA)�� ����ϱ�
--������ ���ǿ� �´� �����͸� ��������
--WHERE ���ǽ� �̿��Ѵ�.
--�����
--SELECT �÷�, �÷�........ OR*
--FROM ���̺��
--WHERE ���ǽ�

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D9';

--��� �� ������ 200���� �̻��� ����� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE SALARY>=2000000;

--��� �� ��å�� J2�� �ƴ� ��� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE JOB_CODE !='J2';

SELECT * FROM EMPLOYEE
WHERE JOB_CODE <>'J2';

--�������� �񱳿��� ó���ϱ�
--��� �� �μ��� D5�̰� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

--��� �� �μ��� D5�̰ų� ������ 300���� �̻��� ����� �̸�, �μ��ڵ�, ���� ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR SALARY>=3000000;

SELECT * FROM EMPLOYEE
WHERE 1=2;

--��¥�� ��Һ��ϱ�
--��¥�� ��Һ��ҋ��� ���ڷ� ��, ���ڿ� ������ ������.
--�⺻���� ��¥�� ǥ���ϴ� ���ڿ� ���� : YY/MM/DD -> 'YY/MM/DD'
SELECT HIRE_DATE FROM EMPLOYEE;

--�Ի����� 2000�� 01�� 01�� ������ ����� �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01';

--�Ի����� 95�� 01�� 01�� ������ ����� ��ü���� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE HIRE_DATE<'95/01/01';

--Ư�� ������ �ִ� ���� ��ȸ�ϱ�
--��� �� 200���� �̻� 300���� ���� ������ �޴� ����� �����, ����, ���ʽ�, �Ի����� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY<=3000000;

-- ����� �Ի����� 00��01��01���� 02�� 12�� 31�� ������ ��� ��ü ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE HIRE_DATE>='00,01,01' AND HIRE_DATE<='02,12,31';

--������ ���� ��ȸ�Ҷ� BETWEEN AND ������ �̿��ϱ�
--�÷��� BETWEEN �� AND ��;
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

SELECT * FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN'00/01/01' AND '02/12/31' AND DEPT_CODE='D9';

--LIKE������ �̿��ϱ�
--�˻��� ���ڿ� �������� �˻��ϴ� ���->�κ���ġ, ���Կ���, ���ϴ� ���ڿ� ���� �˻�
--���ڿ� ������ ��Ÿ����  ��ȣ
-- % : ���ڰ� 0���̻� �ƹ����ڳ� ����Ҷ� ���
-- ��) %��% : ��, �Ѱ�, �ΰ�, �θ���, �Ѱ��ٸ�, �������� -> ���� ���ԵǾ��ִ� ���ڿ�
--     %�� : ������ ������ ��
--     ��% : ������ �����ϴ� ��
-- _ : ���ڰ� 1�� �ƹ����ڳ� ����Ҷ� ���
--��)_��_: �߰��� ���� �ִ� ������
--  _�� : ������ ������ �α���
--  ��_ : ������ �����ϴ� �α���
--  _��% : �α��� �̻��� �ι�° �ڸ��� ���� �����ϴ� ����
-- �÷��� LIKE '����';

-- ��� �� �������� ���� ����� �̸�, ����, �μ��ڵ带 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE
WHERE EMP_NAME LIKE '��__';

--�̸��� �ּҿ� yo�� �����ϰ� �ִ� ����� �����, �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';

--�̸��� �ּҿ� j�� �����ϰ� �������� ���� ��� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '��__';

--LIKE�� ��ġ���� �ʴ� ��� ã��
--NOT����������
--�达�� �ƴ� ����� ã��
SELECT * FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';

--�̸��� �ּҿ� _�ձ��ڰ� 3������ ����� ����� �̸��� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE EMAIL LIKE '___\_%' ESCAPE '\';

--NULL���� ��ȸ�ϱ�
--NULL-> ������, �ƹ��ǹ� ���� �� -> ������ �Ұ���
--����Ŭ�� �����ϴ� NULL�񱳿����ڸ� ���
--IS NULL, IS NOT NULL
--���ʽ��� ���� �ʴ� ��� ��ȸ�ϱ�
SELECT EMP_NAME,BONUS FROM EMPLOYEE
--WHERE BONUS=NULL;
WHERE BONUS IS NULL;

--���ʽ��� �ް��ִ� ����� �̸�, ���ʽ��� ��ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

--��ȸ�� �÷����� NULL�϶� ��ü�ϱ�
--NVL(�÷���,��ü��)�Լ��� �̿�
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE,'����')FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

--���߰� ������ϱ�
--IN/NOT IN : �������� ���� OR�� �����ؼ� ������Ҷ� ����ϴ� ������
--����� �μ��ڵ尡 D5,D6,D7,D8�� ������ϱ�
SELECT * FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6' OR DEPT_CODE='D7' OR DEPT_CODE='D8';
WHERE DEPT_CODE IN ('D5','D6','D7','D8');

--����������
--SELECT EMP_NAME, DEPT_CODE
--FROM EMPLOYEE
--WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���' OR DEPT_TITLE LIKE '%�ؿ�');

--������ �켱����
--��å�� J7�̰ų� J2�� ��� �� �޿��� 200���� �̻��� ����� ��ȸ�ϱ�
--�̸�, ����, ��å�ڵ�
SELECT EMP_NAME, SALARY, JOB_CODE FROM EMPLOYEE
WHERE  JOB_CODE IN('J7','J2') AND SALARY>=2000000; 

--����Ŭ���� �����ϴ� �Լ��� ���� �˾ƺ���
--�������Լ� : ���̺��� ��� �࿡ ����� ��ȯ�Ǵ� �Լ�
--           ����, ����, ��¥, ����ȯ, �����Լ�(����Ȱ��)          
--�׷��Լ� : ���̺� �Ѱ��� ����� ��ȯ�Ǵ� �Լ�
--          �հ� ��� ���� �ִ밪 �ּҰ�

--������ �Լ� Ȱ���ϱ�
--����ϴ� ��ġ
--SELCECT���� �÷��� �ۼ��ϴ� �κ�, WHERE��
--INSERT, UPDATE, DELETE������ ����� ����

--���ڿ� �Լ��� ���� �˾ƺ���
--���ڿ��� ó���ϴ� ���
--LENGTH : ������ �÷��̳�, ���ͷ����� ���� ���̸� ������ִ� �Լ�
--LENGTH('���ڿ�')||(�÷���) -> ���ڿ��� ������ ���
SELECT LENGTH('���� ������ ������')FROM DUAL;
SELECT LENGTH(EMAIL) FROM EMPLOYEE;

--�̸����� 16���� �̻��� ����� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL) FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

--LENGTHB : �����ϴ� BYTE�� ���
--EXPRESS�������� �ѱ��� 3BYTE�� ó����, ENTERPRISE����������  2BYTE�� ó��
SELECT LENGTHB('ABCD'), LENGTHB('������') FROM EMPLOYEE;

--INSTR : �ڹ��� INDEXOF�� ������ ���
--INSTR('���ڿ�')||(�÷�), 'ã�� ����'{,������ġ, ã����°(Ƚ��)}
SELECT INSTR('GD��ī����','G'),INSTR('GD��ī����','��'),INSTR('GD��ī����','��') FROM DUAL;
SELECT EMAIL, INSTR(EMAIL,'j') FROM EMPLOYEE;

--�̸��� �ּҿ� j�� ���ԵǾ� �ִ� ��� ã��
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE INSTR(EMAIL,'j')>0;

SELECT INSTR('GD��ī���� GD������ GD���� GDȭ����','GD'),
        INSTR('GD��ī���� GD������ GD���� GDȭ����','GD',3),
        INSTR('GD��ī���� GD������ GD���� GDȭ����','GD',-1),
        INSTR('GD��ī���� GD������ GD���� GDȭ����','GD',1,3) FROM DUAL;

--������̺��� @�� ��ġ�� ã��
SELECT INSTR(EMAIL,'@')FROM EMPLOYEE;

--LPAD/RPAD : ���ڿ��� ���̰� ������ ���̸�ŭ ���� �ʾ����� ������� ä���ִ� �Լ�
--LPAD/RPAD(���ڿ�||�÷�,�ִ����,��ü����)
SELECT LPAD('������',10,'*'),RPAD('������',10,'@'),LPAD('������',10) FROM DUAL;
SELECT EMAIL, RPAD(EMAIL,20,'#')FROM EMPLOYEE;

--LTRIM/RTRIM : ������ �����ϴ� �Լ�, Ư�� ���ڸ� �����ؼ� ����
--LTRIM/RTRIM('���ڿ�'||�÷�,['Ư������'])
SELECT '           ����',LTRIM('           ����'),RTRIM('          ����       ')
,RTRIM('   ��   ��  ') FROM DUAL;

--Ư�����ڸ� �����ؼ� ������ �� �ִ�.
SELECT '����2222', RTRIM('����2222','2'), RTRIM('����221223','123') FROM DUAL;

--TRIM : ���ʿ� �ִ� ���� �����ϴ� �Լ�, �⺻ : ����, �����ϸ� �������� ����(�ѱ��ڸ�)
--TRIM(���ڿ�||�÷�)
--TRIM((LEADING||TRAILING||BOTH '�����ҹ���' FROM ���ڿ�||�÷���)
SELECT '     ������    ', TRIM('     ������    '),'ZZZZZ��¡��ZZZZZ',TRIM('Z' FROM 'ZZZZZ��¡��ZZZZZ') ,
   TRIM(LEADING 'Z' FROM 'ZZZZZ��¡��ZZZZZ'),
   TRIM(TRAILING 'Z' FROM 'ZZZZZ��¡��ZZZZZ'),
   TRIM(BOTH 'Z' FROM 'ZZZZZ��¡��ZZZZZ') FROM EMPLOYEE;

--SUBSTR : ���ڿ��� �߶󳻴� ��� * JAVA SUBSTRING�޼ҵ�� ����
--SUBSTR : (���ڿ�||�÷���,�����ε�����ȣ[,����])
SELECT SUBSTR('SHOWMETHEMONEY',5), SUBSTR('SHOWMETHEMONEY',5,2)
,SUBSTR('SHOWMETHEMONEY',INSTR('SHOWMETHEMONEY','MONEY'))
,SUBSTR('SHOWMETHEMONEY',-5,2) FROM DUAL;

--����� �̸��Ͽ��� ���̵𰪸� ����ϱ�
--���̵� 7���� �̻��� ����� ��ȸ
SELECT EMP_NAME, EMAIL, SUBSTR (EMAIL,1,INSTR(EMAIL,'@')-1) FROM EMPLOYEE
--WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;
WHERE EMAIL LIKE '_______@%';

--����� ������ ǥ���ϴ� ��ȣ�� ����ϱ�
--���� ����� ��ȸ
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO,8,1) FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN(2,4);

--�����ڸ� ó���ϴ� �Լ� : UPPER, LOWER, INITCAP
SELECT UPPER('Welcome TO oRACLE worLd'),
LOWER('Welcome TO oRACLE worLd'),
INITCAP('Welcome TO oRACLE worLd') FROM DUAL;

--CONCAT : ���ڿ��� �������ִ� �Լ�
--||������ �� ����
SELECT EMP_NAME||EMAIL, CONCAT(EMP_NAME, EMAIL), CONCAT(CONCAT(EMP_NAME, EMAIL),SALARY) FROM EMPLOYEE;

--REPLACE : �����ġ(�÷�)���� �������ڸ� ã�Ƽ� Ư�����ڷ� �����ϴ� ��
--REPLACE(���ڿ�||�÷���,'ã������','��ü����')
SELECT EMAIL, REPLACE(EMAIL,'BS','GD') FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMAIL=REPLACE(EMAIL,'BS','GD');
--SELECT EMAIL FROM EMPLOYEE;
--ROLLBACK;

--REVERSE : ���ڿ��� �Ųٷ� ������ִ� ���
SELECT EMAIL, REVERSE(EMAIL), EMP_NAME, REVERSE(EMP_NAME), REVERSE(REVERSE(EMP_NAME)) FROM EMPLOYEE;

--TRANSLATE : ��Ī�Ǵ� ���ڷ� �������ִ� �Լ�
SELECT TRANSLATE('010-3644-6259','0123456789','�����̻�����ĥ�ȱ�') FROM DUAL;

--���� ó���Լ�
--ABS : ���밪�� ó���ϴ� �Լ�
SELECT ABS(-10), ABS(10) FROM DUAL;

--MOD : �������� ���ϴ� �Լ� * �ڹ��� %�����ڿ� ������ �Լ�
SELECT MOD(3,2) FROM DUAL;
SELECT E.*, MOD(SALARY,3) FROM EMPLOYEE E;

--�Ҽ����� ó���ϴ� �Լ�
--ROUND : �Ҽ����� �ݿø��ϴ� �Լ�
--ROUND(����||�÷���[,�ڸ���])
SELECT 126.567, ROUND(126.567), ROUND(126.467), ROUND(126.567,1) FROM DUAL;

--���ʽ��� ������ ���ޱ��ϱ�
SELECT EMP_NAME,SALARY,SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03),ROUND(SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03)) FROM EMPLOYEE;

--FLOOR : �Ҽ����ڸ� ����
SELECT 126.567, FLOOR(126.567)FROM DUAL;

--TRUNC : �Ҽ��� �ڸ� ���� �ڸ����� ����
SELECT 126.567, TRUNC(126.567), TRUNC(126.567,2),TRUNC(126.567,-2)
,TRUNC(2123456.32,-2) FROM DUAL;

--CEIL : �Ҽ��� �ø�
SELECT 126.567, CEIL(126.567), CEIL(126.111) FROM EMPLOYEE;

--��¥ó���Լ� �̿��ϱ�
--����Ŭ���� ��¥�� ����Ҷ��� �ΰ��� ����� ����
--1.SYSDATE����� -> ��¥ ��/��/�� ���� ��¥(����Ŭ�� ��ġ�Ǿ��ִ� ��ǻ���� �ð�)�� �������.
--2.SYSTIMESTAMP����� -> ��¥,�ð����� �������
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;

--��¥�� ������� ó���� ������, +,- ���갡�� -> �ϼ��� ����, �߰���.
SELECT SYSDATE, SYSDATE-2, SYSDATE+3, SYSDATE+30 FROM DUAL;

--NEXT_DAY : �Ű������� ���޹��� ���� �� ���� ����� ���� ��¥ ���
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��'),NEXT_DAY(SYSDATE,'��') FROM DUAL;

--LOCALE�� ���� ������ ����
SELECT * FROM V$NLS_PARAMETERS;
ALTER SESSION SET NLS_LANGUAGE="AMERICAN";
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MON'),NEXT_DAY(SYSDATE,'WED') FROM DUAL;
ALTER SESSION SET NLS_LANGUAGE="KOREAN";

--LAST_DAY : �� ���� ������ ���� ���
SELECT SYSDATE, LAST_DAY(SYSDATE), LAST_DAY(SYSDATE+30) FROM DUAL;

--ADD_MONTHS : �������� ���ϴ� �Լ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE,10) FROM DUAL;

-- MONTH_BETWEEN : �ΰ��� ��¥�� �޾Ƽ� �� ��¥�� �������� ������ִ� �Լ�
SELECT FLOOR(MONTHS_BETWEEN('23/08/17',SYSDATE)) FROM DUAL;

--��¥�� ����, ��, ���ڸ� ���� ����� �� �ִ� �Լ�
--EXTRACT(YEAR||MONTH||DAY FROM ��¥) : ���ڷ� �������.
--���糯¥�� ��, ��, �� ����ϱ�
SELECT EXTRACT (YEAR FROM SYSDATE) AS ��, EXTRACT(MONTH FROM SYSDATE) AS ��, EXTRACT(DAY FROM SYSDATE)AS �� FROM DUAL;

--����� 12���� �Ի��� ������� ���Ͻÿ�.
SELECT * FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12;

SELECT EXTRACT(DAY FROM HIRE_DATE)+100 FROM EMPLOYEE;

--���뺹���Ⱓ�� 1�� 6����, �������ڸ� ���ϰ�, ���������� �Դ� «���(�Ϸ缼��)�� ���ϱ�
SELECT ADD_MONTHS(SYSDATE,18) AS ��������, (ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS «��� FROM DUAL;

--����ȯ �Լ�
--����Ŭ������ �ڵ�����ȯ�� �� �۵�����.
--����Ŭ �����͸� �����ϴ� Ÿ���� ����.
--���� : CHAR, VARCHAR2, NCHAR, NVARCHAR2 -> JAVA String�� ����
--���� : NUMBER, 
--��¥ : DATE, TIMESTAMP

--TO_CHAR : ����, ��¥�� ���������� �������ִ� �Լ�
--��¥�� ���������� �����ϱ�
--��¥���� ��ȣ�� ǥ���ؼ� ���������� ������ �Ѵ�.
--Y : ��, M : ��, S : ��, H : ��, MI : ��, SS : ��
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YYYY.MM.DD'), TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH:MI:SS') FROM EMPLOYEE;

--���ڸ� ���������� �����ϱ�
--���Ͽ� ���缭 ��ȯ -> �ڸ����� ��� ǥ������ ����
--0 : ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ���� ������, ���� ���� �ڸ��� 0�� ǥ���ϴ� ����
--9 : ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ���� ������, ���� ���� �ڸ��� �����ϴ� ����
--��ȭ�� ǥ���ϰ� �������� L�� ǥ��
SELECT 1234567, TO_CHAR(1234567,'000,000,000'),TO_CHAR(1234567,'999,999,999')
,TO_CHAR(500,'L999,999') FROM DUAL;

SELECT 180.5, TO_CHAR(180.5,'000,000,00'),TO_CHAR(180.5,'FM999,999,00') FROM DUAL;

--������ ��ȭǥ���ϰ� ,�� �����ؼ� ����ϰ� �Ի����� 0000.00.00���� ����ϱ�
SELECT TO_CHAR(SALARY,'L999,999,999'), TO_CHAR(HIRE_DATE,'YYYY,MM.DD') FROM EMPLOYEE;

--���������� �����ϱ�
--TO_NUMBER�Լ��� �̿�
--���ڸ� ���������� �����ϱ�
SELECT 1000000+1000000,TO_NUMBER('1,000,000','999,999,999')+1000000 ,
TO_CHAR(TO_NUMBER('1,000,000','999,999,999')+1000000,'FML999,999,999') FROM DUAL;

-- ��¥������ �����ϱ�
-- ���ڸ� ��¥�� ����
-- �����̸� ��¥�� ����
SELECT TO_DATE('23/12/25','YY/MM/DD')-SYSDATE, TO_DATE('241225','YYMMDD') ,
TO_DATE('25-12-25','YY-MM-DD') FROM DUAL;

SELECT TO_DATE(20230405,'YYYYMMDD'), TO_DATE(230505,'YYMMDD'),TO_DATE(TO_CHAR(000224,'000000'),'YYMMDD') FROM DUAL;

--NULL���� ó�����ִ� �Լ�
--NVL�Լ� : NVL(�÷�,��ü��)
--NVL2�Լ� : NVL2(�÷�,NULL�ƴҶ�, NULL�϶�)
SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE,'����'), NVL2(DEPT_CODE,'����','����') FROM EMPLOYEE;

--���ǿ� ���� ����� ���� �������ִ� �Լ�
--1. DECODE
--DECODE(�÷���||���ڿ�,'����','��ü��','����','��ü��2'.....)
--�ֹι�ȣ���� 8��°�ڸ��� ���� 1�̸� ����, 2�̸� ���ڸ� ��� �÷� �߰��ϱ�
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','����','2','����') AS GENDER FROM EMPLOYEE;

--�� ��å�ڵ��� ��Ī�� ����ϱ�
--J1 ��ǥ, J2 �λ���, J3 ����, J4 ����
SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE,'J1','��ǥ','J2','�λ���','J3','����','J4','����','���')FROM EMPLOYEE;

--2. CASE WITH THEN ELSE
--CASE
--      WHEN ���ǽ� THEN ���೻��
--      WHEN ���ǽ� THEN ���೻��
--      ELSE ���೻��
--END

SELECT EMP_NAME, JOB_CODE,
    CASE
        WHEN JOB_CODE ='J1' THEN '��ǥ'
        WHEN JOB_CODE ='J2' THEN '�λ���'
        WHEN JOB_CODE ='J3' THEN '����'
        WHEN JOB_CODE ='J4' THEN '����'
        ELSE '���'
    END AS ��å,
    
    CASE JOB_CODE
        WHEN 'J1' THEN '��ǥ'
        WHEN 'J2' THEN '�λ���'
    END 
FROM EMPLOYEE;

--������ �������� ��׿����ڿ� �߰������� �׿ܸ� ������ ����ϱ�
--������ 400���� �̻��̸� ���
--������ 400�̸� 300�̻��̸� �߰�����
--�������� �׿�

SELECT EMP_NAME, SALARY,
    CASE 
        WHEN SALARY>=4000000 THEN '��׿�����'
        WHEN SALARY>=3000000 THEN '�߰�������'
        ELSE '�׿�'
    END AS ���
FROM EMPLOYEE;        

--������̺��� ���糪�� ���ϱ�
SELECT EMP_NAME, EMP_NO, SUBSTR((EXTRACT(YEAR FROM SYSDATE)-SUBSTR(EMP_NO,1,2)+1),3,2) FROM EMPLOYEE;

insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('251','������','020808-4123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

SELECT * FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMP_NO='320808-1123341' WHERE 

--�׷� �Լ� Ȱ���ϱ�
--���̺��� �����Ϳ� ���� �����ϴ� �Լ��� �հ�, ���, ����, �ִ밪, �ּҰ��� ���ϴ� �Լ�
--�׷��Լ��� ����� �⺻������ �Ѱ��� ���� ������
--�߰� �÷��� �����ϴ� ���� ����
--����
--SUM : ���̺��� Ư���÷��� ���� ���� -> SUM(�÷�(NUMBER))
--AVG : ���̺��� Ư���÷��� ���� ��� -> AVG(�÷�(NUMBER))
--COUNT : ���̺��� ������ �� (ROW��) -> COUNT(*||�÷�) 
--MIN : ���̺��� Ư���÷��� ���� �ּҰ� -> MIN(�÷�)
--MAX : ���̺��� Ư���÷��� ���� �ִ밪 -> MAX(�÷�)

--����� ������ ���հ踦 ���غ���
SELECT TO_CHAR(SUM(SALARY),'999,999,999')FROM EMPLOYEE;

--D5�μ��� ������ ���հ踦 ���غ���
SELECT TO_CHAR(SUM(SALARY),'999,999,999')FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--J3����� �޿� �հ踦 ���Ͻÿ�
SELECT SUM(SALARY) FROM EMPLOYEE
WHERE JOB_CODE='J3';

--��ձ��ϱ� AVG�Լ�
-- ��ü����� ���� ��ձ��ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE;
-- D5�� �޿� ����� ���ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--D5�μ��� �޿��հ�� ��� ���ϱ�
SELECT SUM(SALARY), AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--NULL���� ���ؼ��� ��� ó���� �ɱ� -> NULL���� ������ �����ع���
SELECT SUM(SALARY),AVG(BONUS),AVG(NVL(BONUS,0)) FROM EMPLOYEE;

--���̺��� �����ͼ� Ȯ���ϱ�
SELECT COUNT(*),COUNT(DEPT_CODE) FROM EMPLOYEE;

--D6�μ��� �ο� ��ȸ�ϼ���
SELECT COUNT(DEPT_CODE)FROM EMPLOYEE
WHERE DEPT_CODE='D6';
--400���� �̻� ������ �޴� ��� ��
SELECT COUNT(SALARY) FROM EMPLOYEE
WHERE SALARY>=4000000;
--D5�μ����� ���ʽ��� �ް� �ִ� ����� ����?
SELECT COUNT(BONUS) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--�μ��� D6,D5,D7�� ����� ��, �޿� �հ�, ����� ��ȸ�ϼ���
SELECT COUNT(DEPT_CODE),SUM(SALARY),AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D7');

SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEE;

--GROUP BY �� Ȱ���ϱ�
--�׷��Լ��� ��������� Ư���������� �÷����� ��� ó���ϴ°� -> ���� �׷캰 �׷��Լ��� ����� ��µ�.
--SELECT �÷�
--FROM ���̺��
--[WHERE ���ǽ�]
--[GROUP BY �÷���[,�÷���,�÷���,....]
--[GORUP BY �÷���]

--�μ��� �޿� �հ踦 ���Ͻÿ�.
SELECT DEPT_CODE,SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE;

--��å�� �޿��� �հ�, ����� ���Ͻÿ�
SELECT JOB_CODE,SUM(SALARY),AVG(SALARY) FROM EMPLOYEE
GROUP BY JOB_CODE;

--�μ��� ����� ���ϱ�
SELECT DEPT_CODE,COUNT(*)FROM EMPLOYEE
GROUP BY DEPT_CODE;

--GROUP BY ������ �ټ��� �÷��� ���� �� �ִ�.
SELECT DEPT_CODE, JOB_CODE, COUNT(*) FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

--GROUP BY�� ����� ������ WHERE�� ����� �����ϴ�.
SELECT DEPT_CODE, SUM(SALARY), COUNT(*) FROM EMPLOYEE
WHERE BONUS IS NOT NULL GROUP BY DEPT_CODE;

--�μ��� �ο��� 3���̻��� �μ��� ����ϱ�
SELECT DEPT_CODE, COUNT(*) FROM EMPLOYEE
--WHERE COUNT(*) >=3 
GROUP BY DEPT_CODE
HAVING COUNT(*) >=3;

--��å�� �ο����� 3���̻��� ��å ����ϱ�
SELECT JOB_CODE, COUNT(*) FROM EMPLOYEE
GROUP BY JOB_CODE HAVING COUNT(*)>=3;

--��ձ޿��� 300���� �̻��� �μ� ����ϱ�
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;

--�Ŵ����� �����ϴ� ����� 2���̻��� �Ŵ������̵� ����ϱ�
SELECT MANAGER_ID, COUNT(*) FROM EMPLOYEE
GROUP BY MANAGER_ID HAVING COUNT(*)>=2 AND MANAGER_ID IS NOT NULL;

--����,������ �޿� ����� ���ϰ� �ο����� ���ϱ�
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','����','2','����','4','����'), AVG(SALARY), COUNT(*) FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','����','2','����','4','����'); 