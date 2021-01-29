package kr.green.usedmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.MemberService;
import kr.green.usedmarket.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv) {

		mv.setViewName("/main/home");
		return mv;
	}
	@RequestMapping(value = "/termsOfService", method = RequestMethod.GET)
	public ModelAndView termsOfServiceGet(ModelAndView mv) {

		mv.setViewName("/main/join/termsOfService");
		return mv;
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {

		mv.setViewName("/main/join/signup");
		return mv;
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVo member) {
		System.out.println(member);
		memberService.signupMember(member);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping(value = "/check/id", method = RequestMethod.POST)
	@ResponseBody
	public String checkIdPost(String id) {
		System.out.println(id);
		MemberVo member = memberService.getMember(id);
		System.out.println(member);
		if(member == null)
			return "possible";
		return "impossible";
	}
}
