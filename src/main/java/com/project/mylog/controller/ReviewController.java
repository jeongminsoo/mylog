package com.project.mylog.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.mylog.model.BoardTag;
import com.project.mylog.model.ReviewBoard;
import com.project.mylog.model.ReviewReplyBoard;
import com.project.mylog.service.BoardTagService;
import com.project.mylog.service.ReveiwReplyBoardService;
import com.project.mylog.service.ReviewBoardService;
import com.project.mylog.util.Paging;
import com.project.mylog.util.ReplyPaging;
import com.project.mylog.util.ReviewPaging;

@Controller
@RequestMapping(value="review")
public class ReviewController {
	
	@Autowired
	private ReviewBoardService rboardservice;
	@Autowired
	private ReveiwReplyBoardService replyservice;
	@Autowired
	private BoardTagService btagservice;
	
	
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(String pageNum, Model model) {
		model.addAttribute("reviewList", rboardservice.reviewList(pageNum));
		model.addAttribute("reviewPaging",new ReviewPaging(rboardservice.reviewCount(), pageNum));
		
		return "review/list";
		
	}
	
	@RequestMapping(value="content", method={RequestMethod.GET, RequestMethod.POST})
	public String reviewContent(int rnum, Model model, String pageNum, String repageNum) {
		//model.addAttribute("replylist", replyservice.reviewReplyContent(rnum)); 
		
		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, repageNum));
		model.addAttribute("repaging", new ReplyPaging(replyservice.reviewReplyCount(rnum), repageNum));
		model.addAttribute("rnum", rnum);
		model.addAttribute("reviewContent", rboardservice.reviewContent(rnum));
		

		
		return "review/content";
		
	}
	
	@RequestMapping(value="write", method= RequestMethod.GET)
	public String reviewWrite() {
	
		return "review/write";
		
	}
	@RequestMapping(value="write", method= RequestMethod.POST)
	public String reviewWrite(MultipartHttpServletRequest mRequest, BoardTag boardtag, ReviewBoard reviewBoard, Model model) {
		model.addAttribute("reviewWrite", rboardservice.reviewWrite(mRequest, reviewBoard));
		btagservice.BoardTagConnect(boardtag);
		return "forward:list.do";
		
	}
	
	@RequestMapping(value="modify", method= RequestMethod.GET)
	public String reviewModify(int rnum, Model model, String pageNum) {
		
		model.addAttribute("modifyView", rboardservice.reviewContent(rnum));
		return "review/modify";
		
	}
	@RequestMapping(value="modify", method= RequestMethod.POST)
	public String reviewModify(MultipartHttpServletRequest mRequest, ReviewBoard reviewBoard, Model model) {
		
		
		model.addAttribute("reviewModify", rboardservice.reviewModify(mRequest, reviewBoard));
		return "forward:list.do";
		
	}
	
	@RequestMapping(value="delete", method= RequestMethod.GET)
	public String reviewDelete(int rnum, Model model) {
		
		model.addAttribute("delete", rboardservice.reviewDelete(rnum));
		return "forward:list.do";
		
	}
	
//	@RequestMapping(value="replylist", method= {RequestMethod.GET,RequestMethod.POST})
//	public String reviewReplyList(String pageNum, Model model, int rnum) {
//		
//		model.addAttribute("rnum", rnum);
//		model.addAttribute("replylist", replyservice.reviewReplyList(rnum, pageNum));
//		model.addAttribute("replyPaging", new Paging(replyservice.reviewReplyCount(), pageNum));
//		return "forward:content.do";
//	}
//	
	//댓글
	
	@RequestMapping(value="replywrite", method= RequestMethod.POST)
	public String replyWrite(int rnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rnum", rnum);
		model.addAttribute("replywrite", replyservice.reviewReplyWrite(replyBoard));
		return "forward:content.do";
	}

	@RequestMapping(value="replydelete", method= RequestMethod.GET)
	public String replyDelete(int rpnum, Model model, int rnum) {
		model.addAttribute("rpnum", rpnum);
		model.addAttribute("rnum", rnum);
		model.addAttribute("replyDelete", replyservice.reviewReplyDelete(rpnum));
		return "forward:content.do";
	}
	

	@RequestMapping(value="replymodify", method= RequestMethod.GET)
	public String replyModifyView(int rpnum, Model model, ReviewReplyBoard replyBoard) {
		model.addAttribute("rpnum", rpnum);
		model.addAttribute("replymview", replyservice.reviewReplyContent(rpnum));
		
		return "review/replymodify";
	}
	
	@RequestMapping(value="replymodify", method= RequestMethod.POST)
	public String replyModify(Model model, ReviewReplyBoard replyBoard) {
		//model.addAttribute("rpnum", rpnum);
		System.out.println("수정할 데이터 : " + replyBoard);
		model.addAttribute("replyModify", replyservice.reviewReplyModify(replyBoard));
		return "forward:content.do";
	}

	
	@RequestMapping(value="replycomment", method= RequestMethod.GET)
	public String replyComment(Model model, int rpnum) {
		//model.addAttribute("rpnum", rpnum);
		model.addAttribute("rpnum", rpnum);
		return "review/replycomment";
	}

	
	

}
