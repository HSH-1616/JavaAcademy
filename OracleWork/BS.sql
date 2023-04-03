SELECT * FROM DBA_USERS;
SELECT * FROM TAB;

--DATABASE사용하기
--1.사용할 계정을 관리자(SYSTEM)계정으로 생성해줌
--  -관리자로 접속해서 생성명령어를 이용함
--2.생성한 계정이 DATABASE를 이용하기 위해서는 권한부여해줘야 한다.
--  -관리자로 접속해서 권한 부여 명령어를 이용
--  -부여권한:접속할수있는 권한(CONNECT) 사용할 수 있는 권한(RESOURCE)

--계정 생성하는 명령어
--CREATE USER 사용자계정명 IDENTIFIED BY 비밀번호 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
--18C버전부터 사용자계정명에 ##을 붙여서 생성해야한다.
--##안붙일수 있게 설정하기
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--DB에 등록되어 있는 사용자 조회하기
SELECT * FROM DBA_USERS;

--사용자를 생성하더라도 권한이 없으면 DB를 이용할수가 없다.
--사용자에게 권한부여하기
--GRANT 권한 OR 롤(역할) TO 사용자계정명
GRANT CONNECT TO BS;
--테이블을 이용할 수 있는 권한을 부여하기
GRANT RESOURCE TO BS;

GRANT CONNECT, RESOURCE TO BS;
--BS계정에서 SQL문 실행해보기
SELECT * FROM TAB; --계정에서 이용하고 있는 테이블을 조회하는 명령어

CREATE TABLE TEST(
TEST VARCHAR2(200)
);

--USER01이라는 계정을 생성하고 접속하게 하기
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

--기본실습DB에 대해 알아보자.
--사원, 부서, 직책, 근무지, 급여수준, 근무지별 국가
--사원 테이블의 정보확인하기
SELECT * FROM EMPLOYEE;
--부서 테이블의 정보확인하기
SELECT * FROM DEPARTMENT;
--직책에 대한 정보확인하기
SELECT * FROM JOB;
--부서별 근무지
SELECT * FROM LOCATION;
--근무지역 국가별정보
SELECT * FROM NATIONAL;
--급여수준
SELECT * FROM SAL_GRADE;

--SELCET문을 활용하기
--기본문법
--SELECT 컬럼명,컬럼명.....||*
--FROM 테이블명

--SELECT문을 이용해서 EMPLOYEE테이블 조회하기
SELECT EMP_NAME, EMP_NO, EMAIL, PHONE
FROM EMPLOYEE;

--SELECT문을 이용해서 EMPLOYEE테이블의 전체 컬럼 조회하기
SELECT *
FROM EMPLOYEE;

--전체 사원의 이름, 월급, 보너스 입사일을 조회하기
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE;

--모든 내용을 확인할때는 SELECT문을 이용함.
--SELECT문을 이용해서 산술연산 처리하기
--+,-,*,/(사칙연산)->피연산자 리터럴, 컬럼값
SELECT 10+20,10-20,20/3,5*4
FROM DUAL;

--리터럴, 컬럼 연산
--전체사원의 급여에 100원씩 더하기
SELECT EMP_NAME,SALARY+100,SALARY
FROM EMPLOYEE;

--컬럼, 컬럼 연산
SELECT EMP_NAME, SALARY+BONUS
FROM EMPLOYEE;

--NULL값과 연산은 불가능하다 -> 결과가 무조건 NULL로 출력됨.
SELECT SALARY, BONUS
FROM EMPLOYEE;

--산술연산은 숫자형만 가능하다.
--오라클에서 문자열 리터럴은 ''을 사용한다.
SELECT '이제 점심먹자'
FROM DUAL;

SELECT EMP_NAME, SALARY, BONUS,10+30
FROM EMPLOYEE;

--사원테이블에서 사원명, 부서코드, 월급, 연봉 조회하기
--사원테이블에서 사원명, 부서코드, 월급, 보너스가 포함된 연봉 조회하기

SELECT EMP_NAME, DEPT_CODE, SALARY, SALARY*12
FROM EMPLOYEE;

SELECT EMP_NAME, DEPT_CODE, SALARY, (SALARY+(SALARY*BONUS))*12
FROM EMPLOYEE;

--테이블에 존재하는 컬럼만 조회가 가능하다.
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

--조회된 컬럼에 별칭을 부여할 수 있다. -> 가상 컬럼에 많이 사용
--AS 예약어를 사용한다.
--예) SELECT EMP_NAME AS 사원명 FROM EMPLOYEE
SELECT EMP_NAME AS 사원명, SALARY AS 월급, EMAIL AS 이메일
FROM EMPLOYEE;

--AS를 생략하고 띄어쓰기로 부여할 수 있다.
SELECT EMP_NAME 사원명, SALARY 월급, EMAIL 이메일
FROM EMPLOYEE;

--별칭에 띄어쓰기, 특수기호가 가능하니?
SELECT EMP_NAME AS "사 원 명", SALARY AS "%월!급"
FROM EMPLOYEE;

--조회되는 데이터의 중복을 제거해주는 명령어 : DISTINCT
--컬럼명 앞에 사용, SELECT문의 맨 앞에 작성
--SELECT DISTINCT 컬럼명(,컬럼명....) FROM 테이블명 
SELECT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
--SELECT EMP_NAME, DINTINCT DEPT_CODE FROM EMPLOYEE;
SELECT DISTINCT EMP_NAME, DEPT_CODE FROM EMPLOYEE;
SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE;
SELECT DISTINCT DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE;

--오라클에서 문자열을 연결해주는 연산자
SELECT '점심'+'맛있다.'
FROM DUAL;

SELECT '점심'||'맛없다'
FROM DUAL;

--||연산은 컬럼을 합쳐서 출력할때도 사용한다.
SELECT EMP_NAME||EMP_NO||EMAIL INFO
FROM EMPLOYEE;
SELECT EMP_NAME||SALARY||BONUS
FROM EMPLOYEE;

SELECT EMP_NAME||'님의 월급은 '||SALARY||' 보너스'||BONUS
FROM EMPLOYEE;

--원하는 ROW(DATA)만 출력하기
--지정한 조건에 맞는 데이터만 가져오기
--WHERE 조건식 이용한다.
--사용방식
--SELECT 컬럼, 컬럼........ OR*
--FROM 테이블명
--WHERE 조건식

SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE='D9';

--사원 중 월급이 200만원 이상인 사원을 조회하기
SELECT * FROM EMPLOYEE
WHERE SALARY>=2000000;

--사원 중 직책이 J2가 아닌 사원 조회하기
SELECT * FROM EMPLOYEE
WHERE JOB_CODE !='J2';

SELECT * FROM EMPLOYEE
WHERE JOB_CODE <>'J2';

--여러개의 비교연산 처리하기
--사원 중 부서가 D5이고 월급이 300만원 이상인 사원의 이름, 부서코드, 월급 조회하기
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

--사원 중 부서가 D5이거나 월급이 300만원 이상인 사원의 이름, 부서코드, 월급 조회하기
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' OR SALARY>=3000000;

SELECT * FROM EMPLOYEE
WHERE 1=2;

--날짜를 대소비교하기
--날짜를 대소비교할떄는 문자로 비교, 문자열 패턴을 맞춰줌.
--기본적인 날짜를 표시하는 문자열 패턴 : YY/MM/DD -> 'YY/MM/DD'
SELECT HIRE_DATE FROM EMPLOYEE;

--입사일이 2000년 01월 01일 이전인 사원의 이름, 입사일을 조회하기
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE
WHERE HIRE_DATE<'00/01/01';

--입사일이 95년 01월 01일 이전인 사원의 전체내용 조회하기
SELECT * FROM EMPLOYEE
WHERE HIRE_DATE<'95/01/01';

--특정 범위에 있는 값을 조회하기
--사원 중 200만원 이상 300만원 이하 월급을 받는 사원의 사원명, 월급, 보너스, 입사일을 조회하기
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY<=3000000;

-- 사원중 입사일이 00년01월01부터 02년 12월 31일 까지인 사원 전체 조회하기
SELECT * FROM EMPLOYEE
WHERE HIRE_DATE>='00,01,01' AND HIRE_DATE<='02,12,31';

--범위의 값을 조회할때 BETWEEN AND 연산을 이용하기
--컬럼명 BETWEEN 값 AND 값;
SELECT EMP_NAME, SALARY, BONUS, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

SELECT * FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN'00/01/01' AND '02/12/31' AND DEPT_CODE='D9';

--LIKE연산자 이용하기
--검색을 문자열 패턴으로 검색하는 기능->부분일치, 포함여부, 원하는 문자열 패턴 검색
--문자열 패턴을 나타내는  기호
-- % : 문자가 0개이상 아무문자나 허용할때 사용
-- 예) %강% : 강, 한강, 두강, 두만강, 한강다리, 강강술래 -> 강이 포함되어있는 문자열
--     %강 : 강으로 끝나는 말
--     강% : 강으로 시작하는 말
-- _ : 문자가 1개 아무문자나 허용할때 사용
--예)_강_: 중간에 강이 있는 세글자
--  _강 : 강으로 끝나는 두글자
--  강_ : 강으로 시작하는 두글자
--  _강% : 두글자 이상의 두번째 자리에 강을 포함하는 문자
-- 컬럼명 LIKE '패턴';

-- 사원 중 유씨성을 가진 사원의 이름, 월급, 부서코드를 조회
SELECT EMP_NAME, SALARY, DEPT_CODE FROM EMPLOYEE
WHERE EMP_NAME LIKE '유__';

--이메일 주소에 yo를 포함하고 있는 사원의 사원명, 이메일 조회하기
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';

--이메일 주소에 j를 포함하고 유씨성을 가진 사원 조회하기
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '유__';

--LIKE에 일치하지 않는 사원 찾기
--NOT부정연산사용
--김씨가 아닌 사원들 찾기
SELECT * FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '김%';

--이메일 주소에 _앞글자가 3글자인 사원의 사원명 이메일 조회하기
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE EMAIL LIKE '___\_%' ESCAPE '\';

--NULL값을 조회하기
--NULL-> 쓰레기, 아무의미 없는 값 -> 연산이 불가능
--오라클이 제공하는 NULL비교연산자를 사용
--IS NULL, IS NOT NULL
--보너스를 받지 않는 사원 조회하기
SELECT EMP_NAME,BONUS FROM EMPLOYEE
--WHERE BONUS=NULL;
WHERE BONUS IS NULL;

--보너스를 받고있는 사원의 이름, 보너스를 조회하기
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

--조회된 컬럼값이 NULL일때 대체하기
--NVL(컬럼명,대체값)함수를 이용
SELECT EMP_NAME, SALARY, NVL(BONUS,0)
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE,'인턴')FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

--다중값 동등비교하기
--IN/NOT IN : 여러개의 값을 OR로 연결해서 동등비교할때 사용하는 연산자
--사원중 부서코드가 D5,D6,D7,D8인 사원구하기
SELECT * FROM EMPLOYEE
--WHERE DEPT_CODE='D5' OR DEPT_CODE='D6' OR DEPT_CODE='D7' OR DEPT_CODE='D8';
WHERE DEPT_CODE IN ('D5','D6','D7','D8');

--서브쿼리문
--SELECT EMP_NAME, DEPT_CODE
--FROM EMPLOYEE
--WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='총무부' OR DEPT_TITLE LIKE '%해외');

--연산자 우선순위
--직책이 J7이거나 J2인 사원 중 급여가 200만원 이상인 사원을 조회하기
--이름, 월급, 직책코드
SELECT EMP_NAME, SALARY, JOB_CODE FROM EMPLOYEE
WHERE  JOB_CODE IN('J7','J2') AND SALARY>=2000000; 

--오라클에서 제공하는 함수에 대해 알아보자
--단일행함수 : 테이블의 모든 행에 결과가 반환되는 함수
--           문자, 숫자, 날짜, 형변환, 선택함수(조건활용)          
--그룹함수 : 테이블에 한개의 결과가 반환되는 함수
--          합게 편균 갯수 최대값 최소값

--단일행 함수 활용하기
--사용하는 위치
--SELCECT문의 컬럼을 작성하는 부분, WHERE절
--INSERT, UPDATE, DELETE문에서 사용이 가능

--문자열 함수에 대해 알아보자
--문자열을 처리하는 기능
--LENGTH : 지정된 컬럼이나, 리터럴값에 대한 길이를 출력해주는 함수
--LENGTH('문자열')||(컬럼명) -> 문자열의 갯수를 출력
SELECT LENGTH('오늘 월요일 힘내요')FROM DUAL;
SELECT LENGTH(EMAIL) FROM EMPLOYEE;

--이메일이 16글자 이상인 사원을 조회하기
SELECT EMP_NAME, EMAIL, LENGTH(EMAIL) FROM EMPLOYEE
WHERE LENGTH(EMAIL)>=16;

--LENGTHB : 차지하는 BYTE를 출력
--EXPRESS버전에서 한글을 3BYTE로 처리함, ENTERPRISE버전에서는  2BYTE로 처리
SELECT LENGTHB('ABCD'), LENGTHB('월요일') FROM EMPLOYEE;

--INSTR : 자바의 INDEXOF와 유사한 기능
--INSTR('문자열')||(컬럼), '찾을 문자'{,시작위치, 찾을번째(횟수)}
SELECT INSTR('GD아카데미','G'),INSTR('GD아카데미','데'),INSTR('GD아카데미','병') FROM DUAL;
SELECT EMAIL, INSTR(EMAIL,'j') FROM EMPLOYEE;

--이메일 주소에 j가 포함되어 있는 사원 찾기
SELECT EMP_NAME, EMAIL FROM EMPLOYEE
WHERE INSTR(EMAIL,'j')>0;

SELECT INSTR('GD아카데미 GD게임즈 GD음악 GD화이팅','GD'),
        INSTR('GD아카데미 GD게임즈 GD음악 GD화이팅','GD',3),
        INSTR('GD아카데미 GD게임즈 GD음악 GD화이팅','GD',-1),
        INSTR('GD아카데미 GD게임즈 GD음악 GD화이팅','GD',1,3) FROM DUAL;

--사원테이블에서 @의 위치를 찾기
SELECT INSTR(EMAIL,'@')FROM EMPLOYEE;

--LPAD/RPAD : 문자열의 길이가 지정한 길이만큼 차지 않았을때 빈공백을 채워주는 함수
--LPAD/RPAD(문자열||컬럼,최대길이,대체문자)
SELECT LPAD('유병승',10,'*'),RPAD('유병승',10,'@'),LPAD('유병승',10) FROM DUAL;
SELECT EMAIL, RPAD(EMAIL,20,'#')FROM EMPLOYEE;

--LTRIM/RTRIM : 공백을 제거하는 함수, 특정 문자를 지정해서 삭제
--LTRIM/RTRIM('문자열'||컬럼,['특정문자'])
SELECT '           병승',LTRIM('           병승'),RTRIM('          병승       ')
,RTRIM('   병   승  ') FROM DUAL;

--특정문자를 지정해서 삭제할 수 있다.
SELECT '병승2222', RTRIM('병승2222','2'), RTRIM('병승221223','123') FROM DUAL;

--TRIM : 양쪽에 있는 값을 제거하는 함수, 기본 : 공백, 설정하면 설정값을 제거(한글자만)
--TRIM(문자열||컬럼)
--TRIM((LEADING||TRAILING||BOTH '제거할문자' FROM 문자열||컬럼명)
SELECT '     월요일    ', TRIM('     월요일    '),'ZZZZZ마징가ZZZZZ',TRIM('Z' FROM 'ZZZZZ마징가ZZZZZ') ,
   TRIM(LEADING 'Z' FROM 'ZZZZZ마징가ZZZZZ'),
   TRIM(TRAILING 'Z' FROM 'ZZZZZ마징가ZZZZZ'),
   TRIM(BOTH 'Z' FROM 'ZZZZZ마징가ZZZZZ') FROM EMPLOYEE;

--SUBSTR : 문자열을 잘라내는 기능 * JAVA SUBSTRING메소드와 동일
--SUBSTR : (문자열||컬럼명,시작인데스번호[,길이])
SELECT SUBSTR('SHOWMETHEMONEY',5), SUBSTR('SHOWMETHEMONEY',5,2)
,SUBSTR('SHOWMETHEMONEY',INSTR('SHOWMETHEMONEY','MONEY'))
,SUBSTR('SHOWMETHEMONEY',-5,2) FROM DUAL;

--사원의 이메일에서 아이디값만 출력하기
--아이디가 7글자 이상인 사원만 조회
SELECT EMP_NAME, EMAIL, SUBSTR (EMAIL,1,INSTR(EMAIL,'@')-1) FROM EMPLOYEE
--WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;
WHERE EMAIL LIKE '_______@%';

--사원의 성별을 표시하는 번호를 출력하기
--여자 사원만 조회
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO,8,1) FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN(2,4);

--영문자를 처리하는 함수 : UPPER, LOWER, INITCAP
SELECT UPPER('Welcome TO oRACLE worLd'),
LOWER('Welcome TO oRACLE worLd'),
INITCAP('Welcome TO oRACLE worLd') FROM DUAL;

--CONCAT : 문자열을 결합해주는 함수
--||연산자 와 동일
SELECT EMP_NAME||EMAIL, CONCAT(EMP_NAME, EMAIL), CONCAT(CONCAT(EMP_NAME, EMAIL),SALARY) FROM EMPLOYEE;

--REPLACE : 대상일치(컬럼)에서 지정문자를 찾아서 특정문자로 변경하는 것
--REPLACE(문자열||컬럼명,'찾을문자','대체문자')
SELECT EMAIL, REPLACE(EMAIL,'BS','GD') FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMAIL=REPLACE(EMAIL,'BS','GD');
--SELECT EMAIL FROM EMPLOYEE;
--ROLLBACK;

--REVERSE : 문자열을 거꾸로 만들어주는 기능
SELECT EMAIL, REVERSE(EMAIL), EMP_NAME, REVERSE(EMP_NAME), REVERSE(REVERSE(EMP_NAME)) FROM EMPLOYEE;

--TRANSLATE : 매칭되는 문자로 변경해주는 함수
SELECT TRANSLATE('010-3644-6259','0123456789','영일이삼사오육칠팔구') FROM DUAL;

--숫자 처리함수
--ABS : 절대값을 처리하는 함수
SELECT ABS(-10), ABS(10) FROM DUAL;

--MOD : 나머지를 구하는 함수 * 자바의 %연산자와 동일한 함수
SELECT MOD(3,2) FROM DUAL;
SELECT E.*, MOD(SALARY,3) FROM EMPLOYEE E;

--소수점을 처리하는 함수
--ROUND : 소수점을 반올림하는 함수
--ROUND(숫자||컬럼명[,자리수])
SELECT 126.567, ROUND(126.567), ROUND(126.467), ROUND(126.567,1) FROM DUAL;

--보너스를 포함한 월급구하기
SELECT EMP_NAME,SALARY,SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03),ROUND(SALARY+SALARY*NVL(BONUS,0)-(SALARY*0.03)) FROM EMPLOYEE;

--FLOOR : 소수점자리 버림
SELECT 126.567, FLOOR(126.567)FROM DUAL;

--TRUNC : 소수점 자리 버림 자리수를 지정
SELECT 126.567, TRUNC(126.567), TRUNC(126.567,2),TRUNC(126.567,-2)
,TRUNC(2123456.32,-2) FROM DUAL;

--CEIL : 소수점 올림
SELECT 126.567, CEIL(126.567), CEIL(126.111) FROM EMPLOYEE;

--날짜처리함수 이용하기
--오라클에서 날짜를 출력할때는 두가지 방식이 있음
--1.SYSDATE예약어 -> 날짜 년/월/일 오늘 날짜(오라클이 설치되어있는 컴퓨터의 시간)을 출력해줌.
--2.SYSTIMESTAMP예약어 -> 날짜,시간까지 출력해줌
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;

--날짜도 산술연산 처리가 가능함, +,- 연산가능 -> 일수가 차감, 추가됨.
SELECT SYSDATE, SYSDATE-2, SYSDATE+3, SYSDATE+30 FROM DUAL;

--NEXT_DAY : 매개변수로 전달받은 요일 중 가장 가까운 다음 날짜 출력
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월'),NEXT_DAY(SYSDATE,'수') FROM DUAL;

--LOCALE의 값을 가지고 언어선택
SELECT * FROM V$NLS_PARAMETERS;
ALTER SESSION SET NLS_LANGUAGE="AMERICAN";
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MON'),NEXT_DAY(SYSDATE,'WED') FROM DUAL;
ALTER SESSION SET NLS_LANGUAGE="KOREAN";

--LAST_DAY : 그 달의 마지막 날을 출력
SELECT SYSDATE, LAST_DAY(SYSDATE), LAST_DAY(SYSDATE+30) FROM DUAL;

--ADD_MONTHS : 개월수를 더하는 함수
SELECT SYSDATE, ADD_MONTHS(SYSDATE,10) FROM DUAL;

-- MONTH_BETWEEN : 두개의 날짜를 받아서 두 날짜의 개월수를 계산해주는 함수
SELECT FLOOR(MONTHS_BETWEEN('23/08/17',SYSDATE)) FROM DUAL;

--날짜의 연도, 월, 일자를 따로 출력할 수 있는 함수
--EXTRACT(YEAR||MONTH||DAY FROM 날짜) : 숫자로 출력해줌.
--현재날짜의 년, 월, 일 출력하기
SELECT EXTRACT (YEAR FROM SYSDATE) AS 년, EXTRACT(MONTH FROM SYSDATE) AS 월, EXTRACT(DAY FROM SYSDATE)AS 일 FROM DUAL;

--사원중 12월에 입사한 사원들을 구하시오.
SELECT * FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12;

SELECT EXTRACT(DAY FROM HIRE_DATE)+100 FROM EMPLOYEE;

--군대복무기간은 1년 6개월, 전역일자를 구하고, 전역때까지 먹는 짬밥수(하루세끼)를 구하기
SELECT ADD_MONTHS(SYSDATE,18) AS 전역일자, (ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS 짬밥수 FROM DUAL;

--형변환 함수
--오라클에서는 자동형변환이 잘 작동을함.
--오라클 데이터를 저장하는 타입이 있음.
--문자 : CHAR, VARCHAR2, NCHAR, NVARCHAR2 -> JAVA String과 동일
--숫자 : NUMBER, 
--날짜 : DATE, TIMESTAMP

--TO_CHAR : 숫자, 날짜를 문자형으로 변경해주는 함수
--날짜를 문자형으로 변경하기
--날짜값을 기호로 표시해서 문자형으로 변경을 한다.
--Y : 년, M : 월, S : 일, H : 시, MI : 분, SS : 초
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD'), TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YYYY.MM.DD'), TO_CHAR(HIRE_DATE,'YYYY-MM-DD HH:MI:SS') FROM EMPLOYEE;

--숫자를 문자형으로 변경하기
--패턴에 맞춰서 변환 -> 자리수를 어떻게 표현할지 선택
--0 : 변환대상값의 자리수가 지정한 자리수와 일치하지 않을때, 값이 없는 자리에 0을 표시하는 패턴
--9 : 변환대상값의 자리수가 지정한 자리수와 일치하지 않을때, 값이 없는 자리에 생략하는 패턴
--통화를 표시하고 싶을때는 L을 표시
SELECT 1234567, TO_CHAR(1234567,'000,000,000'),TO_CHAR(1234567,'999,999,999')
,TO_CHAR(500,'L999,999') FROM DUAL;

SELECT 180.5, TO_CHAR(180.5,'000,000,00'),TO_CHAR(180.5,'FM999,999,00') FROM DUAL;

--월급을 통화표시하고 ,로 구분해서 출력하고 입사일은 0000.00.00으로 출력하기
SELECT TO_CHAR(SALARY,'L999,999,999'), TO_CHAR(HIRE_DATE,'YYYY,MM.DD') FROM EMPLOYEE;

--숫자형으로 변경하기
--TO_NUMBER함수를 이용
--문자를 숫자형으로 변경하기
SELECT 1000000+1000000,TO_NUMBER('1,000,000','999,999,999')+1000000 ,
TO_CHAR(TO_NUMBER('1,000,000','999,999,999')+1000000,'FML999,999,999') FROM DUAL;

-- 날짜형으로 변경하기
-- 숫자를 날짜로 변경
-- 문자이름 날짜로 변경
SELECT TO_DATE('23/12/25','YY/MM/DD')-SYSDATE, TO_DATE('241225','YYMMDD') ,
TO_DATE('25-12-25','YY-MM-DD') FROM DUAL;

SELECT TO_DATE(20230405,'YYYYMMDD'), TO_DATE(230505,'YYMMDD'),TO_DATE(TO_CHAR(000224,'000000'),'YYMMDD') FROM DUAL;

--NULL값을 처리해주는 함수
--NVL함수 : NVL(컬럼,대체값)
--NVL2함수 : NVL2(컬럼,NULL아닐때, NULL일때)
SELECT EMP_NAME, DEPT_CODE, NVL(DEPT_CODE,'인턴'), NVL2(DEPT_CODE,'있음','없음') FROM EMPLOYEE;

--조건에 따라 출력할 값을 변경해주는 함수
--1. DECODE
--DECODE(컬럼명||문자열,'예상값','대체값','예상값','대체값2'.....)
--주민번호에서 8번째자리의 수가 1이면 남자, 2이면 여자를 출력 컬럼 추가하기
SELECT EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),'1','남자','2','여자') AS GENDER FROM EMPLOYEE;

--각 직책코드의 명칭을 출력하기
--J1 대표, J2 부사장, J3 부장, J4 과장
SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE,'J1','대표','J2','부사장','J3','부장','J4','과장','사원')FROM EMPLOYEE;

--2. CASE WITH THEN ELSE
--CASE
--      WHEN 조건식 THEN 실행내용
--      WHEN 조건식 THEN 실행내용
--      ELSE 실행내용
--END

SELECT EMP_NAME, JOB_CODE,
    CASE
        WHEN JOB_CODE ='J1' THEN '대표'
        WHEN JOB_CODE ='J2' THEN '부사장'
        WHEN JOB_CODE ='J3' THEN '부장'
        WHEN JOB_CODE ='J4' THEN '과장'
        ELSE '사원'
    END AS 직책,
    
    CASE JOB_CODE
        WHEN 'J1' THEN '대표'
        WHEN 'J2' THEN '부사장'
    END 
FROM EMPLOYEE;

--월급을 기준으로 고액월급자와 중간월급자 그외를 나눠서 출력하기
--월급이 400만원 이상이면 고액
--월급이 400미만 300이상이면 중간월급
--나머지는 그외

SELECT EMP_NAME, SALARY,
    CASE 
        WHEN SALARY>=4000000 THEN '고액월급자'
        WHEN SALARY>=3000000 THEN '중간월급자'
        ELSE '그외'
    END AS 결과
FROM EMPLOYEE;        

--사원테이블에서 현재나이 구하기
SELECT EMP_NAME, EMP_NO, SUBSTR((EXTRACT(YEAR FROM SYSDATE)-SUBSTR(EMP_NO,1,2)+1),3,2) FROM EMPLOYEE;

insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('251','월드컵','020808-4123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

SELECT * FROM EMPLOYEE;

--UPDATE EMPLOYEE SET EMP_NO='320808-1123341' WHERE 

--그룹 함수 활용하기
--테이블의 데이터에 대한 집계하는 함수들 합계, 평균, 갯수, 최대값, 최소값을 구하는 함수
--그룹함수의 결과는 기본적으로 한개의 값만 가져옴
--추가 컬럼을 선택하는 것이 제한
--종류
--SUM : 테이블의 특정컬럼에 대한 총합 -> SUM(컬럼(NUMBER))
--AVG : 테이블의 특정컬럼에 대한 평균 -> AVG(컬럼(NUMBER))
--COUNT : 테이블의 데이터 수 (ROW수) -> COUNT(*||컬럼) 
--MIN : 테이블의 특정컬럼에 대한 최소값 -> MIN(컬럼)
--MAX : 테이블의 특정컬럼에 대한 최대값 -> MAX(컬럼)

--사원의 월급의 총합계를 구해보자
SELECT TO_CHAR(SUM(SALARY),'999,999,999')FROM EMPLOYEE;

--D5부서의 월급의 총합계를 구해보자
SELECT TO_CHAR(SUM(SALARY),'999,999,999')FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--J3사원에 급여 합계를 구하시오
SELECT SUM(SALARY) FROM EMPLOYEE
WHERE JOB_CODE='J3';

--평균구하기 AVG함수
-- 전체사원에 대한 평균구하기
SELECT AVG(SALARY) FROM EMPLOYEE;
-- D5의 급여 평균을 구하기
SELECT AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--D5부서의 급여합계와 평균 구하기
SELECT SUM(SALARY), AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--NULL값에 대해서는 어떻게 처리가 될까 -> NULL값은 데이터 제외해버림
SELECT SUM(SALARY),AVG(BONUS),AVG(NVL(BONUS,0)) FROM EMPLOYEE;

--테이블의 데이터수 확인하기
SELECT COUNT(*),COUNT(DEPT_CODE) FROM EMPLOYEE;

--D6부서의 인원 조회하세요
SELECT COUNT(DEPT_CODE)FROM EMPLOYEE
WHERE DEPT_CODE='D6';
--400만원 이상 월급을 받는 사원 수
SELECT COUNT(SALARY) FROM EMPLOYEE
WHERE SALARY>=4000000;
--D5부서에서 보너스를 받고 있는 사원의 수는?
SELECT COUNT(BONUS) FROM EMPLOYEE
WHERE DEPT_CODE='D5';

--부서가 D6,D5,D7인 사원의 수, 급여 합계, 평균을 조회하세요
SELECT COUNT(DEPT_CODE),SUM(SALARY),AVG(SALARY) FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D7');

SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEE;

--GROUP BY 절 활용하기
--그룹함수를 사용했을때 특정기준으로 컬럼값을 묶어서 처리하는것 -> 묶인 그룹별 그룹함수의 결과가 출력됨.
--SELECT 컬럼
--FROM 테이블명
--[WHERE 조건식]
--[GROUP BY 컬럼명[,컬럼명,컬럼명,....]
--[GORUP BY 컬럼명]

--부서별 급여 합계를 구하시오.
SELECT DEPT_CODE,SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE;

--직책별 급여의 합계, 평균을 구하시오
SELECT JOB_CODE,SUM(SALARY),AVG(SALARY) FROM EMPLOYEE
GROUP BY JOB_CODE;

--부서별 사원수 구하기
SELECT DEPT_CODE,COUNT(*)FROM EMPLOYEE
GROUP BY DEPT_CODE;

--GROUP BY 절에는 다수의 컬럼을 넣을 수 있다.
SELECT DEPT_CODE, JOB_CODE, COUNT(*) FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

--GROUP BY를 사용한 절에서 WHERE도 사용이 가능하다.
SELECT DEPT_CODE, SUM(SALARY), COUNT(*) FROM EMPLOYEE
WHERE BONUS IS NOT NULL GROUP BY DEPT_CODE;

--부서별 인원이 3명이상인 부서만 출력하기
SELECT DEPT_CODE, COUNT(*) FROM EMPLOYEE
--WHERE COUNT(*) >=3 
GROUP BY DEPT_CODE
HAVING COUNT(*) >=3;

--직책별 인원수가 3명이상인 직책 출력하기
SELECT JOB_CODE, COUNT(*) FROM EMPLOYEE
GROUP BY JOB_CODE HAVING COUNT(*)>=3;

--평균급여가 300만원 이상인 부서 출력하기
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;

--매니저가 관리하는 사람이 2명이상인 매니저아이디 출력하기
SELECT MANAGER_ID, COUNT(*) FROM EMPLOYEE
GROUP BY MANAGER_ID HAVING COUNT(*)>=2 AND MANAGER_ID IS NOT NULL;

--남자,여자의 급여 평균을 구하고 인원수를 구하기
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남자','2','여자','4','여자'), AVG(SALARY), COUNT(*) FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','남자','2','여자','4','여자'); 