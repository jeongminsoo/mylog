package com.project.mylog.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.service.AccountBookService;
import com.project.mylog.service.AccountCategoryService;

@Controller
@RequestMapping("account")
public class AccountController {
	@Autowired
	private AccountBookService abService;
	
	@Autowired
	private AccountCategoryService acService;
	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String monthlyList(Date adate, String pageNum, HttpSession session, Model model) {
		model.addAttribute("monthlyList", abService.monthlyAccount(adate, pageNum, session));
		model.addAttribute("monthTotal", abService.mothlyTotal(adate, session));
		model.addAttribute("mothlyCategoryTotal", abService.monthlyCategoryTotal(adate, session));
		
		adate = new Date(abService.mothlyTotal(adate, session).getAdate().getTime());
		Date before;
		Date after;
		if(adate.getMonth() == 0) {
			before = new Date(adate.getYear()-1, 11, adate.getDate());
		}else {
			before = new Date(adate.getYear(), adate.getMonth()-1, adate.getDate());
		}
		if(adate.getMonth() == 11) {
			after = new Date(adate.getYear()+1, 0, adate.getDate());
		}else {
			after = new Date(adate.getYear(), adate.getMonth()+1, adate.getDate());
		}
		
		model.addAttribute("before", before);
		model.addAttribute("after", after);
		return "account/monthly";
	}
}
