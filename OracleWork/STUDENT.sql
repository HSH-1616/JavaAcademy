CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(15) PRIMARY KEY,
    MEMBER_PWD VARCHAR2(15) NOT NULL,
    MEMBER_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(1) CHECK(GENDER IN('M','F')),
    AGE NUMBER NOT NULL,
    EMAIL VARCHAR2(30),
    PHONE CHAR(11),
    ADDRESS VARCHAR2(500),
    HOBBY VARCHAR2(50),
    ENROLL_DATE DATE DEFAULT SYSDATE
);


CREATE TABLE BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(800),
    COMMENT_WRITER VARCHAR2(10),
    COMMENT_DATE DATE,
    BOARD_REF NUMBER REFERENCES BOARD(BOARD_NO)
);

INSERT INTO MEMBER VALUES('admin','admin','관리자','M',30,'admin@iei.or.kr',
0101234678,'서울시 강남구 역삼동 테헤란로 7','기타,독서,운동','16/03/15');
INSERT INTO MEMBER VALUES('user11','pass11','홍길동','M',23,'hong@kh.org',
01017778888,'경기도 수원시 팔달구 팔달동 77','운동,등산,기타','17/09/21');
INSERT INTO MEMBER VALUES('user22','pass22','신사임당','F',48,'shin50@kh.org',
01050005555,'강원도 강릉시 오죽헌 5','독서,그림,요리','17/05/05');
INSERT INTO MEMBER VALUES('user77','user77','이순신','M',50,'dltnstls@naver.com',
01021226374,'경기도 시흥시','음악','17/12/08');
INSERT INTO MEMBER VALUES('lsj','lsj','이선주','F',24,'dltjswn@naver.com',
01021226377,'경기도 안산시','운동,음악,댄스','17/08/25');
INSERT INTO MEMBER VALUES('seonn','seonn','김공부','F',28,'study11@naver.com',
01021226312,'경기도 성남시','공부,책읽기','17/11/08');
commit;
SELECT * FROM MEMBER;
