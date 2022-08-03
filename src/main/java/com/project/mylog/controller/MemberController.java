package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.service.MemberService;
import com.project.mylog.util.Paging;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="joinView", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinView() {
		return "member/join";
	}
	
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String joinMember(@ModelAttribute("member") Member member, String tempmbirth, Model model) {
		model.addAttribute("joinResult", memberService.joinMember(member, tempmbirth));
		return "forward:loginView.do";
	}
	
	
	@RequestMapping(value="idCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String idCheck(String mid, Model model) {
		String msg;
		if (memberService.idCheck(mid) == 1) {
			msg = "중복된 아이디입니다";
		} else {
			msg = "사용가능한 아이디입니다";
		}
		model.addAttribute("result", msg);
		return "member/idCheck";
	}
	
	
	 @RequestMapping(value="memberList", method = RequestMethod.GET)
	 public String memberList(String pageNum, Model model) {
		 Paging paging = new Paging(memberService.countMember(), pageNum);
		 model.addAttribute("memberList", memberService.memberList(pageNum));
		 model.addAttribute("paging", paging); return "admin/memberList";
	 }
	 
	
	@RequestMapping(value="deleteMember", method = RequestMethod.GET)
	public String deleteMember(String mid, String pageNum, Model model) {
		model.addAttribute("deleteResult", memberService.deleteMember(pageNum, mid));
		return "forward:memberList.do";
	}
	
	@RequestMapping(value="recoverMember", method = RequestMethod.GET)
	public String recoverMember(String mid, String pageNum, Model model) {
		model.addAttribute("recoverResult", memberService.recoverMember(pageNum, mid));
		return "forward:memberList.do";
	}
	
	@RequestMapping(value="loginView", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginView() {
		return "member/login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(String mid, String mpw, HttpSession session, Model model) {
		String result = memberService.loginCheck(mid, mpw, session);
		if (result.equals("로그인 성공")) {
			return "forward:main.do";
		} else {
			model.addAttribute("mid", mid);
			model.addAttribute("mpw", mpw);
			model.addAttribute("loginResult", result);
			return "forward:loginView.do";
		}
	}
	
	@RequestMapping(value="searchIdPwView", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchIdPwView() {
		return "member/searchIdPw";
	}
	
	@RequestMapping(value="searchIdPw", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchIdPw(String mname, String memail, Model model) {
		String result = memberService.searchIdPw(mname, memail);
		if (result.equals("검색 성공")) {
			Member member = memberService.getMemberForMname(mname);
			model.addAttribute("mid", member.getMid());
			return "forward:searchResult.do";
		} else {
			model.addAttribute("mname", mname);
			model.addAttribute("memail", memail);
			model.addAttribute("searchResult", result);
			return "forward:searchIdPwView.do";
		}
	}
	
	@RequestMapping(value="searchResult", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchResult() {
		return "member/searchResult";
	}
}
