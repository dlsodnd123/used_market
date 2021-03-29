package kr.green.usedmarket.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.MemberDao;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public MemberVo getMember(String id) {
		MemberVo member = memberDao.getMember(id);
		return member;
	}
	// 회원가입 기능
	@Override
	public void signupMember(MemberVo member) {
		String encPw = passwordEncoder.encode(member.getMb_pw());
		member.setMb_pw(encPw);
		memberDao.insertMember(member);
		// 회원가입시 기본적인 가판대 생성
		StandVo stand = new StandVo(member.getMb_id());
		stand.setSt_img("기본이미지.jpg");
		System.out.println(stand);
		memberDao.insertStand(stand);
	}	
	// 아이디/패스워드 일치여부 확인하는 기능
	@Override
	public String idpwCheck(MemberVo member) {
		MemberVo oriMember = memberDao.getMember(member.getMb_id());
		String result = "";
		if(oriMember == null)
			result = "notId";
		else if(!passwordEncoder.matches(member.getMb_pw(), oriMember.getMb_pw()))
			result = "notSamePw";
		else
			result = "same";
		return result;
	}
	// 회원정보 수정하는 기능
	@Override
	public void memberInfoChange(MemberVo member) {
		// DB에 저장되어 있는 기존의 회원 정보를 불러오기
		MemberVo oriMember = memberDao.getMember(member.getMb_id());
		// 기존의 회원 정보에 변경된 정보를 덮어쓰기(비밀번호 제외)
		oriMember.setMb_postcode(member.getMb_postcode());
		oriMember.setMb_roadAddress(member.getMb_roadAddress());	
		oriMember.setMb_jibunAddress(member.getMb_jibunAddress());
		oriMember.setMb_detailAddress(member.getMb_detailAddress());
		oriMember.setMb_phone(member.getMb_phone());
		oriMember.setMb_email(member.getMb_email());
		// 비밀번호를 변경했으면
		if(member.getMb_pw() != "") {	
			// 비밀번호를 암호화 시켜서 oriMember에 넣어줌
			String encPw = passwordEncoder.encode(member.getMb_pw());
			oriMember.setMb_pw(encPw);
		}		
		// 회원정보를 업데이드 시킴
		memberDao.updateInfoIncludePw(oriMember);
	}
	// 회원탈퇴 하는 기능
	@Override
	public void memberWithdrawal(String mb_id) {
		// 회원탈퇴 여부 'Y'로 변경
		memberDao.updateWithdrawal(mb_id);
		// 등록된 상품 삭제여부 'Y'로 변경
		memberDao.updateProductisDel(mb_id);
		// 등록된 게시글 삭제여부 'Y'로 변경
		memberDao.updateBoradDel(mb_id);
		// 등록된 댓글 삭제여부 'Y'로 변경
		memberDao.updateCommentDel(mb_id);
		// 해당 가판대 삭제
		memberDao.deleteStand(mb_id);
		// 관심상품 삭제
		memberDao.deleteInterestPd(mb_id);
		// 채팅방 삭제
		memberDao.deleteChatRomm(mb_id);
		// 채팅메시지 삭제
		memberDao.deleteChatMessage(mb_id);
	}
	// 이름과 이메일이 일치하는 회원정보 가져오기
	@Override
	public MemberVo getidFind(MemberVo idFind) {		
		return memberDao.selectIdFind(idFind.getMb_name(), idFind.getMb_email());
	}
	// 아이디, 이름, 이메일과 일치하는 회원정보 가져오기
	@Override
	public MemberVo getpwFind(MemberVo pwFind) {
		return memberDao.selectPwFind(pwFind.getMb_id(), pwFind.getMb_name(), pwFind.getMb_email());
	}
	@Override
	// size만큼의 새로운 비빌번호 만들기(Math.random()사용)
	public String NewPassword(int size) {
		/*
			비밀번호는 0~9숫자(10), a-z소문자(26), A~Z대문자(26)
			랜덤으로 0~61을 생성 => 62가지
			랜덤 숫자가 0~9 => 숫자 0~9
			랜덤 숫자가 10~35 => 소문자 a~z
				ex) 10 => 'a' + 10 - 10
			랜덤 숫자가 36~61 => 대문자 A~Z
			ex) 37 => 'A' + 37 - 36
		*/
		String pw = "";
		for(int i=0; i<size; i++) {
			int r = (int)(Math.random() * 62);
			if(r <= 9)
				pw += (char)('0' + r);
			else if(r <= 35)
				pw += (char)('a' + r - 10);
			else
				pw += (char)('A' + r - 36);
		}
		return pw;
	}
	// 회원정보에 pw를 업데이트하기
	@Override
	public void setMember(MemberVo member) {
		// 회원정보가 없다면 업데이트 하지 않고 종료
		if(member == null)
			return ;
		String encodePw = passwordEncoder.encode(member.getMb_pw());
		member.setMb_pw(encodePw);
		memberDao.updateInfoIncludePw(member);
	}
	// 비밀번호 찾기 메일 보내기
	@Override
	public void sendMail(String title, String content, String email) {
		try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom("test@naver.com");	// 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(email);					// 받는사람 이메일
	        messageHelper.setSubject(title);			// 메일제목은 생략이 가능하다
	        messageHelper.setText(content);				// 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }	
	}
	// 카카오로 가입된 정보가 있는 조회(이메일과 닉네임으로)
	@Override
	public MemberVo getKakaoCheck(String nickname, String email) {
		String division = "kakao";
		return memberDao.selectKakaoCheck(nickname, email, division);
	}
	// 카카오로 회원가입
	@Override
	public void setMemberKakaO(String nickname, String email, String gender) {
		MemberVo memberKakao = new MemberVo();
		memberKakao.setMb_name(nickname);
		memberKakao.setMb_email(email);
		if(gender.equals("male"))
			memberKakao.setMb_gender("남");
    	else
    		memberKakao.setMb_gender("여");
		// 가입구분을 "kakao"를 넣어주기
		memberKakao.setMb_division("kakao");
    	// 아이디에 쓰일 랜덤한 8개 번호 생성 후 기존 맴버 아이디와 일치하는지 확인 후 없으면 아이디로 사용
		String new_id = "";
		MemberVo memberCheck = new MemberVo();
		while(true) {
			for(int i=0; i<8; i++) {
	    		int randomNum = (int)(Math.random() * 9);
	    		new_id += randomNum;
	    	}
	    	memberCheck = memberDao.getMember(new_id);
	    	if(memberCheck == null)
	    		break;			
		}		
		memberKakao.setMb_id(new_id);
    	// 랜덤한 8개 비밀번호 생성
    	String pw = "";
		for(int i=0; i<8; i++) {
			int r = (int)(Math.random() * 62);
			if(r <= 9)
				pw += (char)('0' + r);
			else if(r <= 35)
				pw += (char)('a' + r - 10);
			else
				pw += (char)('A' + r - 36);
		}		
		String encPw = passwordEncoder.encode(pw);
		memberKakao.setMb_pw(encPw);
    	memberDao.insertKakaoMember(memberKakao);
    	String division = "kakao";
    	MemberVo member = memberDao.selectKakaoCheck(nickname, email, division);
    	// 회원등록이 문제없이 진행되었다면
    	if(member != null) {
	    	// 기본 가판대 생성
	    	StandVo stand = new StandVo(member.getMb_id());
    		memberDao.insertStand(stand);
    	}
	}
	// 네이버로 가입된 정보가 있는지 확인
	@Override
	public MemberVo getNaverCheck(String name, String email, String gender, String mobile) {
		String division = "naver";
		return memberDao.selectNaverCheck(name, email, mobile, division);		
	}
	// 네이버로 회원가입
	@Override
	public void setMemberNaver(String name, String email, String gender, String mobile) {
		MemberVo memberNaver = new MemberVo();
		memberNaver.setMb_name(name);
		memberNaver.setMb_email(email);
		memberNaver.setMb_phone(mobile);
		if(gender.equals("M"))
			memberNaver.setMb_gender("남");
		else
			memberNaver.setMb_gender("여");
		// 가입구분을 "kakao"를 넣어주기
		memberNaver.setMb_division("naver");
		// 아이디에 쓰일 랜덤한 8개 번호 생성 후 기존 맴버 아이디와 일치하는지 확인 후 없으면 아이디로 사용
		String new_id = "";
		MemberVo memberCheck = new MemberVo();
		while(true) {
			for(int i=0; i<8; i++) {
	    		int randomNum = (int)(Math.random() * 9);
	    		new_id += randomNum;
	    	}
	    	memberCheck = memberDao.getMember(new_id);
	    	if(memberCheck == null)
	    		break;			
		}
		System.out.println(new_id);
		memberNaver.setMb_id(new_id);
		// 랜덤한 8개 비밀번호 생성
    	String pw = "";
		for(int i=0; i<8; i++) {
			int r = (int)(Math.random() * 62);
			if(r <= 9)
				pw += (char)('0' + r);
			else if(r <= 35)
				pw += (char)('a' + r - 10);
			else
				pw += (char)('A' + r - 36);
		}		
		String encPw = passwordEncoder.encode(pw);
		memberNaver.setMb_pw(encPw);
		memberDao.insertMemberNaver(memberNaver);
		String division = "naver";
		MemberVo member = memberDao.selectNaverCheck(name, email, mobile, division);
		// 회원등록이 문제없이 진행되었다면
    	if(member != null) {
	    	// 기본 가판대 생성
	    	StandVo stand = new StandVo(member.getMb_id());
    		memberDao.insertStand(stand);
    	}			
	}	
}
