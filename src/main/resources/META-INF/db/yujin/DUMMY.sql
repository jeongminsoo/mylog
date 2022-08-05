--회원 더미
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL)
    VALUES('aaa', '1', '홍길동', '1999-09-09', 'aaa@naver.com');
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL)
    VALUES('bbb', '1', '김길동', '1999-09-10', 'bbb@naver.com');
    
-- 친구
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'bbb');

-- 투두 
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '국어 노트 정리하기', '0', '2022-07-28');
INSERT INTO TODO VALUES(TODO_SEQ.NEXTVAL, 'aaa', '수학 노트 정리하기', '0', '2022-07-28');

-- 일기
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 반성일기', 'aaa', NULL, '오늘은 아무것도 하지 못했어요ㅠㅠ', 0, 2, '2022-07-28', '127.00.00.01');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 반성일기', 'bbb', NULL, '오늘은 아무것도 하지 못했어요ㅠㅠ', 0, 2, '2022-07-28', '127.00.00.01');
INSERT INTO 
    DIARYBOARD(DNUM, DTITLE, MID, DTODOIN, DCONTENT, DHIT, DSTATUS, DDATE, DIP)
    VALUES(DIARYBOARD_SEQ.NEXTVAL, '오늘의 반성일기', 'bbb', NULL, '오늘은 아무것도 하지 못했어요ㅠㅠ', 0, 1, '2022-07-28', '127.00.00.01');

-- 댓글
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'aaa', '잘봤습니다', DIARYREPLY_SEQ.CURRVAL, 0, SYSDATE, '127.0.0.011');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRMENTION, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb', '홍길동', '감사합니다1', 1, 1, SYSDATE, '127.0.0.02');
INSERT INTO
    DIARYREPLY(DRNUM, DNUM, MID, DRMENTION, DRCONTENT, DRGROUP, DRINDENT, DRRDATE, DRIP)
    VALUES(DIARYREPLY_SEQ.NEXTVAL, 2, 'bbb', '홍길동', '감사합니다2', 1, 1, SYSDATE, '127.0.0.02');




-- 가계부 카테고리
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '월급');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '용돈');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '음식');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '카페');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '교통');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '통신');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '보험');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '저축');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '투자');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '공부');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '의류');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '화장품');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '가구');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '문화생활');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '취미');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '운동');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '여행');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '경조사');
INSERT INTO ACCOUNTCATEGORY VALUES(ACCOUNTCATEGORY_SEQ.NEXTVAL, '기타');


-- 가계부 
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', '1', '월급', 2000000, '2022-07-01', '1');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', '3', '저녁', -20000, '2022-07-01', '0');  
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', '3', '저녁', -20000, '2022-07-03', '0');    
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', '1', '월급', 2000000, '2022-08-01', '1');
INSERT INTO ACCOUNTBOOK (ANO, MID, ACNO, ACONTENT, APRICE, ADATE, ASTATUS)
    VALUES(ACCOUNTBOOK_SEQ.NEXTVAL, 'aaa', '3', '점심', -10000, '2022-08-01', '0');    
COMMIT;
