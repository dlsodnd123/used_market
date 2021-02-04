package kr.green.usedmarket.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.StandDao;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

@Service
public class StandServiceImp implements StandService{
	
	@Autowired
	StandDao standDao;

	@Override
	public MemberVo getMemberId(HttpServletRequest request) {
		return (MemberVo)request.getSession().getAttribute("member");
	}

	@Override
	public StandVo getStand(MemberVo member) {
		StandVo stand = standDao.selectStand(member.getMb_id());
		return stand;
	}

	@Override
	public void modifyStandName(String standName, MemberVo member) {
		standDao.updateStandName(standName, member.getMb_id());
	}

	@Override
	public StandVo dupStandName(String standName) {
		StandVo stand = standDao.dupStandName(standName);
		return stand;
	}

	@Override
	public void modifyStandIntroduce(String standIntroduce, String mb_id) {
		standDao.updateStandIntroduce(standIntroduce, mb_id);
	}

}
