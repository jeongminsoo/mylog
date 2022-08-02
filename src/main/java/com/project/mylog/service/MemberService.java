package com.project.mylog.service;

import java.util.List;

import com.project.mylog.model.Member;

public interface MemberService {

	public int joinMember(Member member, String tempmbirth);
	
	public int modifyMember(Member member);
	
	public int idCheck(String mid);
	
	public int deleteMember(String pageNum, String mid);
	
	public int recoverMember(String pageNum, String mid);
	
	public List<Member> memberList(String pageNum);
	
	public int countMember();
}
