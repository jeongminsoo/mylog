DROP TABLE QNABOARD;
DROP TABLE FRIEND;
DROP TABLE NOTICE_BOARD;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP SEQUENCE FRIEND_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE NOTICE_SEQ;

-- 회원
CREATE TABLE MEMBER(
    MID VARCHAR2(15) PRIMARY KEY,
    MPW VARCHAR2(15),
    MNAME VARCHAR2(30),
    MBIRTH DATE,
    MEMAIL VARCHAR2(50) UNIQUE,
    MMOTTO VARCHAR2(500),
    MSTATUS NUMBER(1) DEFAULT 1
);

-- 회원 더미
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS) VALUES ('aaa', '111', '닉네임', '2000-01-01', 'aaa@a.com', '나는 최고다', '1');
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS) VALUES ('bbb', '111', '닉네임', '2000-01-01', 'bbb@b.com', '나는 최고다', '1');
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO) VALUES ('ccc', '111', '닉네임', '2000-01-01', 'ccc@c.com', '나는 최고다');

SELECT * FROM MEMBER;

-- 이메일 중복체크
SELECT * FROM MEMBER WHERE MEMAIL = 'leekr44@naver.com';

-- 아이디 중복체크
SELECT COUNT(*) FROM MEMBER WHERE MID = 'aaa';

-- 친구
CREATE TABLE FRIEND(
    FNO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    FID VARCHAR2(15) REFERENCES MEMBER(MID)
);

CREATE SEQUENCE FRIEND_SEQ
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;

-- 친구 더미
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'bbb');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'aaa', 'ccc');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'bbb', 'ccc');
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'bbb', 'aaa');

SELECT * FROM FRIEND;

-- 친구목록
SELECT FID, MNAME FROM FRIEND F, MEMBER M WHERE M.MID = F.FID AND F.MID = 'aaa' ORDER BY FID;

-- 친구 수
SELECT COUNT(*) FROM FRIEND WHERE MID = 'aaa';

-- 내친구 리스트에서 검색
SELECT FID, MNAME FROM FRIEND F, MEMBER M WHERE M.MID = F.FID AND F.MID = 'aaa' AND MNAME LIKE '%'||'닉네임'||'%' ORDER BY FID;

-- 친구 찾기
SELECT * FROM MEMBER WHERE MNAME LIKE '%'||'네임'||'%';

-- 날 팔로우한 친구 목록
SELECT F.MID, MNAME FROM FRIEND F, MEMBER M WHERE M.MID = F.FID AND F.FID = 'aaa' ORDER BY FID;

-- 친구 삭제
DELETE FROM FRIEND WHERE MID = 'aaa' AND FID = 'ccc';

DROP TABLE QNABOARD;
DROP TABLE NOTICEBOARD;
DROP SEQUENCE QNABOARD_SEQ;
DROP SEQUENCE NOTICEBOARD_SEQ;

-- 공지사항
CREATE TABLE NOTICEBOARD(
    NNO NUMBER(8) PRIMARY KEY,
    AID VARCHAR2(15) REFERENCES ADMIN(AID),
    NTITLE VARCHAR2(100) NOT NULL,
    NCONTENT VARCHAR2(3000) NOT NULL,
    NRDATE DATE DEFAULT SYSDATE,
    NHIT NUMBER(8) DEFAULT 0,
    NIP VARCHAR2(20)
);

CREATE SEQUENCE NOTICEBOARD_SEQ
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;

-- 공지사항 등록
INSERT INTO NOTICEBOARD (NNO, AID, NTITLE, NCONTENT, NIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지', '공지합니다', '127.0.0.1');
    
-- 공지사항 목록
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM NOTICEBOARD ORDER BY NNO DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- 공지사항 수정
UPDATE NOTICEBOARD SET NTITLE = '수정공지', NCONTENT = '수정공지합니다', NIP = '127.0.0.2'
    WHERE NNO = 1;

-- 공지사항 삭제
DELETE FROM NOTICEBOARD WHERE NNO = 2;

-- 공지사항 조회수 증가
UPDATE NOTICEBOARD SET NHIT = NHIT + 1 WHERE NNO = 1;

-- 공지사항 갯수
SELECT COUNT(*) FROM NOTICEBOARD;

-- 공지사항 MODEL 가져오기 / CONTENT
SELECT * FROM NOTICEBOARD WHERE NNO = 1;

-- QNA
CREATE TABLE QNABOARD(
    QNO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    AID VARCHAR2(15) REFERENCES ADMIN(AID),
    QWRITER VARCHAR2(30) NOT NULL,
    QTITLE VARCHAR2(100) NOT NULL,
    QCONTENT VARCHAR2(3000) NOT NULL,
    QRDATE DATE DEFAULT SYSDATE,
    QHIT NUMBER(8) DEFAULT 0,
    QGROUP NUMBER(8),
    QSTEP NUMBER(4),
    QINDENT NUMBER(4),
    QIP VARCHAR2(20)
);

CREATE SEQUENCE QNABOARD_SEQ
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;

-- QNA 등록
INSERT INTO QNABOARD (QNO, MID, QWRITER, QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'qqq', '최강','문의드립니다', '답변주세요', QNABOARD_SEQ.CURRVAL, 0, 0, '127.0.0.1');

-- QNA 수정
UPDATE QNABOARD SET QTITLE = '수정문의드립니다', QCONTENT = '수정답변주세요' WHERE QNO = 1;

-- QNA 삭제
DELETE FROM QNABOARD WHERE QNO = 2;

-- QNA 가져오기 / QNA CONTENT
SELECT * FROM QNABOARD WHERE QNO = 1;

-- QNA 조회수 증가
UPDATE QNABOARD SET QHIT = QHIT + 1 WHERE QNO = 1;

-- QNA 리스트
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM QNABOARD
                     ORDER BY QGROUP DESC, QSTEP) A)
    WHERE RN BETWEEN 1 AND 10;

-- MY QNA 리스트
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM QNABOARD
                     ORDER BY QGROUP DESC, QSTEP) A)
    WHERE MID = 'qqq' AND RN BETWEEN 1 AND 10;

-- 답글 전 STEP
UPDATE QNABOARD SET QSTEP = QSTEP + 1 WHERE QGROUP = 1 AND QSTEP > 0;

-- 답글
INSERT INTO QNABOARD (QNO, MID, AID, QWRITER,QTITLE, QCONTENT, QGROUP, QSTEP, QINDENT, QIP)
    VALUES (QNABOARD_SEQ.NEXTVAL, 'qqq', 'admin', '관리자', '답변드립니다', '이해하셨죠?', 1, 1, 1, '127.0.0.1');

-- MY QNA 개수
SELECT COUNT(*) FROM QNABOARD WHERE MID = 'qqq';

COMMIT;





