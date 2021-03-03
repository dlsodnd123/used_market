package kr.green.usedmarket.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;
import kr.green.usedmarket.dao.StandDao;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.InterestPdVo;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

@Service
public class StandServiceImp implements StandService{
	
	@Autowired
	StandDao standDao;
	
	@Autowired
	ProductDao productDao;

	@Override
	public MemberVo getMemberId(HttpServletRequest request) {
		return (MemberVo)request.getSession().getAttribute("member");
	}
	// 가판대 정보 가져오기
	@Override
	public StandVo getStand(String mb_id) {
		StandVo stand = standDao.selectStand(mb_id);
		return stand;
	}
	// 가판대명 수정
	@Override
	public void modifyStandName(String standName, MemberVo member) {
		standDao.updateStandName(standName, member.getMb_id());
	}
	// 가판대명 중복 검사
	@Override
	public StandVo dupStandName(String standName) {
		StandVo stand = standDao.dupStandName(standName);
		return stand;
	}
	// 가판대 소개글 수정
	@Override
	public void modifyStandIntroduce(String standIntroduce, String mb_id) {
		standDao.updateStandIntroduce(standIntroduce, mb_id);
	}
	// 가판대 대표이미지 수정
	@Override
	public void updateStandImg(String fileName, String mb_id) {
		standDao.updateStandImg(fileName, mb_id);
	}
	// 등록된 상품 가져오기
	@Override
	public ArrayList<ProductVo> getProductList(String mb_id) {
		return standDao.selectProductList(mb_id);
	}
	// 등록된 상품의 개수 가져오기
	@Override
	public int getProductCount(String mb_id) {
		return standDao.selectProductCount(mb_id);
	}
	// 상품 번호와 일치하는 상품내용 가져오기
	@Override
	public ProductVo getProduct(int pd_num) {
		return standDao.selectProduct(pd_num);
	}
	// 판매여부처리
	@Override
	public void updateProductisSale(ProductVo product) throws Exception {
		if(product.getPd_isSale().equals("N")) {
			product.setPd_isSale("Y");
			Date date = new Date();
			SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String dateString = simpleFormat.format(date);
			product.setPd_saleDate(dateString);
		}else {
			product.setPd_isSale("N");
			product.setPd_saleDate(null);
		}
		standDao.updateProductisSale(product);
	}
	// 삭제여부
	@Override
	public void updateProductisDel(ProductVo product) {
		if(product.getPd_isDel().equals("N")) {
			product.setPd_isDel("Y");
		}else {
			product.setPd_isDel("N");
		}
		standDao.updateProductisDel(product);
	}
	// 판매완료상품 갯수 가져오기
	@Override
	public int getProductSaleCount(String mb_id) {
		return standDao.selectProductSaleCount(mb_id);
	}
	// 판매완료된 상품리스트 가져오기
	@Override
	public ArrayList<ProductVo> getSaleProductList(String mb_id) {
		return standDao.selectSaleProductList(mb_id);
	}
	// 판매완료된 상품 개수 가져오기
	@Override
	public int getSaleProductCount(String mb_id) {
		return standDao.selectSaleProductCount(mb_id);
	}
	// 멤버 아이디와 일치하는 찜한 상품목록 가져오기
	@Override
	public ArrayList<DibsVo> getDibsList(String mb_id) {
		ArrayList<DibsVo> DibsList = standDao.selectDibsPdNnm(mb_id);
		for(DibsVo tmp : DibsList) {
			tmp.setSt_img(productDao.selectPreviewImg(tmp.getPd_num()));
		}
		return DibsList;
	}
	// 찜한 상품의 갯수 가져오기
	@Override
	public int getDibsPdCnt(String mb_id) {
		return standDao.selectDibsPdCnt(mb_id);
	}
	// 찜한상품 목록에서 제거하기
	@Override
	public String delDbisProduct(List<Integer> pd_num, String mb_id) {
		ArrayList<InterestPdVo> interestPd = new ArrayList<InterestPdVo>();
		// 상품번호와 회원아이디를 주면 정보를 가져오기
		for(int tmpPdNum : pd_num)
			interestPd.add(standDao.selectInterestPd(tmpPdNum, mb_id));
		// 해당하는 정보가 없거나 삭제하려는 상품의 수보다 작으면 "notInfo"반환하기
		if(interestPd == null || interestPd.size() < pd_num.size())
			return "notInfo";
		// 정보가 있으면 해당정보 삭제시킴
		for(int tmpPdNum : pd_num)
			standDao.deleteInterestPd(tmpPdNum, mb_id);
		return "Success";
	}
	// 가판대 문의글들 가져오기
	@Override
	public ArrayList<ProductQuestionsVo> getstQuestionsList(String st_name) {
		ArrayList<ProductQuestionsVo> stQuestionsList = standDao.selectStQustionsList(st_name);
		for(ProductQuestionsVo tmp : stQuestionsList) {
			tmp.setSt_img(productDao.selectProductQuestionsImg(tmp.getBo_mb_id()));
		}			
		return stQuestionsList;
	}
}
