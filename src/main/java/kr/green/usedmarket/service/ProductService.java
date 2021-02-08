package kr.green.usedmarket.service;

import java.util.ArrayList;

import kr.green.usedmarket.vo.ProductVo;

public interface ProductService {

	void setProduct(ProductVo product);

	void setProductImg(String fileName, int pd_num);

}
