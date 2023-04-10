SELECT * FROM BS.EMPLOYEE;
UPDATE BS.EMPLOYEE SET SALARY=1000000;
ROLLBACK;

CREATE TABLE TEST(
TESTNO NUMBER,
TESTCONTENT VARCHAR2(200)
);

--TCL : 트렌젝션을 컨트롤하는 명령어
--COMMINT : 지급까지 실행한 수정구문(DML)명령어를 모두 DB에 저장
--ROLLBACK : 지금까지 실행한 수정구문(DML)명령어를 모두 취소
--트랜잭션 : 하나의 작업단의 한개 서비스
--트랜잭션의 대상이 되는 명령어 : DML(INSERT, UPDATE, DELETE)

INSERT INTO JOB VALUES('JD','강사');
SELECT * FROM JOB;
COMMIT;

