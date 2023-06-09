SELECT * FROM CATEGORY;
SELECT * FROM SUB_CATEGORY;
SELECT * FROM PRODUCT;
SELECT * FROM users;

ROLLBACK;
ALTER TABLE PRODUCT MODIFY SUBCATEGORY_ID VARCHAR2(30);
ALTER TABLE PRODUCT RENAME COLUMN SUBCATEGORY_ID TO SUBCATEGORY_NAME ;
ALTER TABLE PRODUCT RENAME COLUMN SUBCATEGORY_NAME TO SUBCATEGORY_ID ;
ALTER TABLE PRODUCT MODIFY SUBCATEGORY_ID NUMBER;
alter table product read write;
COMMIT;

 ALTER TABLE emp DROP COLUMN SUBCATEGORY_NAME;
ALTER TABLE PRODUCT ADD CONSTRAINT SUBCATEGORY_NAME foreign KEY (SUBCATEGORY_NAME) references SUB_CATEGORY;
drop table product;
DROP TABLE product CASCADE CONSTRAINTS;

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
   SUBCATEGORY_ID NUMBER NOT NULL,
   GOONGUAREA_ID NUMBER NOT NULL,   
   CONSTRAINT FK_USER_ID FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID),
   CONSTRAINT FK_SUBCATEGORY_ID FOREIGN KEY(SUBCATEGORY_ID) REFERENCES SUB_CATEGORY(SUBCATEGORY_ID)
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
COMMENT ON COLUMN "PRODUCT"."GOONGUAREA_ID" IS '군,구 지역ID(FK)';

--상점아이디 시퀀스생성
CREATE SEQUENCE SEQ_PRODUCT_ID
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO PRODUCT VALUES (SEQ_PRODUCT_ID.nextval, 'user01', '아이폰14 팝니다', '새상품', DEFAULT, 350000, DEFAULT, DEFAULT, '아이폰14 새상품 팝니다~ 연락주세요!', '아이폰,아이폰14','19', '1');
UPDATE PRODUCT SET SUBCATEGORY_ID = 19 WHERE PRODUCT_ID = 4;
UPDATE PRODUCT SET KEYWORD = '#아이폰,#아이폰14,#아이폰14,#아이폰14' WHERE PRODUCT_ID = 4;

SELECT * FROM PRODUCT;
SELECT*FROM CATEGORY;
SELECT CATEGORY_NAME,SUBCATEGORY_NAME FROM PRODUCT  
JOIN SUB_CATEGORY USING(SUBCATEGORY_ID) 
JOIN CATEGORY USING(CATEGORY_ID)
WHERE PRODUCT_ID = 4;

SELECT * FROM PRODUCT
LEFT OUTER JOIN SUB_CATEGORY USING(SUBCATEGORY_ID) 
LEFT OUTER JOIN CATEGORY USING(CATEGORY_ID)
WHERE PRODUCT_ID = 4;
COMMIT;

CREATE TABLE PRODUCT_COMMENT(
		USER_ID VARCHAR2(25),
		PRODUCT_ID NUMBER,
        PRODUCT_COMMENT_NO NUMBER,
        PRODUCT_COMMENT_LEVEL NUMBER DEFAULT 1,         
        PRODUCT_COMMENT_CONTENT VARCHAR2(2000),          
        PRODUCT_COMMENT_REF NUMBER, 
        PRODUCT_COMMENT_DATE DATE DEFAULT SYSDATE, 
        CONSTRAINT PK_PRODUCT_COMMENT_NO PRIMARY KEY(PRODUCT_COMMENT_NO),
        CONSTRAINT FK_USER_ID_COMMENT FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID),
        CONSTRAINT FK_PRODUCT_ID FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
        CONSTRAINT FK_PRODUCT_COMMENT_REF FOREIGN KEY(PRODUCT_COMMENT_REF) REFERENCES PRODUCT_COMMENT(PRODUCT_COMMENT_NO)ON DELETE CASCADE
    );
   ALTER TABLE PRODUCT_COMMENT RENAME COLUMN PRODCUT_COMMENT_LEVEL TO PRODUCT_COMMENT_LEVEL ;
   
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_COMMENT_NO IS '상품페이지 댓글번호';
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_COMMENT_LEVEL IS '상품페이지 댓글 레벨';
    COMMENT ON COLUMN PRODUCT_COMMENT.USER_ID IS '상품페이지 댓글 작성자';
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_COMMENT_CONTENT IS '상품페이지 댓글';
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_ID IS '상품페이지 번호';
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_COMMENT_REF IS '상품페이지 댓글 참조번호';
    COMMENT ON COLUMN PRODUCT_COMMENT.PRODUCT_COMMENT_DATE IS '상품페이지 댓글 작성일';
    
   CREATE SEQUENCE SEQ_PRODUCT_COMMENT_NO
    START WITH 1
    INCREMENT BY 1
    NOMINVALUE
    NOMAXVALUE
    NOCYCLE
    NOCACHE;
   SELECT *FROM PRODUCT_COMMENT;
   INSERT INTO PRODUCT_COMMENT VALUES('user01','4',SEQ_PRODUCT_COMMENT_NO.NEXTVAL, DEFAULT,'구매원합니다~',NULL,DEFAULT);
