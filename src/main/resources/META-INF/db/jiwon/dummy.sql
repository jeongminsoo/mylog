-- Member
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('aaa', '111', '�ڹڹ�', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'park@park.com', NULL, 1);
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('bbb', '111', '���', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'bb@bb.com', NULL, 1);
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('ccc', '111', '�ֶ��', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'ccc@ccc.com', NULL, 1);
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('ddd', '111', '���', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'ddd@ddd.com', NULL, 1);
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('eee', '111', '������', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'eee@eee.com', NULL, 1);
    SELECT * FROM MEMBER;
    COMMIT;
-- Admin
   INSERT INTO ADMIN (aID, aPW, aGRADE) 
        VALUES ('aa', '111', 1);
-- TEAM
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'MYLOG', '�ּ��� ������'); 
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'bbb', 'BEEBEE', 'NOpainNOgain');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ccc', 'SOLACCI', 'solacci');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ddd', 'DD', 'DDistheBest');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'eee', 'leelee', 'leeee');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ddd', 'DIY', 'noGoal');
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'ccc', 'CICI', NULL);
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'bbb', 'BECOME', NULL);
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'AYY~!', NULL);
   INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'eee', 'EE', NULL); 
    SELECT * FROM TEAM;
-- TEAM_MEMBER
   INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'bbb', 2, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ccc', 3, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ddd', 4, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'eee', 5, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ddd', 6, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ccc', 7, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'bbb', 8, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 9, 1);
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK) 
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'eee', 10, 1);
    SELECT * FROM TEAM_MEMBER; 
-- TEAMBOARD
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa', '���� �׷츸��� ��', '�������̱׷츸��Ǻб��ؿ�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ccc', '�ٸ���Ÿ �׷�', '�ٸ���Ÿ', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '���û��� ���� �׷�', '���û�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'eee', '�⸻����', '�⸻', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '��Ȱ�ڰ���', '��Ȱ', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '����׷�', '���', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa', '��ó���������', '��ó��Ǳ���� ���� �׷��ؿ�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ccc', '���� �׷츸��� ��', '�������̱׷츸��Ǻб��ؿ�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '�̷� �׷���?', '�������̱׷츸��Ǻб��ؿ�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'eee', '�����Ҷ�����~!', '���� �׷�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'ddd', '�����ȸ', '�����ȸ���� ���� �׷�����ϽǺ�', 0, SYSDATE, NULL);
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tHIT, tRDATE, tIP) 
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'bbb', '�ݸ޴�', '�ݸ޴ޱ׷츸����?', 0, SYSDATE, NULL);
    SELECT * FROM TEAMBOARD;
    commit;
--TEAM_TODO
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 1, 'ppt�ε�������', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 2, 'ppt������', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 3, '�Ĺ����ֱ�', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 4, '��ħì�ܸԱ�', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE) 
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 5, '�������ߴ��� ������', 0, 1, TEAM_TODO_SEQ.CURRVAL , '2022-08-18');
    SELECT * FROM TEAM_TODO;    
        
        
        