package kr.green.usedmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;
import kr.green.usedmarket.vo.ProductVo;

@Service
public class ProductServiceImp implements ProductService {
	
	@Autowired
	ProductDao productDao;

	@Override
	public void setProduct(ProductVo product) {
		productDao.insertProduct(product);
	}

	@Override
	public void setProductImg(String fileName, int pd_num) {
		productDao.insertProductImg(fileName, pd_num);
	}
}
