DROP TABLE DIARYREPLY;
DROP TABLE DIARYBOARD;
DROP TABLE TODO;
DROP TABLE ACCOUNTBOOK;
DROP TABLE ACCOUNTCATEGORY;
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    MID     VARCHAR2(15) PRIMARY KEY,
    MPW    VARCHAR2(15) NOT NULL,
    MNAME VARCHAR2(30) NOT NULL,
    MBIRTH DATE,
    MEMAIL VARCHAR2(50) NOT NULL UNIQUE,
    MMOTTO VARCHAR2(500),
    MSTATUS NUMBER(1) DEFAULT 1 NOT NULL
);

CREATE TABLE ACCOUNTCATEGORY(
    ACNO NUMBER(8) PRIMARY KEY,
    ATITLE VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE ACCOUNTBOOK(
    ANO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    ACNO NUMBER(8) NOT NULL,
    ACONTENT VARCHAR2(500) NOT NULL,
    APRICE NUMBER(9) NOT NULL,
    ADATE DATE NOT NULL,
    ASTATUS NUMBER(1) NOT NULL
);

CREATE TABLE TODO(
    TDNO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    TDCONTENT VARCHAR(100) NOT NULL,
    TDCHECK NUMBER(1) DEFAULT 0 NOT NULL,
    TDRDATE DATE NOT NULL );

CREATE TABLE DIARYBOARD(
    DNUM NUMBER(8) PRIMARY KEY,
    DTITLE VARCHAR2(100) NOT NULL,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    TDNO NUMBER(8) REFERENCES TODO(TDNO),
    DCONTENT CLOB NOT NULL,
    DHIT NUMBER(5) DEFAULT 0 NOT NULL,
    DSTATUS CHAR(2) NOT NULL,
    DRDATE DATE NOT NULL,
    DIP VARCHAR2(20) NOT NULL   );
    
CREATE TABLE DIARYREPLY(
    DRNUM NUMBER(8) PRIMARY KEY,
    DNUM NUMBER(8) REFERENCES DIARYBOARD(DNUM),
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    DRCONTENT VARCHAR2(1000) NOT NULL,
    DRGROUP NUMBER(9) NOT NULL,
    DRSTEP NUMBER(9) NOT NULL,
    DRINDENT NUMBER(9) NOT NULL,
    DRRDATE DATE DEFAULT SYSDATE NOT NULL,
    DRIP VARCHAR2(20) NOT NULL  );

DROP SEQUENCE TODO_SEQ;
DROP SEQUENCE DIARYBOARD_SEQ;
DROP SEQUENCE DIARYREPLY_SEQ;
DROP SEQUENCE FRIEND_SEQ;
DROP SEQUENCE ACCOUNTBOOK_SEQ;
DROP SEQUENCE ACCOUNTCATEGORY_SEQ;

CREATE SEQUENCE ACCOUNTBOOK_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE SEQUENCE ACCOUNTCATEGORY_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE SEQUENCE FRIEND_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE SEQUENCE TODO_SEQ MAXVALUE 99999999 NOCACHE NOCYCLE;
CREATE SEQUENCE DIARYBOARD_SEQ MAXVALUE 99999999 NOCACHE NOCYCLE;
CREATE SEQUENCE DIARYREPLY_SEQ MAXVALUE 99999999 NOCACHE NOCYCLE;


-- 이메일로 아이디 찾기
SELECT MID FROM MEMBER WHERE MEMAIL = 'aaa@naver.com' AND MSTATUS = '1';

-- 이메일과 아이디로 비밀번호 찾기
SELECT MPW FROM MEMBER WHERE MID = 'aaa' AND MEMAIL = 'aaa@naver.com' AND MSTATUS = '1';

-- 로그인
SELECT * FROM MEMBER WHERE MID = 'aaa' AND MPW = '1' AND MSTATUS = '1';

-- 회원 탈퇴
UPDATE MEMBER SET MSTATUS = 0 WHERE MID = 'aaa';

-- 투두 만들기(todoMake)
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '국어 노트 정리하기', '0', '2022-07-28');


-- 오늘 날짜의 투두 리스트 전체 출력하기(todoList)
SELECT *
    FROM TODO
    WHERE MID = 'aaa'
        AND TDRDATE = '2022-07-28'
    ORDER BY TDCHECK, TDNO;
    
-- 투두 미루기(todoDelay)
UPDATE TODO SET TDCHECK = 1 WHERE TDNO = 1;

-- TDNO로 TODO 가져오기(getTodo)
SELECT * FROM TODO WHERE TDNO = 1;

-- 미룬 투두를 다음 날로(todoDelayMake)
INSERT INTO TODO 
    VALUES(TODO_SEQ.NEXTVAL,  'aaa', '국어 노트 정리하기', 0, (SELECT TDRDATE+1 FROM TODO WHERE TDNO = 1));
 
-- 투두 완료하기
UPDATE TODO SET TCHECK = 2 WHERE TNO = 2;


-- 날짜로 내 투두리스트 가져오기(
SELECT * FROM TODO WHERE TDRDATE = '2022-07-28' AND MID = 'aaa';

-- 투두 삭제하기
DELETE FROM TODO WHERE TNO = 3;

-- 글 작성하기
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, TNO, DCONTENT, DHIT, DSTATUS, DRDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 반성일기', 'aaa', NULL, '오늘은 아무것도 하지 못했어요ㅠㅠ', 0, 2, '2022-07-28', '127.00.00.01');

-- 공개된 일기보기
SELECT D.*, MNAME
    FROM DIARYBOARD D, MEMBER M
    WHERE D.MID=M.MID AND DSTATUS = 2
    ORDER BY DRDATE DESC;
    
-- 오늘날짜의 내가 쓴 글 보기
SELECT * FROM DIARYBOARD 
    WHERE DRDATE = '2022-07-28' AND MID = 'aaa';

-- 친구 일기 보기 (친구 테이블이랑 연결해서 해야함)
SELECT D.*, MNAME
    FROM DIARYBOARD D, FRIEND F, MEMBER M
    WHERE D.MID=F.FID AND M.MID=F.FID AND DSTATUS > 0 AND F.MID='aaa';

-- 나에게 공개된 글 (전체공개/친구공개) 모두 보기
SELECT D.*, MNAME
    FROM DIARYBOARD D, FRIEND F, MEMBER M
    WHERE (D.MID=M.MID AND DSTATUS = 2)  OR
    (D.MID=F.FID AND M.MID=F.FID AND DSTATUS = 1 AND F.MID='aaa')
    ORDER BY DRDATE DESC;
    
-- 카테고리 생성
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '월급');
SELECT * FROM ACCOUNTCATEGORY;

-- 카테고리 리스트
SELECT * FROM ACCOUNTCATEGORY;

-- 일 가계부 보기
SELECT * 
    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
    WHERE B.ACNO = C.ACNO
        AND MID = 'aaa'
        AND ADATE = '2022-07-01'
        ORDER BY ADATE;

-- 일 총액 보기
SELECT PLUSSUM+MINUSUM TOTAL, PLUSSUM, MINUSUM
    FROM (SELECT SUM(APRICE) PLUSSUM FROM ACCOUNTBOOK WHERE ASTATUS = 1 AND MID = 'aaa' AND ADATE = '2022-07-01'),
            (SELECT SUM(APRICE) MINUSUM FROM ACCOUNTBOOK WHERE ASTATUS = 0 AND MID = 'aaa' AND ADATE = '2022-07-01');

-- 가계부 작성하기
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', 1, '월급', 2000000, '2022-08-01', 1);

-- 가계부 수정하기
UPDATE ACCOUNTBOOK
    SET ACNO = 1,
         ACONTENT = '7월 월급',
         APRICE = 2500000, 
         ADATE = '2022-07-15',
         ASTATUS = 1
    WHERE ANO = 1;

-- 가계부 삭제
DELETE FROM ACCOUNTBOOK WHERE ANO = 1;


-- 월 가계부 보기
SELECT * 
    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
    WHERE B.ACNO = C.ACNO
        AND MID = 'aaa'
        AND ADATE BETWEEN '2022-07-01' AND (SELECT LAST_DAY('2022-07-01') FROM DUAL)
        ORDER BY ADATE;

-- 월 총액 보기
SELECT PLUSSUM+MINUSUM TOTAL, PLUSSUM, MINUSUM
    FROM (SELECT SUM(APRICE) PLUSSUM FROM ACCOUNTBOOK WHERE ASTATUS = 1 AND MID = 'aaa' 
                AND ADATE BETWEEN '2022-07-01' AND (SELECT LAST_DAY('2022-07-01') FROM DUAL)),
            (SELECT SUM(APRICE) MINUSUM FROM ACCOUNTBOOK WHERE ASTATUS = 0 AND MID = 'aaa'
                    AND ADATE BETWEEN '2022-07-01' AND (SELECT LAST_DAY('2022-07-01') FROM DUAL));
                    
-- 카테고리별 액수 보기
SELECT ATITLE, SUM(APRICE) TOTAL
    FROM ACCOUNTBOOK B, ACCOUNTCATEGORY C
    WHERE B.ACNO = C.ACNO
        AND MID = 'aaa'
        AND ADATE BETWEEN '2022-07-01' AND (SELECT LAST_DAY('2022-07-01') FROM DUAL)
    GROUP BY ATITLE;