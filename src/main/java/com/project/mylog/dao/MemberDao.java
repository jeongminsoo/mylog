package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.Member;

@Mapper
public interface MemberDao {

	public int joinMember(Member member);
	
	public int modifyMember(Member member);
	
	public int idCheck(String mid);
	
	public int deleteMember(String mid);
	
	public int recoverMember(String mid);
	
	public List<Member> memberList(Member member);
	
	public int countMember();
}
