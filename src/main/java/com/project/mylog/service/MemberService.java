package com.project.mylog.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.mylog.model.Member;

public interface MemberService {

	public int joinMember(Member member, String tempmbirth);
	
	public int modifyMember(Member member);
	
	public int idCheck(String mid);
	
	public int deleteMember(String pageNum, String mid);
	
	public int recoverMember(String pageNum, String mid);
	
	public List<Member> memberList(String pageNum);
	
	public int countMember();
	
	public Member getMember(String mid);
	
	public String loginCheck(String mid, String mpw, HttpSession session);
	
	public String searchIdPw(String mname, String memail);
	
	public Member getMemberForMname(String mname);
	
	public int emailCheck(String memail);
	
	public List<Member> findFriend(String mname);
}
