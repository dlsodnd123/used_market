package kr.green.usedmarket.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

public interface StandService {

	MemberVo getMemberId(HttpServletRequest request);

	StandVo getStand(MemberVo member);

	void modifyStandName(String standName, MemberVo member);

	StandVo dupStandName(String standName);

	void modifyStandIntroduce(String standIntroduce, String mb_id);

	void updateStandImg(String fileName, String mb_id);

	ArrayList<ProductVo> getProduct(String st_name);

}
