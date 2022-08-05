package com.project.mylog.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.dao.TimerDao;
import com.project.mylog.model.Member;
import com.project.mylog.model.Timer;
import com.project.mylog.service.TimerService;

@Controller
@RequestMapping(value="timer")
public class TimerController {
	
	@Autowired
	private TimerService timerService;
	
	@RequestMapping(value="setting", method=RequestMethod.GET)
	public String timerSetting() {
		
		return "timer/timersetting";
	}
	
	@RequestMapping(value="tableview", method=RequestMethod.GET)
	public String tableView() {
		
		return "timer/timetable";
	}
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String timerView(HttpSession session, Timer timer, Model model) {
		model.addAttribute("timerset",timerService.timerMake(session, timer));
		model.addAttribute("tno", timerService.getTno());
		return "timer/timer";
	}
	
	@RequestMapping(value="timestart", method=RequestMethod.GET)
	public String timerStart(Timer timer, Model model) {
		model.addAttribute("timestart",timerService.timerStart(timer));
		System.out.println(1);
		return "timer/timer";
	}
	
	@RequestMapping(value="timewrite", method=RequestMethod.GET)
	public String timerWrite(HttpSession session, Timer timer, Model model) {
		int tno = timerService.endTno();
		model.addAttribute("timing", timerService.startEnd(session, timer));
		
		model.addAttribute("ttablewrite", timerService.timerTno(tno));
		
		return "forward:view.do";
	}
	
	@RequestMapping(value="timesave", method=RequestMethod.GET)
	public String timerSave(HttpSession session, Timer timer, Model model) {
		int tno = timerService.endTno();
		
		model.addAttribute("ttablewrite", timerService.timerSave(timer));
		
		return "forward:view.do";
	}
	
	
}
