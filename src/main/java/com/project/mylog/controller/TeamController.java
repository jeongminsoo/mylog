package com.project.mylog.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Team;
import com.project.mylog.model.TeamMember;
import com.project.mylog.service.TeamMemberService;
import com.project.mylog.service.TeamService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value = "team")
public class TeamController {

	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TeamMemberService teamMservice;
	
	//makeTeam
	@RequestMapping(value = "makeTeamView", method = RequestMethod.GET)
	public String makeTeamView() {
		return "team/makeTeamView";
	}
	@RequestMapping(value = "makeTeam", method = RequestMethod.POST)
	public String makeTeam(@ModelAttribute("team") Team team, Model model) {
		model.addAttribute("makeTeamResult", teamService.makeTeam(team));
		return "forward:../teammember/firstJoin.do";
	}
	//teamDetail
	@RequestMapping(value = "teamDetailView", method = RequestMethod.GET)
	public String teamDetailView(int tno, String mid, TeamMember teammember, Model model) {
		teammember.setMid(mid);
		teammember.setTno(tno);
		model.addAttribute("teamDetail", teamService.getTeamDetail(tno));
		model.addAttribute("teamMemberTotCnt", teamMservice.teamMemberTotCnt(tno));
		model.addAttribute("tMemberDetail", teamMservice.getTeamMemberDetail(teammember));
		model.addAttribute("teamMemberList", teamMservice.teamMemberList(tno));
		return "team/teamDetailView";
	}
	//teamList
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String teamList(String pageNum, Model model) {
		model.addAttribute("teamList", teamService.teamList(pageNum));
		int teamTotCnt = teamService.teamTotCnt();
		model.addAttribute("paging", new Paging(teamTotCnt, pageNum, 12, 5));
		return "team/list";
	}
}
