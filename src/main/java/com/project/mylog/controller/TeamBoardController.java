package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.TeamBoard;
import com.project.mylog.service.TeamBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value="teamboard")
public class TeamBoardController {
	
	@Autowired
	private TeamBoardService tbService;
	
	//teamboardList
	@RequestMapping(value = "teamboardList", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamboardList(String pageNum, Model model) {
		model.addAttribute("teamboardList", tbService.teamBoardList(pageNum));
		int teamBoardTotCnt = tbService.teamBoardTotCnt();
		model.addAttribute("paging", new Paging(teamBoardTotCnt, pageNum));
		return "teamboard/teamboardList";
	}
	//teamboardWrite
	@RequestMapping(value = "teamboardWriteView", method = {RequestMethod.GET, RequestMethod.POST})
	public String teamboardWriteView() {
		return "teamboard/teamboardWriteView";
	}
	@RequestMapping(value = "teamboardWrite", method = RequestMethod.POST)
	public String teamboardWrite(@ModelAttribute("teamboard") TeamBoard teamboard, MultipartHttpServletRequest mRequest, Model model) { // ip저장위해
		model.addAttribute("teamboardwriteResult", tbService.teamBoardWrite(mRequest, teamboard)); 
		return "forward:teamboardList.do";
	}
	//teamboardContent
	@RequestMapping(value = "teamboardContent", method= {RequestMethod.GET, RequestMethod.POST})
	public String teamboardContent(int tnum, String pageNum, Model model) {
		model.addAttribute("content", tbService.teamBoardDetail(tnum));
		model.addAttribute("pageNum", pageNum);
		return "teamboard/teamboardContent";
	}
	//teamboardModify
	@RequestMapping(value = "teamboardModifyView", method= RequestMethod.GET)
	public String teamboardModifyView(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboard", tbService.teamBoardModifyReplyView(tnum));
		return "teamboard/teamboardModifyView";
	}
	@RequestMapping(value = "teamboardModify", method= RequestMethod.POST)
	public String teamboardModify(@ModelAttribute("teamboard") TeamBoard teamboard, MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("teamboardmodifyResult", tbService.teamBoardModify(mRequest, teamboard));
		return "forward:teamboardList.do";
	}
	//teamboardDelete
	@RequestMapping(value = "teamboardDelete", method = RequestMethod.GET)
	public String delete(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboarddeleteResult", tbService.teamBoardDelete(tnum));		
		return "forward:teamboardList.do";
	}
	//teamboardReply
	@RequestMapping(value = "teamboardReplyView", method = RequestMethod.GET)
	public String replyView(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboard", tbService.teamBoardModifyReplyView(tnum));
		return "teamboard/teamboardReplyView";
	}
	@RequestMapping(value = "teamboardReply", method = RequestMethod.POST)
	public String teamboardReply(@ModelAttribute("teamboard") TeamBoard teamboard, MultipartHttpServletRequest mRequest, Model model) { // ip저장위해 request필요
		model.addAttribute("teamboard", tbService.teamBoardReply(mRequest, teamboard));
		return "forward:teamboardList.do";
	}
}
