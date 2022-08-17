--관리자
--관리자 등록
INSERT INTO ADMIN (aID, aPW, aGRADE) VALUES ('d111', '111', 1);

--관리자 목록
SELECT * FROM ADMIN;

--관리자 삭제
DELETE FROM ADMIN WHERE AID='MMM';


--감상문
--감상문 추가
INSERT INTO RBOARD (RNUM,MID,RTITLE,RCONTENT, RFILENAME, RRDATE,RSTATUS, RIP) 
            VALUES(RSEQ.NEXTVAL, 'aaa', '테스트보드','테스트보드입니다', NULL, SYSDATE, 0,'124.01.01');
--수정

UPDATE RBOARD SET RTITLE = '테스트1',
            RCONTENT='테스트1입니다', 
            RFILENAME = NULL,
            RSTATUS= 1
            WHERE RNUM=2;

            
--삭제(할때 해시태그도 삭제되어야함)
DELETE RBOARD WHERE RNUM =0;
 
SELECT R.*, MNAME FROM RBOARD R , MEMBER M WHERE M.MID=R.MID;
--출력

--내가 쓴 감상문 리스트(댓글 출력, 검색 가능)
SELECT *
    FROM(SELECT ROWNUM RN, A.* 
        FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS CNT FROM RBOARD R, MEMBER M 
            WHERE M.MID = R.MID and r.mid='aaa' AND RTITLE LIKE '%'||''||'%' ORDER BY RRDATE DESC, R.RNUM DESC)A)
        WHERE RN BETWEEN 1 AND 100;
            
--내가 쓴 감상문 갯수
SELECT COUNT(*)RCNT 
    FROM(SELECT ROWNUM RN, A.*
				FROM(SELECT R.*, MNAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS
				CNT FROM RBOARD R, MEMBER M WHERE M.MID = R.MID and r.mid='aaa' AND RTITLE LIKE
				'%'||''||'%' ORDER BY RRDATE DESC)A);
                
--내가 볼 수 있는 감상문 (검색 안한 경우)



   SELECT B.* FROM(
    SELECT ROWNUM RN, A.* FROM(SELECT DISTINCT RSTATUS, RNUM,RTITLE, MNAME, RRDATE,RFILENAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(R.MID = F.MID AND M.MID = F.MID AND MSTATUS =1 AND RSTATUS=0) 
                 OR (R.MID=F.FID AND M.MID=F.FID AND MSTATUS =1  AND F.MID='bbb' AND RSTATUS = 1)
                  OR (R.MID=M.MID AND M.MID=F.MID AND M.MID='bbb' AND RSTATUS = 2 )ORDER BY RRDATE DESC )A)B
			WHERE RN BETWEEN 1 AND 100;

   
--내가 볼 수 있는 감상문(제목 검색한 경우)



   SELECT B.* FROM(
    SELECT ROWNUM RN, A.* FROM(SELECT DISTINCT RSTATUS, RNUM,RTITLE, MNAME, RRDATE,RFILENAME,(SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = R.MID AND M.MID='aaa' AND MSTATUS =1 AND RSTATUS=0 AND RTITLE LIKE '%'||'보드'||'%') 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1  AND F.MID='aaa' AND RSTATUS = 1 AND RTITLE LIKE '%'||'보드'||'%')
                  OR (F.FID=R.MID AND F.MID=M.MID AND M.MID='aaa' AND RSTATUS = 2 AND RTITLE LIKE '%'||'보드'||'%')ORDER BY RRDATE DESC )A)B
			WHERE RN BETWEEN 1 AND 100;


SELECT A.* 
    FROM(SELECT ROWNUM RN, r.*, MNAME, (SELECT COUNT(*)FROM RPBOARD B WHERE B.RNUM= R.RNUM)AS RCNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = M.MID AND MSTATUS =1 AND RSTATUS=0 AND RTITLE LIKE '%'||'셰익스피어'||'%') 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa' AND RTITLE LIKE '%'||'셰익스피어'||'%')
                  OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 AND RTITLE LIKE '%'||'셰익스피어'||'%') ORDER BY RRDATE DESC)A
        WHERE RN BETWEEN 1 AND 50;
        
--내가 볼 수 있는 감상문 개수 (검색 안 했을 때)
SELECT COUNT(DISTINCT RNUM)CNT FROM RBOARD R, MEMBER M, FRIEND F
                WHERE(M.MID = R.MID AND F.MID = R.MID AND M.MID='aaa' AND MSTATUS =1 AND RSTATUS=0) 
                 OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1  AND F.MID='aaa' AND RSTATUS = 1)
                  OR (F.FID=R.MID AND F.MID=M.MID AND M.MID='aaa' AND RSTATUS = 2 );
            


--타이틀 검색했을 때
SELECT COUNT(DISTINCT RNUM)CNT FROM RBOARD R, MEMBER M, FRIEND F 
    WHERE (M.MID = R.MID AND F.MID = R.MID AND M.MID='aaa' AND MSTATUS =1 AND RSTATUS=0 AND  RTITLE LIKE '%'||'보드'||'%') 
        OR (M.MID=F.FID AND R.MID=F.FID AND MSTATUS =1 AND RSTATUS = 1 AND F.MID='aaa' AND  RTITLE LIKE '%'||'보드'||'%') 
        OR (M.MID=R.MID AND F.MID=R.MID AND R.MID='aaa' AND RSTATUS =2 AND  RTITLE LIKE '%'||'보드'||'%');   
        
 --세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--조회수 올리기
UPDATE RBOARD SET RHIT = RHIT+1 WHERE RNUM=1;
--조회수 안 올리고 세부사항
SELECT * FROM RBOARD WHERE RNUM=2;
--전체 글 개수
SELECT COUNT(*)CNT FROM RBOARD;


--감상문 댓글
--작성
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPSTEP, RPINDENT,RPIP)
    VALUES (RPSEQ.NEXTVAL, 2, 'aaa', '댓글입니다', SYSDATE, RPSEQ.CURRVAL, 0,0,'127.10.10'); 
--수정
UPDATE RPBOARD SET RPCONTENT = '댓글 테스트' WHERE RPNUM = 1;
--삭제
DELETE RPBOARD WHERE RPNUM=1;
--출력
SELECT * 
    FROM(SELECT ROWNUM RN, A.* 
         FROM(SELECT P.*, MNAME FROM RPBOARD P, MEMBER M WHERE M.MID = P.MID AND RNUM=1 ORDER BY RPGROUP DESC, RPINDENT, RPDATE)A)
    WHERE RN BETWEEN 1 AND 30;
    
--댓글 개수
SELECT COUNT(*) FROM RPBOARD WHERE RNUM=1;
    
--댓글내용보기
SELECT P.*,MNAME FROM RPBOARD P, MEMBER M WHERE M.MID =P.MID AND RNUM=1;

--답댓글 전
UPDATE RPBOARD SET RPSTEP = RPSTEP+1 WHERE RPGROUP = 1 AND RPSTEP > 0;

--답댓글
INSERT INTO RPBOARD (RPNUM,RNUM,MID,RPCONTENT,RPDATE,RPGROUP, RPINDENT, RPMENTION, RPIP)
   			 VALUES(RPSEQ.NEXTVAL, 1, 'aaa', '대댓글 테스트합니다', SYSDATE, 1, 1, '홍길동', '127.1.01');


--해시태그
--해시태그 추가
INSERT INTO HASHTAG(HNO, HNAME) VALUES (HSEQ.NEXTVAL, '운동');
--글 번호로 해시태그 찾기
SELECT * FROM BOARD_TAG WHERE RNUM =1;
--해당 아이디가 가장 최근에 쓴 글
SELECT MAX(RNUM) FROM RBOARD WHERE MID='AAA';
--해시태그 이름으로 해시태그 번호 찾기

SELECT MAX(HNO) FROM HASHTAG WHERE HNAME='공부';
--해시태그 수정
UPDATE HASHTAG SET HNAME ='#진학'
                WHERE HNO=1;
--해시태그 삭제
DELETE HASHTAG WHERE HNAME ='#진학';
--해시태그 연결
INSERT INTO BOARD_TAG(BTNO, RNUM, HNO) VALUES(BTSEQ.NEXTVAL,(SELECT MAX(RNUM) FROM RBOARD), (SELECT HNO FROM HASHTAG WHERE HNAME='#공부'));
--해시태그 출력
SELECT RBOARD.*
    FROM BOARD_TAG
    JOIN RBOARD ON RBOARD.RNUM = BOARD_TAG.RNUM
    WHERE BOARD_TAG.HNO = 1 AND RBOARD.RNUM=2;

--타이머

--타이머 생성

INSERT INTO TIMER(TNO, MID, TTODAY, TNAME, TDO, TPAUSE, TDURING, TSTART, TEND) 
    		VALUES(TSEQ.NEXTVAL,'aaa', SYSDATE, '개발' ,60,0 , 60, 0, 0 );
            
--타이머 눌렀을 때(START)
UPDATE TIMER SET TSTART = 0 WHERE TNO = 94; 

--타이머 눌렀을 때 (END)
UPDATE TIMER SET TEND = 0 WHERE TNO = 1; 

--타이머 pause눌렀을 때
UPDATE TIMER SET TDURING = 1 WHERE TNO = 95;

--타임테이블
--타임테이블 생성
INSERT INTO TTABLE(TBNO, TNO, MID, TBSHOUR, TBSMIN, TBEHOUR, TBEMIN) 
VALUES(TBSEQ.NEXTVAL, 1,'aaa', 21, 10 ,23,20 );

--시작한 시간
UPDATE TTABLE SET TBSHOUR = 4, TBSMIN = 50 WHERE TBNO =1;

--끝난 시간
UPDATE TTABLE SET TBEHOUR = 7, TBEMIN =20 WHERE TBNO =1;

--시작 끝 한번에 입력
UPDATE TTABLE SET TBSHOUR = 4, TBSMIN = 50, TBEHOUR = 7, TBEMIN =20 WHERE TBNO =1;
--날짜별 LIST
SELECT to_char(TTODAY, 'yyyy-mm-dd'), ttoday FROM TIMER where to_char(TTODAY, 'yyyy-mm-dd')=to_char('2022-01-01', 'yyyy-mm-dd');

--TNO로 List
SELECT B.*, TDURING FROM TTABLE B, TIMER T WHERE B.TNO=1;

--TBNO로 List
SELECT B.*, TDURING FROM TTABLE B, TIMER T WHERE TBNO=1;
--테이블에 있는 것 중 가장 최근 것
SELECT MAX(TBNO)TBNO FROM TTABLE;

--TNO로 타이머 불러오기
SELECT * FROM TIMER WHERE TNO = 109;

--시간이 마지막까지 측정된 것 불러오기
SELECT * FROM TIMER WHERE mid = 'aaa' and tend>0;

COMMIT;

