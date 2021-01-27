package kr.green.usedmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.MemberService;
import kr.green.usedmarket.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		
		MemberVo member = memberService.getMember("aaa");
		System.out.println(member);

		mv.setViewName("/main/home");
		return mv;
	}
	
}
