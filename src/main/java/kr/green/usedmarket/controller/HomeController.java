package kr.green.usedmarket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.green.usedmarket.kakaologin.KakaoAPI;
import kr.green.usedmarket.naverlogin.NaverLoginBo;
import kr.green.usedmarket.service.MemberService;
import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.MemberVo;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService; 
	
	@Autowired
	StandService standService; 
	
	@Autowired
	ProductService productService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	KakaoAPI kakaoAPI;
	
    /* NaverLoginBO */
    private NaverLoginBo naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv, String code, HttpServletRequest request, String state, HttpSession session) throws IOException {
		// 카카오 토큰을 이용한 로그인
		String access_Token = kakaoAPI.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
		MemberVo member = null;
	    if(userInfo.size() != 0) {
	    	// 카카오로 가입된 정보가 있는 조회(이메일과 닉네임으로)
	    	member = memberService.getKakaoCheck((String)userInfo.get("nickname"), (String)userInfo.get("email"));
	    	// 가입된 정보가 없다면 가입 진행
	    	if(member == null)
	    		memberService.setMemberKakaO((String)userInfo.get("nickname"), (String)userInfo.get("email"), (String)userInfo.get("gender"));
	    }
	    // 네이버 로그인
	    if(code != null && state != null) {
		    OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        // 로그인 사용자 정보를 읽어온다.
	        apiResult = naverLoginBO.getUserProfile(oauthToken);
	        // 사용자 정보가 비어있지 않다면 
	        // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성하여 필요 정보 추출
	        if(apiResult != null) {
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(apiResult);
	            
	            JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
	            
	            String name = response.getAsJsonObject().get("name").getAsString();
	            String email = response.getAsJsonObject().get("email").getAsString();
		        String gender = response.getAsJsonObject().get("gender").getAsString();
		        String mobile = response.getAsJsonObject().get("mobile").getAsString();
		        
		        // 네이버로 가입된 정보가 있는지 확인 후
		        member = memberService.getNaverCheck(name, email, gender, mobile);
		        // 가입된 정보가 없으면 회원가입 진행
		        if(member == null) {
		        	memberService.setMemberNaver(name, email, gender, mobile);
		        }
	        }
	    }
		// 메인화면에 나타낼 신규상품의 목록 가져오기
		ArrayList<DibsVo> newProductList = productService.getNewProduct();		
		// 메인화면에 나타낼 관심수가 많은 상품의 목록 가져오기
		ArrayList<DibsVo> interestProductList = productService.getInterestProduct();
		
		mv.addObject("member", member);
		mv.addObject("interestProductList", interestProductList);
		mv.addObject("newProductList", newProductList);
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
	public ModelAndView loginGet(ModelAndView mv, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);        
        System.out.println("네이버:" + naverAuthUrl);        
        mv.addObject("url", naverAuthUrl);
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
		kakaoAPI.kakaoLogout((String)request.getAttribute("access_Token"));
		request.removeAttribute("access_Token");
		request.removeAttribute("userId");		
		
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
	// 아이디 찾기 화면
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public ModelAndView idFindGet(ModelAndView mv) {	
		
		mv.setViewName("/main/idFind");
		return mv;
	}
	// 아이디 찾기(이름과 이메일 이용)
	@RequestMapping(value = "/id/find", method = RequestMethod.POST)
	@ResponseBody
	public Object idFindPost(@RequestBody MemberVo idFind) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String result = "";
		// 이름과 이메일이 일치하는 회원조회하기
		MemberVo member = memberService.getidFind(idFind);
		// 화면에서 준 정보와 일치하는 회원이 없다면 "notInfo" 반환
		if(member == null)
			result = "notInfo";
		// 일치한다면 아이디를 반환
		else
			result = member.getMb_id();
		map.put("result", result);
		return map;
	}
	// 비밀번호 찾기 화면
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public ModelAndView pwFindGet(ModelAndView mv) {	
		
		mv.setViewName("/main/pwFind");
		return mv;
	}
	// 비밀번호 찾기(아이디, 이름, 이메일 이용)
	@RequestMapping(value = "/pw/find", method = RequestMethod.POST)
	@ResponseBody
	public Object pdFindPost(@RequestBody MemberVo pwFind) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String result = "";
		// 아이디, 이름, 이메일이 일치하는 회원조회하기
		MemberVo member = memberService.getpwFind(pwFind);
		// 화면에서 보내준 정보와 일치하는 회원정보가 없으면 "notInfo" 반환
		if(member == null)
			result = "notInfo";
		// 일치하는 정보가 있으면 
		else {
			// 새로운 비밀번호 8자리를 만들어서 해당 회원에 비빌번호에 넣어준다
			String pw = memberService.NewPassword(8);
			member.setMb_pw(pw);
			memberService.setMember(member);
			// 메일제목과 내용을 입력
			String title = "[중고시장] 비밀번호찾기 메일입니다.";
			String content = "안녕하세요. 중고시장입니다. 새 비밀번호는 " + pw + " 입니다. 본인이 보낸것이 아니면 즉시 고객센터로 문의 바랍니다.";
			// 제목, 내용, 회원가입시 입력한 메일정보를 이용해서 메일 보내기
			memberService.sendMail(title, content, member.getMb_email());
		}
		
		map.put("result", result);
		return map;
	}
}
