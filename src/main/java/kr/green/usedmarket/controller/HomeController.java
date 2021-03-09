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
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.green.usedmarket.service.MemberService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService; 
	
	@Autowired
	StandService standService; 
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
	// 회원정보수정 전 비밀번호 확인 화면
	@RequestMapping(value = "/memberConfirm", method = RequestMethod.GET)
	public ModelAndView memberConfirmGet(ModelAndView mv) {

		mv.setViewName("/main/memberConfirm");
		return mv;
	}
	// 비밀번호 확인 하는 기능
	@RequestMapping(value = "/pw/check", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheckPost(String mb_pw, HttpServletRequest request) {
		System.out.println(mb_pw);
		// 로그인 된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 로그인 된 정보가 없다면 "notLogin", 비밀번호가 일치하지 않는다면 "notSame", 같으면 "same" 전송
		if(member == null)
			return "notLogin";
		if(!passwordEncoder.matches(mb_pw, member.getMb_pw()))
			return "notSame";		
		return "same";
	}
	// 회원정보수정 화면
	@RequestMapping(value = "/memberInfoChange", method = RequestMethod.GET)
	public ModelAndView memberInfoChangeGet(ModelAndView mv, HttpServletRequest request) {		
		MemberVo member = standService.getMemberId(request);
		mv.addObject("member", member);
		mv.setViewName("/main/memberInfoChange");
		return mv;
	}
	// 회원정보수정 하는 기능
	@RequestMapping(value = "/memberInfoChange", method = RequestMethod.POST)
	public ModelAndView memberInfoChangePost(ModelAndView mv, MemberVo member) {
		// 회원정보 수정하는 기능
		memberService.memberInfoChange(member);
		
		mv.setViewName("redirect:/");
		return mv;
	}
	// 회원탈퇴 화면
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public ModelAndView withdrawalGet(ModelAndView mv, HttpServletRequest request) {		
		MemberVo member = standService.getMemberId(request);
		mv.addObject("member", member);
		mv.setViewName("/main/withdrawal");
		return mv;
	}
	// 회원탈퇴 기능
	@RequestMapping(value = "/member/withdrawal", method = RequestMethod.POST)
	@ResponseBody
	public String memberWithdrawalPost(String mb_id, HttpServletRequest request) {
		// 화면에서 전달받은 아이디와 일치하는 회원이 있는지 조회
		MemberVo member = memberService.getMember(mb_id);
		// 일치하는 회원이 없으면 'memberNull' 반환
		if(member == null)
			return "memberNull";
		// 일치하는 회원이 있으면 회원탈퇴 진행 후 'success' 반환
		memberService.memberWithdrawal(mb_id);
		return "success";
	}
}
