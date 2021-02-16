package kr.green.usedmarket.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	// 약관동의 화면
	@RequestMapping(value = "/termsOfService", method = RequestMethod.GET)
	public ModelAndView termsOfServiceGet(ModelAndView mv) {

		mv.setViewName("/main/join/termsOfService");
		return mv;
	}
	// 일반 회원가입 화면
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {

		mv.setViewName("/main/join/signup");
		return mv;
	}
	// 일반 회원가입 정보받아 처리하는 기능
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVo member) {
		memberService.signupMember(member);
	
		mv.setViewName("redirect:/");
		return mv;
	}
	// 아이디 중복검사하는 기능
	@RequestMapping(value = "/check/id", method = RequestMethod.POST)
	@ResponseBody
	public String checkIdPost(String id) {
		MemberVo member = memberService.getMember(id);
		if(member == null)
			return "possible";
		return "impossible";
	}
	// 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) {

		mv.setViewName("/main/login");
		return mv;
	}
	// 로그인정보 입력받아 처리하는 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, String id, String pw) {
		MemberVo member = memberService.getMember(id);
		mv.addObject("member",member);
		mv.setViewName("redirect:/");
		return mv;
	}
	// 로그인할 때 아이디 비번 체크하는 기능
	@RequestMapping(value = "/idpw/check", method = RequestMethod.POST)
	@ResponseBody
	public Object idpwCheckPost(@RequestBody MemberVo member) {
		String result = memberService.idpwCheck(member);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	// 로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest request) {
		request.getSession().removeAttribute("member");
		mv.setViewName("redirect:/");
		return mv;
	}
}
