package kr.green.usedmarket.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;
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
	// 상품목록 가져오기
	@Override
	public ArrayList<String> getProductImg(int pd_num) {
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
}
