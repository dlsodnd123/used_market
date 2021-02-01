package kr.green.usedmarket.service;

import kr.green.usedmarket.vo.MemberVo;

public interface MemberService {

	MemberVo getMember(String id);

	void signupMember(MemberVo member);

	String idpwCheck(MemberVo member);
}
