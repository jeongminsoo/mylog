package com.project.mylog.controller;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.Member;
import com.project.mylog.service.DiaryBoardService;
import com.project.mylog.service.TodoService;
import com.project.mylog.util.CalendarPrinter;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	@Autowired
	private TodoService todoService;
	
	@Autowired
	private DiaryBoardService diaryboardService;
	
	@RequestMapping(value="calendar", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendar(String year, String month, Model model) {
		int yearInt;
		int monthInt;
		if(year==null && month==null) {
			Calendar cal = Calendar.getInstance();
			yearInt = cal.get(Calendar.YEAR);
			monthInt = cal.get(Calendar.MONTH)+1;
			year = String.valueOf(year);
			month = monthInt < 10 ? "0" + month : String.valueOf(monthInt);
		} else {
			yearInt = Integer.parseInt(year);
			monthInt = Integer.parseInt(month);
			month = monthInt < 10 ? "0" + month : String.valueOf(monthInt);
		}
		CalendarPrinter calPrint = new CalendarPrinter(yearInt, monthInt);
		
		model.addAttribute("calPrint", calPrint);
		model.addAttribute("year", yearInt);
		model.addAttribute("month", monthInt);
		
		return "calendar/calendar";
	}
	
	@RequestMapping(value="dailyList", method = {RequestMethod.GET, RequestMethod.POST})
	public String todoList(HttpSession session, String year, String month, String day, String pageNum, Model model) {
		int yearInt = Integer.parseInt(year);
		int monthInt = Integer.parseInt(month);
		int dayInt = Integer.parseInt(day);
		
		Member member = (Member) session.getAttribute("member");
		String mid = member.getMid();
		
		CalendarPrinter calPrint = new CalendarPrinter(yearInt, monthInt);
		
		if (dayInt == 0) {
			if (monthInt-1 == 0) {
				monthInt = 12;
				yearInt -= 1;
				calPrint = new CalendarPrinter(yearInt, monthInt);
			} else {
				monthInt -= 1;
				calPrint = new CalendarPrinter(yearInt, monthInt);
			}
			dayInt = calPrint.getLastday();
		} else if (dayInt > calPrint.getLastday()  ) {
			if (monthInt + 1 > 11) {
				monthInt = 1;
				yearInt += 1;
			} else {
				monthInt += 1;
			}
			dayInt = 1;
		}
		
		Date tdrdate = new Date(yearInt-1900, monthInt - 1, dayInt);
		Date ddate = new Date(yearInt-1900, monthInt - 1, dayInt);
		
		model.addAttribute("todos", todoService.todoList(mid, tdrdate));
		model.addAttribute("diarys", diaryboardService.myDiaryList(mid, ddate, pageNum));
		model.addAttribute("year", yearInt);
		model.addAttribute("month", monthInt);
		model.addAttribute("day", dayInt);
		return "calendar/dailyList";
	}
}
