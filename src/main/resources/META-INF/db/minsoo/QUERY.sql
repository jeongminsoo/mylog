-- 회원

-- 이메일 중복체크 / emailCheck
SELECT * FROM MEMBER WHERE MEMAIL = 'leekr44@naver.com';

-- 아이디 중복체크 / idCheck
SELECT COUNT(*) FROM MEMBER WHERE MID = 'aaa';

-- 회원가입 / joinMember
-- 모두 입력
INSERT INTO MEMBER (MID, MPW, MNAME, MBIRTH, MEMAIL, MMOTTO, MSTATUS) VALUES ('eee', '111', '닉네임', '2000-01-01', 'eee@e.com', '나는 최고다', '1');

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

-- 페이징을 위한 회원 수 / countMember
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

COMMIT;




