package kr.green.usedmarket.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.StandDao;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

@Service
public class StandServiceImp implements StandService{
	
	@Autowired
	StandDao standDao;

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
}
