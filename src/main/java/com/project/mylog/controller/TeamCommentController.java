package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.TeamCommentBoard;
import com.project.mylog.service.TeamCommentBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value="teamcomment")
public class TeamCommentController {
	
	@Autowired
	private TeamCommentBoardService tcService;
	
	//teamcommentWrite
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String teamcommentWrite(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment, HttpServletRequest request, Model model) { // ip저장위해
		model.addAttribute("teamcommentwriteResult", tcService.teamCommentWrite(request, teamcomment)); 
		return "forward:../teamboard/content.do";
	}
	//teamboardModify
	@RequestMapping(value = "modify", method= RequestMethod.POST)
	public String teamcommentModify(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment, HttpServletRequest request, Model model) {
		model.addAttribute("teamcommentmodifyResult", tcService.teamCommentModify(request, teamcomment));
		return "forward:../teamboard/content.do";
	}
	//teamboardDelete
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int tnum, String pageNum, int tcnum, String tcpageNum, Model model) {
		model.addAttribute("teamcommentdeleteResult", tcService.teamCommentDelete(tcnum));
		return "forward:../teamboard/content.do";
	}
	//teamboardReply
	@RequestMapping(value = "replyView", method = {RequestMethod.GET, RequestMethod.POST})
	public String teamboardReplyView(int tcnum, Model model) {
		model.addAttribute("teamcomment", tcService.teamCommentDetail(tcnum));
		System.out.println("replyView단 : "+tcnum);
		System.out.println("원댓글 정보 : " + tcService.teamCommentDetail(tcnum));
		return "teamcomment/replyView";
	}
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String teamboardReply(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment, HttpServletRequest request, Model model) { // ip저장위해 request필요
		model.addAttribute("teamcomment", tcService.teamCommentReply(request, teamcomment));
		return "forward:../teamboard/content.do";
	}
}
