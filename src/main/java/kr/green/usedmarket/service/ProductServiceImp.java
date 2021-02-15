package kr.green.usedmarket.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;
import kr.green.usedmarket.vo.PreviewVo;
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
}
