package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.TeamBoard;
import com.project.mylog.model.TeamCommentBoard;
import com.project.mylog.service.TeamBoardService;
import com.project.mylog.service.TeamCommentBoardService;
import com.project.mylog.util.Paging;

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
		model.addAttribute("teamcommentList", tcService.teamCommentList(tcpageNum));
		int teamCommentTotCnt = tcService.teamCommentTotCnt();
		model.addAttribute("teamCommentTotCnt", teamCommentTotCnt);
		System.out.println("댓글 수 : " + teamCommentTotCnt);
		//model.addAttribute("paging", new Paging(teamCommentTotCnt, tcpageNum));

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

	// teamcommentWrite
	@RequestMapping(value = "tcwrite", method = RequestMethod.POST)
	public String teamcommentWrite(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment,
			HttpServletRequest request, Model model) { // ip저장위해
		model.addAttribute("teamboardwriteResult", tcService.teamCommentWrite(request, teamcomment));
		return "forward:content.do";
	}

	// teamcommentModify
	@RequestMapping(value = "tcmodify", method = RequestMethod.POST)
	public String teamcommentModify(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment,
			HttpServletRequest request, Model model) {
		model.addAttribute("teamboardmodifyResult", tcService.teamCommentModify(request, teamcomment));
		return "forward:content.do";
	}

	// teamcommentDelete
	@RequestMapping(value = "tcdelete", method = RequestMethod.GET)
	public String teamcommentDelete(int tcnum, String pageNum, Model model) {
		model.addAttribute("teamboarddeleteResult", tcService.teamCommentDelete(tcnum));
		return "forward:content.do";
	}

	// teamcommentReply
	@RequestMapping(value = "tcreply", method = RequestMethod.POST)
	public String teamcommentReply(@ModelAttribute("teamcomment") TeamCommentBoard teamcomment,
			HttpServletRequest request, Model model) { // ip저장위해 request필요
		model.addAttribute("teamcomment", tcService.teamCommentReply(request, teamcomment));
		return "forward:content.do";
	}

}
