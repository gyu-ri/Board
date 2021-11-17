<<<<<<<<<<테이블 생성>>>>>>>>>>

CREATE TABLE BOARD(
NO NUMBER NOT NULL PRIMARY KEY,
TITLE VARCHAR2(300) NOT NULL,
WRITER VARCHAR2(15) NOT NULL,
PASSWORD VARCHAR2() NOT NULL,
CONTENT VARCHAR2 (1500) NOT NULL,
WRITE_DATE DATE
);

<<<<<<<<<위에 테이블은 답글 구현 전 테이블>>>>>>>>>>>

CREATE TABLE BOARD(
NO NUMBER NOT NULL PRIMARY KEY,
TITLE VARCHAR2(300) NOT NULL,
WRITER VARCHAR2(15) NOT NULL,
PASSWORD VARCHAR2(16) NOT NULL,
CONTENT VARCHAR2 (1500) NOT NULL,
WRITE_DATE DATE,
GROUP_NO NUMBER NOT NULL,
GROUP_ORDER NUMBER NOT NULL,
INDENT NUMBER NOT NULL,
DELETESTATUS NUMBER DEFAULT 0,

);


CREATE TABLE REPLY(
NO NUMBER NOT NULL,
RNO NUMBER NOT NULL,
TEXT VARCHAR2(600) NOT NULL,
WRITER VARCHAR2(15) NOT NULL,
PASSWORD VARCHAR2(16) NOT NULL,
WRITE_DATE DATE,
PRIMARY KEY(NO, RNO)
);

<<<<<<<<<<테이블 생성>>>>>>>>>>

INSERT
INTO BOARD(NO, TITLE, WRITER, PASSWORD, CONTENT,WRITE_DATE)
VALUES (NO_SEQ.NEXTVAL,'테스트', '귤귤', 12345, '마바사아',SYSDATE);


<<<<<<<<<<제약 조건 추가>>>>>>>>>>

ALTER TABLE REPLY ADD FOREIGN KEY(NO)
REFERENCES BOARD(NO);

<<<<<<<<<<제약 조건 추가>>>>>>>>>>


<<<<<<<<<<SEQUENCE 추가>>>>>>>>>>

CREATE SEQUENCE NO_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 99999999
NOCYCLE;


CREATE SEQUENCE RNO_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 99999999
NOCYCLE;

CREATE SEQUENCE GNO_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 99999999
NOCYCLE;

<<<<<<<<<<SEQUENCE 추가>>>>>>>>>>

<<<<<<<<<<댓글 추가>>>>>>>>>>
INSERT INTO REPLY (NO, RNO, TEXT, WRITER, PASSWORD, WRITE_DATE)
VALUES (660, RNO_SEQ.NEXTVAL, '댓글 테스트2입니다', '테스트', 123, SYSDATE);
<<<<<<<<<<댓글 추가>>>>>>>>>>


<<<<<<<<<<컬럼 추가>>>>>>>>>>

ALTER TABLE board ADD GROUP_NO NUMBER;

ALTER TABLE board ADD GROUP_ORDER NUMBER;

ALTER TABLE board ADD INDENT NUMBER;

ALTER TABLE board ADD DELETESTATUS NUMBER DEFAULT 0;

ALTER TABLE board ADD parentNo NUMBER;

ALTER TABLE board ADD replyCount NUMBER DEFAULT 0;

ALTER TABLE board ADD fileName VARCHAR2(90);
<<<<<<<<<<컬럼 추가>>>>>>>>>>



<<<<<<<<<<테이블 검색>>>>>>>>>>

SELECT * FROM TABS;

<<<<<<<<<<테이블 검색>>>>>>>>>>


<<<<<<<<<<테이블 컬럼 조회>>>>>>>>>>

SELECT * FROM COLS WHERE TABLE_NAME = 'BOARD';

<<<<<<<<<<테이블 컬럼 조회>>>>>>>>>>


<<<<<<<<<<테이블 컬럼 삭제>>>>>>>>>>

ALTER TABLE board DROP COLUMN GROUP_NO;

ALTER TABLE board DROP COLUMN DELETE_STATUS;
<<<<<<<<<<테이블 컬럼 삭제>>>>>>>>>>



<<<<<<<<<<부모글 추가(원글)>>>>>>>>>>

INSERT INTO
BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
VALUES (NO_SEQ.NEXTVAL, '제목이다22222', '작성자다2', '내용이다222', '123', SYSDATE, GNO_SEQ.NEXTVAL, 0, 0);

<<<<<<<<<<부모글 추가(원글)>>>>>>>>>>


<<<<<<<<<<답글 추가>>>>>>>>>>

INSERT INTO
BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
VALUES (NO_SEQ.NEXTVAL, '답글 테스트중', '답글 작성자다', '답글 내용이다', '123', SYSDATE, #{groupNo}, #{groupOrder}+1, #{indent}+1);


INSERT INTO
BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
VALUES (NO_SEQ.NEXTVAL, '답글 테스트중', '답글 작성자다', '답글 내용이다', '123', SYSDATE, #{groupNo}, 
		NVL(max(SELECT group_order
        FROM board
        WHERE no = 663),1), 
        NVL(max(SELECT indent
        FROM board
        WHERE no = 663),1));
        
위에꺼는 다 안됨~~!!!!

INSERT INTO
BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
VALUES (NO_SEQ.NEXTVAL, '답글 테스트중22', '답글작성자', '답글 내용이다', '123', SYSDATE, 5, 
		(SELECT NVL(max(group_order),1)+1 FROM board WHERE no = 669), 
        (SELECT NVL(max(indent),1)+1 FROM board WHERE no = 669));
        

INSERT INTO
BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
VALUES (NO_SEQ.NEXTVAL, '답글 테스트중@@@', '답글작성자', '답글 내용이다', '123', SYSDATE, 9, 
		(SELECT gorup_order FROM board (SELECT NVL(max(group_order),1)+1 FROM board group_no = 9 AND group_order = 1)), 
        (SELECT NVL(max(indent),1)+1 FROM board group_no = 9 AND indent = 1));

        
        
        INSERT INTO
		BOARD (no, title, writer, content, password, write_date, group_no, group_order, indent)
		VALUES (NO_SEQ.NEXTVAL, #{title}, #{writer}, #{content}, #{password}, SYSDATE, #{groupNo}, 
		(SELECT NVL(max(#{groupOrder}),1)+1 FROM board WHERE no = #{no}), 
        (SELECT NVL(max(#{indent}),1)+1 FROM board WHERE no = #{no}))

<<<<<<<<<<답글 추가>>>>>>>>>>


NVL(max(SELECT group_order
        FROM board
        WHERE no = #{no}),1)+1




SELECT group_order
FROM board
WHERE no = 665;


SELECT * FROM BOARD
where no=662;