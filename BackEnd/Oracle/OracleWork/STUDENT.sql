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

INSERT INTO MEMBER VALUES('admin','admin','������','M',30,'admin@iei.or.kr',
0101234678,'����� ������ ���ﵿ ������� 7','��Ÿ,����,�','16/03/15');
INSERT INTO MEMBER VALUES('user11','pass11','ȫ�浿','M',23,'hong@kh.org',
01017778888,'��⵵ ������ �ȴޱ� �ȴ޵� 77','�,���,��Ÿ','17/09/21');
INSERT INTO MEMBER VALUES('user22','pass22','�Ż��Ӵ�','F',48,'shin50@kh.org',
01050005555,'������ ������ ������ 5','����,�׸�,�丮','17/05/05');
INSERT INTO MEMBER VALUES('user77','user77','�̼���','M',50,'dltnstls@naver.com',
01021226374,'��⵵ �����','����','17/12/08');
INSERT INTO MEMBER VALUES('lsj','lsj','�̼���','F',24,'dltjswn@naver.com',
01021226377,'��⵵ �Ȼ��','�,����,��','17/08/25');
INSERT INTO MEMBER VALUES('seonn','seonn','�����','F',28,'study11@naver.com',
01021226312,'��⵵ ������','����,å�б�','17/11/08');
commit;
SELECT * FROM MEMBER;
