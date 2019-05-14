package com.kbkb.mypackage.project;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("menu","project");
		return "project/index";
	}
	
	
}

