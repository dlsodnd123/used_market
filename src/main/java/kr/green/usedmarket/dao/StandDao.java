package kr.green.usedmarket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.pagination.Criteria;
import kr.green.usedmarket.vo.CommentVo;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.InterestPdVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

public interface StandDao {

	StandVo selectStand(@Param("id")String mb_id);

	StandVo dupStandName(@Param("standName")String standName);
	
	void updateStandName(@Param("standName")String standName, @Param("mb_id")String mb_id);

	void updateStandIntroduce(@Param("standIntroduce")String standIntroduce, @Param("mb_id")String mb_id);

	void updateStandImg(@Param("fileName")String fileName, @Param("mb_id")String mb_id);

	ArrayList<ProductVo> selectProductList(@Param("mb_id")String mb_id, @Param("cri")Criteria cri);

	int selectProductCount(@Param("mb_id")String mb_id);

	ProductVo selectProduct(@Param("pd_num")int pd_num);

	void updateProductisSale(@Param("product")ProductVo product);

	void updateProductisDel(@Param("product")ProductVo product);
	
	int selectProductSaleCount(@Param("mb_id")String mb_id);

	ArrayList<ProductVo> selectSaleProductList(@Param("mb_id")String mb_id, @Param("cri")Criteria cri);

	int selectSaleProductCount(@Param("mb_id")String mb_id);

	ArrayList<DibsVo> selectDibsPdNnm(@Param("mb_id")String mb_id);

	int selectDibsPdCnt(@Param("mb_id")String mb_id);

	InterestPdVo selectInterestPd(@Param("tmpPdNum")int tmpPdNum, @Param("mb_id")String mb_id);

	void deleteInterestPd(@Param("tmpPdNum")int tmpPdNum, @Param("mb_id")String mb_id);

	ArrayList<ProductQuestionsVo> selectStQustionsList(@Param("st_name")String st_name);

	int selectStQuestionsCount(@Param("st_name")String st_name);

	ArrayList<CommentVo> selectCommentList(@Param("st_mb_id")String st_mb_id);

	ProductQuestionsVo selectStQuestions(@Param("bo_num")int bo_num);

}
