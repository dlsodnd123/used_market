package kr.green.usedmarket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

public interface StandDao {

	StandVo selectStand(@Param("id")String mb_id);

	StandVo dupStandName(@Param("standName")String standName);
	
	void updateStandName(@Param("standName")String standName, @Param("mb_id")String mb_id);

	void updateStandIntroduce(@Param("standIntroduce")String standIntroduce, @Param("mb_id")String mb_id);

	void updateStandImg(@Param("fileName")String fileName, @Param("mb_id")String mb_id);

	ArrayList<ProductVo> selectProductList(@Param("mb_id")String mb_id);

	int selectProductCount(@Param("mb_id")String mb_id);

	ProductVo selectProduct(@Param("pd_num")int pd_num);

	void updateProductisSale(@Param("product")ProductVo product);

	void updateProductisDel(@Param("product")ProductVo product);
	
	int selectProductSaleCount(@Param("mb_id")String mb_id);

	ArrayList<ProductVo> selectSaleProductList(@Param("mb_id")String mb_id);

	int selectSaleProductCount(@Param("mb_id")String mb_id);
}
