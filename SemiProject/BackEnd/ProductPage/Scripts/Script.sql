ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER semi IDENTIFIED BY semi DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO semi;

CREATE TABLE USERS(
	USER_ID VARCHAR2(25) PRIMARY KEY,
	EMAIL VARCHAR2(30) NOT NULL,
	NICKNAME VARCHAR2(20) NOT NULL,
	PASSWORD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(15) NOT NULL,
	DECLARE_COUNT NUMBER DEFAULT 0 NOT NULL,
	ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	AUTH CHAR(1) DEFAULT 'U' NOT NULL ,
	TEMPERATURE NUMBER DEFAULT 36.5 NOT NULL,
	PROFILE_IMG VARCHAR2(100) DEFAULT 'profileImg_default.png' NOT NULL
);

COMMENT ON COLUMN "USERS"."USER_ID" IS '유저ID';
COMMENT ON COLUMN "USERS"."EMAIL" IS '유저이메일';
COMMENT ON COLUMN "USERS"."NICKNAME" IS '유저닉네임';
COMMENT ON COLUMN "USERS"."PASSWORD" IS '비밀번호';
COMMENT ON COLUMN "USERS"."NAME" IS '유저이름';
COMMENT ON COLUMN "USERS"."DECLARE_COUNT" IS '신고누적수';
COMMENT ON COLUMN "USERS"."ENROLL_DATE" IS '가입일';
COMMENT ON COLUMN "USERS"."AUTH" IS '관리자권한';
COMMENT ON COLUMN "USERS"."TEMPERATURE" IS '온도';
COMMENT ON COLUMN "USERS"."PROFILE_IMG" IS '프로필사진';

INSERT INTO USERS VALUES ('admin', 'admin@admin.com', 'GM01', '1234', '관리자', DEFAULT, DEFAULT, 'M', DEFAULT, DEFAULT);
INSERT INTO USERS VALUES ('user01', 'user01@user01.com', 'USER01', 'user01', '유저공일', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

CREATE TABLE PRODUCT(
	PRODUCT_ID NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(25) NOT NULL,
	PRODUCT_TITLE VARCHAR2(120) NOT NULL,
	PRODUCT_STATUS VARCHAR2(20) NOT NULL,
	SELL_STATUS VARCHAR2(20) DEFAULT '판매중' NOT NULL,
	PRICE NUMBER NOT NULL,
	REGIST_TIME DATE DEFAULT SYSDATE NOT NULL,
	VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
	EXPLANATION VARCHAR2(3000) NOT NULL,
	KEYWORD VARCHAR2(50),
	SUBCATEGORY_ID varchar(15) NOT NULL,
	GOONGUAREA_ID NUMBER NOT NULL,
	
	CONSTRAINT FK_USER_ID FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID)
);

COMMENT ON COLUMN "PRODUCT"."PRODUCT_ID" IS '상품ID';
COMMENT ON COLUMN "PRODUCT"."USER_ID" IS '유저ID(FK)';
COMMENT ON COLUMN "PRODUCT"."PRODUCT_TITLE" IS '상품명';
COMMENT ON COLUMN "PRODUCT"."PRODUCT_STATUS" IS '상품상태';
COMMENT ON COLUMN "PRODUCT"."SELL_STATUS" IS '판매상태';
COMMENT ON COLUMN "PRODUCT"."PRICE" IS '가격';
COMMENT ON COLUMN "PRODUCT"."REGIST_TIME" IS '상품등록일';
COMMENT ON COLUMN "PRODUCT"."VIEW_COUNT" IS '조회수';
COMMENT ON COLUMN "PRODUCT"."EXPLANATION" IS '상품설명';
COMMENT ON COLUMN "PRODUCT"."KEYWORD" IS '상품키워드';
COMMENT ON COLUMN "PRODUCT"."SUBCATEGORY_ID" IS '세부카테고리ID(FK)';
COMMENT ON COLUMN "PRODUCT"."AREA_ID" IS '군,구 지역ID(FK)';

--상점아이디 시퀀스생성
CREATE SEQUENCE SEQ_PRODUCT_ID
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO PRODUCT VALUES (SEQ_PRODUCT_ID.nextval, 'user01', '아이폰14 팝니다', '새상품', DEFAULT, 350000, DEFAULT, DEFAULT, '아이폰14 새상품 팝니다~ 연락주세요!', '아이폰,아이폰14','스마트폰', '1')

SELECT * FROM USERS;
SELECT * FROM PRODUCT;
COMMIT;