--DAO QUERY
select * from team_member;
    -- Member
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('aaa', '111', '박박박', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'park@park.com', NULL, 1);
    INSERT INTO MEMBER (mID, mPW, mNAME, mBIRTH, mEMAIL, mMOTTO, mSTATUS) 
        VALUES ('ddd', '111', '디디', TO_DATE('2002-02-02', 'YYYY-MM-DD'), 'DDD@DDD.com', NULL, 1);
    COMMIT;
    SELECT * FROM MEMBER;
    -- ADMIN
    select * from admin;
    -- 관리자 등록
    INSERT INTO ADMIN (aID, aPW, aGRADE)
        VALUES ('ADMINaaa', '111', 0);
    -- 일반 관리자
    -- 로그인
    SELECT * FROM ADMIN WHERE AID='aaa' AND APW='111';
    -- 회원 탈퇴 시키기
    UPDATE MEMBER SET mSTATUS = 0
        WHERE mID='aaa';
    SELECT * FROM MEMBER;
    -- 회원 복구
    UPDATE MEMBER SET mSTATUS = 1
        WHERE mID='aaa';
        commit;
    -- 회원 리스트 출력
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT M.* FROM MEMBER M
                    ORDER BY mID, mSTATUS DESC) A)
        WHERE RN BETWEEN 1 AND 11;
    commit;
    -- TEAM(make TEAM)
    -- teamList
    SELECT * FROM 
	        (SELECT ROWNUM RN, A.* FROM 
	            (SELECT T.*, M.mNAME FROM TEAM T, MEMBER M
	            			WHERE T.MID = M.MID
	                        ORDER BY TNO DESC) A)
		        WHERE RN BETWEEN 1 AND 3;
    SELECT * FROM TEAM ORDER BY TNO DESC;
    -- teamTotCnt
    SELECT COUNT(*) FROM TEAM;
    -- 가입신청 한 팀인지 아닌지
    SELECT * FROM TEAM_MEMBER WHERE MID='aaa' AND tNO=2;
    -- (1) 팀 만들기
    INSERT INTO TEAM (tNO, mID, tNAME, tGOAL) 
        VALUES (TEAM_SEQ.NEXTVAL, 'aaa', 'myLOG', '팀프빠샤');
        -- 팀 번호 가져오기(팀 생성 후 바로, 팀장 가입하기 위함)
        SELECT MAX(tNO) tNO FROM TEAM;
    -- (2) 팀 삭제
    DELETE FROM TEAM WHERE tNO=2;
    -- (3) 팀장 변경, 팀명 변경, 팀목표 쓰기, 팀목표 변경
    UPDATE TEAM SET mID = 'aaa',
                    tNAME = 'mylog',
                    tGOAL = '팀프빠샤빠샤!'
                WHERE tNO = 32;
    -- 팀 디테일
    SELECT * FROM TEAM WHERE tNO=1;
    -- TEAM_MEMBER(join team)
    -- 내 팀 리스트
    SELECT T.tNAME, T.MID FROM TEAM_MEMBER TM, TEAM T WHERE TM.tNO = T.tNO AND TM.tmCHECK=1 AND TM.mID='aaa';
    -- 가입신청한 팀 리스트
    SELECT T.tNAME, T.MID FROM TEAM_MEMBER TM, TEAM T WHERE TM.tNO = T.tNO AND TM.tmCHECK=0 AND TM.mID='aaa';
    SELECT * FROM TEAM_MEMBER;
    COMMIT;
    -- detail
    SELECT * FROM TEAM_MEMBER WHERE TNO=2 AND MID='aaa';
    -- (1) 팀원 가입 신청
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'aaa', 1, 0);
    -- (2) 팀원 가입 신청 취소
    DELETE FROM TEAM_MEMBER WHERE tmNO='' AND tNO=4;
    DELETE FROM TEAM_MEMBER WHERE mID='ddd' AND tNO=4;
    commit;
    -- (2) 팀원 가입(가입허가/팀원 가입)
    UPDATE TEAM_MEMBER SET tmCHECK = 1
                    WHERE tmNO='' AND tNO='';
    INSERT INTO TEAM_MEMBER (tmNO, mID, tNO, tmCHECK)
        VALUES (TEAM_MEMBER_SEQ.NEXTVAL, 'ddd', 2, 1);
    commit;
    -- 팀 가입신청자 리스트(팀장만 가입허가 가능)
    SELECT * FROM TEAM_MEMBER WHERE tmCHECK = 0 AND tNO = 1; 
    SELECT * FROM TEAM_MEMBER;
    -- (2) 팀원 탈퇴
    DELETE FROM TEAM_MEMBER WHERE tmNO=1 AND tNO='';
    DELETE FROM TEAM_MEMBER WHERE mID='aaa' AND tNO=1;
    -- (3) 팀원 리스트
    SELECT * FROM TEAM_MEMBER WHERE tmCHECK=1 AND tNO=1;
    -- (4) 팀 인원수
    SELECT COUNT(*) FROM TEAM_MEMBER WHERE tNO=1;

    --TEAM_TODO(★ 수정가능성이 많습니다.)
    -- (1) 팀 투두 리스트     (★되는지 봐야함)
    SELECT TT.*, TM.mID , M.mNAME
        FROM TEAM_TODO TT, TEAM_MEMBER TM, TEAM T, MEMBER M
        WHERE TT.tmNO=TM.tmNO AND TM.mID=M.mID AND T.TNO= TT.TNO AND TT.tNO=2 AND tt.ttrdate LIKE TO_DATE('2022-08-08', 'YYYY-MM-DD')
        ORDER BY ttcheck, ttORDER;
    -- 팀투두 가져오기
    SELECT TT.*, TM.mID, M.mNAME FROM TEAM_TODO TT, TEAM_MEMBER TM, MEMBER M WHERE TT.tmNO=TM.tmNO AND TM.mID=M.mID AND TTNO=5;
    
    -- (2) 팀 투두 항목 생성
    SELECT * FROM TEAM;
    SELECT * FROM TEAM_MEMBER;
    
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE)
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 2, 'ppt만들기', 0, 5, TEAM_TODO_SEQ.CURRVAL, SYSDATE);
    INSERT INTO TEAM_TODO (ttNO, tNO, ttCONTENT, ttCHECK, tmNO, ttORDER, ttRDATE)
        VALUES (TEAM_TODO_SEQ.NEXTVAL, 2, 'service단 만들기', 0, 5, TEAM_TODO_SEQ.CURRVAL, SYSDATE);
    COMMIT;
    -- (3) 팀 투두 항목 삭제
    DELETE FROM TEAM_TODO WHERE ttNO=3;
    -- 팀 투두 항목 수정
    UPDATE TEAM_TODO SET ttCONTENT = 'ddd',
                         tmNO=2
                    WHERE ttNO =2 AND tNO=2;
    -- (4) 팀 투두 항목 순서 바꾸기
    UPDATE TEAM_TODO SET ttORDER = 2
                    WHERE ttNO=1;
    -- (5) 팀 투두 체크
    UPDATE TEAM_TODO SET ttCHECK = 1
                    WHERE ttNO=1 AND tmNO=1;
    -- (6) 팀 투두 리스트 삭제
    DELETE FROM TEAM_TODO WHERE tNO=1;
    
     --TEAMinBOARD
    -- (1) 글목록(startRow부터 endRow까지)
    SELECT B.*, TM.mID FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT TI.* FROM TEAMinBOARD TI
                        ORDER BY tiGROUP DESC, tiSTEP) A) B, TEAM_MEMBER TM
        WHERE B.tmNO = TM.tmNO AND RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 글갯수
    SELECT COUNT(*) FROM TEAMinBOARD;
    -- (3) 글쓰기(원글)
    INSERT INTO TEAMinBOARD (tNUM, tNO, tmNO, tiTITLE, tiCONTENT, tiFILENAME,  
            tiGROUP, tiSTEP, tiINDENT, tiIP)
        VALUES (TEAMinBOARD_SEQ.NEXTVAL, 1, 1, 'title','content', null, 
            TEAMinBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) Hit 하나 올리기(1번글 조회수 하나 올리기)
    UPDATE TEAMinBOARD SET tiHIT = tiHIT +1 WHERE tiNUM=1;
    -- (5) NUM으로 글 dto보기
    SELECT TI.* FROM TEAMinBOARD TI WHERE tiNUM=1;
    -- (6) 글 수정하기
    UPDATE TEAMinBOARD SET tiTITLE = '바뀐제목',
                        tiCONTENT = '본문',
                        tiFILENAME = NULL,
                        tiIP = '192.168.151.10',
                        tiRDATE = SYSDATE
                WHERE tiNUM = 1;
    -- (7) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMinBOARD WHERE tiNUM=3;
    ROLLBACK;
    -- (8) 답변글 추가전 STEP a 수행
    UPDATE TEAMinBOARD SET tiSTEP = tiSTEP+1 
        WHERE tiGROUP = 1 AND tiSTEP>0;
    -- (9) 답변글 쓰기
    INSERT INTO TEAMinBOARD (tiNUM, tNO, tmNO, tiTITLE, tiCONTENT, tiFILENAME,
            tiGROUP, tiSTEP, tiINDENT, tiIP)
        VALUES (TEAMinBOARD_SEQ.NEXTVAL, 1, 1, 'reply','content', null,
            1, 1, 1, '192.168.10.151');
    
    -- TEAMin_COMMENTBOARD
    -- (1) 댓글목록(startRow부터 endRow까지)
        -- 그냥 출력 시 사용
        SELECT TiC.* FROM TEAMin_COMMENTBOARD TiC WHERE tiNUM=1 
                    ORDER BY ticGROUP DESC, ticSTEP;
    SELECT B.*, TM.MID FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT TiC.* FROM TEAMin_COMMENTBOARD TiC WHERE tiNUM=1
                        ORDER BY ticGROUP DESC, ticSTEP) A) B, TEAM_MEMBER TM
        WHERE B.tmNO = TM.tmNO AND RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    -- (2) 댓글갯수
    SELECT COUNT(*) FROM TEAMin_COMMENTBOARD;
    -- (3) 댓글쓰기(원글)
    INSERT INTO TEAMin_COMMENTBOARD (ticNUM, tiNUM, tmNO, ticCONTENT, 
            ticGROUP, ticSTEP, ticINDENT, ticIP)
        VALUES (TEAMin_COMMENTBOARD_SEQ.NEXTVAL, 1, 1, 'commentContent',
            TEAMin_COMMENTBOARD_SEQ.CURRVAL, 0, 0, '192.168.10.01');
    -- (4) 댓글 수정하기
    UPDATE TEAMin_COMMENTBOARD SET ticCONTENT = '바뀐댓글',
                         ticIP = '192.168.151.10',
                         ticRDATE = SYSDATE
                WHERE ticNUM = 1;
    -- (5) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMin_COMMENTBOARD WHERE ticNUM=1;
    ROLLBACK;
    -- (6) 답댓글 추가전 STEP a 수행
    UPDATE TEAMin_COMMENTBOARD SET ticSTEP = ticSTEP+1 
        WHERE ticGROUP = 1 AND ticSTEP>0;
    -- (7) 답댓글 쓰기
    INSERT INTO TEAMin_COMMENTBOARD (ticNUM, tiNUM, tmNO, ticCONTENT,
            ticGROUP, ticSTEP, ticINDENT, ticIP)
        VALUES (TEAMin_COMMENTBOARD_SEQ.NEXTVAL, 1, 1, 'reply',
            1, 1, 1, '192.168.10.151');
                    
    --TEAMBOARD
    -- (1) 글목록(startRow부터 endRow까지)
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
            (SELECT T.*, M.mNAME FROM TEAMBOARD T, MEMBER M
                                 WHERE T.MID = M.MID
                        ORDER BY trdate DESC) A)
        WHERE RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
       
    -- (2) 글갯수
    SELECT COUNT(*) FROM TEAMBOARD;
    -- (3) 글쓰기(원글)
    INSERT INTO TEAMBOARD (tNUM, mID, tTITLE, tCONTENT, tIP)
        VALUES (TEAMBOARD_SEQ.NEXTVAL, 'aaa','title','content', '192.168.10.01');
    -- (4) Hit 하나 올리기(1번글 조회수 하나 올리기)
    UPDATE TEAMBOARD SET tHIT = tHIT +1 WHERE tNUM=1;
    -- (5) NUM으로 글 dto보기
    SELECT T.*, M.mNAME FROM TEAMBOARD T, MEMBER M WHERE tNUM=1;
    -- (6) 글 수정하기
    UPDATE TEAMBOARD SET tTITLE = '바뀐제목',
                        tCONTENT = '본문',
                        tIP = '192.168.151.10',
                        tRDATE = SYSDATE
                WHERE tNUM = 1;
    -- (7) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAMBOARD WHERE tNUM=3;
    ROLLBACK;
    
    -- TEAM_COMMENTBOARD
    select tnum from teamboard;
    -- (1) 댓글목록(startRow부터 endRow까지)
        SELECT TR.* FROM TEAM_COMMENTBOARD TR
                    ORDER BY tcGROUP DESC, tcRDATE;
        -- 그냥 출력 시 사용
        SELECT TR.* FROM TEAM_COMMENTBOARD TR WHERE tNUM=12
                    ORDER BY tcGROUP DESC, tcRDATE;
    SELECT * FROM 
        (SELECT ROWNUM RN, A.* FROM 
        (SELECT TC.* FROM TEAM_COMMENTBOARD TC WHERE tNUM=12
                    ORDER BY tcGROUP DESC, tcINDENT, tcRDATE) A)
        WHERE RN BETWEEN 1 AND 11; -- DAO에 들어갈 QUERY
    select * from TEAM_COMMENTBOARD where tcnum=1;
    -- (2) 댓글갯수
    SELECT COUNT(*) FROM TEAM_COMMENTBOARD WHERE tNUM=12;
    -- (3) 댓글쓰기(원글)
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tNUM, tcCONTENT, 
            tcGROUP, tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 1, 'commentContent',
            TEAM_COMMENTBOARD_SEQ.CURRVAL, 0, '192.168.10.01');
    -- (4) 댓글 수정하기
    UPDATE TEAM_COMMENTBOARD SET tcCONTENT = '바뀐댓글',
                         tcIP = '192.168.151.10'
                WHERE tcNUM = 1;
    -- (5) 글 삭제하기(NUM으로 삭제하기)
    COMMIT;
    DELETE FROM TEAM_COMMENTBOARD WHERE tcNUM=1;
    ROLLBACK;
    -- (6) 답댓글 추가전 STEP a 수행(TNUM으로 작성자 ID가져오기)
    SELECT TC.*, M.mNAME FROM TEAM_COMMENTBOARD TC, MEMBER M WHERE TC.MID=M.MID AND TCNUM=1;
    -- (7) 답댓글 쓰기
    INSERT INTO TEAM_COMMENTBOARD (tcNUM, mID, tcMENTION, tNUM, tcCONTENT, 
            tcGROUP, tcINDENT, tcIP)
        VALUES (TEAM_COMMENTBOARD_SEQ.NEXTVAL, 'aaa', 'ddd',1, 'reply',
           1, 1, '192.168.10.151');
    
    
    