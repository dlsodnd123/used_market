package kr.green.usedmarket.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;
import kr.green.usedmarket.vo.BoardVo;
import kr.green.usedmarket.vo.InterestPdVo;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.PreviewVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
import kr.green.usedmarket.vo.ProductVo;

@Service
public class ProductServiceImp implements ProductService {
	
	@Autowired
	ProductDao productDao;
	// 상품 등록
	@Override
	public void setProduct(ProductVo product) {
		productDao.insertProduct(product);
	}
	// 상품 이미지 등록
	@Override
	public void setProductImg(String fileName, int pd_num) {
		productDao.insertProductImg(fileName, pd_num);
	}
	// 상품목록 이미지 가져오기
	@Override
	public String[] getProductImg(int pd_num) {
		return productDao.selectProductImg(pd_num);
	}
	// 상품내용 수정
	@Override
	public void productModfiy(ProductVo product) {
		productDao.updateProduct(product);
	}
	// 상품에 첨부되어있던 이미지 파일 삭제
	@Override
	public void deleteImg(String deleteImg, int pd_num) {
		productDao.deleteImg(deleteImg, pd_num);
	}
	// 이미지 목록 가져오기
	@Override
	public String[] getImgList(int pd_num) {
		return productDao.selectProductImg(pd_num);
	}
	// 가판대에 있는 회원아이디와 일치하는 상품번호, 상품이미지, 상품가격 가져오기
	public ArrayList<PreviewVo> getPreviewList(int pd_num, String pd_mb_id) {
		ArrayList<PreviewVo> getPreviewList = productDao.selectProductNum(pd_num, pd_mb_id);
		for(PreviewVo tmp:getPreviewList) {
			tmp.setImg_name(productDao.selectPreviewImg(tmp.getPd_num()));
		}
		return getPreviewList;
	}
	// 상품문의 등록
	@Override
	public void setProductQuestions(BoardVo board) {
		productDao.insertProductQuestions(board);
	}
	// 상품문의 게시글의 상품번호와 일치하는 게시글을의 작성자와 내용을가져오고 작성자와 일치하는 가판대이미지 가져오기
	@Override
	public ArrayList<ProductQuestionsVo> getProductQuestionsList(int pd_num) {
		ArrayList<ProductQuestionsVo> getProductQuestionsList = productDao.selectgetProductQuestionsList(pd_num);
		for(ProductQuestionsVo tmp : getProductQuestionsList) {
			tmp.setSt_img(productDao.selectProductQuestionsImg(tmp.getBo_mb_id()));
		}
		return getProductQuestionsList;
	}
	// 상품 찜하기 기능
	@Override
	public String setProductInterest(MemberVo member, int pd_num) {
		String result = "";
		// 상품이 찜해져 있는 확인
		InterestPdVo interestPd = productDao.selectInterestPd(member.getMb_id(), pd_num);
		// 찜한 정보가 없다면 정보 추가
		if(interestPd == null) {
			productDao.insertInterestPd(member.getMb_id(), pd_num);
			result = "interest";
		}else {
			// 찜한 정보가 있고 찜으로 되어있지 않다면 추천으로 변경
			if(interestPd.getItpd_selected() == 0) {
				interestPd.setItpd_selected(1);
				System.out.println("추천 : " + interestPd);
				productDao.updateInterestPd(interestPd);
				result = "interest";
			}
			// 찜으로 되어있다면
			else {
				interestPd.setItpd_selected(0);
				System.out.println("비추천 : " + interestPd);
				productDao.updateInterestPd(interestPd);
				result = "cancelInterest";
			}
		}
		return result;
	}
	// 유저 정보와 일치하는 찜정보 가져오기
	@Override
	public InterestPdVo setInterestPd(MemberVo member, int pd_num) {
		return productDao.selectInterestPd(member.getMb_id(), pd_num);
	}
}
