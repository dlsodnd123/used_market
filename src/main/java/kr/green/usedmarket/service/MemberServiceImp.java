package kr.green.usedmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.MemberDao;
import kr.green.usedmarket.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public MemberVo getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public void signupMember(MemberVo member) {
		memberDao.insertMember(member);
		
	}
	

}
