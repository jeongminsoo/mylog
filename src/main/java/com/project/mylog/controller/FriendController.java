package com.project.mylog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.service.FriendService;
import com.project.mylog.util.Paging;

@Controller
@RequestMapping("friend")
public class FriendController {

	@Autowired
	private FriendService friendService;
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String friendListVIew(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		String mid = member.getMid();
		model.addAttribute("friends", friendService.myFriendList(mid));
		Paging paging1 = new Paging(friendService.countMyFriend(mid), "1");
		Paging paging2 = new Paging(friendService.countFollowMe(mid), "1");
		model.addAttribute("follows", friendService.followMe(mid));
		model.addAttribute("paging1", paging1);
		model.addAttribute("paging2", paging2);
		return "friend/list";
	}
	
	@RequestMapping(value="search", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchMyFriend(String mid, String mname, Model model) {
		Paging paging = new Paging(friendService.countMyFriend(mid), "1");
		model.addAttribute("paging", paging);
		model.addAttribute("friends", friendService.searchMyFriend(mid, mname));
		return "friend/listResult";
	}
	
	@RequestMapping(value="findView", method = {RequestMethod.GET, RequestMethod.POST})
	public String findView() {
		return "friend/find";
	}
	
	@RequestMapping(value="findResult", method = {RequestMethod.GET, RequestMethod.POST})
	public String findResult() {
		return "friend/findResult";
	}
	
	@RequestMapping(value="myFollow", method = {RequestMethod.GET, RequestMethod.POST})
	public String myFollow(String mid, Model model) {
		Paging paging = new Paging(friendService.countFollowMe(mid), "1");
		model.addAttribute("paging", paging);
		model.addAttribute("follows", friendService.followMe(mid));
		return "friend/myFollow";
	}
	
	@RequestMapping(value="follow", method = {RequestMethod.GET, RequestMethod.POST})
	public String follow(String mid, String fid, Model model) {
		model.addAttribute("followResult", friendService.followFriend(mid, fid));
		return "forward:list.do";
	}
	
	@RequestMapping(value="unfollow", method = {RequestMethod.GET, RequestMethod.POST})
	public String unfollow(String mid, String fid, Model model) {
		model.addAttribute("unfollowResult", friendService.unfollowFriend(mid, fid));
		return "forward:list.do";
	}
}
