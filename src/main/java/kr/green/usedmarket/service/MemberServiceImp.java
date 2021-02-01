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

	@Override
	public void signupMember(MemberVo member) {
		String encPw = passwordEncoder.encode(member.getMb_pw());
		member.setMb_pw(encPw);
		memberDao.insertMember(member);
		StandVo stand = new StandVo(member.getMb_id());
		memberDao.insertStand(stand);
	}

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
}
