package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.service.ReveiwReplyBoardService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping(value="reply")
public class ReviewReplyController {

	@Autowired
	private ReveiwReplyBoardService replyservice;
	
	@RequestMapping(value="list", method= RequestMethod.GET)
	public String reviewReplyList(String pageNum, Model model, int rnum) {
		
		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, pageNum));
		model.addAttribute("replyPaging", new Paging(replyservice.reviewReplyCount(), pageNum));
		return "forward:content.do";
	}
	
	@RequestMapping(value="write", method= RequestMethod.POST)
	public String replyWrite(int rnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rnum", rnum);
		model.addAttribute("replywrite", replyservice.reviewReplyWrite(replyBoard));
		return "forward:content.do";
	}

}
