package com.project.mylog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

<<<<<<< HEAD:src/main/java/com/project/mylog/HomeController.java
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home() {
		return "home";
=======
	@RequestMapping(value="main", method = {RequestMethod.GET, RequestMethod.POST})
	public String main() {
		return "main/main";
>>>>>>> 57e93aa8c9624e651a048967cb53467a055df493:src/main/java/com/project/mylog/controller/MainController.java
	}
}
