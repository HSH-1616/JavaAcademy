SELECT * FROM DBA_USERS;
SELECT * FROM TAB;

-- DATABASE사용하기
-- 1. 사용할 계정을 관리자(SYSTEM) 계정으로 생성해줌
--     - 관리자로 접속해서 생성명령어를 이용함.
-- 2. 생성한 계정이 DATABASE를 이용하기 위해서는 권한부여 해줘야 한다.
--    - 관리자로 접속해서 권한 부여명령어를 이용
--    - 부여권한 : 접속할수있는 권한(CONNECT), 사용할 수 있는 권한(RESOURCE)

-- 계정생성하는 명령어
-- CREATE USER 사용자계정명 IDENTIFIED BY 비밀번호 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-- 18C버전부터 사용자계정명에 ##을 붙여서 생성해야 한다.
-- ##안붙일 수 있게 설정하기
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- DB에 등록되어 있는 사용자 조회하기
SELECT * FROM DBA_USERS;

-- 사용자를 생성하더라고 권한이 없으면 DB를 이용할 수 없다.
-- 사용자에게 권한부여하기
-- GRANT 권한 or 롤(역할) TO 사용자계정명
GRANT CONNECT TO BS;
-- 테이블을 이용할 수 있는 권한을 부여하기
GRANT RESOURCE TO BS;

GRANT CONNECT, RESOURCE TO BS;

-- BS계정에서 SQL문 실행해보기
SELECT * FROM TAB; --계정에서 이용하고 있는 테이블을 조회하는 명령어
CREATE TABLE TEST(
    TEST VARCHAR2(200)
);

-- USER01/USER01라는 계정을 생성하고 접속하고 아래 명령어 실행하기
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

-- 기본실습 DB에 대해 알아보자.
-- 사원, 부서, 직책, 근무지, 급여수준, 근무지별 국가
-- 사원테이블의 정보확인하기
SELECT * FROM EMPLOYEE;
-- 부서테이블의 정보확인하기
SELECT * FROM DEPARTMENT;
-- 직책에 대한 정보확인하기
SELECT * FROM JOB;
-- 부서별 근무지
SELECT * FROM LOCATION;
-- 근무지역 국가별정보
SELECT * FROM NATIONAL;
-- 급여수준
SELECT * FROM SAL_GRADE;

-- SELECT문을 활용하기
-- 기본문법
-- SELECT 컬럼명,컬럼명.... OR *
-- FROM 테이블명;

-- SELECT문을 이용해서 EMPLOYEE테이블 조회하기
SELECT EMP_NAME, EMP_NO, EMAIL, PHONE
FROM EMPLOYEE;
-- SELECT문을 이용해서 EMPLOYEE테이블의 전체 컬럼 조회하기
SELECT *
FROM EMPLOYEE;

-- 전체 사원의 이름, 월급, 보너스 입사일을 조회하기
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE;

-- 모든 내용을 확인할때는 SELECT문을 이용함.
-- SELECT문을 이용해서 산술연산처리하기
-- +,-,*,/(사칙연산) -> 피연산자 리터럴, 컬럼값
SELECT 10+20, 10-20, 20/3, 5*4
FROM DUAL;

-- 리터럴, 컬럼 연산
-- 전체사원의 급여에 100 더하기
SELECT EMP_NAME, SALARY+100, SALARY
FROM EMPLOYEE;

-- 컬럼, 컬럼 연산
SELECT EMP_NAME, SALARY+BONUS
FROM EMPLOYEE;
-- NULL값과 연산은 불가능하다 -> 결과가 무조건 NULL로 출력됨.
SELECT SALARY, BONUS
FROM EMPLOYEE;

-- 산술연산은 숫자형만 가능하다.
-- 오라클에서 문자열 리터럴은 ''을 사용한다.
SELECT '이제 점심먹자'+100
FROM DUAL;

SELECT EMP_NAME, SALARY, BONUS, 10+30
FROM EMPLOYEE;

-- 사원테이블에서  사원명, 부서코드, 월급, 연봉 조회하기
SELECT EMP_NAME, DEPT_CODE, SALARY, SALARY*12
FROM EMPLOYEE;
-- 사원테이블에서  사원명, 부서코드, 월급, 보너스가 포함된 연봉 조회하기
SELECT EMP_NAME,DEPT_CODE, SALARY, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;

-- 테이블에 존재하는 컬럼만 조회가 가능하다
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE;
--SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;
-- 조회된 컬럼에 별칭을 부여할 수 있다. -> 가상컬럼에 많이 사용
-- AS 예약어를 사용한다.
-- 예) SELECT EMP_NAME AS 사원명 FROM EMPLOYEE
SELECT EMP_NAME AS 사원명, SALARY AS 월급, EMAIL AS 이메일
FROM EMPLOYEE;
-- AS 를 생략하고 띄어쓰기로 부여할 수 있다.
SELECT EMP_NAME 사원명, SALARY 월급, EMAIL 이메일
FROM EMPLOYEE;

-- 별칭에 띄어쓰기, 특수기호가 가능하니?
SELECT EMP_NAME AS "사 원 명", SALARY AS "$월$급"
FROM EMPLOYEE;


-- 조회되는 데이터의 중복을 제거해주는 명령어 : DISTINCT
-- 컬럼명 앞에 사용, SELECT문의 맨 앞에 작성
-- SELECT DISTINCT 컬럼명[,컬럼명...] FROM 테이블명
SELECT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
-- SELECT EMP_NAME, DISTINCT DEPT_CODE FROM EMEPLOYEE;
SELECT DISTINCT DEPT_CODE, EMP_NAME FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;

-- 오라클에서 문자열을 연결해주는 연산자 -> ||
SELECT '점심'+'맛있다' 
FROM DUAL;

SELECT '점심'||'맛없다 FEAT 반장'
FROM DUAL;
-- || 연산은 컬럼을 합쳐서 출력할때도 사용한다.
SELECT EMP_NAME||EMP_NO||EMAIL AS INFO
FROM EMPLOYEE;
SELECT EMP_NAME||SALARY||BONUS
FROM EMPLOYEE;

SELECT EMP_NAME||'님의 월급은 '||SALARY||' 보너스'||BONUS
FROM EMPLOYEE;

-- 원하는 ROW(DATA)만 출력하기
-- 지정한 조건에 맞는 데이터만 가져오기
-- WHERE 조건식 이용한다.
-- 사용방식
-- SELECT 컬럼, 컬럼...... OR *
-- FROM 테이블명
-- WHERE 조건식

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D9';
-- 사원 중 월급이 200만원이상인 사원을 조회하기
SELECT * 
FROM EMPLOYEE
WHERE SALARY>=2000000;

-- 사원 중 직책이 J2가 아닌 사원 조회하기
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE != 'J2';

-- 여러개의 비교연산 처리하기
-- 사원 중 부서가 D5이고 월급이 300만원 이상인 사원의 이름, 부서코드, 월급 조회하기
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- 사원 중 부서가 D5이거나 월급이 300만원 이상인 사원의 이름, 부서코드, 월급 조회하기
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR SALARY>=3000000;

SELECT * 
FROM EMPLOYEE
WHERE 1=2;

-- 날짜를 대소비교하기
-- 날짜를 대소비교할때는 문자로 비교, 문자열 패턴을 맞춰줌.
-- 기본적이 날짜를 표시하는 문자열 패턴 : YY/MM/DD -> 'YY/MM/DD'
SELECT HIRE_DATE 
FROM EMPLOYEE;
-- 입사일이 2000년 01월 01일 이전이 사원의 이름, 입사일을 조회하기
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01';

-- 입사일이 95년 01월 01일이전인 사원의 전체내용 조회하기
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE < '95/01/01';

-- 특정 범위에 있는 값을 조회하기
-- 사원 중 월급 200만원이상 300만원 이하 월급을 받는 사원의 사원명, 월급, 보너스, 입사일을 조회하기
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY <=3000000;
-- 사원중 입사일이 00년01월01부터 02년12월31일 까지인 사원 전체 조회하기
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE>='00/01/01' AND HIRE_DATE<='02/12/31';

-- 범위의 값을 조회할때 BETWEEN AND 연산을 이용하기
-- 컬럼명 BETWEEN 값 AND 값 ;
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '00/01/01' AND '02/12/31' AND DEPT_CODE ='D9';

-- LIKE연산자 이용하기
-- 검색을 문자열 패턴으로 검색하는 기능 -> 부분일치, 포함여부, 원하는 문자열패턴검색
-- 문자열 패턴을 나타내는 기호
-- % : 문자가 0개이상 아무문자나 허용할때 사용
-- 예)  %강% : 강 o, 한강, 두강, 두만강, 한강다리, 강강술래 -> 강이 포함되어있는 문자열
--      %강 : 강으로 끝나는 말
--      강% : 강으로 시작하는 말
-- _ : 문자가 1개 아무문자나 허용할때 사용
-- 예) _강_ : 중간에 강이 있는 세글자
--    _강 : 강으로 끝나는 두글자
--    강_ : 강으로 시작하는 두글자
--    _강% : 두글자 이상의 두번째자리에 강을 포함하는 문자
-- 컬럼명 LIKE '패턴';

-- 사원 중 유씨성을 가진 사원의 이름, 월급, 부서코드를 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '유__';

-- 이메일 주소에 yo를 포함하고 있는 사원의 사원명, 이메일 조회하기
SELECT EMP_NAME, EMAIL 
FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';

-- 이메일주소에 j를 포함하고 유씨성을 가진 사원 조회하기
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '유__'; 

-- LIKE에 일치하지 않는 사원 찾기
-- NOT부정연산사용
-- 김씨가 아닌 사원들 찾기
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '김%';

-- 이메일주소에 _앞글자가 3글자인 사원의 사원명 이메일 조회하기
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___*_%' ESCAPE '*';

-- NULL값을 조회하기
-- NULL -> 쓰레기, 아무의미없는 값 -> 연산이 불가능
-- 오라클리 제공하는 NULL비교연산자를 사용
-- IS NULL, IS NOT NULL
-- 보너스를 받지 않는 사원조회하기
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
--WHERE BONUS='(null)';
WHERE BONUS IS NULL;

-- 보너스를 받고있는 사원의 이름, 보너스를 조회하기
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


-- 조회된 컬럼값이 NULL일때 대체하기
-- NVL(컬럼명,대체값)함수를 이용
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE,'인턴') AS DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;
--CREATE TABLE NAMETEST(
--    NAME2 VARCHAR2(200),
--    AGE NUMBER
--);
--
--INSERT INTO NAMETEST VALUES('유병승', 19);
--
--SELECT * FROM NAMETEST
--WHERE NAME2 NOT LIKE '%유%' OR NAME2 IS NULL;
--
--DROP TABLE NAMETEST;

-- 다중값 동등비교하기
-- IN / NOT IN : 여러개의 값을 OR로 연결해서 동등비교할때 사용하는 연산자
-- 사원 중 부서코드가 D5,D6,D7,D8인  사원구하기
SELECT * 
FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6' OR DEPT_CODE='D7' OR DEPT_CODE='D8';
WHERE DEPT_CODE NOT IN ('D5','D6','D7','D8');

-- 서브쿼리문
--SELECT EMP_NAME, DEPT_CODE
--FROM EMPLOYEE
--WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='총무부' OR DEPT_TITLE LIKE '%해외%');

-- 연산자 우선순위
-- 직책이 J7이거나  J2인 사원 중 급여가 200만원이상인 사원을 조회하기
-- 이름, 월급, 직책코드
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J2') AND SALARY>=2000000;

--SCOTT/TIGER 계정을 생성 후 SCOTT_EN 테이블 추가

-- 1. 오라클을 설치한다. 
-- 2. SQLDEVELOPER압축 푼다 -> EXE파일 실행
-- 3. SYSTEM계정 접속생성하기 ->> DBA
-- 4. BS/BS 계정 생성, 권한 부여
-- 5. BS접속 생성하기 
-- 6. BS계정에서 BS.sql 스크립트실행하기
-- 7. BS계정에서 작업하기
-- 8. system계정으로 접속
-- 9. scott/tiger계정 생성 및 권한부여
-- 10. scott접속 생성
-- 11. scott 계정에서 scott_en.sql파일 실행

-- 오늘날짜를 출력할 수 있음 
--SYSDATE
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE-10 FROM DUAL;
SELECT SYSDATE-HIRE_DATE
FROM EMPLOYEE;


-- 오라클에서 제공하는 함수에 대해 알아보자
-- 단일행함수 : 테이블의 모든 행에 결과가 반환되는 함수
--              문자, 숫자, 날짜, 형변환, 선택함수(조건활용)
-- 그룹함수 : 테이블에 한개의 결과가 반환되는 함수
--           합계 평균 갯수 최대값 최소값

-- 단일행 함수 활용하기
-- 사용하는 위치
-- SELECT문의 컬럼을 작성하는 부분, WHERE절
-- INSERT, UPDATE, DELETE문에서 사용이 가능

-- 문자열함수에 대해 알아보자
-- 문자열을 처리하는 기능
-- LENGTH : 지정된컬럼이나, 리터럴값에 대한 길이를 출력해주는 함수
-- LENGTH('문자열'||컬럼명) -> 문자열의 갯수를 출력
SELECT LENGTH('오늘 월요일 힘내요!')
FROM DUAL;
SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- 이메일이 16글자 이상인 사원을 조회하기
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

-- LENGTHB : 차지하는 BYTE를 출력
-- EXPRESS버전에서 한글을 3BYTE로 저장함. ENTERPRISE버전에서는 2BYTE
SELECT LENGTHB('ABCD'), LENGTHB('월요일')
FROM EMPLOYEE;

-- INSTR : JAVA의 INDEXOF와 유사한 기능함.
-- INSTR('문자열'||컬럼,'찾을 문자'[,시작위치 ,찾을번째(횟수])
SELECT INSTR('GD아카데미','GD'), INSTR('GD아카데미','아'), INSTR('GD아카데미','병')
FROM DUAL;

SELECT EMAIL, INSTR(EMAIL,'j')
FROM EMPLOYEE;

-- EMAIL주소에 j가 포함되어있는 사원찾기
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE INSTR(EMAIL,'j')>0;

SELECT INSTR('GD아카데미 GD게임즈 GD음악사 GD화이팅','GD'),
       INSTR('GD아카데미 GD게임즈 GD음악사 GD화이팅','GD',3),
       INSTR('GD아카데미 GD게임즈 GD음악사 GD화이팅','GD',-1),
       INSTR('GD아카데미 GD게임즈 GD음악사 GD화이팅','GD',1,3)
FROM DUAL;

-- 사원테이블에서 @의 위치를 찾기
SELECT EMP_NAME, EMAIL, INSTR(EMAIL,'@')
FROM EMPLOYEE;

-- LPAD/RPAD : 문자열의 길이가 지정한 길이만큼 차지 않았을때 빈공백을 채워주는 함수
-- LPAD/RPAD(문자열||컬럼,최대길이,대체문자)
SELECT LPAD('유병승',10,'*'),RPAD('유병승',10,'@'), LPAD('유병승',10)
FROM DUAL;

SELECT EMAIL, RPAD(EMAIL,20,'#')
FROM EMPLOYEE;

-- LTRIM/RTRIM : 공백을 제거하는 함수, 특정문자를 지정해서 삭제
-- LTRIM/RTRIM('문자열'||컬럼[,'특정문자'])
SELECT '      병승', LTRIM('      병승'), RTRIM('     병승     '), RTRIM('    병   승    ')
FROM DUAL;
-- 특정문자를 지정해서 삭제할 수 있다.
SELECT '병승2222', RTRIM('병승2222','2'), RTRIM('병승22122','2'),
        RTRIM('병승22122','12')
FROM DUAL;

-- TRIM : 양쪽에 있는 값을 제거하는 함수, 기본 : 공백, 설정하면 설정값을 제거(한글자만)
-- TRIM(문자열||컬럼)
-- TRIM(LEADING||TRAILING||BOTH '제거할문자' FROM 문자열||컬럼명)

SELECT '     월요일     ', TRIM('     월요일     '),
        'ZZZZZZ마징가ZZZZZ', TRIM('Z' FROM 'ZZZZZZ마징가ZZZZZ'),
        TRIM(LEADING 'Z' FROM 'ZZZZZZ마징가ZZZZZ'),
        TRIM(TRAILING 'Z' FROM 'ZZZZZZ마징가ZZZZZ'),
        TRIM(BOTH 'Z' FROM 'ZZZZZZ마징가ZZZZZ')
FROM EMPLOYEE;


-- SUBSTR : 문자열을 잘라내는기능 * JAVA SUBSTRING메소드와 동일
-- SUBSTR(문자열||컬럼명,시작인덱스번호[,길이])
SELECT SUBSTR('SHOWMETHEMONEY',5),SUBSTR('SHOWMETHEMONEY',5,2),
        SUBSTR('SHOWMETHEMONEY',INSTR('SHOWMETHEMONEY','MONEY')),
        SUBSTR('SHOWMETHEMONEY',-5,2)
FROM DUAL;

-- 사원의 이메일에서 아이디값만 출력하기
-- 아이디가 7글자이상인 사원만 조회
SELECT EMP_NAME,EMAIL, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)
FROM EMPLOYEE 
--WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;
WHERE EMAIL LIKE '_______@%';
-- 사원의 성별을 표시하는 번호를 출력하기
-- 여자사원만 조회
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO,8,1)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN (2,4);

-- 영문자를 처리하는 함수 : UPPPER, LOWER, INITCAP
SELECT UPPER('Welcome to oRACLE worLd'),
    LOWER('Welcome to oRACLE worLd'),
    INITCAP('Welcome to oRACLE worLd')
FROM DUAL;

-- CONCAT : 문자열을 결합해주는 함수
-- ||연산자와 동일
SELECT EMP_NAME||EMAIL, CONCAT(EMP_NAME, EMAIL)
    ,CONCAT(CONCAT(EMP_NAME, EMAIL),SALARY)
FROM EMPLOYEE;

-- REPLACE : 대상문자(컬럼)에서 지정문자를 찾아서 특정문자로 변경하는 것
-- REPLACE(문자열||컬럼명,'찾을문자','대체문자')
SELECT EMAIL, REPLACE(EMAIL,'BS','GD')
FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMAIL=REPLACE(EMAIL,'BS','GD');
--SELECT EMAIL FROM EMPLOYEE;
--ROLLBACK;

-- REVERSE : 문자열을 꺼꾸로 만들어주는 기능
SELECT EMAIL, REVERSE(EMAIL), EMP_NAME, REVERSE(EMP_NAME),REVERSE(REVERSE(EMP_NAME))
FROM EMPLOYEE;

-- TRANSLATE : 매칭되는 문자로 변경해주는 함수
SELECT TRANSLATE('010-3644-6259','0123456789','영일이삼사오육칠팔구')
FROM DUAL;


-- 숫자처리함수
-- ABS : 절대값을 처리하는 함수
SELECT ABS(-10), ABS(10)
FROM DUAL;

-- MOD :  나머지를 구하는 함수 * 자바의 %연산자와 동일한 함수
SELECT MOD(3,2)
FROM DUAL;

SELECT E.*, MOD(SALARY,3)
FROM EMPLOYEE E;

-- 소수점을 처리하는 함수
-- ROUND : 소수점을 반올림하는 함수
-- ROUND(숫자||컬럼명[,자리수])
SELECT 126.567, ROUND(126.567), ROUND(126.467), ROUND(126.567,2)
FROM DUAL;

--보너스를 포함한 월급구하기
SELECT EMP_NAME,SALARY, SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03)
        ,ROUND(SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03))
FROM EMPLOYEE;

-- FLOOR : 소수점자리 버림
SELECT 126.567, FLOOR(126.567) --FLOOR(126.567,2)
FROM DUAL;

--TRUNC : 소수점자리 버림 자리수를 지정
SELECT 126.567, TRUNC(126.567), TRUNC(126.567,2), TRUNC(126.567,-2),
        TRUNC(2123456.32,-2)
FROM DUAL;

-- CEIL : 소수점 올림
SELECT 126.567, CEIL(126.567), CEIL(126.111)
FROM EMPLOYEE;

-- 날짜처리함수 이용하기
-- 오라클에서 날짜를 출력할때는 두가지 방식이 있음
-- 1. SYSDATE예약어 -> 날짜 년/월/일 오늘 날짜(오라클이 설치되어있는 컴퓨터의 날짜)를 출력해줌.
-- 2. SYSTIMESTAMP예약어 -> 날짜+시간까지 출력해줌
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

-- 날짜도 산술연산처리가 가능함, +,- 연산 가능 -> 일수가 차감, 추가됨.
SELECT SYSDATE, SYSDATE-2, SYSDATE+3, SYSDATE+30
FROM DUAL;

-- NEXT_DAY : 매개변수로 전달받은 요일 중 가장 가까운 다음 날짜 출력
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월'), NEXT_DAY(SYSDATE,'수요일')--, NEXT_DAY(SYSDATE,'MONDAY')
FROM DUAL;
-- LOCALE의 값을 가지고 언어선택
SELECT * FROM V$NLS_PARAMETERS;
ALTER SESSION SET NLS_LANGUAGE='KOREAN';
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MON'), NEXT_DAY(SYSDATE,'TUESDAY')
FROM DUAL;

-- LASY_DAY : 그달의 마지막날을 출력
SELECT SYSDATE, LAST_DAY(SYSDATE), LAST_DAY(SYSDATE+30)
FROM DUAL;

-- ADD_MONTHS : 개월수를 더하는 함수
SELECT SYSDATE, ADD_MONTHS(SYSDATE,10)
FROM DUAL;

-- MONTHS_BETWEEN : 두개의 날짜를 받아서 두날짜의 개월수를 계산해주는 함수
SELECT FLOOR(MONTHS_BETWEEN('23/08/17',SYSDATE))
FROM DUAL;

-- 날짜의 년도, 월, 일자를 따로 출력할 수 있는 함수
-- EXTRACT(YEAR||MONTH||DAY FROM 날짜) : 숫자로 출력해줌.
-- 현재날짜의 년, 월, 일 출력하기
SELECT EXTRACT(YEAR FROM SYSDATE) AS 년, EXTRACT(MONTH FROM SYSDATE) AS 월, EXTRACT(DAY FROM SYSDATE) AS 일
FROM DUAL;

-- 사원 중 12월에 입사한 사원들을 구하시오
SELECT *
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12;

SELECT EXTRACT(DAY FROM HIRE_DATE)+100
FROM EMPLOYEE;

-- 오늘부로 최주영씨가...... 군대로... 다시 끌려간다....ㅠㅠ 군대목무기간은 1년6개월,
-- 전역일자를 구하고, 전역때까지 먹는 짬밥수(하루세끼)를 구하기
SELECT ADD_MONTHS(SYSDATE,18) AS 전역일, (ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS 짬밥수
FROM DUAL;

-- 형변환 함수
-- 오라클에서는 자동형변환이 잘 작동을 함.
-- 오라클 데이터를 저장하는 타입이 있음
-- 문자 : CHAR, VARCHAR2, NCHAR, NVARCHAR2 -> JAVA String과 동일
-- 숫자 : NUMBER
-- 날짜 : DATE, TIMESTAMP

-- TO_CHAR : 숫자, 날짜를 문자형으로 변경해주는 함수
-- 날짜를 문자형으로 변경하기
-- 날짜값을 기호로 표시해서 문자형으로 변경을 한다.
-- Y : 년, M : 월, D : 일, H : 시, MI : 분, SS : 초
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YY.MM.DD'),TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH24:MI:SS')
FROM EMPLOYEE;

-- 숫자를 문자형으로 변경하기
-- 패턴에 맞춰서 변환 -> 자리수를 어떻게 표현할지 선택
-- 0 : 변환대상값의 자리수가 지정한 자리수와 일치하지 않을때, 값이 없는 자리에 0을 표시하는 패턴
-- 9 : 변환대상값의 자리수가 지정한 자리수와 일치하지 않을때, 값이 없는 자리에 생략하는 패턴
-- 통화를 표시하고 싶을때는 L을 표시
SELECT 1234567, TO_CHAR(1234567,'000,000,000'), TO_CHAR(1234567,'999,999,999'),
        TO_CHAR(500,'L999,999')
FROM DUAL;
SELECT 180.5, TO_CHAR(180.5,'000,000.00'), TO_CHAR(180.5,'FM999,999.00') AS 키
FROM DUAL;


-- 월급을 통화표시하고 ,로 구분해서 출력하고 입사일은 0000.00.00으로 출력하기
SELECT EMP_NAME, SALARY, TO_CHAR(SALARY,'FML999,999,999') AS 급여, TO_CHAR(HIRE_DATE,'YYYY.MM.DD') AS 입사일
FROM EMPLOYEE;

-- 숫자형으로 변경하기
-- TO_NUMBER함수를 이용
-- 문자를 숫자형으로 변경하기
SELECT 1000000+1000000,TO_NUMBER('1,000,000','999,999,999')+1000000,
    TO_CHAR(TO_NUMBER('1,000,000','999,999,999')+1000000,'FML999,999,999')
FROM DUAL;

-- 날짜형으로 변경하기
-- 숫자를 날짜로 변경
-- 문자열를 날짜로 변경
SELECT TO_DATE('23/12/25','YY/MM/DD')-SYSDATE, TO_DATE('241225','YYMMDD'),
    TO_DATE('25-12-25','YY-MM-DD')
FROM DUAL;

SELECT TO_DATE(20230405,'YYYYMMDD'), TO_DATE(230505,'YYMMDD'), TO_DATE(TO_CHAR(000224,'000000'),'YYMMDD')
FROM DUAL;


-- NULL값을 처리해주는 함수
-- NVL함수 : NVL(컬럼,대체값)
-- NVL2함수 : NVL2(컬럼, NULL아닐때, NULL일때)
SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE,'인턴'), NVL2(DEPT_CODE,'있음','없음')
FROM EMPLOYEE;


-- 조건에 따라 출력할 값을 변경해주는 함수
-- 1. DECODE
-- DECODE(컬럼명||문자열,'예상값','대체값','예상값2','대체값2',.....)
-- 주민번호에서 8번째자리의 수가 1이면 남자, 2이면 여자를 출력하는 가상컬럼추가하기
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','남자','2','여자') AS GENDER
FROM EMPLOYEE
WHERE GENDER='남자';

-- 각 직책코드의 명칭을 출력하기
-- J1 대표, J2 부사장, J3 부장, J4 과장
SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE,'J1','대표','J2','부사장','J3','부장','J4','과장','사원') AS 직책
FROM EMPLOYEE;
-- 2. CASE WHEN THEN ELSE
-- CASE
--     WHEN 조건식 THEN 실행내용
--     WHEN 조건식 THEN 실행내용
--     WHEN 조건식 THEN 실행내용
--     ELSE 실행내용
-- END

SELECT EMP_NAME, JOB_CODE,
        CASE 
            WHEN JOB_CODE = 'J1' THEN '대표'
            WHEN JOB_CODE = 'J2' THEN '부사장'
            WHEN JOB_CODE = 'J3' THEN '부장'
            WHEN JOB_CODE = 'J4' THEN '과장'
--            ELSE '사원'
        END AS 직책,
        CASE JOB_CODE
            WHEN 'J1' THEN '대표'
            WHEN 'J2' THEN '부사장'
        END
FROM EMPLOYEE;
        
--월급을 기준으로 고액월급자와 중간월급자 그외를 나눠서 출력하기
-- 월급이 400만원 이상이면 고액
-- 월급이 400미만 300이상이면 중간월급자
-- 나머지는 그외를 출력하는 가상컬럼만들기
-- 이름, 월급, 결과

SELECT EMP_NAME, SALARY, 
    CASE 
        WHEN SALARY>=4000000 THEN '고액'
        WHEN SALARY>=3000000 THEN '중간'
        ELSE '그외'
    END AS 결과
FROM EMPLOYEE;    

-- 사원테이블에서 현재나이를 구하기
SELECT EMP_NAME, EMP_NO,EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'YY'))||'살' AS YY년,
    EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))||'살' AS RR년,
    EXTRACT(YEAR FROM SYSDATE)-(
        TO_NUMBER(SUBSTR(EMP_NO,1,2))+
        CASE 
            WHEN SUBSTR(EMP_NO,8,1) IN (1,2) THEN 1900
            WHEN SUBSTR(EMP_NO,8,1) IN (3,4) THEN 2000
        END
    ) AS 살
FROM EMPLOYEE;

-- RR로 년도를 출력할때 
--현재년도       입력년도     계산년도
--00~49         00~49       현세기
--00~49         50~99       전세기
--50~99         00~49       다음세기
--50~99         50~99       현세기
insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('252','옛사람','320808-4123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');
SELECT * FROM EMPLOYEE;

UPDATE EMPLOYEE SET EMP_NO='320808-1123341' WHERE EMP_ID='252';
COMMIT;

-- 그룹함수 활용하기
-- 테이블의 데이터에 대한 집계하는 함수들 합계, 평균, 갯수, 최대값, 최소값을 구하는 함수
-- 그룹함수의 결과는 기본적으로 한개의 값만 가져옴
-- 추가 컬럼을 선택하는것이 제한
-- 종류
-- SUM : 테이블의 특정컬럼에 대한 총합 -> SUM(컬럼(NUMBER))
-- AVG : 테이블의 특정컬럼에 대한 평균 -> AVG(컬럼(NUMBER))
-- COUNT : 테이블의 데이터수(ROW수) -> COUNT(*||컬럼)
-- MIN : 테이블의 특정컬럼에 대한 최소값 -> MIN(컬럼명)
-- MAX : 테이블의 특정컬럼에 대한 최대값 -> MAX(컬럼명)

-- 사원의 월급의 총합계를 구해보자
SELECT TO_CHAR(SUM(SALARY),'FML999,999,999') FROM EMPLOYEE;

-- D5부서의 월급의 총합계를 구해보자
SELECT SUM(SALARY) 
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--SELECT SUM(EMP_NAME)
--FROM EMPLOYEE;

-- J3사원의 급여 합계를 구하시오
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE JOB_CODE='J3';

-- 평균구하기 AVG함수
-- 전체사원에 대한 평균구하기
SELECT AVG(SALARY) FROM EMPLOYEE;
-- D5의 급여 평균을 구하기
SELECT AVG(SALARY) FROM EMPLOYEE 
WHERE DEPT_CODE='D5';

-- D5부서의 급여합계와 평균구하기
SELECT SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE 
WHERE DEPT_CODE='D5';

-- NULL값에 대해서는 어떻게 처리가 될까? -> NULL값은 데이터 제외해버림
SELECT SUM(BONUS),AVG(BONUS),AVG(NVL(BONUS,0))
FROM EMPLOYEE;

-- 테이블의 데이터수 확인하기
SELECT COUNT(*),COUNT(DEPT_CODE), COUNT(BONUS)
FROM EMPLOYEE;


-- D6부서의 인원 조회하세요
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';

-- 400만원 이상 월급을 받는 사원 수는?
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY>=4000000;
-- D5부서에서 보너스를 받고 있는 사원의 수는?
SELECT COUNT(BONUS) 
FROM EMPLOYEE
WHERE DEPT_CODE='D5'; --AND BONUS IS NOT NULL;

-- 부서가 D6, D5, D7인 사원의 수, 급여, 합계, 평균을 조회하세요
SELECT COUNT(*) AS 사원수, SUM(SALARY) AS 급여합계, AVG(SALARY) AS 급여평균
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D7');

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

-- GROUP BY 절 활용하기
--  그룹함수를 사용했을때 특정기준으로 컬럼값을 묶어서 처리하는 것 -> 묶인 그룹별 그룹함수의 결과가 출력됨.
-- SELECT 컬럼
-- FROM 테이블명
-- [WHERE 조건식]
-- [GROUP BY 컬럼명[,컬럼명,컬럼명,...]]
-- [ORDERY BY 컬럼명]

-- 부서별 급여 합계를 구하시오
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 직책별 급여의 합계, 평균을 구하시오
SELECT JOB_CODE, SUM(SALARY), AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- 부서별 사원수 구하기
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- GROUP BY 절에는 다수의 컬럼을 넣을 수 있다.
SELECT DEPT_CODE, JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- GROUP BY를 사용한 절에서 WHERE도 사용이 가능하다.
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;

-- 부서별 인원이 3명이상인 부서만 출력하기
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
--WHERE COUNT(*) >=3
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 3;

-- 직책별 인원수가 3명이상인 직책 출력하기
SELECT JOB_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*)>=3;

-- 평균급여가 300만원 이상인 부서출력하기
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000 AND COUNT(*)>=4;
-- 매니저가 관리하는 사원이 2명이상인 매니저아이디 출력하기
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING COUNT(*)>=2;

-- 남자, 여자의 급여 평균을 구하고 인원수를 구하기
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','3','남','2','여','4','여') AS 성별, AVG(SALARY), COUNT(*) 
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','남','3','남','2','여','4','여');

-- 각 그룹별 집계와 총 집계를 한번에 출력해주는 함수
-- ROLLUP(), CUBE()
-- GROUP BY ROLLUP(컬럼명)
-- GROUP BY CUBE(컬럼명)
--부서별 급여합계와 총합계를 조회하는 구문
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

-- ROLLUP,CUBE함수의 인수로 한개이상의 컬럼을 넣을 수 있다.
-- ROLLUP : 두개이상의 인수를 전달했을때 두개 컬럼의 집계, 첫번째 인수컬럼의 소계, 전체 총계
-- CUBE : 두개이상 인수를 전달했을때 두개 컬럼의 집계, 첫번째 인수컬럼의 소계, 두번째 인수컬럼의 소계, 전체 총계

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE);

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- 부서별, 직책별, 총사원을 한번에 조회하기
SELECT DEPT_CODE, JOB_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- GOURPING함수를 이용하면 집계한 결과에 대한 분기처리를 할 수 있다.
-- ROLLUP, CUBE로 집계된 ROW에 대한 분기처리
-- GROUPING함수를 실행하면 ROLLUP, CUBE로 집계된 ROW 1을 반환 아니면 0을 반환
SELECT DEPT_CODE, JOB_CODE, COUNT(*),
    CASE
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN '부서별인원'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN '직책별인원'
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=0 THEN '부서_직책인원'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN '총인원'
    END AS 결과
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE, JOB_CODE);

-- 테이블에서 조회한 데이터 정렬하기
-- ORDER BY 구문을 사용함.
-- SELECT 컬럼명.....
-- FROM 테이블명
-- [WHERE 조건식]
-- [GROUP BY 컬럼명]
-- [HAVING 조건식]
-- [ORDER BY 컬럼명 [정렬방식(DESC(내림),ASC(오름, DEFAULT)]]

-- 이름을 기준으로 정렬하기
SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME;

SELECT *
FROM EMPLOYEE
ORDER BY EMP_NAME DESC;

-- 월급이 높은사람부터 낮은사람으로 정렬하기
-- 이름, 급여, 보너스
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
ORDER BY SALARY DESC;

--부서코드를 기준으로 오름차순 정렬하고 값이 같으면 월급이 내림차순으로 정렬하기
SELECT *
FROM EMPLOYEE
ORDER BY DEPT_CODE ASC, SALARY DESC, EMP_NAME ASC;

-- 정렬했을때 NULL값에 대한 처리
--BONUS를 많이 받는 사원부터 출력하기
SELECT *
FROM EMPLOYEE
--ORDER BY BONUS DESC;--NULL인 값을 먼저 출력한다.
--ORDER BY BONUS ASC;--NULL인 값을 나중에 출력한다.
--옵션을 설정해서 NULL값 출력위치를 변경할 수 있다.
--ORDER BY BONUS DESC NULLS LAST;
ORDER BY BONUS ASC NULLS FIRST;


-- ORDER BY 절에서는 별칭을 사용할 수 있음
SELECT EMP_NAME, SALARY AS 월급, BONUS
FROM EMPLOYEE
--WHERE 월급 >300000
ORDER BY 월급;

-- SELECT문을 이용해서 데이터를 조회하면 RESULT SET이 출력되는데 
-- RESULT SET에 출력되는 컬럼에는 자동으로 INDEX번호가 1부터 부여가 됨.
SELECT *
FROM EMPLOYEE
ORDER BY 2;

-- 집합연산자
-- 여러개의 SELECT문을 한개의 결과(RESULT SET)으로 출력해주는 것
-- 첫번째 SELECT문의 컬럼수와  이후 SELECT문의 컬럼수가 같아야 한다.
-- 각 컬럼별 데이터 타입도 동일해야 한다.

-- UNION : 두개이상의 SELECT문을 합치는 연산자
-- SELECT 문 UNION SELECT문
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

--두 SELECT문의 컬럼의 수가 다르면 안된다.
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
--SELECT EMP_ID, EMP_NAME, SALARY, BONUS
--FROM EMPLOYEE
--WHERE SALARY>3000000;
-- 두개의 SELECT문의 컬럼의 타입도 맞춰야한다.
SELECT EMP_ID, EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- 다른 테이블에 있는 데이터를 합치기
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
-- 여러 GROUP BY 절이 있는 구문을 하나로 작성하게 해주는 기능
-- 부서, 직책, 매니저별 급여평균
SELECT  DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE, MANAGER_ID;
-- 부서, 직책별 급여평균
SELECT  DEPT_CODE, JOB_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;
-- 부서, 매니저별 급여평균
SELECT  DEPT_CODE, MANAGER_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,MANAGER_ID;


SELECT DEPT_CODE, JOB_CODE, MANAGER_ID, AVG(SALARY), 10+20
FROM EMPLOYEE
GROUP BY GROUPING 
        SETS((DEPT_CODE,JOB_CODE,MANAGER_ID),(DEPT_CODE,JOB_CODE),(DEPT_CODE,MANAGER_ID));
        
-- JOIN에 대해 알아보자
-- 두개이상의 테이블을 특정컬럼을 기준으로 연결해주는 기능
-- JOIN은 두 종류가 있음
-- 1. INNER JOIN : 기준되는 값이 일치하는 ROW만 가져오는 JOIN
-- 2. OUTER JOIN : 기준되는 값이 일치하지 않은 ROW도 가져오는 JOIN * 기준이 필요

-- JOIN을 작성하는 방법 2가지
-- 1. 오라클 조인방식 : , 와 WHERE로 작성
-- 2. ANSI 표준 조인방식 : JOIN, ON||USING 예약어를 사용해서 작성

-- EMPLOYEE테이블과 DEPARTMENT테이블 JOIN하기
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- 오라클방식으로 JOIN하기
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;

-- ANSI 표준으로 JOIN하기
SELECT * 
FROM EMPLOYEE 
    JOIN DEPARTMENT ON EMPLOYEE.DEPT_CODE=DEPARTMENT.DEPT_ID;
        
-- 사원에 대해 사원명, 이메일, 전화번호, 부서명을 조회하기    
SELECT EMP_NAME, EMAIL, PHONE, DEPT_TITLE
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
    
-- JOIN 문에서도 WHERE절 사용하기
-- 부서가 총부무인 사원 사원명, 월급, 보너스, 부서명 조회하기
SELECT EMP_NAME, SALARY, BONUS, DEPT_TITLE
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='총무부';
-- JOIN 문에서 GROUP BY 절 사용하기
-- 부서별 평균급여를 출력하기 부서명, 평균급여
SELECT DEPT_TITLE,AVG(SALARY)
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000;

-- JOIN할때 기준이되는 컬럼명이 중복된다면 반드시 별칭을 작성해야한다.
-- 사원명, 급여, 보너스, 직책명을 조회하기
SELECT *
FROM EMPLOYEE E
    JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE E.JOB_CODE='J3';
    
-- 중복되는 컬럼명으로 조인할 때는 USING을 이용할 수 있다.
SELECT *
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE='J3';

SELECT * FROM JOB;    

-- 직책이 과장인 사원의 이름, 직책명, 직책코드, 월급을 조회하세요
SELECT EMP_NAME,JOB_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME='과장';

SELECT *
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_CODE IS NULL;
    
-- OUTER JOIN사용하기
-- 컬럼에 대해 동일비교를 했을때 없는 ROW를 출력해주는 JOIN
-- 기준이 되는 테이블(모든 데이터를 출력할)을 설정해줘야한다.
-- LEFT OUTER JOIN : JOIN을 기준으로 왼쪽에 있는 테이블을 기준으로 설정
-- RIGHT OUTER JOIN : JOIN을 기준으로 오른쪽에 있는 테이블을 기준으로 설정
-- 일치되는 ROW가 없는 경우 모든 컬럼을 NULL로 표시함.
SELECT *
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

SELECT *
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- CROSS JOIN : 모든 ROW를 연결해주는 JOIN
SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 1;

-- SELF JOIN : 한개의 테이블에 다른 컬럼의 값을 가지고 있는 컬럼이 있는 경우 그 두개 컬럼을 이용해서 JOIN
SELECT * FROM EMPLOYEE;
-- 매니저가 있는 사원의 이름, 매니저 아이디, 매니저 사원번호, 매니저 이름 조회
SELECT E.EMP_NAME,E.MANAGER_ID,M.EMP_ID,M.EMP_NAME
FROM EMPLOYEE E
    JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;
-- 사원이름, 매니저아이디, 매니저사원번호, 매니저 이름 조회
-- 매니저가 없으면 없음을 출력하기
SELECT E.EMP_NAME,NVL(E.MANAGER_ID,'없음'),NVL(M.EMP_ID,'없음'),NVL(M.EMP_NAME,'없음')
FROM EMPLOYEE E
   RIGHT OUTER JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;
SELECT * FROM EMPLOYEE;

-- 동등조인 동등비교를 해서 처리함. ON 컬럼명=컬럼명
-- 비동등조인에 대해 알아보자
-- 연결할 테이블이 범위값을 가져야한다.
SELECT * FROM SAL_GRADE;
SELECT *
FROM EMPLOYEE 
    JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;
-- 회원등급 포인트제로, 상품등급(상태), 댓글 수에 따른 회원등급

-- 다중조인을 할 수 있다.
-- 세개이상의 테이블을 연결해서 사용하기
-- 사원의 사원명, 직책명, 부서명을 조회하기
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE
FROM DEPARTMENT
    JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
    JOIN JOB USING(JOB_CODE);
-- 사원의 사원명, 부서명, 직책명, 근무지역(LOCALNAME) 조회하기
-- 부서명이 없으면 대기, 근무지역이 없으면 대기발령을 출력하기
SELECT EMP_NAME,DEPT_TITLE, JOB_NAME, LOCAL_NAME
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE;
    
-- 서브쿼리 : SELECT문 안에 SELECT문이 하나 더 있는 쿼리문을 말함.
-- 서브쿼리는 반드시 ()안에 작성을 해야한다.
-- 윤은해사원과 동일한 급여를 받고있는 사원을 조회하기
SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='윤은해';
SELECT * 
FROM EMPLOYEE
WHERE SALARY=2000000;

SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='윤은해');

-- D5부서의 평균급여보다 많이 받는 사원구하기
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5');

-- 1. 단일행서브쿼리
-- 서브쿼리 SELECT문의 결과가 1개열, 1개행인 것
-- 컬럼, WHERE절에 비교대상 값
-- 사원들의 급여 평균보다 많이 급여를 받는 사원의 이름, 급여, 부서코드를 출력하기
SELECT EMP_NAME, SALARY, DEPT_CODE,(SELECT AVG(SALARY) FROM EMPLOYEE) AS AVG
FROM EMPLOYEE
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

-- 부서가 총무부인 사원을 조회하기
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='총무부');

SELECT * 
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='총무부';

-- 직책이 과장인 사원을 조회하기
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAME='과장');


-- 2. 다중행 서브쿼리
-- 서브쿼리의 결과가 한개열 다수 행(ROW)을 갖는 것
-- 직책이 부장, 과장인 사원을 조회하기
SELECT JOB_CODE 
FROM JOB
WHERE JOB_NAME IN ('부장','과장');

SELECT *
FROM EMPLOYEE
WHERE JOB_CODE NOT IN (SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('부장','과장'));

-- 다중행에 대한 대소비교하기
-- >=, >, <, <=
SELECT *
FROM EMPLOYEE;
-- WHERE SALARY >=(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));
-- ANY : OR로 ROW를 연결
-- ALL : AND로 ROW를 연결
-- 컬럼 >(=) ANY(서브쿼리) :  다중행 서브쿼리의 결과 중 하나라도 크면 참 ->  다중행 서브쿼리의 결과 중 최소값보다 크면 참
-- 컬럼 <(=) ANY(서브쿼리) : 다중행 서브쿼리의 결과 중 하나라도 작으면 참 -> 다중행 서브쿼리의 결과 중 최대값보다 작으면 참

SELECT *
FROM EMPLOYEE
--WHERE SALARY >= ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5','D6'));
WHERE SALARY >=(SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN ('D5','D6'));

-- 컬럼 >(=) ALL(서브쿼리) : 다중행 서브쿼리의 결과가 모두 클때 참 - > 다중행 서브쿼리의 결과 중 최대값보다 크면 참
-- 컬럼 <(=) ALL(서브쿼리) : 다중행 서브쿼리의 결과가 모두 작을때 참 -> 다중행 버스쿼리의 결과 중 최소값보다 작으면 참
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));
WHERE SALARY < (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));

-- 2000년 1월1일 이전 입사자 중 2000년 1월 1일 이후 입사한 사원 중 가장 높게 받는 사원보다 급여를 높게 받는 사원의
-- 사원명, 급여, 조회하기
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01' 
    -- AND SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE HIRE_DATE >'00/01/01');
    AND SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE HIRE_DATE>'00/01/01');

-- 다중열 서브쿼리 : 열이 다수, 행이 1개인 쿼리문
-- 퇴직한 여사원의 같은부서, 같은 직급에 해당하는 사원 조회하기
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2';

SELECT *
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
--    AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
--    AND ENT_YN='N';
WHERE (DEPT_CODE, JOB_CODE) 
    IN (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y' AND SUBSTR(EMP_NO,8,1)='2')
    AND ENT_YN='N';

-- 기술지원부이면서 급여가 200만원인 사원이 있다고 한다.
-- 그사원의 이름, 부서명, 급여 출력하기
SELECT DEPT_CODE, SALARY 
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='기술지원부' AND SALARY =2000000;  

SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE 
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, SALARY 
                                FROM EMPLOYEE 
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='기술지원부' AND SALARY =2000000);

--다중행 다중열 서브쿼리
-- 사원중 총무부이고 300만원 이상 월급을 받는 사원
SELECT DEPT_CODE, SALARY
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE='총무부' AND SALARY>=3000000;

SELECT * 
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN (SELECT DEPT_CODE, SALARY
                                FROM EMPLOYEE
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='총무부' AND SALARY>=3000000);

-- 다중행, 다중행다중열 서브쿼리는 컬럼에는 사용하지못함.
-- WHERE, FROM절에 사용(INLINE VIEW)
SELECT (SELECT DEPT_CODE
                                FROM EMPLOYEE
                                    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                WHERE DEPT_TITLE='총무부' AND SALARY>=3000000) AS TEST
FROM DUAL;

SELECT *
FROM EMPLOYEE CROSS JOIN (SELECT DEPT_CODE
        FROM EMPLOYEE
           JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
             WHERE DEPT_TITLE='총무부' AND SALARY>=3000000);



SELECT EMP_NAME
FROM EMPLOYEE;


-- 상관 서브쿼리
-- 서브쿼리를 구성할때 메인쿼리에 값을 가져와 사용하게 설정
-- 메인쿼리의 값이 서브쿼리의 결과에 영향을 주고, 서브쿼리의 결과가 메인쿼리의 결과에 영향을 주는 쿼리문
-- 본인이 속한 부서의 사원수를 조회를 하기
-- 사원명, 부서코드, 사원수
SELECT EMP_NAME, DEPT_CODE,(SELECT COUNT(*) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS 사원수
FROM EMPLOYEE E;

-- WHERE에 상관서브쿼리 이용하기
-- EXISTS(서브쿼리) : 서브쿼리의 결과가 1행 이상이면 TRUE, 0행이면 FALSE

SELECT *
FROM EMPLOYEE E
--WHERE EXISTS(SELECT DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE='D9');
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- 최소급여를 받는 사원 조회하기
SELECT *
FROM EMPLOYEE E
--WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEE);
WHERE NOT EXISTS(SELECT SALARY FROM EMPLOYEE WHERE SALARY>E.SALARY);


-- 모든 사원의 사원번호, 이름, 매니저아이디, 매니저 이름 조회하기
-- 서브쿼리로 풀어보자
SELECT EMP_ID, EMP_NAME,MANAGER_ID,
    (SELECT EMP_NAME FROM EMPLOYEE WHERE E.MANAGER_ID=EMP_ID) AS MANAGER_NAME
FROM EMPLOYEE E;

-- 사원의 이름, 급여, 부서명, 소속부서급여평균 조회하기
SELECT EMP_NAME,SALARY,DEPT_TITLE,
    TO_CHAR(FLOOR((SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.DEPT_CODE=DEPT_CODE)),'FML999,999,999') 
    AS 소속부서평균
FROM EMPLOYEE E
    JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- 직급이 J1이 아닌 사원중에서 자신의 부서별 평균 급여보다 급여를 적게 받는 사원 조회하기
SELECT * 
FROM EMPLOYEE E
WHERE JOB_CODE != 'J1' 
    AND SALARY<(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.DEPT_CODE=DEPT_CODE);

-- 자신이 속한 직급의 평균급여보다 많이 받는 직원의 이름, 직책명, 급여를 조회하기
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E
    JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
    WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE WHERE E.JOB_CODE=JOB_CODE);


-- FROM 절에 서브쿼리이용하기
-- INLINE VIEW
-- FROM절에 사용하는 서브쿼리는 대부분 다중행다중열서브쿼리 사용
-- RESULT SET을 하나의 테이블처럼 사용하게 하는 것
-- 가상컬럼을 포함하고 있거나, JOIN을 사용한 SELECT문을 사용
-- VIEW : INLINE VIEW, STORED VIEW

-- EMPLOYEE테이블에 성별(남, 여)을 추가해서 출력하기
SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여') AS GENDER
FROM EMPLOYEE E;

--성별중 여자만 출력하기
SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여') AS GENDER
FROM EMPLOYEE E
WHERE DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여')='여';

-- INLINE VIEW이용하기
SELECT * 
FROM (
    SELECT E.*,DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','3','남','4','여') AS GENDER
    FROM EMPLOYEE E
)WHERE GENDER='여';

-- JOIN,집합연산자 활용했을때
SELECT *
FROM (
    SELECT * 
    FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB USING(JOB_CODE)
) 
WHERE DEPT_TITLE='총무부' AND JOB_NAME='부사장';

SELECT T.*, T.SALARY*12 AS 연봉
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

-- 집합연산자이용하기
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

-- ROW에 순위를 정하고 출력하기
-- TOP-N출력하기
SELECT * FROM EMPLOYEE;
-- 급여를 많이 받는 사원 1~3위까지 출력하기
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- 1. 오라클이 제공하는 가상컬럼 ROWNUM을 이용하기
SELECT ROWNUM, E.* 
FROM EMPLOYEE E
WHERE ROWNUM BETWEEN 1 AND 3
ORDER BY SALARY DESC;
-- SELECT문을 실행할때마다 ROWNUM이 생성이 됨,
SELECT ROWNUM,T.*
FROM(
    SELECT ROWNUM AS INNERNUM,E.*
    FROM EMPLOYEE E
    ORDER BY SALARY DESC
)T
WHERE ROWNUM<=3;

-- 5~10 까지 구하기
SELECT * 
FROM(
    SELECT ROWNUM AS RNUM,T.* 
    FROM (SELECT * 
            FROM EMPLOYEE 
            ORDER BY SALARY DESC) T)
WHERE RNUM BETWEEN 5 AND 10;        

-- 2. RANK OVER()함수 이용하기
SELECT *
 FROM (
        SELECT EMP_NAME, SALARY, 
            RANK() OVER(ORDER BY SALARY DESC) AS NUM,
            DENSE_RANK() OVER(ORDER BY SALARY DESC) AS NUM2
        FROM EMPLOYEE
    )
WHERE NUM BETWEEN 5 AND 10;


-- 평균급여를 많이 받는 부서 3개 출력하기 
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

-- DDL에 대해 알아보자
-- 데이터 정의언어로 오라클에서 사용하는 객체를 생성, 수정, 삭제하는 명령어
-- 생성 : CREATE 오브젝트명 ....
-- 수정 : ALTER 오브젝트명 .....
-- 삭제 : DROP 오브젝트명 ....

-- 테이블을 생성하는 방법부터 알아보자...
-- 테이블생성 : 데이터를 저장할 수 있는 공간을 생성하는 것
-- 테이블을 생성하기 위해서는 저장공간을 확보하는데 확보할때 TYPE이 필요
-- 오라클이 제공하는 타입중 자주쓰는 타입에 대해 알아보자.
-- 문자형타입 : CHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB
-- 숫자형타입 : NUMBER
-- 날짜형타입 : DATA, TIMESTAMP

-- 문자형타입에 대해 알아보자
-- CHAR(길이) : 고정형 문자열 저장타입으로 길이만큼 공간을 확보하고 저장한다. * 최대 2000바이트저장가능
-- VARCHAR2(길이) : 가변형 문자열 저장타입으로 저장되는 데이터만큼 공간확보하고 저장한다. * 최대 4000바이트저장가능
CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6),
    C NCHAR(6),
    D NVARCHAR2(6)
);

SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('가나','가나','가나','가나');
INSERT INTO TBL_STR VALUES('가나','가나','가나','가나다라마바사');
INSERT INTO TBL_STR VALUES(1234,'가나','가나','가나다라마바');
SELECT LENGTH(A),LENGTH(B),LENGTH(C),LENGTH(D)
FROM TBL_STR;


-- 숫자형 자료형
-- NUMBER : 실수, 정수 모두 저장이 가능함.
-- 선언방법
-- NUMBER : 기본값
-- NUMBER(PRECISION, SCALE) : 저장할 범위설정
--   PRECISION : 표현할 수 있는 전체 자리수(1~38)
--   SCALE : 소수점이하의 자리수(-84 ~ 127)
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
INSERT INTO TBL_NUM VALUES('1234.오육','1234.567','1234.567','1234.567');
-- 날짜
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

-- 기본테이블 작성하기
-- CREATE TABLE 테이블명 예)BOARD_COMMENT ( 컬럼명 자료형(길이), 컬럼명2 자료형....);
-- 회원을 저장하는 테이블 만들기
-- 이름 : 문자, 회원번호:숫자||문자, 아이디:문자, 패스워드:문자, 이메일:문자, 나이:숫자, 등록일:날짜
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
-- 생성된 테이블의 컬럼에 설명(COMMENT)작성하기
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름 최소2글자이상 저장';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디 최소 4글자이상';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호 최소 8글자이상';

SELECT * 
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='MEMBER';

-- 테이블에 커멘트 작성하기
COMMENT ON TABLE MEMBER IS '회원정보저장';
SELECT *
FROM USER_TAB_COMMENTS;

-- 테이블의 각 컬럼에 저장되는 데이터의 특성에 따라 제약조건을 설정할 수 있다.
-- 오라클이 제공하는 제약조건
-- NOT NULL(C) : 지정된 컬럼에 NULL값을 허용하지 않는 것 * DEFAULT설정 NULLABLE
-- UNIQUE(U) : 지정된 컬럼에 중복값을 허용하지 않는 것
-- PRIMARY KEY(P)/PK : 데이터(ROW) 구분하는 컬럼에 설정하는 제약조건 -> NOT NULL, UNIQUE제약조건 설정
                --      일반적으로 한개테이블에 한개 PK를 설정
--                      다수컬럼에 설정할 수도 있다(복합키)
-- FOREGIN KEY(R) : 지정된 컬럼의 값을 다른 테이블의 지정된 컬럼에 있는 값만 저장하게 하는 제약조건 
--                  다른테이블 지정된 컬럼은 중복이 있으면 안됨!(UNIQUE제약조건이나 PK제약조건이 설정된 컬럼)
-- CHECK(C) : 지정된 컬럼에 지정된 값을 저장하기 위한 제약조건 * 동등값, 범위값 지정

-- 테이블에 설정된 제약조건을 확인하는 명령어
SELECT * 
FROM USER_CONSTRAINTS;
SELECT *
FROM USER_CONS_COLUMNS;

SELECT C.CONSTRAINT_NAME,CONSTRAINT_TYPE, C.TABLE_NAME, SEARCH_CONDITION,COLUMN_NAME
FROM USER_CONSTRAINTS C
    JOIN USER_CONS_COLUMNS CC ON C.CONSTRAINT_NAME=CC.CONSTRAINT_NAME;


-- 테이블에 제약조건 설정하기
-- 제약조건 설정하는 방법 2가지
-- 1. 테이블 생성과 동시에 설정하기
--    1) 컬럼레벨에서 설정
--        예) CREATE TABLE 테이블명( 컬럼명 자료형 제약조건, 컬럼명2 자료형 제약조건,....)
--    2) 테이블레벨에서 설정
--        예) CREATE TABLE 테이블명( 컬럼명 자료형, 컬럼명2 자료형, 제약조건설정....)
-- 2. 생성된 테이블에 제약조건 추가하기 -> ALTER명령어이용

-- NOT NULL 제약조건설정하기
-- 컬럼레벨에서만 설정이 가능
CREATE TABLE BASIC_MEMBER(
  MEMBER_NO NUMBER,
  MEMBER_ID VARCHAR2(20),
  MEMBER_PWD VARCHAR2(20),
  MEMBER_NAME VARCHAR2(10),
  MEMBER_AGE NUMBER
);
-- 제약조건이 설정되지않으면 모든 컬럼에는 NULL값을 허용한다
INSERT INTO BASIC_MEMBER VALUES(NULL,NULL,NULL,NULL,NULL);
SELECT * FROM BASIC_MEMBER;
-- ID, PASSWORD는 NULL을 허용하면 안되는 컬럼
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
--  NOT NULL(MEMBER_NO) 테이블레벨에서 설정 불가능하다.
);

-- UNIQUE제약조건
-- 컬럼이 유일한값을 유지해야할때 사용
SELECT * FROM BASIC_MEMBER;
INSERT INTO BASIC_MEMBER VALUES(1,'ADMIN','1234','관리자',48);
INSERT INTO BASIC_MEMBER VALUES(2,'ADMIN','3333','유저1',31);

CREATE TABLE NQ_MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
SELECT * FROM NQ_MEMBER;
INSERT INTO NQ_MEMBER VALUES('1','ADMIN','1234','관리자',44);
INSERT INTO NQ_MEMBER VALUES(2,'ADMIN','1234','유저1',33);

-- NULL값에 대한 처리는 어떻게???
INSERT INTO NQ_MEMBER VALUES(3,NULL,'1234','유저2',22);
SELECT * FROM NQ_MEMBER;
INSERT INTO NQ_MEMBER VALUES(4,NULL,'4444','유저3',11);
-- NULL값을 허용하지 않으려면 제약조건을 추가하면된다.
CREATE TABLE NQ_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
SELECT * FROM NQ_MEMBER2;
INSERT INTO NQ_MEMBER2 VALUES(1,NULL,'1234','관리자',44);
INSERT INTO NQ_MEMBER2 VALUES(1,'ADMIN','1234','관리자',44);
INSERT INTO NQ_MEMBER2 VALUES(2,'ADMIN','2222','유저2',22);

-- UNIQUE제약조건을 테이블레벨에서도 설정이 가능
CREATE TABLE NQ_MEMBER3(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID)-- 다수의 컬럼에 UNIQUE제약조건을 설정할때 사용
);
INSERT INTO NQ_MEMBER3 VALUES(1,'ADMIN','1234','관리자',45);
INSERT INTO NQ_MEMBER3 VALUES(2,'ADMIN','2222','관리자',45);

-- 다수컬럼에 UNIQUE제약조건 설정하기
-- 다수컬럼의 값이 일치해야 중복값으로 인식 -> 선언컬럼이 하나의 그룹으로 묶임
CREATE TABLE NQ_MEMBER4(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID,MEMBER_NAME)
);
INSERT INTO NQ_MEMBER4 VALUES(1,'ADMIN','1234','관리자',44);
SELECT * FROM NQ_MEMBER4;
INSERT INTO NQ_MEMBER4 VALUES(2,'ADMIN','3333','유저1',33);
INSERT INTO NQ_MEMBER4 VALUES(4,'ADMIN','4444','관리자',24);

-- PRIMARY KEY 설정하기
-- 생성한 테이블의 컬럼 중 도메인이 중복값이 없고, NULL값을 허용하지 않을때 그 컬럼에 설정
-- PK용 컬럼을 생성해서 활용 -> IDX, STUDETNO, PRODUCTNO, BOARDNO
-- 저장되는 데이터 중 하나를 선택 설정
-- PK를 설정하면 자동으로 UNIQUE, NOT NULL제약조건, INDEX가 부여됨.
CREATE TABLE PK_MEMBER(
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER
);
INSERT INTO PK_MEMBER VALUES(NULL,'ADMIN','1234','관리자',44);
INSERT INTO PK_MEMBER VALUES(1,'ADMIN','1234','관리자',44);
INSERT INTO PK_MEMBER VALUES(1,'USER01','2222','유저1',22);
SELECT * FROM PK_MEMBER;

SELECT * FROM PK_MEMBER WHERE MEMBER_NO=1;

-- PK 테이블레벨에서 설정이 가능
CREATE TABLE PK_MEMBER1(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    PRIMARY KEY(MEMBER_NO)
);
INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','관리자',44);
INSERT INTO PK_MEMBER1 VALUES(1,'ADMIN','1234','관리자',44);
-- PRIMARY KEY를 다수컬럼에 설정할 수 있다. -> 복합키
-- 테이블 레벨에서 설정
CREATE TABLE PK_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20) NOT NULL,
    MEMBER_NAME VARCHAR2(10),
    MEMBER_AGE NUMBER,
    PRIMARY KEY(MEMBER_NO, MEMBER_ID)
);
DROP TABLE PK_MEMBER2;
INSERT INTO PK_MEMBER2 VALUES(1,'USER01','1111','유저1',33);
INSERT INTO PK_MEMBER2 VALUES(2,'USER01','2222','유저2',22);
INSERT INTO PK_MEMBER2 VALUES(1,'USER02','2222','유저2',22);
INSERT INTO PK_MEMBER2 VALUES(NULL,'USER02','3333','유저3',33);
INSERT INTO PK_MEMBER2 VALUES(3,NULL,'3333','유저3',33);
SELECT * FROM PK_MEMBER2;

-- 구매테이블, 장바구니 테이블 등에 복합키를 설정할 수 있다.
CREATE TABLE CART(
    MEMBER_ID VARCHAR2(20),
    PRODUCT_NO NUMBER,
    BUY_DATE DATE,
    STOCK NUMBER,
    PRIMARY KEY(MEMBER_ID,PRODUCT_NO, BUY_DATE)
);

-- FOREIGN KEY 제약조건 설정하기
-- 다른테이블에 있는 데이터를 가져와 사용하는것(참조)
-- 참조관계를 설정하면 부모(참조되는테이블)-자식(참조하는테이블)관계가 설정이 됨.
-- FK제약조건은 자식테이블에 설정
-- FK제약조건을 설정하는 컬럼은 UNIQUE제약조건이나 PK제약조건이 설정되어있어야 한다.
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

INSERT INTO BOARD VALUES(1, '냉무',NULL,'관리자',SYSDATE);
SELECT * FROM BOARD;
INSERT INTO BOARD VALUES(2, '솔이씨...','너무하세요!!!','강민기',SYSDATE);
INSERT INTO BOARD VALUES(3, '선생님 오늘 금요일','금요일인데 정리할시간.....없다','최주영',SYSDATE);

INSERT INTO BOARD_COMMENT VALUES(1,'네 없어요!!!','유병승',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(2,'전 그럴의도가 없었어요','최솔',SYSDATE,2);

INSERT INTO BOARD_COMMENT VALUES(3,'전 그럴의도가 없었어요','최솔',SYSDATE,3);
INSERT INTO BOARD_COMMENT VALUES(4,'호호호 금요일 즐겨요!','조장흠',SYSDATE,3);

SELECT * 
FROM BOARD
    JOIN BOARD_COMMENT ON BOARD_NO=BOARD_REF;
    
-- FK가 설정된 컬럼에 NULL??? 저장된다. 저장하지 않으려면
-- NOT NULL제약조건을 설정해야한다.
INSERT INTO BOARD_COMMENT VALUES(5,'NULL들어가니?','최솔',SYSDATE,NULL);
SELECT * FROM BOARD_COMMENT;

-- FK를 설정해서 테이블간 관계가 설정이 되면 참조되고는 있는 부모테이블의
-- ROW를 함부로 삭제할 수 없다.
DELETE FROM BOARD WHERE BOARD_NO=2;

SELECT * FROM BOARD;

-- FK설정할때 삭제에 대한 옵션을 설정할 수 있다.
-- ON DELETE SET NULL : 참조컬럼을 NULL값으로 수정 * 참조컬럼에 NOT NULL제약조건이 있으면 안된다.
-- ON DELETE CASCADE : 참조되는 부모데이터가 삭제되면 같이 삭제버림


CREATE TABLE BOARD_COMMENT2(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    --BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE SET NULL
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);

INSERT INTO BOARD VALUES(1,'냉무',NULL,'유병승',SYSDATE);
INSERT INTO BOARD_COMMENT2 VALUES(6,'SET NULL','유병승',SYSDATE,1);
SELECT * FROM BOARD_COMMENT2;
DELETE FROM BOARD WHERE BOARD_NO=1;
DROP TABLE BOARD_COMMENT2;

-- 참조관계를 설정할때 대상이되는 컬럼에는 반드시 UNIQUE, PK제약조건이 설정되어있어야한다.
CREATE TABLE FK_TEST(
    FK_NO NUMBER,
    PARENT_NAME VARCHAR2(20), --REFERENCES BASIC_MEMBER(MEMBER_ID)
    FOREIGN KEY(PARENT_NAME) REFERENCES NQ_MEMBER2(MEMBER_ID)
);
-- FK는 한개의 테이블만 가능 다수 컬럼을 지정할 수 없다
-- FK설정하는 컬럼은 참조하는 컬럼과 타입, 길이(더커도 상관없음)가 일치해야한다.

-- CHECK제약조건
-- 컬럼에 지정한 값만 저장할 수 있게 하는 제약조건
-- 컬럼레벨에서 가능
CREATE TABLE PERSON(
    NAME VARCHAR2(20),
    AGE NUMBER CHECK(AGE > 0) NOT NULL,
    GENDER VARCHAR2(5) CHECK(GENDER IN('남','여'))
);
INSERT INTO PERSON VALUES('유병승',19,'남');
INSERT INTO PERSON VALUES('유병승',19,'유');

-- 테이블 생성시 DEFAULT값을 설정할 수 있음
-- DEFAULT예약어 사용
CREATE TABLE DEFAULT_TEST(
    TEST_NO NUMBER PRIMARY KEY,
    TEST_DATE DATE DEFAULT SYSDATE,
    TEST_DATA VARCHAR2(20) DEFAULT '기본값'
);
INSERT INTO DEFAULT_TEST VALUES(1,DEFAULT,DEFAULT);
INSERT INTO DEFAULT_TEST VALUES(2,'23/02/04','데이터');
INSERT INTO DEFAULT_TEST(TEST_NO) VALUES(3);
SELECT * FROM DEFAULT_TEST;

-- 제약설정시 이름설정하기
-- 기본방식으로 제약조건을 설정하면 SYS00000으로 자동으로 설정됨,
CREATE TABLE MEMBER_TEST(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_ID_UQ UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_PWD_NN NOT NULL,
    CONSTRAINT COMPOSE_UQ UNIQUE(MEMBER_NO,MEMBER_ID)
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='MEMBER_TEST';

-- 테이블을 생성할때 SELECT문를 이용할 수 있다.
-- 테이블 복사 개념
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

--TEST_MEMBER 테이블
--MEMBER_CODE(NUMBER) - 기본키						-- 회원전용코드 
--MEMBER_ID (varchar2(20) ) - 중복금지, NULL값 허용금지	-- 회원 아이디
--MEMBER_PWD (char(20)) - NULL 값 허용금지					-- 회원 비밀번호
--MEMBER_NAME(nchar(10)) - 기본값 '아무개'				-- 회원 이름
--MEMBER_ADDR (char(50)) - NULL값 허용금지					-- 회원 거주지
--GENDER (varchar2(5)) - '남' 혹은 '여'로만 입력 가능				-- 성별
--PHONE(varchar2(20)) - NULL 값 허용금지 					-- 회원 연락처
--HEIGHT(NUMBER(5,2) - 130이상의 값만 입력가능           -- 회원키

CREATE TABLE TEST_MEMBER(
    MEMBER_CODE NUMBER CONSTRAINT PK_MEMBER_CODE PRIMARY KEY,
    MEMBER_ID varchar2(20) UNIQUE NOT NULL,
    MEMBER_PWD char(20) NOT NULL,
    MEMBER_NAME nchar(10) DEFAULT '아무개',
    MEMBER_ADDR char(50) NOT NULL,
    GENDER varchar2(5) CHECK( GENDER  IN ('남','여')),				
    PHONE varchar2(20) NOT NULL,					
    HEIGHT NUMBER(5,2) CHECK( HEIGHT>=130)
);
COMMENT ON COLUMN TEST_MEMBER.MEMBER_CODE IS '회원전용코드';
COMMENT ON COLUMN TEST_MEMBER.MEMBER_ID IS '회원 아이디';
-- 회원 비밀번호
-- 회원 이름
-- 회원 거주지
-- 성별
-- 회원 연락처
-- 회원키

-- DML구문에 대해 알아보자
-- 테이블에 저장되는 데이터를 다루는 명령어
-- INSERT : 테이블에 데이터(ROW)추가하는 명령어
-- UPDATE : 테이블에 있는 데이터의 특정컬럼을 수정하는 명령어
-- DELETE : 테이블에 있는 특정ROW를 삭제하는 명령어

-- INSERT문 활용하기
-- 1. 전체컬럼에 값을 대입하기
-- INSERT INTO 테이블명 VALUES(컬럼에 대입할 값,컬럼에 대입할 값,컬럼에 대입할 값...)
--  * 테이블에 선언된 컬럼수와 동일해야한다.
-- 2. 특정컬럼을 골라서 값을 대입하기
-- INSERT INTO 테이블명(특정컬럼,특정컬럼...) VALUES(특정컬럼에 대입할값,특정컬럼에 대입할값,....)
--  * 지정된 컬럼의 수와 VALUES에 있는 수가 같아야함.
--  * 지정되지 않은 컬럼의 값은 NULL대입됨. 주의! 나머지 컬럼에 NOT NULL제약조건이 있으면 안된다.

CREATE TABLE TEMP_DEPT
AS SELECT * FROM DEPARTMENT WHERE 1=0;
SELECT * FROM TEMP_DEPT;

INSERT INTO TEMP_DEPT VALUES('D0','자바','L1');

INSERT INTO TEMP_DEPT VALUES('D1','오라클',TO_NUMBER('10'));

--컬럼을 지정해서 값을 대입하기
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


-- SELECT문을 이용해서 값 대입하기
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
-- EMPLOYEE테이블에서 부서가 D6인 사원들을 INSERT_SUB에 저장하기
INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE DEPT_CODE='D6');
SELECT * FROM INSERT_SUB;

-- 지정한 컬럼에 SELECT문으로 데이터 저장하기
INSERT INTO INSERT_SUB(EMP_ID,EMP_NAME)(SELECT EMP_ID,EMP_NAME FROM EMPLOYEE);

-- INSERT ALL
-- SELECT문을 이용해서 두개 이상의 테이블에 값을 넣을때 사용
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

-- INSERT ALL 을 조건맞춰서 저장시키기
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE 1=0;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

-- EMPLOYEE테이블에서 00년 이전 입사자는 EMP_OLD에 저장, 이후 입사자는 EMP_NEW에 저장하기
INSERT ALL
    WHEN HIRE_DATE<'00/01/01' THEN INTO EMP_OLD VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    WHEN HIRE_DATE>='00/01/01' THEN INTO EMP_NEW VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
SELECT EMP_ID,EMP_NAME,HIRE_DATE
FROM EMPLOYEE;

-- UPDATE는 다음주 월요일에... 할...까....요???? FALSE
-- UPDATE문 활용하기
-- UPDATE 테이블명 SET 수정할컬럼명=수정할값,수정할컬럼명=수정할값...[WHERE 조건]
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY, BONUS
FROM EMPLOYEE;
SELECT * FROM EMP_SALARY;
-- 전형돈의 급여를 300만원으로 수정하기
UPDATE EMP_SALARY SET SALARY=3000000 WHERE EMP_NAME='전형돈';
-- 다수컬럼값을 수정할 때는 , 구분해서 대입한다.
UPDATE EMP_SALARY SET SALARY=2500000,BONUS=0.5 WHERE EMP_NAME='전형돈';
-- 다수의 ROW 와 컬럼을 수정하기
-- 부서가 D5인 사원의 급여를 100000만원씩 추가하기
UPDATE EMP_SALARY SET SALARY=SALARY+100000 WHERE DEPT_CODE='D5';
SELECT * FROM EMP_SALARY WHERE DEPT_CODE='D5';

-- 유씨성을 가진 사원의 급여를 50만원 올리고 보너는 0.4수정하기
UPDATE EMP_SALARY SET SALARY=SALARY+500000, BONUS=0.4 WHERE EMP_NAME LIKE '유%';

-- 수정시 주의할점!!! 반드시 WHERE을 작성해서 타겟을 정확하게 설정해야한다.
-- WHERE을 작성하지 않으면 전체ROW가 수정되니 주의해야한다.
UPDATE EMP_SALARY SET EMP_NAME='유병승';
SELECT * FROM EMP_SALARY;
ROLLBACK;


-- UPDATE문에서 SELECT문 활용하기
-- 방명수의 부서,보너스를 심봉선과 동일하게 수정하자
UPDATE EMP_SALARY 
SET DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='심봉선'),
    BONUS=(SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME='심봉선')
WHERE EMP_NAME='방명수';
SELECT * FROM EMP_SALARY WHERE EMP_NAME IN('방명수','심봉선');

ROLLBACK;
UPDATE EMP_SALARY
SET (DEPT_CODE,BONUS) = (SELECT DEPT_CODE,BONUS FROM EMPLOYEE WHERE EMP_NAME='심봉선')
WHERE EMP_NAME='방명수';

-- DELETE 활용하기
-- 테이블의 ROW를 삭제하는 명령어
-- DELETE FROM 테이블명 [WHERE 조건식]
-- D9부서원들 삭제하기
DELETE FROM EMP_SALARY WHERE DEPT_CODE='D9';
SELECT * FROM EMP_SALARY;
ROLLBACK;
DELETE FROM EMP_SALARY;

--TRUNCATE 삭제 -> ROLLBACK
TRUNCATE TABLE EMP_SALARY;

-- DDL(ALTER, DROP)
-- ALTER : 오라클에 정의되어있는 OBJECT를 수정할때 사용하는 명령어
-- ALTER TABLE :테이블에 정의되어있는 컬럼, 제약조건을 수정할때 사용
CREATE TABLE TBL_USERALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
SELECT * FROM TBL_USERALTER;
-- 생성된 TBL_USERALTER테이블에 컬럼을 추가하기
-- ALTER TABLE 테이블명 ADD (컬럼명 자료형 [제약조건])
ALTER TABLE TBL_USERALTER ADD (USER_NAME VARCHAR2(20));
DESC TBL_USERALTER;
INSERT INTO TBL_USERALTER VALUES(1,'ADMIN','1234','관리자');

-- 테이블에 데이터가 있는 상태에서 컬럼을 추가하면?? 가능할까??
ALTER TABLE TBL_USERALTER ADD(NICKNAME VARCHAR2(30));
SELECT * FROM TBL_USERALTER;

-- 이메일 주소 추가할때 NOT NULL 제약조건설정
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(40) DEFAULT '미설정' NOT NULL);
ALTER TABLE TBL_USERALTER ADD(GENDER VARCHAR2(10) CONSTRAINT GENDER_CK CHECK (GENDER IN('남','여')));
INSERT INTO TBL_USERALTER VALUES(2,'USER01','USER01','유저1','유저','USERO1@USER01.COM','여');

-- 제약조건 추가하기
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건설정
ALTER TABLE TBL_USERALTER ADD CONSTRAINT USERID_UQ UNIQUE(USER_ID);
INSERT INTO TBL_USERALTER VALUES(3,'USER02','USER02','유저2','유저2','USERO2@USER02.COM','남');

-- NOT NULL제약조건은 이미 컬럼에 NULLABLE로 설정이 되어있기 때문에 ADD가 아닌 MODIFY변경으로 해줘야한다.
INSERT INTO TBL_USERALTER VALUES(4,'USER03',NULL,'유저2','유저2','USERO2@USER02.COM','남');
DELETE FROM TBL_USERALTER WHERE USER_NO=4;
--ALTER TABLE TBL_USERALTER ADD CONSTRAINT PASSWORD_NN NOT NULL;
ALTER TABLE TBL_USERALTER MODIFY USER_PWD CONSTRAINT USER_PWD_NN NOT NULL;

-- 컬럼수정하기 -> 컬럼의 타입, 크기를 변경하는것
-- ALTER TABLE 테이블명 MODIFY 컬럼명 자료형
DESC TBL_USERALTER;
ALTER TABLE TBL_USERALTER MODIFY GENDER CHAR(10);

-- 제약조건 수정하기 
ALTER TABLE TBL_USERALTER
MODIFY USER_PWD CONSTRAINT USER_PWD_UQ UNIQUE;

-- 컬럼명 변경하기
-- ALTER TABLE 테이블명 RENAME COLUMN 컬럼명 TO 새컬럼명
ALTER TABLE TBL_USERALTER RENAME COLUMN USER_ID TO USERID;
DESC TBL_USERALTER;

-- 제약조건명 변경하기
-- ALTER TABLE 테이블명 RENAME CONSTRAINT 제약조건명 TO 새제약조건명
ALTER TABLE TBL_USERALTER RENAME CONSTRAINT SYS_C007406 TO USERALTER_PK;

-- 컬럼삭제하기
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE TBL_USERALTER DROP COLUMN EMAIL;
DESC TBL_USERALTER;

-- 제약조건삭제하기
-- ALTER TABLE 테이블명 DROP CONSTARINT 제약조건명;
ALTER TABLE TBL_USERALTER DROP CONSTRAINT USERALTER_PK;


-- 테이블 삭제하기
DROP TABLE TBL_USERALTER;
SELECT * FROM TBL_USERALTER;
-- 테이블을 삭제할때 FK제약조건이 설정되어있다면 기본적으로 삭제가 불가능함.
CREATE TABLE EMP_COPY 
AS SELECT * FROM EMPLOYEE;
ALTER TABLE EMP_COPY ADD CONSTRAINT EMP_ID_PK PRIMARY KEY(EMP_ID);
DROP TABLE TBL_FKTEST;
CREATE TABLE TBL_FKTEST(
    EMP_ID VARCHAR2(20) CONSTRAINT FK_EMPID REFERENCES EMP_COPY(EMP_ID),
    CONTENT VARCHAR2(20)
);

INSERT INTO TBL_FKTEST VALUES('200','200이야');
INSERT INTO TBL_FKTEST VALUES('201','201이야');
INSERT INTO TBL_FKTEST VALUES('202','202이야');
SELECT * FROM TBL_FKTEST;
DROP TABLE EMP_COPY;
-- 옵션을 설정해서 삭제할 수 있다.
DROP TABLE EMP_COPY CASCADE CONSTRAINT;

-- DCL에 대해알아보자. -> SYSTEM계정이 수행
-- 사용자의 권한관리하는 명령어.
-- GRANT 권한, 역할 TO 사용자계정명
-- 권한 : CREATE VIEW, CREATE TABLE, INSERT, SELECT, UPDATE 등등
-- 역할(ROLE) : 권한의 묶음
-- 각 역할(ROLE)에 부여된 권한 확인하기
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='RESOURCE';
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='CONNECT';

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER QWER IDENTIFIED BY QWER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT CONNECT TO QWER;

-- BS계정의 테이블을 조회할 수 있는 권한 부여하기
GRANT SELECT ON BS.EMPLOYEE TO QWER;
GRANT UPDATE ON BS.EMPLOYEE TO QWER;
--GRANT SELECT ON BS. TO QWER;

-- 권한회수하기
-- REVOKE 권한 || ROLE FROM 사용자계정명
REVOKE UPDATE ON BS.EMPLOYEE FROM QWER;

-- ROLE만들기
CREATE ROLE MYROLE;
GRANT CREATE TABLE, CREATE VIEW TO MYROLE;

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE='MYROLE';
GRANT MYROLE TO QWER;

-- TCL : 트렌젝션을 컨트롤하는 명령어
-- COMMIT : 지금까지 실행한 수정구문(DML)명령어를 모두 DB에 저장
-- ROLLBACK : 지금까지 실행한 수정구문(DML)명령어를 모두 취소
-- 트렌젝션 : 하나의 작업단위 한개 서비스
-- 트렌젝션의 대상되는 명령어 : DML(INSERT, UPDATE, DELETE)

INSERT INTO JOB VALUES('J0','강사');
SELECT * FROM JOB;
COMMIT;

-- ORACLE에서 제공하는 OBJECT활용하기
-- USER, TABLE, VIEW, SEQUENCE, INDEX, SYNONYM, FUNCTION, PROCEDURE, PACKAGE 등등
CREATE TABLE EMP_M1
AS SELECT * FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT * FROM EMPLOYEE WHERE JOB_CODE='J4';

INSERT INTO EMP_M2 VALUES(999,'곽두원','561014-123456','KWACK@DF.COM','01021314123','D5','J1','S1',90000,0.5,
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

-- view에 대해 알아보자
-- SELECT문의 결과 RESULT SET을 하나의 테이블처럼 활용하게하는것
-- STORED VIEW 생성하기
-- CREATE [옵션] VIEW VIEW명칭 AS SELECT문
CREATE VIEW V_EMP
AS SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;

-- VIEW를 생성할 권한을 부여해야함.
-- SYSTEM / SYS AS SYSDBA계정으로 부여를 한다
GRANT CREATE VIEW TO BS;

CREATE OR REPLACE VIEW V_EMP
AS SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
-- 생성된 VIEW테이블 이용하기
SELECT * FROM V_EMP;


-- 부서별, 직책별 급여의 평균을 구하는 SELECT문
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


-- VIEW테이블 조회
SELECT * FROM USER_VIEWS;

-- VIEW에 특징
-- DML구무은 사용이 가능하니??
-- 실제테이블과 연결되어있는 컬럼을 수정할때는 가능, 가상컬럼은 수정이 불가능하다.
SELECT * FROM V_EMP;
UPDATE V_EMP SET EMP_NAME='최주영' WHERE EMP_NAME='월드컵';
UPDATE V_EMP SET SALARY=100 WHERE EMP_NAME='최주영';
UPDATE V_EMP SET DEPT_TITLE='TEST' WHERE DEPT_CODE='D1';
SELECT * FROM EMPLOYEE;
UPDATE V_AVG_DEPTJOB SET AVG_SALARY=1000000;

-- 단일 테이블로 만들어진 VIEW는 ISNERT가 가능함.
-- -> VIEW에서 값을 넣으것 이외에 컬럼에는 NULL값을 삽입함. -> NOT NULL제약조건이 설정되면 안된다.
CREATE VIEW V_EMPTEST
AS SELECT EMP_ID, EMP_NO, EMP_NAME, EMAIL, PHONE, JOB_CODE, SAL_LEVEL FROM EMPLOYEE;
--SELECT DEPT_CODE FROM V_EMPTEST;
INSERT INTO V_EMPTEST VALUES('997','981011-1234123','홍길동','HONG@HONG.COM','12341234','J1','S1');
-- JOIN을 사용한 VIEW는 INSERT가 불가능함.
-- JOIN, UNION연결된 VIEW는 입력이 불가능함.
INSERT INTO V_EMP VALUES('996','홍길동','980110-1234567','HONG@HONG.COM','12345','D5','J1'
    ,'S1',100,0.2,206,SYSDATE,NULL,'N','D0','되니','L3');
SELECT * FROM V_EMP;

-- DELETE문은 가능하니?
DELETE FROM V_EMPTEST WHERE EMP_ID='997';
SELECT * FROM EMPLOYEE;
DELETE FROM V_EMP WHERE EMP_NAME='옛사람';


-- VIEW생성시 사용할 수 있는 옵션
-- 1. OR REPLACE : 중복되는 VIEW이름이 있으면 덮어쓰기를 해주는 옵션.
-- * OBJECT명칭은 중복이 불가능하다.
CREATE OR REPLACE VIEW V_EMP
AS SELECT * FROM EMPLOYEE;
SELECT * FROM V_EMP;

-- FORCE/NOFORCE : 실제 테이블이 존재하지않아도 VIEW생성할 수있게 해주는 옵션.
SELECT * FROM TT;
DROP VIEW V_TT;
CREATE FORCE VIEW V_TT
AS SELECT * FROM TT;
SELECT * FROM V_TT;

CREATE TABLE TT(
    TTNO NUMBER,
    TTNAME VARCHAR2(200)
);

-- WITH CHECK OPTION : SELECT문의 WHERE절에 사용한 컬럼은 수정하지 못하게 만드는 옵션.
CREATE OR REPLACE VIEW V_CHECK
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' WITH CHECK OPTION;
SELECT * FROM V_CHECK;
UPDATE V_CHECK SET EMP_NAME='김재훈' WHERE EMP_NAME='하이유';
ROLLBACK;

-- WITH READ ONLY : VIEW테이블에서 수정을 불가능하게 하는 옵션 -> 읽기전용
CREATE OR REPLACE VIEW V_CHECK
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D5' WITH READ ONLY;


-- SEQUENCE에 대해 알아보자
-- 자동번호 발급해주는 객체
-- 기본 SEQUENCE생성하기
-- CREATE SEQUENCE 시퀀스이름 [옵션들];
-- 기본으로 생성하면 번호가 1부터 1씩 증가해서 발급해줌
-- 1. SEQUENCE번호를 발급하려면 시퀀스명.NEXTVAL을 선언한다.
CREATE SEQUENCE SEQ_BASIC;
SELECT SEQ_BASIC.NEXTVAL FROM DUAL;
-- SEQEUNCE는 중복되지않는 숫자를 발급해주기 때문에 테이블의 PK컬럼의 값으로 많이 사용한다.
SELECT * FROM BOARD;
DESC BOARD;
INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'첫번째게시글','첫번째','유병승',SYSDATE);


-- 현재 SEQUENCE값을 확인하기
-- 시퀀명.CURRVAL를 이용한다.
SELECT SEQ_BASIC.CURRVAL FROM DUAL;
SELECT SEQ_BASIC.NEXTVAL FROM DUAL;

SELECT * FROM BOARD;
CREATE TABLE ATTACHMENT(
    ATTACH_NO NUMBER PRIMARY KEY,
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO),
    FILENAME VARCHAR2(200) NOT NULL
);
INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'첨부파일게시글','첨부파일있다','유병승',SYSDATE);
INSERT INTO ATTACHMENT VALUES(1,SEQ_BASIC.CURRVAL,'내사진.PNG');
INSERT INTO ATTACHMENT VALUES(2,SEQ_BASIC.CURRVAL,'내사진2.PNG');
SELECT * FROM BOARD;
SELECT * FROM ATTACHMENT;
SELECT * FROM BOARD JOIN ATTACHMENT ON BOARD_NO=BOARD_REF;


-- SEQUENCE옵션값 활용하기
-- START WITH 숫자 : 설정한 숫자부터 시작 DEFAULT 1
-- INCREMENT BY 숫자 : 증가하는 간격을 의미 DEFAULT 1 
-- MAXVALUE 숫자 : 최대값을 설정
-- MINVALUE 숫자 : 최소값을 설정
-- CYCLE/NOCYCLE : 번호를 순환할지 말지 결정하는것 * MAXVALUE,MINVALUE가 설정되어있어야한다.
-- CACHE : 미리번호를 생성하는 기능 DEFAULT 20 
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

-- 1. CURRVAL를 호출하려면 같은 SESSION안에서 NEXTVAL을 한번이라도 호출하고 호출해야한다.
CREATE SEQUENCE SEQ_05;
SELECT SEQ_05.NEXTVAL, SEQ_05.CURRVAL FROM DUAL;

-- 2. SEQUNCE에 값을 추가해서 PK값으로 쓸 수 있다.
-- p_001, M_001
SELECT 'P_'||LPAD(SEQ_05.NEXTVAL,4,'0') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYYMMDD')||'_'||SEQ_05.NEXTVAL FROM DUAL;


-- 오라클에서 제공하는 SELECT문 
-- 계층형쿼리, 한 테이블에서 연관있는 ROW을 묶어서 출력할 수 있게 해주는 쿼리문 -> ROW순서를 연관있는 자료로 연결해서 출력
-- 매니저와 연결해서 출력하기
SELECT LEVEL, EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
    START WITH EMP_ID=200
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    
SELECT LEVEL||' '||LPAD(' ',(LEVEL-1)*5,' ')||EMP_NAME||NVL2(MANAGER_ID,'('||MANAGER_ID||')','') AS 조직도
FROM EMPLOYEE
    START WITH EMP_ID=200
    CONNECT BY PRIOR EMP_ID=MANAGER_ID;
    

-- PL/SQL구문에 대해 알아보자
-- PL/SQL구문을 사용하는 방법
-- 1. 익명블록을 이용하기 -> BEGIN ~ END;/ 구문을 사용하는 것 * 재사용이 불가능함.
-- 2. PROCEDURE, FUNCTION객체로 생성해서 이용 ->  OBJECT안에 작성된 PL/SQL * 생성된 OBJECT명으로 재사용이 가능

-- 익명블럭
-- PL/SQL구문은 크게 3가지로 나눠짐
-- [선언부] : DECLARE예약어를 사용 변수, 상수를 선언
--              변수선언방법 : 변수명 타입(기본타입, 참조타입, ROWTYPE, TABLE, RECODE);
-- [실행부] : BEGIN 구문작성  END;/ 조건문, 반복문 등 실행할 내용에 대해 작성하는 구문
-- [예외처리부] : 처리할 예외가 있을때 작성하는 구문
SET SERVEROUTPUT ON;
-- 스크립트 출력창에 문구를 출력할 수 있다.

BEGIN
    DBMS_OUTPUT.PUT_LINE('안녕 나의 첫 PL/SQL구문');
END;
/

-- 변수활용하기
-- 변수는 DECLARE부분에 변수명 자료형 형식으로 선언
-- 자료형의 종류
-- 기본자료형 : 오라클에서 제공하는 TYPE들 (NUMBER, VARCAHR2, CHAR, DATE......)
-- 참조형자료형 : 테이블의 특정컬럼에 설정된 타입을 불러와 사용
-- ROWTYPE : 테이블의 한개 ROW를 저장할 수 있는 타입
-- 타입을 생성해서 활용
-- TABLETYPE : 자바의 배열과 비슷한 타입 -> 인덱스번호가 있고, 한개타입만 저장이 가능
-- RECORDE : 자바의 클래스와 비슷한 타입 -> 멤버변수가 있고, 다수타입이 저장가능


-- 기본자료형 선언과 이용하기
DECLARE
    V_EMPNO VARCHAR2(20);
    V_EMPNAME VARCHAR2(15);
    V_AGE NUMBER := 19;
BEGIN
    V_EMPNO:='010224-1234567';
    V_EMPNAME:='유병승';
    DBMS_OUTPUT.PUT_LINE(V_EMPNO);
    DBMS_OUTPUT.PUT_LINE(V_EMPNAME);
    DBMS_OUTPUT.PUT_LINE(V_AGE);
END;
/

-- 참조형자료형이용하기
DECLARE 
    V_EMPID EMPLOYEE.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    V_EMPID:='200';
    V_SALARY := 1000000;
    DBMS_OUTPUT.PUT_LINE(V_EMPID||' : '||V_SALARY);
    --SQL문과 연동하여 처리하기
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
    WHERE EMP_ID='&사원번호';
    -- ROWTYPE의 각 컬럼을 출력하려면 .연산자를 이용해서 컬럼명으로 접근한다.
    DBMS_OUTPUT.PUT_LINE(V_EMP.EMP_ID||' '||V_EMP.EMP_NAME||' '||V_EMP.SALARY||' '||V_EMP.BONUS);
    SELECT * 
    INTO V_DEPT
    FROM DEPARTMENT
    WHERE DEPT_ID=V_EMP.DEPT_CODE;
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPT_ID||' '||V_DEPT.DEPT_TITLE||' '||V_DEPT.LOCATION_ID);
    
END;
/
-- 생성해서 사용하는 타입    
-- 테이블타입
DECLARE
    TYPE EMP_ID_TABLE IS TALE OF EMPLOYEE.EMP_ID%TYPEB 
    INDEX BY BINARY_INTEGER;
    -- 변수명 타입
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

-- RECORD타입활용하기
-- 클래스와 유사 
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
    WHERE EMP_NAME='&사원명';
    DBMS_OUTPUT.PUT_LINE(MYDATA.ID||MYDATA.NAME||MYDATA.DEPTTITLE||MYDATA.JOBNAME);
END;
/

-- PL/SQL구문에서 조건문 활용하기
-- IF문 활용
-- IF 조건식  
--  THEN : 조건식이 TRUE일때 THEN에 있는 구문이 실행됨. 
-- END IF;

DECLARE
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_ID='&사원번호';
    
    IF V_SALARY>3000000
        THEN DBMS_OUTPUT.PUT_LINE('많이 받으시네요!');    
    END IF;   
END;
/

-- IF 
--  THEN 실행구문
--  ELSE 실행구문
-- END IF;

DECLARE
    V_SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT SALARY
    INTO V_SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME='&사원명';
    IF V_SALARY>3000000
        THEN DBMS_OUTPUT.PUT_LINE('많이받으시네요!');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('보통이시네요!');
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
    WHERE EMP_NAME='&사원명';
    
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

-- IF 조건식 THEN ELSIF 조건식 THEN ELSE END IF;
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
    WHERE EMP_ID='&사원번호';
    
    IF V_JOBCODE='J1'
        THEN MSG := '대표이사';
    ELSIF V_JOBCODE IN ('J2','J3','J4')
        THEN MSG := '임원';
    ELSE MSG := '사원';
    END IF;
    INSERT INTO MSGTEST VALUES(V_EMP_ID,MSG);
    COMMIT;

END;
/
SELECT * FROM MSGTEST JOIN EMPLOYEE USING(EMP_ID);


-- CASE문 이용하기
DECLARE
    NUM NUMBER;
BEGIN
    NUM:='&수';
    CASE 
        WHEN NUM>10
            THEN DBMS_OUTPUT.PUT_LINE('10초과');
        WHEN NUM>5
            THEN DBMS_OUTPUT.PUT_LINE('10~5사이값');
        ELSE DBMS_OUTPUT.PUT_LINE('5이하의 값입니다.');
    END CASE;
END;
/

-- 반복문사용하기
-- 기본반복문 LOOP예약어를 이용
-- FOR, WHILE문이 있음.
DECLARE
    NUM NUMBER := 1;
    RNDNUM NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
        -- 오라클에서 랜덤값 출력하기
        RNDNUM:=FLOOR(DBMS_RANDOM.VALUE(1,10));
        DBMS_OUTPUT.PUT_LINE(RNDNUM);
        INSERT INTO BOARD VALUES(SEQ_BASIC.NEXTVAL,'제목'||RNDNUM,'CONTENT'||RNDNUM,'작성자'||RNDNUM,SYSDATE);
        NUM:=NUM+1;
        IF NUM>100
            THEN EXIT; --BREAK문과 동일
        END IF;            
    END LOOP;
    COMMIT;
END;
/
SELECT * FROM BOARD;

-- WHILE문
-- WHILE 조건문 LOOP
--  실행구문
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

-- FOR 변수 IN 범위(시작..끝) LOOP
-- END LOOP;

BEGIN
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/
-- FOR 변수 IN (SELECT문) LOOP
-- END LOOP;
BEGIN 
    FOR EMP IN (SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') AS GENDER FROM EMPLOYEE E) LOOP
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

-- PL/SQL구문저장하고 사용하기
-- PROCEDURE, FUNCTION
-- PROCEDURE
-- CREATE PROCEDURE 프로시져명
-- IS
-- 변수선언(필요하다면...)
-- BEGIN
--  실행할 로직
-- END;
-- /
-- 저장된 프로시저 실행하기
-- EXEC 프로시저명
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

-- 프로시저의 매개변수 활용하기
-- IN매개변수 : 프로시저실행시에 필요한 데이터를 받는 매개변수 * 일반적인 매개변수
-- OUT매개변수 :  호출한 곳에서 지정한 변수에 데이터를 대입해주는 매개변수를 의이함.

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

-- 전역변수선언
VAR EMP_NAME VARCHAR2(20);
PRINT EMP_NAME;
EXEC PRO_SELECT_EMP(201,:EMP_NAME);
PRINT EMP_NAME;


-- FUNCTION 오브젝트
-- 함수 : 매개변수, 리턴값을 갖는다.
-- SELECT문 내부에서 실행함.
-- CREATE FUNCTION 함수명([매개변수선언])
-- RETURN 리턴타입
-- IS 
-- [변수선언]
-- BEGIN
--  실행할 로직
-- END;
-- /
-- 매개변수로 받은 문자열의 길이를 반환해주는 함수
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

SELECT MYFUNC('유병승')
FROM DUAL;
SELECT MYFUNC(EMAIL)
FROM EMPLOYEE;

-- 매개변수로 EMP_ID를 받아서 연봉을 계산해주는 함수를 만들기
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
SELECT EMP_NAME, SALARY,BONUS, SAL_YEAR(EMP_ID) AS 연봉
FROM EMPLOYEE;

DECLARE
    V_RESULT NUMBER;
BEGIN
    V_RESULT:=SAL_YEAR('&사번');
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;
/

-- 신입사원이 추가되면 신입사원이 입사하였습니다 출력하는 트리거
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- 트리거 실행시 새로입력한값, 이전값에 대해 출력할 수 있음
    -- INSERT : 새로운값(0), 이전값(X) 
    -- UPDATE : 새로운값(O), 이전값(O)
    -- DELETE : 새로운값(X), 이전값(O)
    -- 새로운값 : :NEW.컬럼명
    -- 이전값 :  :OLD.컬럼명
    DBMS_OUTPUT.PUT_LINE('신입사원 '||:NEW.EMP_NAME||'님이 입사하였습니다');
END;
/
INSERT INTO EMPLOYEE VALUES('993','최솔','970105-1234567','CHOI@CHOIK.COM','01012341234','D3','J1',
    'S1',10,0.5,200,SYSDATE,NULL,DEFAULT);

--트리거로 재고관리하기
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
    STATUS VARCHAR2(10) CHECK(STATUS IN('입고','출고'))    
);

CREATE SEQUENCE SEQ_PROIO;

SELECT * FROM TBL_PRODUCT;
SEELCT * FROM TBL_PROIO;
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'랜드로버','레인지로버',80000000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'맥북프로','애플',2800000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'에어컨','삼성',1300000,DEFAULT);
INSERT INTO TBL_PRODUCT 
VALUES(SEQ_PRO.NEXTVAL,'아이패드','애플',1600000,DEFAULT);
SELECT * FROM TBL_PRODUCT;
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,1,SYSDATE,10,'입고');
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,2,SYSDATE,7,'입고');
INSERT INTO TBL_PROIO VALUES(SEQ_PROIO.NEXTVAL,2,SYSDATE,3,'출고');

SELECT * FROM TBL_PROIO;
SELECT * FROM TBL_PRODUCT;

DELETE FROM TBL_PROIO;
COMMIT;

CREATE OR REPLACE TRIGGER TRG_PRODUCT
AFTER INSERT ON TBL_PROIO
FOR EACH ROW
BEGIN
    IF :NEW.STATUS='입고'
        THEN UPDATE TBL_PRODUCT SET STOCK=STOCK+:NEW.AMOUNT 
        WHERE : NEW.PCODE=PCODE;
    ELSIF : NEW.STATUS='출고'
        THEN UPDATE TBL_PRODUCT SET STOCK=STOCK-:NEW.AMOUNT
        WHERE : NEW.PCODE=PCODE;
    END IF;
END;
/

CREATE USER student IDENTIFIED BY student DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT RESOURCE, CONNECT TO student;




















    
    






























        
        
        
        
        
        





















































































