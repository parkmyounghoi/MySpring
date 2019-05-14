package com.kbkb.mypackage.guestbook;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GuestbookController {
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/guestbook", method = RequestMethod.GET)
	public String home(Model model) {
		List<GuestbookDTO> list = sqlsession.selectList("guestbook.selectAll");
		
		model.addAttribute("list",list);
		model.addAttribute("menu","guestbook");
		return "guestbook/index";
	}
	
	@RequestMapping(value = "/guestbook/save")
	public String save(Model model , 
					   @RequestParam String content) {
		logger.info(content);
		
		sqlsession.insert("guestbook.insertguestbook",content);
		
		model.addAttribute("myresult","success");
		
//		List<GuestbookDTO> list = sqlsession.selectList("guestbook.selectAll");
//		model.addAttribute("list",list);
//		model.addAttribute("menu","guestbook");
		return "guestbook/save";
	}
	
	@RequestMapping(value = "/guestbook/delete")
	public String delete(Model model , String idx) {
//		logger.info(content);
		
		sqlsession.insert("guestbook.deleteguestbook",idx);
		
		model.addAttribute("myresult","success");
		
//		List<GuestbookDTO> list = sqlsession.selectList("guestbook.selectAll");
//		model.addAttribute("list",list);
//		model.addAttribute("menu","guestbook");
		return "guestbook/save";
	}
	
	@RequestMapping(value = "/guestbook/update")
	public String update(Model model , GuestbookDTO gd) {
//		logger.info(content);
		
		sqlsession.insert("guestbook.updateguestbook",gd);
		
		model.addAttribute("myresult","success");
		
//		List<GuestbookDTO> list = sqlsession.selectList("guestbook.selectAll");
//		model.addAttribute("list",list);
//		model.addAttribute("menu","guestbook");
		return "guestbook/save";
	}
	
	
}

