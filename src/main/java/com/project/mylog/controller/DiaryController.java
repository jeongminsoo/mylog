package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mylog.service.DiaryBoardService;

@Controller
@RequestMapping("diary")
public class DiaryController {
	
	@Autowired
	private DiaryBoardService dbService;
	
}
