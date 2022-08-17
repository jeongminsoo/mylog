-- CREATE TABLE & SEQUENCE
    -- ADMIN
    DROP TABLE ADMIN CASCADE CONSTRAINTS;
    CREATE TABLE ADMIN (
        aID VARCHAR2(15) PRIMARY KEY,
        aPW VARCHAR2(15),
        aGRADE NUMBER(1)
    );
    -- MEMBER
    DROP TABLE MEMBER CASCADE CONSTRAINTS;
    CREATE TABLE MEMBER(
        mID VARCHAR2(15) PRIMARY KEY,
        mPW VARCHAR2(15) NOT NULL,
        mNAME VARCHAR2(30) NOT NULL,
        mBIRTH DATE,
        mEMAIL VARCHAR2(30) UNIQUE NOT NULL,
        mMOTTO VARCHAR2(100),
        mSTATUS NUMBER(1) DEFAULT 1 NOT NULL
    );
    -- TEAM
    DROP SEQUENCE TEAM_SEQ;
    CREATE SEQUENCE TEAM_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM CASCADE CONSTRAINTS;
    CREATE TABLE TEAM(
        tNO NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES  MEMBER(mID),
        tNAME VARCHAR2(100) NOT NULL,
        tGOAL VARCHAR2(100)
    );
    --TEAM_MEMBER
    DROP SEQUENCE TEAM_MEMBER_SEQ;
    CREATE SEQUENCE TEAM_MEMBER_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_MEMBER CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_MEMBER(
        tmNO NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID) NOT NULL,
        tNO NUMBER(8) REFERENCES TEAM(tNO) NOT NULL,
        tmCHECK NUMBER(1) DEFAULT 0 NOT NULL
    );
    --TEAM_TODO
    DROP SEQUENCE TEAM_TODO_SEQ;
    CREATE SEQUENCE TEAM_TODO_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_TODO CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_TODO(
        ttNO NUMBER(8) PRIMARY KEY,
        tNO NUMBER(8) REFERENCES TEAM(tNO),
        ttCONTENT VARCHAR2(4000) NOT NULL,
        ttCHECK NUMBER(2) DEFAULT 0 NOT NULL,
        tmNO NUMBER(8) REFERENCES TEAM_MEMBER(tmNO),
        ttORDER NUMBER(6),
        ttRDATE DATE DEFAULT SYSDATE
    );
    
    -- TEAMBOARD
    DROP SEQUENCE TEAMBOARD_SEQ;
    CREATE SEQUENCE TEAMBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAMBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAMBOARD(
        tNUM NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID),
        tTITLE VARCHAR2(100) NOT NULL,
        tCONTENT CLOB NOT NULL,
        tHIT NUMBER(8) DEFAULT 0,
        tRDATE DATE DEFAULT SYSDATE,
        tIP VARCHAR2(20)
    );
    -- TEAM_COMMENTBOARD
    DROP SEQUENCE TEAM_COMMENTBOARD_SEQ;
    CREATE SEQUENCE TEAM_COMMENTBOARD_SEQ
        NOCACHE
        NOCYCLE;
    DROP TABLE TEAM_COMMENTBOARD CASCADE CONSTRAINTS;
    CREATE TABLE TEAM_COMMENTBOARD(
        tcNUM NUMBER(8) PRIMARY KEY,
        mID VARCHAR2(15) REFERENCES MEMBER(mID),
        tcMENTION VARCHAR2(30),
        tNUM NUMBER(8) REFERENCES TEAMBOARD(tNUM),
        tcCONTENT VARCHAR2(1000) NOT NULL,
        tcRDATE DATE DEFAULT SYSDATE,
        tcGROUP NUMBER(8) DEFAULT 0,
        tcINDENT NUMBER(4) DEFAULT 0,
        tcIP VARCHAR2(20)
    );