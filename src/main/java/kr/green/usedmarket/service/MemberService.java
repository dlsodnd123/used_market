package kr.green.usedmarket.service;

import kr.green.usedmarket.vo.MemberVo;

public interface MemberService {

	MemberVo getMember(String id);

	void signupMember(MemberVo member);

	String idpwCheck(MemberVo member);

	void memberInfoChange(MemberVo member);

	void memberWithdrawal(String mb_id);

	MemberVo getidFind(MemberVo idFind);

	MemberVo getpwFind(MemberVo pwFind);

	String NewPassword(int size);

	void setMember(MemberVo member);

	void sendMail(String title, String content, String mb_email);

	MemberVo getKakaoCheck(String nickname, String email);

	void setMemberKakaO(String nickname, String email, String gender);

	MemberVo getNaverCheck(String name, String email, String gender, String mobile);

	void setMemberNaver(String name, String email, String gender, String mobile);
}
