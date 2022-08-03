package com.project.mylog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController {

	@RequestMapping(value="calendar", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendar(int year, int month, Model model) {

		return "claendar/calendar";
	}
}
