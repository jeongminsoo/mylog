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
import com.project.mylog.service.TeamCommentBoardService;
import com.project.mylog.util.Paging;
import com.project.mylog.util.Paging2;

@Controller
@RequestMapping(value = "teamboard")
public class TeamBoardController {

	@Autowired
	private TeamBoardService tbService;

	@Autowired
	private TeamCommentBoardService tcService;

	// teamboardList
	@RequestMapping(value = "list", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamboardList(String pageNum, Model model) {
		model.addAttribute("teamboardList", tbService.teamBoardList(pageNum));
		int teamBoardTotCnt = tbService.teamBoardTotCnt();
		model.addAttribute("paging", new Paging(teamBoardTotCnt, pageNum));
		return "teamboard/list";
	}

	// teamboardWrite
	@RequestMapping(value = "writeView", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamboardWriteView() {
		return "teamboard/writeView";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String teamboardWrite(@ModelAttribute("teamboard") TeamBoard teamboard, MultipartHttpServletRequest mRequest,
			Model model) { // ip저장위해
		model.addAttribute("teamboardwriteResult", tbService.teamBoardWrite(mRequest, teamboard));
		return "forward:list.do";
	}

	// teamboardContent
	@RequestMapping(value = "content", method = { RequestMethod.GET, RequestMethod.POST })
	public String teamboardContent(int tnum, String pageNum, String tcpageNum, Model model) {
		model.addAttribute("content", tbService.teamBoardDetail(tnum));
		model.addAttribute("pageNum", pageNum);
		//comment
		model.addAttribute("teamcommentList", tcService.teamCommentList(tcpageNum, tnum));
		int teamCommentTotCnt = tcService.teamCommentTotCnt(tnum);
		model.addAttribute("teamCommentTotCnt", teamCommentTotCnt);
		model.addAttribute("paging", new Paging2(teamCommentTotCnt, tcpageNum));
		return "teamboard/content";
	}

	// teamboardModify
	@RequestMapping(value = "modifyView", method = RequestMethod.GET)
	public String teamboardModifyView(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboard", tbService.teamBoardModifyReplyView(tnum));
		return "teamboard/modifyView";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String teamboardModify(@ModelAttribute("teamboard") TeamBoard teamboard,
			MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("teamboardmodifyResult", tbService.teamBoardModify(mRequest, teamboard));
		return "forward:list.do";
	}

	// teamboardDelete
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String teamboardDelete(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboarddeleteResult", tbService.teamBoardDelete(tnum));
		return "forward:list.do";
	}

	// teamboardReply
	@RequestMapping(value = "replyView", method = RequestMethod.GET)
	public String replyView(int tnum, String pageNum, Model model) {
		model.addAttribute("teamboard", tbService.teamBoardModifyReplyView(tnum));
		return "teamboard/replyView";
	}

	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String teamboardReply(@ModelAttribute("teamboard") TeamBoard teamboard, MultipartHttpServletRequest mRequest,
			Model model) { // ip저장위해 request필요
		model.addAttribute("teamboard", tbService.teamBoardReply(mRequest, teamboard));
		return "forward:list.do";
	}

}
