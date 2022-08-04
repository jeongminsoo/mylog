package com.project.mylog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="timer")
public class TimerController {
	
	@RequestMapping(value="veiw", method=RequestMethod.GET)
	public String timerView(String mid, String tname, int tdo, Model model) {
		if(tname !=null) {
			model.addAttribute("tname", tname);
		}else if(tname ==null) {
			model.addAttribute("tname","기타");
		}
		
		
		model.addAttribute("tdo", tdo);
		return "timer/timer";
	}
}
