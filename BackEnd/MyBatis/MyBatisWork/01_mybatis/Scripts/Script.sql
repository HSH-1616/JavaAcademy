create table student(
		student_no number primary key,
		student_name varchar2(30) not null,
		student_tel char(11) not null,
		student_email varchar2(50),
		student_addr varchar2(256),
		reg_date date default sysdate
);

create sequence seq_student;
insert into student values (seq_student.nextval, '홍길동', '01012345678', 'honggd@google.com','서울시 강남구', default);

SELECT * FROM student;
SELECT * FROM user_sequences;