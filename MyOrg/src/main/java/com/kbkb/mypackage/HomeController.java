package com.kbkb.mypackage;

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

import com.kbkb.mypackage.member.MemberDTO;
import com.kbkb.mypackage.member.MemberService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	MemberService ms;
	@Autowired
	SqlSession sqlsession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<MemberDTO> al = sqlsession.selectList("members.selectAll");
		model.addAttribute("memberList", al);
		model.addAttribute("menu", "home");
		return "home";
	}
}
