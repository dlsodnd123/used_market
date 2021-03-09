package kr.green.usedmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
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
		StandVo stand = new StandVo(member.getMb_id());
		
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
	public void sendMail(String title, String content, String mb_email) {
		// TODO Auto-generated method stub		
	}
}
