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
	
	//teamcommentList
	@RequestMapping(value = "teamcommentList", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamcommentList(String pageNum, Model model) {
		model.addAttribute("teamcommentList", tcService.teamCommentList(pageNum));
		int teamCommentTotCnt = tcService.teamCommentTotCnt();
		model.addAttribute("paging", new Paging(teamCommentTotCnt, pageNum));
		return "forward:teamboardContent.do";
	}
	//teamcommentWrite
	@RequestMapping(value = "teamboardWrite", method = RequestMethod.POST)
	public String teamboardWrite(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment, HttpServletRequest request, Model model) { // ip저장위해
		model.addAttribute("teamboardwriteResult", tcService.teamCommentWrite(request, teamcomment)); 
		return "forward:teamboardList.do";
	}
	//teamboardContent
	/*@RequestMapping(value = "teamboardContent", method= {RequestMethod.GET, RequestMethod.POST})
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
	}*/
}
