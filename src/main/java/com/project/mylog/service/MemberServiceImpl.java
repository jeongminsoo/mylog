package com.project.mylog.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.MemberDao;
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int joinMember(Member member, String tempmbirth) {
		if ("".equals(tempmbirth)) {
			member.setMbirth(null);
		} else {
			member.setMbirth(Date.valueOf(tempmbirth));
		}
		return memberDao.joinMember(member);
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);
	}

	@Override
	public int idCheck(String mid) {
		return memberDao.idCheck(mid);
	}

	@Override
	public int deleteMember(String pageNum, String mid) {
		return memberDao.deleteMember(mid);
	}

	@Override
	public int recoverMember(String pageNum, String mid) {	
		return memberDao.recoverMember(mid);
	}

	@Override
	public List<Member> memberList(String pageNum) {
		Paging paging = new Paging(memberDao.countMember(), pageNum);
		Member member = new Member();
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		return memberDao.memberList(member);
	}

	@Override
	public int countMember() {
		return memberDao.countMember();
	}

}
