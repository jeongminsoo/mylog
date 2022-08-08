-- 회원

-- 이메일 중복체크 / emailCheck
SELECT * FROM MEMBER WHERE MEMAIL = 'leekr44@naver.com';

-- 아이디 중복체크 / idCheck
SELECT COUNT(*) FROM MEMBER WHERE MID = 'aaa';

-- 회원가입 / joinMember
-- 모두 입력
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS) VALUES ('aaa', '111', '닉네임', '2000-01-01', 'aaa@a.com', '나는 최고다', '1');

-- 생일 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MMOTTO, MSTATUS) VALUES ('fff', '111', '닉네임', 'fff@f.com', '나는 최고다', '1');

-- 좌우명 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL) VALUES ('ppp', '111', '닉네임', '2000-01-01', 'ppp@p.com');

-- 모두 제외
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL) VALUES ('rrr', '111', '닉네임', 'rrr@r.com');


-- 회원 탈퇴 / deleteMember
UPDATE MEMBER SET MSTATUS = 0 WHERE MID = 'aaa';

-- 회원 복구 / recoverMember
UPDATE MEMBER SET MSTATUS = 1 WHERE MID = 'aaa';

-- 회원리스트 페이징을 위한 query / countMember
SELECT COUNT(*) FROM MEMBER;

-- 로그인 체크 / loginCheck
SELECT * FROM MEMBER WHERE MID = 'aaa' AND MPW = '111';

-- 아이디/비밀번호 찾기 / searchIdPw
SELECT * FROM MEMBER WHERE MNAME= '닉네임' AND MEMAIL = 'aaa@a.com';

-- 아이디/비밀번호 찾기에 쓰일 query / getMemberForEmail
SELECT * FROM MEMBER WHERE MEMAIL = 'aaa@a.com';

-- 회원정보 가져오기 (회원정보수정) / getMember
SELECT * FROM MEMBER WHERE MID = 'aaa';

-- 친구 검색(내가 팔로우한 사람은 1, 팔로우하지 않은 사람은 0) / findFriend
SELECT MID, MNAME, (SELECT COUNT(*) FROM FRIEND WHERE MID = 'aaa' AND FID = MEMBER.MID) EXISTENT
			FROM MEMBER WHERE MNAME LIKE '%'||''||'%' AND NOT MID = 'aaa';

-- 페이징 회원리스트(관리자용) / memberList
SELECT * FROM 
	        (SELECT ROWNUM RN, A.* FROM 
		        (SELECT M.* FROM MEMBER M
		                    ORDER BY MSTATUS DESC,mID) A)
		        WHERE RN BETWEEN 1 AND 10;

-- 친구

-- 친구 목록 / myFriendList
SELECT FID, MNAME FROM FRIEND F, MEMBER M
			WHERE M.MID = F.FID AND F.MID = 'aaa' ORDER BY FID;

-- 친구 목록 내에서 검색 / searchMyFriend
SELECT FID, MNAME FROM FRIEND F, MEMBER M
			WHERE M.MID = F.FID AND F.MID = 'aaa' AND
				MNAME LIKE '%'||'닉네임'||'%'
			ORDER BY FID;
            
-- 친구목록 페이징을 위한 query / countMyFriend
SELECT COUNT(*) FROM FRIEND WHERE MID = 'aaa';

-- 나를 팔로우한 친구리스트 페이징을 위한 query / countFollowMe
SELECT COUNT(*) FROM (SELECT F2.MID, MNAME,(SELECT COUNT(*) FROM FRIEND F1 WHERE F1.MID = 'aaa' AND F1.FID = F2.MID) EXISTENT
								FROM FRIEND F2, MEMBER M WHERE M.MID = F2.FID AND F2.FID = 'aaa');
                                
-- 나를 팔로우한 친구 리스트 (내가 이미 팔로우한 사람은 1, 팔로우하지 않은 사람은 0)
SELECT F2.MID, MNAME, (SELECT COUNT(*) FROM FRIEND F1 WHERE F1.MID = 'aaa' AND F1.FID = F2.MID) EXISTENT
			FROM FRIEND F2, MEMBER M WHERE M.MID = F2.FID AND F2.FID = 'aaa';
            
-- 친구 팔로우 하기 / followFriend
INSERT INTO FRIEND VALUES (FRIEND_SEQ.NEXTVAL, 'bbb', 'ccc');

-- 친구 언팔로우하기 / unfollowFriend
DELETE FROM FRIEND WHERE MID = 'bbb' AND FID = 'ccc';
SELECT COUNT(*) FROM FRIEND WHERE MID='aaa' AND FID='bbb';
SELECT * FROM MEMBER WHERE MID = 'bbb';

SELECT * FROM FRIEND;
ROLLBACK;
COMMIT;




