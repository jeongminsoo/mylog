package com.project.mylog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.mylog.model.FileUp;
import com.project.mylog.service.DiaryBoardService;

@Controller
@RequestMapping("ckeditor")
public class CkecitorController {
	
	@Autowired
	DiaryBoardService bdService;
	
	@RequestMapping(value = "diaryUpload", method = {RequestMethod.GET, RequestMethod.POST})
	public String fileUpload(FileUp fileUp, HttpServletRequest request , Model model){
		fileUp = bdService.fileUp(fileUp, request);
		model.addAttribute("filePath", "../" + fileUp.getAttachPath() + fileUp.getFilename());  
		return "ckeditor/ckeditorImageUpload";
    }
}
