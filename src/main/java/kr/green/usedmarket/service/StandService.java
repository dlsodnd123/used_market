package kr.green.usedmarket.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

public interface StandService {

	MemberVo getMemberId(HttpServletRequest request);

	StandVo getStand(String mb_id);

	void modifyStandName(String standName, MemberVo member);

	StandVo dupStandName(String standName);

	void modifyStandIntroduce(String standIntroduce, String mb_id);

	void updateStandImg(String fileName, String mb_id);

	ArrayList<ProductVo> getProductList(String mb_id);

	int getProductCount(String mb_id);

	ProductVo getProduct(int pd_num);

	void updateProductisSale(ProductVo product);

	void updateProductisDel(ProductVo product);

	int getProductSaleCount(String mb_id);

}
