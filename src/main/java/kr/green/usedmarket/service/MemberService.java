package kr.green.usedmarket.service;

import kr.green.usedmarket.vo.MemberVo;

public interface MemberService {

	MemberVo getMember(String id);

	void signupMember(MemberVo member);

	String idpwCheck(MemberVo member);

	void memberInfoChange(MemberVo member);

	void memberWithdrawal(String mb_id);

	MemberVo getidFind(MemberVo idFind);
}
