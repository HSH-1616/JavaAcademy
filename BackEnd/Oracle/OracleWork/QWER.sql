SELECT * FROM BS.EMPLOYEE;
UPDATE BS.EMPLOYEE SET SALARY=1000000;
ROLLBACK;

CREATE TABLE TEST(
TESTNO NUMBER,
TESTCONTENT VARCHAR2(200)
);

--TCL : Ʈ�������� ��Ʈ���ϴ� ��ɾ�
--COMMINT : ���ޱ��� ������ ��������(DML)��ɾ ��� DB�� ����
--ROLLBACK : ���ݱ��� ������ ��������(DML)��ɾ ��� ���
--Ʈ����� : �ϳ��� �۾����� �Ѱ� ����
--Ʈ������� ����� �Ǵ� ��ɾ� : DML(INSERT, UPDATE, DELETE)

INSERT INTO JOB VALUES('JD','����');
SELECT * FROM JOB;
COMMIT;

