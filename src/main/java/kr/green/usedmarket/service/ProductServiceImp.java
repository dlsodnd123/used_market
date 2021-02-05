package kr.green.usedmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ProductDao;

@Service
public class ProductServiceImp implements ProductService {
	
	@Autowired
	ProductDao productDao;

}
