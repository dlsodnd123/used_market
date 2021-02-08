package kr.green.usedmarket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.ProductVo;

public interface ProductDao {

	void insertProduct(@Param("product")ProductVo product);

	void insertProductImg(@Param("fileName")String fileName, @Param("pd_num")int pd_num);
}
