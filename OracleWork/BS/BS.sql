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

--�� �׷캰 ����� �����踦 �ѹ��� ������ִ� �Լ�
--ROLLUP, CUBE()
--GROUP BY ROLLUP(�÷���)
--GROUP BY CUBE(�÷���)

--�μ��� �޿��հ�� ���հ踦 ��ȸ�ϴ� ����
SELECT SUM(SALARY) FROM EMPLOYEE;

SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL 
GROUP BY ROLLUP(DEPT_CODE);

SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL 
GROUP BY CUBE(DEPT_CODE);

SELECT JOB_CODE, SUM(SALARY) FROM EMPLOYEE
--GROUP BY ROLLUP(JOB_CODE);
GROUP BY CUBE(JOB_CODE);

--ROLLUP,CUBE�Լ��� �μ��� �Ѱ��̻��� �÷��� ���� �� �ִ�.
--ROLLUP : �ΰ��̻��� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ��÷��� �Ұ�, ��ü �Ѱ�
--CUBE : �ΰ��̻� �μ��� ���������� �ΰ� �÷��� ����, ù��° �μ�Ŀ���� �Ұ�, �ι�° �μ�Ŀ���� �Ұ�, ��ü �Ѱ�

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

--�μ���, ��å��, �ѻ���� �ѹ��� ��ȸ�ϱ�
SELECT DEPT_CODE, JOB_CODE, COUNT(*) FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

--GROUPING�Լ��� �̿��ϸ� ������ ����� ���� �б�ó���� �� �� �ִ�.
--ROLLUP, CUBE�� ����� ROW�� ���� �б�ó��
--GROUPING�Լ��� �����ϸ� ROLLUP, CUBE�� ����� ROW 1�� ��ȯ �ƴϸ� 0�� ��ȯ
SELECT COUNT(*), 
    CASE
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '�μ����ο�'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '��å���ο�'
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=0 THEN '�μ�_��å�ο�'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '���ο�'
    END AS ����    
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

--���̺��� ��ȸ�� ������ �����ϱ�
--ORDER BY ������ �����
--SELECT �÷���......
--FROM ���̺��
--(WHERE ���ǽ�)
--(GROUP BY �÷���)
--(HAVING ���ǽ�)
--(ORDER BY �÷���)
--(ORDER BY �÷��� [���Ĺ��(DESC(����),ASC(����, DEFAULT))]

--�̸��� �������� �����ϱ�
SELECT * FROM EMPLOYEE
ORDER BY EMP_NAME;

SELECT * FROM EMPLOYEE
ORDER BY EMP_NAME DESC;

--������ ����������� ����������� �����ϱ�
--�̸�, �޿�, ���ʽ�
SELECT EMP_NAME, SALARY, BONUS FROM EMPLOYEE
ORDER BY SALARY DESC;

--�μ��ڵ带 �������� �������� �����ϰ� ������ ������ ������������ �����ϱ�
SELECT * FROM EMPLOYEE
ORDER BY DEPT_CODE ASC, SALARY DESC, EMP_NAME ASC;

--���������� NULL���� ���� ó��
--BONUS�� ���� �޴� ������� ����ϱ�
SELECT * FROM EMPLOYEE 
--ORDER BY BONUS DESC--NULL���� ���� ����Ѵ�.
--ORDER BY BONUS ASC;--NULL�� ���� ���߿� ����Ѵ�.
--�ɼ��� �����ؼ� NULL�� �����ġ�� ������ �� �ִ�.
--ORDER BY BONUS DESC NULLS LAST;
ORDER BY BONUS ASC NULLS FIRST;

--ORDER BY �������� ��Ī�� ����� �� �ִ�.
SELECT EMP_NAME, SALARY AS ����, BONUS 
FROM EMPLOYEE
ORDER BY ����;

--SELECT���� �̿��ؼ� �����͸� ��ȸ�ϸ� RESULT SET�� ��µǴµ�
--RESULT SET�� ��µǴ� �÷����� �ڵ����� INDEX��ȣ�� 1���� �ο�����
SELECT * FROM EMPLOYEE ORDER BY 9;

--���տ�����
--�������� SELECT���� �Ѱ��� ���(RESULT SET)���� ������ִ� ��
--ù��° SELECT���� �÷����� ���� SELECT���� �÷����� ���ƾ��Ѵ�.
--�� �÷��� ������ Ÿ�Ե� �����ؾ� �Ѵ�.

--UNION : �ΰ� �̻��� SELECT���� ��ġ�� ������
--SELECT �� UNION SELECT��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE DEPT_CODE='D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE DEPT_CODE='D5'
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE
WHERE SALARY>=3000000;

--�� SELECT���� �÷��� ���� �ٸ��� �ȵȴ�.
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
--SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE
--WHERE SALARY>=3000000;

--�ΰ��� SELECT���� �÷��� Ÿ�Ե� ������Ѵ�.
SELECT EMP_ID, EMP_NAME, EMP_NO FROM EMPLOYEE
WHERE SALARY>=3000000;

--�ٸ� ���̺� �ִ� �����͸� ��ġ��
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE, 10 FROM DEPARTMENT;

SELECT EMP_ID, EMP_NAME FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT
UNION
SELECT JOB_CODE, JOB_NAME FROM JOB
MINUS
SELECT EMP_ID,EMP_NAME FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D7');

--GROUPING SET
--���� GROUP BY ���� �ִ� ������ �ϳ��� �ۼ��ϰ� ���ִ� ���
--�μ�, ��å, �Ŵ����� �޿����
SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE, MANAGER_ID;
--�μ�, ��å�� �޿���� 
SELECT DEPT_CODE, JOB_CODE, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;
--�μ�, �Ŵ����� �޿����
SELECT DEPT_CODE, MANAGER_ID, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE, MANAGER_ID;

SELECT DEPT_CODE, MANAGER_ID, AVG(SALARY) FROM EMPLOYEE
GROUP BY GROUPING SETS((DEPT_CODE,JOB_CODE,MANAGER_ID),(DEPT_CODE,JOB_CODE),(DEPT_CODE,MANAGER_ID));

--JOIN�� ���� �˾ƺ���
--�ΰ��̻��� ���̺��� Ư���÷��� �������� �������ִ� ���
--JOIN�� �� ������ ����
--1.INNER JOIN : ���صǴ� ���� ��ġ�ϴ� ROW�� �������� JOIN
--2.OUTER JOIN : �����̵Ǵ� ���� ��ġ���� ���� ROW�� �������� JOIN * ������ �ʿ�

--JOIN�� �ۼ��ϴ� ��� 2����
--1. ����Ŭ ���ι�� : ,�� WHERE���� �ۼ�
--2. ANSI ǥ�� ���ι�� : JOIN, ON||USING ���� ����ؼ� �ۼ�

--EMPLOYEE���̺�� DEPARTMENT���̺� JOIN�ϱ�
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

--����Ŭ ������� JOIN�ϱ�
SELECT * FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;

--ANSI ǥ������ JOIN�ϱ�
SELECT * FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;

--����� ���� �����, �̸���, ��ȭ��ȣ, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL, PHONE, DEPT_TITLE FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

--JOIN �������� WHERE�� ����ϱ�
--�μ��� �ѹ����� ��� �����, ����, ���ʽ�, �μ��� ��ȸ�ϱ�

SELECT EMP_NAME,SALARY,BONUS,DEPT_TITLE FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���';

--JOIN������ GROUP BY �� ����ϱ�
--�μ��� ��ձ޿��� ����ϱ� �μ���, ��ձ޿�
SELECT DEPT_TITLE, AVG(SALARY) FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000;

--JOIN�Ҷ� �����̵Ǵ� �÷����� �ߺ��ȴٸ� �ݵ�� ��Ī�� �ۼ��ؾ��Ѵ�.
--�����, �޿�, ���ʽ�, ��å���� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS, JOB_NAME
FROM EMPLOYEE  E
JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE E.JOB_CODE='J3';

--�ߺ��Ǵ� �÷������� ������ ���� USING�� �̿��� �� �ִ�.
SELECT * FROM EMPLOYEE 
JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE='J3';

SELECT * FROM JOB;

--��å�� ������ ����� �̸�, ��å��, ��å�ڵ�, ������ ��ȸ�ϼ���
SELECT EMP_NAME, JOB_NAME, JOB_CODE, SALARY FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME='����';

SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_CODE IS NULL;

--OUTER JOIN ����ϱ�
--�÷��� ���� ���Ϻ񱳸� ������ ���� ROW�� ������ִ� JOIN
--������ �Ǵ� ���̺�(��絥���͸� �����)�� ����������Ѵ�.
--LEFT OUTER JOIN : JOIN�� �������� ���ʿ� �ִ� ���̺��� �������� ����
--RIGHT OUTER JOIN : JOIN�� �������� �����ʿ� �ִ� ���̺��� �������� ����
--��ġ�Ǵ� ROW�� ���� ��� ����÷��� NULL�� ǥ����.
SELECT * FROM EMPLOYEE LEFT OUTER JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

SELECT * FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

--CROSS JOIN : ��� ROW�� �������ִ� JOIN
SELECT * FROM EMPLOYEE 
CROSS JOIN DEPARTMENT ORDER BY 1;

--SELF JOIN : �Ѱ��� ���̺� �ٸ� �÷��� ���� ������ �ִ� �÷��� �ִ� ��� �� �ΰ� �÷��� �̿��ؼ� JOIN
SELECT * FROM EMPLOYEE;
--�Ŵ����� �ִ� ����� �̸�, �Ŵ��� ���̵�, �Ŵ��� �����ȣ, �Ŵ��� �̸� ��ȸ
SELECT E.EMP_NAME,E.MANAGER_ID,M.EMP_ID,M.EMP_NAME FROM EMPLOYEE E
JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

--����̸�, �Ŵ������̵�, �Ŵ��������ȣ, �Ŵ����̸� ��ȸ
--�Ŵ����� ������ ������ ����ϱ�
SELECT E.EMP_NAME,NVL(E.MANAGER_ID,'����'),NVL(M.EMP_ID,'����'), NVL(M.EMP_NAME,'����') 
FROM EMPLOYEE E 
RIGHT OUTER JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

SELECT E.EMP_NAME,NVL(E.MANAGER_ID,'����'),NVL(M.EMP_ID,'����'), NVL(M.EMP_NAME,'����') 
FROM EMPLOYEE E 
LEFT OUTER JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
--���� ���� ����񱳸� �ؼ� ó����, ON �÷���=�÷���
--�񵿵����ο� ���� �˾ƺ���
--������ ���̺��� �������� �������Ѵ�.
SELECT * FROM SAL_GRADE;

SELECT * FROM EMPLOYEE
JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;
--ȸ����� ����Ʈ����, ��ǰ���(����), ��� ���� ���� ȸ�����

--���������� �� �� �ִ�.
--�����̻��� ���̺��� �����ؼ� ����ϱ�
--����� �����, ��å��, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME,JOB_NAME,DEPT_TITLE FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
JOIN JOB USING(JOB_CODE);

--����� �����, �μ���, ��å��, �ٹ�����(LOCALNAME) ��ȸ�ϱ�
SELECT EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_CODE)
LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
LEFT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;

--�������� : SELECT�� �ȿ� SELECT���� �ϳ� �� �ִ� �������� ����.
-- ���������� �ݵ�� ()�ȿ� �ۼ��� �ؾ��Ѵ�.
--������ ����� ������ �޿��� �ް��ִ� ����� ��ȸ�ϱ�
SELECT SALARY FROM EMPLOYEE
WHERE EMP_NAME='������';
SELECT*FROM EMPLOYEE
WHERE SALARY=2000000;

SELECT * FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������');

--D5�μ��� ��ձ޿� ���� ���� �޴� ������ϱ�
SELECT * FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5');

--1.������ ��������
--�������� SELECT���� ����� 1����, 1������ ��
--�÷�, WHERE���� �񱳴�� ��
--������� �޿� ��պ��� ���� �޿��� �޴� ����� �̸�, �޿�, �μ��ڵ带 ����ϱ�
SELECT EMP_NAME, SALARY, DEPT_CODE, (SELECT AVG(SALARY) FROM EMPLOYEE) AS AVG FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

--�μ��� �ѹ����� ��� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���');

SELECT * FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE
WHERE DEPT_TITLE='�ѹ���';

--��å�� ������ ����� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAME='����');

--2. ������ ��������
--���������� ����� �Ѱ��� �ټ� ��(ROW)�� ���°�
--��å�� ����, ������ ����� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE
WHERE JOB_CODE IN(SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('����','����'));

--�����࿡ ���� ��Һ��ϱ�
-- >=, >, <, <=
SELECT * FROM EMPLOYEE;
--WHERE SALARY >=(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'))
--ANY : OR�� ROW�� ���� 
--ALL : AND�� ROW�� ����
--�÷� >(=) ANY(��������) : ������ ���������� ��� �� �ϳ��� ũ�� �� -> ������ ���������� ��� �� �ּҰ����� ũ�� ��
--�÷� <(=) ANY(��������) : ������ ���������� ��� �� �ϳ��� ������ �� -> ������ ���������� ��� �� �ִ밪���� ������ ��
SELECT * FROM EMPLOYEE
WHERE SALARY >= ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));

--�÷� >(=) ALL(��������) : ������ ���������� ����� ��� Ŭ�� �� -> ������ ���������� ����� �ִ밪���� ũ�� ��
--�÷� <(=) ALL(��������) : ������ ���������� ����� ��� ������ �� -> ������ ���������� ����� �ּҰ����� ������ ��
SELECT EMP_NAME, SALARY FROM EMPLOYEE
WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));
--WHERE SALARY < (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));

--2000�� 1�� 1�� ���� �Ի����� 2000�� 1�� 1�� ���� �Ի��� ��� �� ���� ���� �޴� ������� ���� �޴� ����� �����, �޿� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01' 
AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE HIRE_DATE>'00/01/01');

--���߿� �������� : ���� �ټ�, ���� 1���� ������
--������ ������� ���� �μ�, ���� ���޿� �ش��ϴ� ��� ��ȸ�ϱ�
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE
WHERE ENT_YN='Y'
AND SUBSTR(EMP_NO,8,1)IN(2,4); 

SELECT * FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)IN(2,4)) 
AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)IN(2,4))
AND ENT_YN='N';

SELECT * FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE)
IN (SELECT DEPT_CODE,JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)IN(2,4))
AND ENT_YN='N';

--��� �������̸鼭 �޿��� 200������ ����� �ִٰ� �Ѵ�.
--�׻���� �̸�, �μ���, �޿� ����ϱ�
SELECT EMP_NAME, DEPT_TITLE, SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE (DEPT_TITLE, SALARY)
IN(SELECT DEPT_TITLE,SALARY FROM EMPLOYEE
WHERE DEPT_TITLE='���������' AND SALARY=2000000);

--������ ���߿� ��������
--����� �ѹ����̰� 300���� �̻� ������ �޴� ���
SELECT DEPT_TITLE,SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000;

SELECT * FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN(SELECT DEPT_CODE,SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000);

--������, ��������߿� ���������� �÷����� ������� ����.
--WHERE, FROM���� ���(INLINE VIEW)
SELECT EMP_NAME, (SELECT DEPT_CODE,SALARY FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='�ѹ���' AND SALARY>=3000000) AS TEST FROM EMPLOYEE;

--��� ��������
--���������� �����Ҷ� ���������� ���� ������ ����ϰ� ����
--���������� ���� ���������� ����� ������ �ְ�, ���������� ����� ���������� ������ �ִ� ������
--������ ���� �μ��� ������� ��ȸ�� �ϱ�
--�����, �μ��ڵ�, �����
SELECT EMP_NAME, DEPT_CODE,(SELECT COUNT(*) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) ����� FROM EMPLOYEE E;

--WHERE���� ����������� �̿��ϱ�
--EXISTS(��������) : ���������� ����� 1�� �̻��̸� TRUE, 0���̸� FALSE
SELECT * FROM EMPLOYEE E
--WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE DEPT_CODE='D9');
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

--�ּ� �޿��� �޴� ��� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT SALARY FROM EMPLOYEE WHERE SALARY<E.SALARY);

--������� �����ȣ, �̸�, �Ŵ������̵�. �Ŵ��� �̸� ��ȸ�ϱ�
--���������� Ǯ��
SELECT EMP_ID, EMP_NAME, MANAGER_ID,(SELECT EMP_NAME FROM EMPLOYEE WHERE E.MANAGER_ID=EMP_ID) MANAGER_NAME FROM EMPLOYEE E;

--����� �̸�, �޿�, �μ���,�ҼӺμ� �޿���� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, DEPT_TITLE, (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE WHERE DEPT_CODE=DEPT_ID) �ҼӺμ��޿���� FROM EMPLOYEE E
JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE;

--������ J1�� �ƴ� ����߿��� �ڽ��� �μ��� ��� �޿����� �޿��� ���� �޴� ��� ��ȸ�ϱ�
SELECT * FROM EMPLOYEE E
WHERE JOB_CODE!='J1' AND SALARY<(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE);

--�ڽ��� ���� ������ ��ձ޿����� ���� �޴� ������ �̸�, ��å��, �޿��� ��ȸ�ϱ�
SELECT EMP_NAME, JOB_NAME, SALARY FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE JOB_CODE=E.JOB_CODE);

--FROM���� �������� �̿��ϱ�
--INLINE VIEW
--FROM ���� ����ϴ� ���������� ��κ� ��������߿��������� ���
--RESULT SET�� �ϳ��� ���̺�ó�� ����ϰ� �ϴ� ��
--�����÷��� �����ϰ� �ְų�, JOIN�� ����� SELECT���� ���
--VIEW : INLINE VIEW, STORED VIEW

--EMPLOYEE���̺� ������ �߰��ؼ� ����ϱ�
SELECT  E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') GENDER FROM EMPLOYEE E;

SELECT * FROM EMPLOYEE
WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��')='��';

--INLINE VIEW �̿��ϱ�
SELECT * FROM (
SELECT  E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��') GENDER FROM EMPLOYEE E
)WHERE GENDER='��';

--JOIN, ���տ����� Ȱ��������
SELECT * FROM 
( 
SELECT * FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
JOIN JOB USING(JOB_CODE)
)
WHERE DEPT_TITLE='�ѹ���' AND JOB_NAME='�λ���';

SELECT T.*, T.SALARY*12 AS ���� FROM
(
SELECT E.*,D.*,(SELECT TRUNC(AVG(SALARY),-1) FROM EMPLOYEE
WHERE DEPT_CODE=E.DEPT_CODE) AS DEPT_SAL_AVG FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
) T
WHERE DEPT_SAL_AVG>3000000;

--���տ����� �̿��ϱ�
SELECT * FROM (SELECT EMP_ID AS CODE, EMP_NAME AS TITLE
FROM EMPLOYEE
UNION
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT
UNION
SELECT JOB_CODE, JOB_NAME
FROM JOB
)
WHERE CODE LIKE '%1%';

SELECT * FROM (SELECT ROWNUM AS RNUM,E.*
FROM (SELECT * FROM EMPLOYEE)E);

--ROW�� ������ ���ϰ� ����ϱ�
--TOP-N ����ϱ�
SELECT * FROM EMPLOYEE;

--�޿��� ���� �޴� ��� 1-3�� ���� ����ϱ�

--1. ����Ŭ�� �����ϴ� �����÷� ROWNUM�� �̿��ϱ�
SELECT ROWNUM, E.* FROM EMPLOYEE E
WHERE ROWNUM BETWEEN 1 AND 3
ORDER BY SALARY DESC;

--SELECT���� �����Ҷ����� ROWNUM�� ������ ��
SELECT ROWNUM,T.* 
FROM( 
SELECT ROWNUM AS INNERNUM,E.* FROM EMPLOYEE E
ORDER BY SALARY DESC
)T
WHERE ROWNUM<=3;

SELECT ROWNUM AS RNUM,T.* 
FROM( 
SELECT ROWNUM AS INNERNUM,E.* FROM EMPLOYEE E
ORDER BY SALARY DESC
)T
WHERE ROWNUM BETWEEN 1 AND 10;


SELECT *  
FROM( 
SELECT ROWNUM AS RNUM,T.* FROM (
SELECT * FROM EMPLOYEE
ORDER BY SALARY DESC
)T)
WHERE RNUM BETWEEN 5 AND 10;

--2. RANK_OVER()�Լ� �̿��ϱ�
SELECT * FROM (SELECT EMP_NAME, SALARY, 
RANK()OVER(ORDER BY SALARY DESC) AS NUM,
DENSE_RANK() OVER(ORDER BY SALARY DESC) AS NUM2
FROM EMPLOYEE)
WHERE NUM BETWEEN 5 AND 10;

--��ձ޿��� ���� �޴� �μ� 3�� ����ϱ�
SELECT * FROM(SELECT DEPT_CODE,ROUND(AVG(SALARY)),
RANK()OVER(ORDER BY AVG(SALARY)DESC) AS NUM
FROM EMPLOYEE
GROUP BY DEPT_CODE)
WHERE NUM<4;

--DDL�� ���� �˾ƺ���
--������ ���Ǿ��� ����Ŭ���� ����ϴ� ��ü�� ����, ����, �����ϴ� ��ɾ�
--���� : CREATE ������Ʈ�� ....
--���� : ALTER ������Ʈ�� .....
--���� : DROP ������Ʈ�� ......

--���̺��� �����ϴ� ������� �˾ƺ���...
--���̺� ���� : �����͸� ������ �� �ִ� ������ �����ϴ� ��
--���̺��� �����ϱ� ���ؼ��� ��������� Ȯ���ϴµ� Ȯ���Ҷ� TYPE�� �ʿ��ϴ�.
--����Ŭ�� �����ϴ� Ÿ���� ���� ���� Ÿ�Կ� ���� �˾ƺ���.
--���ڿ�Ÿ�� : CHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB
--������Ÿ�� : NUMBER
--��¥��Ÿ�� : DATE, TIMESTAMP

--������Ÿ�Կ� ���� �˾ƺ���
--CHAR(����) : ������ ���ڿ� ����Ÿ������ ���̸�ŭ ������ Ȯ���ϰ� �����Ѵ�. + �ִ� 2000����Ʈ ���尡��
--VARCHAR2(����) : ������ ���ڿ� ���� Ÿ������ ����Ǵ� �����͸�ŭ ������ Ȯ���ؼ� ����
CREATE TABLE TBL_STR(
 A CHAR(6),
 B VARCHAR(6),
 C NCHAR(6),
 D NVARCHAR2(6)
);

SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('����','����','����','����');
INSERT INTO TBL_STR VALUES('����','����','����','�����ٶ󸶹ٻ�');
INSERT INTO TBL_STR VALUES(1234,'����','����','�����ٶ󸶹�');
SELECT LENGTH(A),LENGTH(B),LENGTH(C),LENGTH(D) FROM TBL_STR; 

--������ �ڷ���
--NUMBER : �Ǽ�, ���� ��� ������ ������.
--������
--NUMBER : �⺻��
--NUMBER(PRECISION, SCALE) : ������ ��������
--PRECISION : ǥ���� �� �ִ� ��ü �ڸ���(1~38)
--SCALE : �Ҽ��������� �ڸ���(-84 ~ 127)
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
INSERT INTO TBL_NUM VALUES(123456.123,12345.123,0,1234567); 
INSERT INTO TBL_NUM VALUES('1234.567','1234.567','1234.567','1234.567');

--��¥
--DATE,TIMESTAMP
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    TODAY TIMESTAMP
);

SELECT * FROM TBL_DATE;
INSERT INTO TBL_DATE VALUES('98/08/03','98/01/26 15:30:30');
INSERT INTO TBL_DATE VALUES(
TO_DATE('98/08/03','YY/MM/DD'),
TO_TIMESTAMP('98/01/26 15:30:30','RR/MM/DD HH24:MI:SS'));

CREATE TABLE TBL_STR2(
    TESTSTR CLOB,
    TESTVARCHAR VARCHAR2(2000)
);
SELECT * FROM TBL_STR2;
INSERT INTO TBL_STR2 VALUES('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','A');