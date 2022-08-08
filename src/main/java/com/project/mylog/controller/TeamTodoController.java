package com.project.mylog.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.service.TeamService;
import com.project.mylog.service.TeamTodoService;

@Controller
@RequestMapping("teamtodo")
public class TeamTodoController {

	@Autowired
	private TeamTodoService teamTodoService;

	@Autowired
	private TeamService teamService;

	//todoList 만들기
	@RequestMapping(value = "make", method = RequestMethod.GET)
	public String todoMake(int tno, Model model) {
		return "teamtodo/teamTodoMake";
	}

	// 해당날짜의 todoList
	@RequestMapping(value = "todoList", method = { RequestMethod.GET, RequestMethod.POST })
	public String todoList(HttpSession session, String year, String month, String day, Model model) {
		int yearInt = Integer.parseInt(year);
		int monthInt = Integer.parseInt(month);
		int dayInt = Integer.parseInt(day);

		Date ttrdate = new Date(yearInt - 1900, monthInt - 1, dayInt);
		model.addAttribute("ttrdate", ttrdate);
		return "forward:../team/myTeamDetailView.do?ttrdate=" + ttrdate;
	}

	
	/*
	 * @RequestMapping(value = "make", method = RequestMethod.POST) public String
	 * todoMake(Todo todo, Model model) { todoService.todoMake(todo); return
	 * "forward:../diary/myList.do"; }
	 * 
	 * @RequestMapping(value = "modify", method = RequestMethod.GET) public String
	 * todoModify() { return "todo/todoModify"; }
	 * 
	 * @RequestMapping(value = "modify", method = RequestMethod.POST) public String
	 * todoModify(int tdno, String tdcontent) { todoService.todoModify(tdno,
	 * tdcontent); return "forward:../diary/myList.do"; }
	 * 
	 * @RequestMapping(value = "delete", method = RequestMethod.GET) public String
	 * todoDelete(int tdno) { Date ddate = todoService.getTodo(tdno).getTdrdate();
	 * todoService.todoDelete(tdno); return
	 * "forward:../diary/myList.do?ddate="+ddate; }
	 * 
	 * @RequestMapping(value = "check", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String todoChange(int tdno, int tdcheck) { Date
	 * ddate = todoService.getTodo(tdno).getTdrdate(); todoService.todoChange(tdno,
	 * tdcheck); return "forward:../diary/myList.do?ddate="+ddate; }
	 */
}
