DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER(
    MID VARCHAR2(15) PRIMARY KEY,
    MPW VARCHAR2(15) NOT NULL,
    MNAME VARCHAR2(30) NOT NULL,
    MBIRTH DATE,
    MEMAIL VARCHAR2(30)UNIQUE,
    MMOTTO VARCHAR2(100),
    MSTATUS NUMBER(1)DEFAULT 1
);

commit;

--감상문
DROP SEQUENCE RSEQ;
CREATE SEQUENCE RSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE RBOARD CASCADE CONSTRAINTS;
CREATE TABLE RBOARD(
    RNUM NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(50) REFERENCES MEMBER(MID),
    RTITLE VARCHAR2(100) NOT NULL,
    RCONTENT CLOB NOT NULL,
    RFILENAME VARCHAR2(100),
    RRDATE DATE DEFAULT SYSDATE,
    RHIT NUMBER(8),
    RSTATUS NUMBER(1) DEFAULT 0,
    RIP VARCHAR2(20)
);

--감상문 댓글
DROP SEQUENCE RPSEQ;
CREATE SEQUENCE RPSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE RPBOARD CASCADE CONSTRAINTS;
CREATE TABLE RPBOARD(
    RPNUM NUMBER(8) PRIMARY KEY,
    RNUM NUMBER(8) REFERENCES RBOARD(RNUM),
    MID VARCHAR2(50) REFERENCES MEMBER(MID),
    RPCONTENT VARCHAR2(1000) NOT NULL,
    RPDATE DATE DEFAULT SYSDATE,
    RPGROUP NUMBER(8) NOT NULL,
    RPSTEP NUMBER(4), 
    RPINDENT NUMBER(4),
    RPIP VARCHAR2(20)
);
--해시태그
DROP SEQUENCE HSEQ;
CREATE SEQUENCE HSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;
CREATE TABLE HASHTAG(
    HNO NUMBER(8) PRIMARY KEY,
    HNAME VARCHAR2(50) NOT NULL
);
--해시태그 이어주기
DROP SEQUENCE BTSEQ;
CREATE SEQUENCE BTSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE BOARD_TAG;
CREATE TABLE BOARD_TAG(
    BTNO NUMBER(8) PRIMARY KEY,
    HNO NUMBER(8) REFERENCES HASHTAG(HNO),
    RNUM NUMBER(8) REFERENCES RBOARD(RNUM)
    on delete cascade
);

--타이머
DROP SEQUENCE TSEQ;
CREATE SEQUENCE TSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE TIMER;
CREATE TABLE TIMER(
    TNO NUMBER(8) PRIMARY KEY,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    TTODAY DATE DEFAULT SYSDATE,
    TNAME VARCHAR2(100),
    TDO NUMBER(2) DEFAULT 0,
    TPAUSE NUMBER(8) DEFAULT 0,
    TDURING NUMBER(8) DEFAULT 0,
    TSTART NUMBER(8) DEFAULT 0,
    TEND NUMBER(8) DEFAULT 0
    
);
--타임테이블

DROP SEQUENCE TBSEQ;
CREATE SEQUENCE TBSEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
DROP TABLE TTABLE;
CREATE TABLE TTABLE(
    TBNO NUMBER(8)PRIMARY KEY,
    TNO NUMBER(8)REFERENCES TIMER(TNO) ,
    MID VARCHAR2(15) REFERENCES MEMBER(MID),
    TBSHOUR NUMBER(8)DEFAULT 0, 
    TBSMIN NUMBER(8)DEFAULT 0,
    TBEHOUR NUMBER(8)DEFAULT 0,
    TBEMIN NUMBER(8)DEFAULT 0
    
);

