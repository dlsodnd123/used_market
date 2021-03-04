package kr.green.usedmarket.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.green.usedmarket.vo.CommentVo;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
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

	void updateProductisSale(ProductVo product) throws Exception;

	void updateProductisDel(ProductVo product);

	int getProductSaleCount(String mb_id);

	ArrayList<ProductVo> getSaleProductList(String mb_id);

	int getSaleProductCount(String mb_id);

	ArrayList<DibsVo> getDibsList(String mb_id);
                                                 
	int getDibsPdCnt(String mb_id);

	String delDbisProduct(List<Integer> pd_num, String mb_id);

	ArrayList<ProductQuestionsVo> getstQuestionsList(String st_name);

	int getStQuestionsCount(String st_name);

	ArrayList<CommentVo> getCommentList(String st_mb_id);

	ProductQuestionsVo getStQuestions(int bo_num);

}
