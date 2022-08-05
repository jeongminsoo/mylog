package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.model.Team;
import com.project.mylog.model.TeamMember;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value = "teammember")
public class TeamMemberController {

	@Autowired
	private TeamMemberService teamMservice;
	
	@Autowired
	private TeamService teamService;

	//myTeamList
	@RequestMapping(value = "myteamList", method = {RequestMethod.GET, RequestMethod.POST})
	public String myTeamList(String mid, HttpSession session, Model model) {
		model.addAttribute("myteamList", teamMservice.myTeamList(session));
		//myTeamList
		model.addAttribute("myapplyteamList", teamMservice.myApplyTeamList(session));
		return "teammember/myteamList";
	}
	
	//applyTeamMember
	
	//deleteApplyTeam(조장도 인위적으로 가능)
	@RequestMapping(value = "deleteApplyTeam", method = RequestMethod.GET)
	public String deleteApplyTeam(@ModelAttribute("teammember") TeamMember teammember, Model model) {
		model.addAttribute("deleteApplyTeamResult", teamMservice.deleteApplyTeam(teammember));
		return "forward:myteamList.do";
	}
	
	//permitApplyTeam
	
	//join
	@RequestMapping(value = "firstJoin", method = {RequestMethod.GET, RequestMethod.POST})
	public String firstJoinTeamMember(HttpSession session, Model model) {
		int tno = teamService.getTno();
		model.addAttribute("jointeamResult", teamMservice.joinTeamMember(session, tno));
		return "forward:myteamList.do";
	}
	@RequestMapping(value = "Join", method = RequestMethod.GET)
	public String joinTeamMember(int tno, HttpSession session, Model model) {
		model.addAttribute("jointeam", teamMservice.joinTeamMember(session, tno));
		System.out.println(teamMservice.myTeamList(session));
		return "teammember/myteamList";
	}
	
	//teamApplyList(조장만 확인가능)
	
	//drawalTeamMember(팀 탈퇴)
	
	//teamMemberList
	
	//teamMemberTotCnt
	
	
	
}
